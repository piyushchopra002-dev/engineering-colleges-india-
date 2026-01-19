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

async function fetchThumbnailForTitle(title) {
  const url = `https://en.wikipedia.org/w/api.php?action=query&prop=pageimages&format=json&pithumbsize=800&titles=${encodeURIComponent(
    title
  )}&origin=*`;
  const res = await fetch(url);
  if (!res.ok) return null;
  const data = await res.json();
  const pages = data?.query?.pages || {};
  const page = Object.values(pages)[0];
  return page?.thumbnail?.source || null;
}

async function fetchWikipediaImage(query) {
  const title = await searchWikipediaTitle(query);
  if (!title) return null;
  return fetchThumbnailForTitle(title);
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
    if (!currentUrl) {
      checked += 1;
      continue;
    }

    const ok = await urlIsReachable(currentUrl);
    checked += 1;

    if (!ok) {
      const query = `${college.name} ${college.city} ${college.state}`;
      const wikiImage = await fetchWikipediaImage(query);

      if (wikiImage) {
        const { error: updateError } = await supabase
          .from("colleges")
          .update({ cover_image_url: wikiImage })
          .eq("id", college.id);

        if (updateError) {
          console.log(`❌ ${college.name}: ${updateError.message}`);
        } else {
          fixed += 1;
          console.log(`✅ Fixed ${college.name}`);
        }
      } else {
        console.log(`⚠️  ${college.name}: no Wikipedia image found`);
      }
    }

    await sleep(250);
  }

  console.log(`\n✅ Done. Checked ${checked} colleges, fixed ${fixed}.`);
}

validateAndFix().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
