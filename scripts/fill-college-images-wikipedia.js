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

async function fillImages() {
  const limit = Number(process.argv[2] || 0);
  console.log("🔍 Fetching colleges without images...");

  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("id, name, city, state, cover_image_url, logo_url")
    .order("name", { ascending: true });

  if (error) {
    console.error("❌ Error loading colleges:", error.message);
    process.exit(1);
  }

  const missing = colleges.filter((c) => !c.cover_image_url && !c.logo_url);
  const targets = limit > 0 ? missing.slice(0, limit) : missing;

  console.log(`🧩 Found ${missing.length} without images`);
  console.log(`🚀 Processing ${targets.length} records...\n`);

  let updated = 0;
  for (const college of targets) {
    const query = `${college.name} ${college.city} ${college.state}`;
    const imageUrl = await fetchWikipediaImage(query);

    if (imageUrl) {
      const { error: updateError } = await supabase
        .from("colleges")
        .update({ cover_image_url: imageUrl })
        .eq("id", college.id);

      if (updateError) {
        console.log(`❌ ${college.name}: ${updateError.message}`);
      } else {
        updated += 1;
        console.log(`✅ ${college.name}`);
      }
    } else {
      console.log(`⚠️  ${college.name}: no image found`);
    }

    await sleep(250);
  }

  console.log(`\n✅ Done. Updated ${updated} colleges.`);
}

fillImages().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
