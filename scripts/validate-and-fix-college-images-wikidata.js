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

async function urlIsReachable(url) {
  try {
    const response = await fetch(url, { method: "HEAD" });
    if (response.ok) return true;
    if (response.status === 405 || response.status === 403) {
      const getResponse = await fetch(url);
      return getResponse.ok;
    }
    return false;
  } catch {
    return false;
  }
}

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

async function getWikidataImage(entityId) {
  const url = `https://www.wikidata.org/w/api.php?action=wbgetclaims&entity=${encodeURIComponent(
    entityId
  )}&property=P18|P154&format=json&origin=*`;
  const res = await fetch(url);
  if (!res.ok) return null;
  const data = await res.json();
  const claims = data?.claims || {};

  const pickImage = (property) => {
    const claim = claims?.[property]?.[0];
    return claim?.mainsnak?.datavalue?.value || null;
  };

  const imageFile = pickImage("P18") || pickImage("P154");
  if (!imageFile) return null;

  return `https://commons.wikimedia.org/wiki/Special:FilePath/${encodeURIComponent(imageFile)}`;
}

async function getCollegeImageFromWikidata(college) {
  const query = `${college.name} engineering college`;
  const title = await searchWikipediaTitle(query);
  if (!title) return null;
  const wikidataItem = await getWikidataItemFromTitle(title);
  if (!wikidataItem) return null;
  return getWikidataImage(wikidataItem);
}

function shouldReplaceUrl(currentUrl, reachable) {
  if (!currentUrl) return true;
  if (!reachable) return true;
  const lowered = currentUrl.toLowerCase();
  return lowered.includes("wikipedia") || lowered.includes("wikimedia");
}

async function validateAndFix() {
  const limit = Number(process.argv[2] || 0);
  console.log("🔍 Loading colleges...");

  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("id, name, city, state, cover_image_url, logo_url")
    .order("name", { ascending: true });

  if (error) {
    console.error("❌ Error loading colleges:", error.message);
    process.exit(1);
  }

  const targets = limit > 0 ? colleges.slice(0, limit) : colleges;
  console.log(`🧩 Checking ${targets.length} records...\n`);

  let checked = 0;
  let fixed = 0;

  for (const college of targets) {
    const currentUrl = college.cover_image_url || college.logo_url;
    const reachable = currentUrl ? await urlIsReachable(currentUrl) : false;
    const shouldReplace = shouldReplaceUrl(currentUrl, reachable);
    checked += 1;

    if (shouldReplace) {
      const wikidataImage = await getCollegeImageFromWikidata(college);
      if (wikidataImage) {
        const { error: updateError } = await supabase
          .from("colleges")
          .update({ cover_image_url: wikidataImage })
          .eq("id", college.id);

        if (updateError) {
          console.log(`❌ ${college.name}: ${updateError.message}`);
        } else {
          fixed += 1;
          console.log(`✅ Updated ${college.name}`);
        }
      } else {
        console.log(`⚠️  ${college.name}: no Wikidata image found`);
      }
    }

    await sleep(250);
  }

  console.log(`\n✅ Done. Checked ${checked} colleges, updated ${fixed}.`);
}

validateAndFix().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
