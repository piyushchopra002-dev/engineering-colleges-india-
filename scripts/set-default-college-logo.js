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
const BUCKET_NAME = "college-logos";
const DEFAULT_PATH = "default-college-logo.svg";

const defaultSvg = `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" role="img" aria-label="College logo">
  <rect width="512" height="512" rx="48" fill="#ffffff"/>
  <rect x="40" y="40" width="432" height="432" rx="36" fill="#f3f4f6"/>
  <path d="M256 96L80 192l176 96 176-96-176-96z" fill="#2563eb"/>
  <path d="M144 240v96c0 8 4 16 12 20 20 10 56 20 100 20s80-10 100-20c8-4 12-12 12-20v-96l-112 60-112-60z" fill="#1d4ed8"/>
  <circle cx="256" cy="352" r="12" fill="#1e40af"/>
  <text x="256" y="420" text-anchor="middle" font-family="Arial, sans-serif" font-size="28" fill="#1f2937">
    College
  </text>
</svg>`;

async function ensureBucket() {
  const { data: buckets } = await supabase.storage.listBuckets();
  const exists = buckets?.some((b) => b.name === BUCKET_NAME);
  if (!exists) {
    const { error } = await supabase.storage.createBucket(BUCKET_NAME, {
      public: true,
    });
    if (error && !String(error.message || "").includes("already exists")) {
      throw error;
    }
  }
}

async function uploadDefaultLogo() {
  const { error } = await supabase.storage
    .from(BUCKET_NAME)
    .upload(DEFAULT_PATH, Buffer.from(defaultSvg), {
      upsert: true,
      contentType: "image/svg+xml",
    });
  if (error) throw error;

  const { data } = supabase.storage.from(BUCKET_NAME).getPublicUrl(DEFAULT_PATH);
  return data.publicUrl;
}

async function updateAllColleges(logoUrl) {
  const { error } = await supabase
    .from("colleges")
    .update({ logo_url: logoUrl })
    .not("id", "is", null);
  if (error) throw error;
}

async function run() {
  await ensureBucket();
  const logoUrl = await uploadDefaultLogo();
  await updateAllColleges(logoUrl);
  console.log(`✅ Default logo set for all colleges: ${logoUrl}`);
}

run().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
