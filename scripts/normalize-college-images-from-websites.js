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

const normalizeWebsite = (website) => {
  if (!website) return null;
  try {
    const url = website.startsWith("http") ? website : `https://${website}`;
    return new URL(url);
  } catch {
    return null;
  }
};

async function normalizeImages() {
  const limit = Number(process.argv[2] || 0);
  console.log("🔍 Loading colleges with websites...");

  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("id, name, website")
    .order("name", { ascending: true });

  if (error) {
    console.error("❌ Error loading colleges:", error.message);
    process.exit(1);
  }

  const targets = colleges.filter((c) => c.website);
  const batch = limit > 0 ? targets.slice(0, limit) : targets;

  console.log(`🧩 Found ${targets.length} colleges with websites`);
  console.log(`🚀 Processing ${batch.length} records...\n`);

  let updated = 0;
  for (const college of batch) {
    const websiteUrl = normalizeWebsite(college.website);
    if (!websiteUrl) continue;

    const logoUrl = `https://logo.clearbit.com/${websiteUrl.hostname}`;

    const { error: updateError } = await supabase
      .from("colleges")
      .update({ logo_url: logoUrl, cover_image_url: null })
      .eq("id", college.id);

    if (updateError) {
      console.log(`❌ ${college.name}: ${updateError.message}`);
    } else {
      updated += 1;
      console.log(`✅ ${college.name}`);
    }

    await sleep(150);
  }

  console.log(`\n✅ Done. Updated ${updated} colleges.`);
}

normalizeImages().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
