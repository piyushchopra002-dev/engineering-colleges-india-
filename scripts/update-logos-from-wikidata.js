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

async function searchWikidataEntity(query) {
  const url = `https://www.wikidata.org/w/api.php?action=wbsearchentities&search=${encodeURIComponent(
    query
  )}&language=en&format=json&origin=*`;
  const res = await fetch(url);
  if (!res.ok) return null;
  const data = await res.json();
  const first = data?.search?.[0];
  return first?.id || null;
}

async function getWikidataImage(entityId) {
  const url = `https://www.wikidata.org/w/api.php?action=wbgetclaims&entity=${encodeURIComponent(
    entityId
  )}&property=P154|P18&format=json&origin=*`;
  const res = await fetch(url);
  if (!res.ok) return null;
  const data = await res.json();
  const claims = data?.claims || {};

  const pickImage = (property) => {
    const claim = claims?.[property]?.[0];
    return claim?.mainsnak?.datavalue?.value || null;
  };

  const imageFile = pickImage("P154") || pickImage("P18");
  if (!imageFile) return null;
  return `https://commons.wikimedia.org/wiki/Special:FilePath/${encodeURIComponent(
    imageFile
  )}?width=512`;
}

async function updateLogos() {
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
    const entityId = await searchWikidataEntity(college.name);
    if (!entityId) {
      continue;
    }

    const imageUrl = await getWikidataImage(entityId);
    if (!imageUrl) {
      continue;
    }

    const { error: updateError } = await supabase
      .from("colleges")
      .update({ logo_url: imageUrl })
      .eq("id", college.id);

    if (updateError) {
      console.log(`❌ ${college.name}: ${updateError.message}`);
    } else {
      updated += 1;
      console.log(`✅ ${college.name}`);
    }

    await sleep(150);
  }

  console.log(`\n✅ Done. Updated ${updated} logos from Wikidata/Wikimedia.`);
}

updateLogos().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
