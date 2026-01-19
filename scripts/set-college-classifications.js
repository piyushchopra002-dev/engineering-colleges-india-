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

const privateSlugs = new Set([
  "bits-pilani",
  "vit-vellore",
  "manipal-institute-of-technology",
  "srm-institute-of-science-and-technology",
  "kiit-university",
  "amity-university",
  "lovely-professional-university",
  "shiv-nadar-university",
  "siksha-o-anusandhan-university",
  "thapar-institute-of-engineering-and-technology",
  "sastra-deemed-university",
  "amrita-vishwa-vidyapeetham",
]);

const deemedSlugs = new Set([
  "bits-pilani",
  "vit-vellore",
  "manipal-institute-of-technology",
  "srm-institute-of-science-and-technology",
  "kiit-university",
  "siksha-o-anusandhan-university",
  "sastra-deemed-university",
  "amrita-vishwa-vidyapeetham",
]);

const classify = (college) => {
  const slug = college.slug || "";
  const name = (college.name || "").toLowerCase();

  let institution_category = "College";
  if (slug.startsWith("iit-") || slug.includes("indian-institute-of-technology")) {
    institution_category = "IIT";
  } else if (slug.startsWith("nit-") || slug.includes("national-institute-of-technology")) {
    institution_category = "NIT";
  } else if (slug.startsWith("iiit-")) {
    institution_category = "IIIT";
  } else if (deemedSlugs.has(slug) || name.includes("deemed")) {
    institution_category = "Deemed University";
  } else if (name.includes("university")) {
    institution_category = "University";
  }

  let ownership_type = "Government";
  if (privateSlugs.has(slug) || name.includes("private")) {
    ownership_type = "Private";
  }

  let jurisdiction = "State";
  if (institution_category === "IIT" || institution_category === "NIT" || institution_category === "IIIT") {
    jurisdiction = "Central";
  }

  return { institution_category, ownership_type, jurisdiction };
};

async function run() {
  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("id, slug, name");

  if (error) {
    console.error("❌ Error loading colleges:", error.message);
    process.exit(1);
  }

  let updated = 0;
  for (const college of colleges) {
    const { institution_category, ownership_type, jurisdiction } = classify(college);
    const { error: updateError } = await supabase
      .from("colleges")
      .update({ institution_category, ownership_type, jurisdiction })
      .eq("id", college.id);

    if (updateError) {
      console.log(`❌ ${college.slug}: ${updateError.message}`);
    } else {
      updated += 1;
    }
  }

  console.log(`✅ Updated classifications for ${updated} colleges.`);
}

run().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
