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

async function searchWikipediaTitle(query) {
  const url = `https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=${encodeURIComponent(
    query
  )}&format=json&origin=*`;
  const res = await fetch(url);
  if (!res.ok) return null;
  const data = await res.json();
  const first = data?.query?.search?.[0];
  return first?.title || null;
}

async function getWikidataItemFromTitle(title) {
  const url = `https://en.wikipedia.org/w/api.php?action=query&prop=pageprops&ppprop=wikibase_item&format=json&titles=${encodeURIComponent(
    title
  )}&origin=*`;
  const res = await fetch(url);
  if (!res.ok) return null;
  const data = await res.json();
  const pages = data?.query?.pages || {};
  const page = Object.values(pages)[0];
  return page?.pageprops?.wikibase_item || null;
}

async function getOfficialWebsiteFromWikidata(entityId) {
  const url = `https://www.wikidata.org/w/api.php?action=wbgetentities&ids=${encodeURIComponent(
    entityId
  )}&props=claims&format=json&origin=*`;
  const res = await fetch(url);
  if (!res.ok) return null;
  const data = await res.json();
  const entity = data?.entities?.[entityId];
  const claims = entity?.claims || {};
  const claim = claims?.P856?.[0];
  return claim?.mainsnak?.datavalue?.value || null;
}

async function resolveOfficialWebsite(college) {
  const query = `${college.name} engineering college`;
  const title = await searchWikipediaTitle(query);
  if (!title) return null;
  const wikidataItem = await getWikidataItemFromTitle(title);
  if (!wikidataItem) return null;
  return getOfficialWebsiteFromWikidata(wikidataItem);
}

async function fillWebsites() {
  const limit = Number(process.argv[2] || 0);
  console.log("🔍 Loading colleges...");

  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("id, name, website")
    .order("name", { ascending: true });

  if (error) {
    console.error("❌ Error loading colleges:", error.message);
    process.exit(1);
  }

  const targets = limit > 0 ? colleges.slice(0, limit) : colleges;
  console.log(`🚀 Processing ${targets.length} records...\n`);

  let updated = 0;
  for (const college of targets) {
    const officialWebsite = await resolveOfficialWebsite(college);
    if (officialWebsite && officialWebsite !== college.website) {
      const { error: updateError } = await supabase
        .from("colleges")
        .update({ website: officialWebsite })
        .eq("id", college.id);

      if (updateError) {
        console.log(`❌ ${college.name}: ${updateError.message}`);
      } else {
        updated += 1;
        console.log(`✅ ${college.name} -> ${officialWebsite}`);
      }
    } else if (!officialWebsite) {
      console.log(`⚠️  ${college.name}: no official website found`);
    }

    await sleep(200);
  }

  console.log(`\n✅ Done. Updated ${updated} colleges.`);
}

fillWebsites().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
