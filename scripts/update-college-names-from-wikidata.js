const { createClient } = require("@supabase/supabase-js");
require("dotenv").config({ path: ".env.local" });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error("❌ Missing required environment variables.");
  console.error("Need NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY");
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

const STOP_WORDS = new Set([
  "of",
  "and",
  "the",
  "for",
  "in",
  "at",
  "technology",
  "engineering",
  "college",
  "institute",
  "university",
]);

const normalize = (value) =>
  (value || "")
    .toLowerCase()
    .replace(/[^a-z0-9\s]/g, " ")
    .replace(/\s+/g, " ")
    .trim();

const tokensFor = (value) =>
  normalize(value)
    .split(" ")
    .filter((t) => t && !STOP_WORDS.has(t));

const jaccard = (a, b) => {
  const setA = new Set(a);
  const setB = new Set(b);
  const intersection = new Set([...setA].filter((x) => setB.has(x)));
  const union = new Set([...setA, ...setB]);
  if (union.size === 0) return 0;
  return intersection.size / union.size;
};

async function searchWikidataEntity(query) {
  const url = `https://www.wikidata.org/w/api.php?action=wbsearchentities&search=${encodeURIComponent(
    query
  )}&language=en&format=json&origin=*`;
  const res = await fetch(url);
  if (!res.ok) return null;
  const data = await res.json();
  return data?.search?.[0] || null;
}

async function getWikidataEntity(entityId) {
  const url = `https://www.wikidata.org/w/api.php?action=wbgetentities&ids=${encodeURIComponent(
    entityId
  )}&props=labels|descriptions&languages=en&format=json&origin=*`;
  const res = await fetch(url);
  if (!res.ok) return null;
  const data = await res.json();
  return data?.entities?.[entityId] || null;
}

const isEducationEntity = (description) => {
  const text = (description || "").toLowerCase();
  return (
    text.includes("university") ||
    text.includes("college") ||
    text.includes("institute") ||
    text.includes("engineering school") ||
    text.includes("educational")
  );
};

async function updateNames() {
  const limit = Number(process.argv[2] || 0);
  console.log("🔍 Loading colleges...");

  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("id, name")
    .order("name", { ascending: true });

  if (error) {
    console.error("❌ Error loading colleges:", error.message);
    process.exit(1);
  }

  const targets = limit > 0 ? colleges.slice(0, limit) : colleges;
  console.log(`🚀 Processing ${targets.length} colleges...\n`);

  let updated = 0;
  for (const college of targets) {
    const searchResult = await searchWikidataEntity(college.name);
    if (!searchResult?.id) {
      continue;
    }

    const entity = await getWikidataEntity(searchResult.id);
    const label = entity?.labels?.en?.value;
    const description = entity?.descriptions?.en?.value || "";

    if (!label || !isEducationEntity(description)) {
      continue;
    }

    const score = jaccard(tokensFor(college.name), tokensFor(label));
    if (score < 0.6) {
      continue;
    }

    if (label !== college.name) {
      const { error: updateError } = await supabase
        .from("colleges")
        .update({ name: label })
        .eq("id", college.id);

      if (updateError) {
        console.log(`❌ ${college.name}: ${updateError.message}`);
      } else {
        updated += 1;
        console.log(`✅ ${college.name} -> ${label}`);
      }
    }

    await sleep(150);
  }

  console.log(`\n✅ Done. Updated ${updated} college names from Wikidata.`);
}

updateNames().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
