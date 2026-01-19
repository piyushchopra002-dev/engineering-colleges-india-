const fs = require("fs");
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

const csvPath = process.argv[2] || "scripts/slug-name.csv";

const parseCsvLine = (line) => {
  const firstComma = line.indexOf(",");
  if (firstComma === -1) return null;
  const slug = line.slice(0, firstComma).trim();
  let name = line.slice(firstComma + 1).trim();
  if (name.startsWith("\"") && name.endsWith("\"")) {
    name = name.slice(1, -1);
  }
  return { slug, name };
};

async function run() {
  const raw = fs.readFileSync(csvPath, "utf8");
  const lines = raw.split(/\r?\n/).filter(Boolean);
  const records = lines.slice(1).map(parseCsvLine).filter(Boolean);

  let updated = 0;
  let missing = [];

  for (const { slug, name } of records) {
    const { data, error } = await supabase
      .from("colleges")
      .update({ name })
      .eq("slug", slug)
      .select("id");

    if (error) {
      console.error(slug, error.message);
      continue;
    }
    if (!data || data.length === 0) {
      missing.push(slug);
    } else {
      updated += data.length;
    }
  }

  console.log(`✅ Updated ${updated} records`);
  if (missing.length) {
    console.log(`⚠️ Missing slugs: ${missing.join(", ")}`);
  }
}

run().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
