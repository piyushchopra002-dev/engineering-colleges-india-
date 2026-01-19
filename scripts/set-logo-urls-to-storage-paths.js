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

async function run() {
  await ensureBucket();

  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("id, slug")
    .order("name", { ascending: true });

  if (error) {
    console.error("❌ Error loading colleges:", error.message);
    process.exit(1);
  }

  let updated = 0;
  for (const college of colleges) {
    if (!college.slug) continue;
    const logoUrl = `${supabaseUrl}/storage/v1/object/public/${BUCKET_NAME}/${college.slug}.png`;
    const { error: updateError } = await supabase
      .from("colleges")
      .update({ logo_url: logoUrl })
      .eq("id", college.id);

    if (updateError) {
      console.log(`❌ ${college.slug}: ${updateError.message}`);
    } else {
      updated += 1;
    }
  }

  console.log(`✅ Set logo_url for ${updated} colleges.`);
  console.log(
    `Now upload files to Storage bucket "${BUCKET_NAME}" named as <slug>.png (e.g., iit-bombay.png).`
  );
}

run().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
