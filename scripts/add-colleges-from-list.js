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

const list = [
  ["iiit-hyderabad", "Hyderabad", "Telangana"],
  ["iiit-bangalore", "Bengaluru", "Karnataka"],
  ["iiit-delhi", "New Delhi", "Delhi"],
  ["iiit-allahabad", "Prayagraj", "Uttar Pradesh"],
  ["iiit-gwalior", "Gwalior", "Madhya Pradesh"],
  ["iiit-jabalpur", "Jabalpur", "Madhya Pradesh"],
  ["iiit-kancheepuram", "Chennai", "Tamil Nadu"],
  ["iiit-kalyani", "Kalyani", "West Bengal"],
  ["iiit-kota", "Kota", "Rajasthan"],
  ["iiit-lucknow", "Lucknow", "Uttar Pradesh"],
  ["iiit-nagpur", "Nagpur", "Maharashtra"],
  ["iiit-pune", "Pune", "Maharashtra"],
  ["iiit-ranchi", "Ranchi", "Jharkhand"],
  ["iiit-sonepat", "Sonepat", "Haryana"],
  ["iiit-sri-city", "Sri City", "Andhra Pradesh"],
  ["iiit-surajpur", "Surajpur", "Chhattisgarh"],
  ["iiit-una", "Una", "Himachal Pradesh"],
  ["iiit-vadodara", "Vadodara", "Gujarat"],
  ["birla-institute-of-technology-mesra", "Ranchi", "Jharkhand"],
  ["psg-college-of-technology", "Coimbatore", "Tamil Nadu"],
  ["sastra-deemed-university", "Thanjavur", "Tamil Nadu"],
  ["amrita-vishwa-vidyapeetham", "Coimbatore", "Tamil Nadu"],
  ["jadavpur-university", "Kolkata", "West Bengal"],
  ["anna-university", "Chennai", "Tamil Nadu"],
  ["college-of-engineering-pune", "Pune", "Maharashtra"],
  ["osmania-university-college-of-engineering", "Hyderabad", "Telangana"],
  ["government-college-of-technology-coimbatore", "Coimbatore", "Tamil Nadu"],
];

const titleCase = (value) =>
  value
    .split(" ")
    .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
    .join(" ");

const nameFromSlug = (slug) => {
  if (slug.startsWith("iiit-")) {
    const location = titleCase(slug.replace("iiit-", "").replace(/-/g, " "));
    return `IIIT ${location}`;
  }
  if (slug === "psg-college-of-technology") return "PSG College of Technology";
  if (slug === "sastra-deemed-university") return "SASTRA Deemed University";
  if (slug === "amrita-vishwa-vidyapeetham") return "Amrita Vishwa Vidyapeetham";
  if (slug === "birla-institute-of-technology-mesra") return "Birla Institute of Technology, Mesra";
  if (slug === "college-of-engineering-pune") return "College of Engineering Pune";
  if (slug === "osmania-university-college-of-engineering")
    return "Osmania University College of Engineering";
  if (slug === "government-college-of-technology-coimbatore")
    return "Government College of Technology, Coimbatore";
  return titleCase(slug.replace(/-/g, " "));
};

async function run() {
  const payload = list.map(([slug, city, state]) => ({
    slug,
    name: nameFromSlug(slug),
    city,
    state,
    location: `${city}, ${state}`,
  }));

  const { error } = await supabase.from("colleges").upsert(payload, {
    onConflict: "slug",
  });

  if (error) {
    console.error("❌ Upsert error:", error.message);
    process.exit(1);
  }

  console.log(`✅ Upserted ${payload.length} colleges.`);
}

run().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
