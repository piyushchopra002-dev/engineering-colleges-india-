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

const normalize = (value) => (value || "").trim().toLowerCase();

async function removeDuplicates() {
  console.log("🔍 Loading colleges...");

  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("id, name, slug, city, state, created_at")
    .order("created_at", { ascending: true });

  if (error) {
    console.error("❌ Error loading colleges:", error.message);
    process.exit(1);
  }

  const groups = new Map();
  for (const college of colleges) {
    const key = `${normalize(college.name)}|${normalize(college.city)}|${normalize(
      college.state
    )}`;
    if (!groups.has(key)) groups.set(key, []);
    groups.get(key).push(college);
  }

  const toDelete = [];
  for (const [, group] of groups) {
    if (group.length > 1) {
      const keep = group[0];
      group.slice(1).forEach((c) => toDelete.push(c));
      console.log(
        `🧹 Keeping: ${keep.name} (${keep.city}, ${keep.state}) | Removing ${group.length - 1}`
      );
    }
  }

  if (toDelete.length === 0) {
    console.log("✅ No duplicates found.");
    return;
  }

  console.log(`\n🚀 Deleting ${toDelete.length} duplicate records...`);
  const ids = toDelete.map((c) => c.id);

  const { error: deleteError } = await supabase.from("colleges").delete().in("id", ids);
  if (deleteError) {
    console.error("❌ Error deleting duplicates:", deleteError.message);
    process.exit(1);
  }

  console.log("✅ Duplicates removed.");
}

removeDuplicates().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
