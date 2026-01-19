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

async function getCoordinatesFromTitle(title) {
  const url = `https://en.wikipedia.org/w/api.php?action=query&prop=coordinates&format=json&titles=${encodeURIComponent(
    title
  )}&origin=*`;
  const res = await fetch(url);
  if (!res.ok) return null;
  const data = await res.json();
  const pages = data?.query?.pages || {};
  const page = Object.values(pages)[0];
  const coords = page?.coordinates?.[0];
  if (!coords) return null;
  return { lat: coords.lat, lon: coords.lon };
}

async function reverseGeocode(lat, lon) {
  const url = `https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lat}&lon=${lon}`;
  const res = await fetch(url, {
    headers: {
      "User-Agent": "college-directory/1.0 (contact: admin@example.com)",
    },
  });
  if (!res.ok) return null;
  const data = await res.json();
  const address = data?.address || {};
  const city =
    address.city ||
    address.town ||
    address.village ||
    address.municipality ||
    address.county;
  const state = address.state || address.state_district || address.region;
  if (!city || !state) return null;
  return { city, state };
}

async function updateCityState() {
  const limit = Number(process.argv[2] || 0);
  console.log("🔍 Loading colleges...");

  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("id, name, city, state")
    .order("name", { ascending: true });

  if (error) {
    console.error("❌ Error loading colleges:", error.message);
    process.exit(1);
  }

  const targets = limit > 0 ? colleges.slice(0, limit) : colleges;
  console.log(`🚀 Processing ${targets.length} colleges...\n`);

  let updated = 0;
  for (const college of targets) {
    const title = await searchWikipediaTitle(`${college.name} engineering college`);
    if (!title) {
      continue;
    }

    const coords = await getCoordinatesFromTitle(title);
    if (!coords) {
      continue;
    }

    const place = await reverseGeocode(coords.lat, coords.lon);
    if (!place) {
      continue;
    }

    const city = place.city;
    const state = place.state;

    if (city !== college.city || state !== college.state) {
      const { error: updateError } = await supabase
        .from("colleges")
        .update({ city, state })
        .eq("id", college.id);

      if (updateError) {
        console.log(`❌ ${college.name}: ${updateError.message}`);
      } else {
        updated += 1;
        console.log(`✅ ${college.name}: ${college.city}, ${college.state} -> ${city}, ${state}`);
      }
    }

    await sleep(1000);
  }

  console.log(`\n✅ Done. Updated ${updated} colleges.`);
}

updateCityState().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
