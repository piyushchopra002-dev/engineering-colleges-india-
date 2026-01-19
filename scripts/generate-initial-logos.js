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

const palette = [
  "#2563eb",
  "#16a34a",
  "#9333ea",
  "#ea580c",
  "#0ea5e9",
  "#db2777",
  "#dc2626",
  "#0f766e",
];

const initialsFor = (name) => {
  if (!name) return "CL";
  const parts = name
    .replace(/[^a-zA-Z0-9\s]/g, " ")
    .split(/\s+/)
    .filter(Boolean);
  if (parts.length === 1) return parts[0].slice(0, 2).toUpperCase();
  return `${parts[0][0]}${parts[1][0]}`.toUpperCase();
};

const colorFor = (slug) => {
  let hash = 0;
  for (let i = 0; i < slug.length; i += 1) {
    hash = (hash * 31 + slug.charCodeAt(i)) % 0xffffffff;
  }
  return palette[Math.abs(hash) % palette.length];
};

const makeSvg = (text, color) => `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" role="img" aria-label="${text}">
  <rect width="512" height="512" rx="48" fill="#ffffff"/>
  <rect x="40" y="40" width="432" height="432" rx="36" fill="#f3f4f6"/>
  <circle cx="256" cy="256" r="150" fill="${color}" opacity="0.12"/>
  <text x="256" y="290" text-anchor="middle" font-family="Arial, sans-serif" font-size="140" font-weight="700" fill="${color}">
    ${text}
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

async function uploadLogo(path, svg) {
  const { error } = await supabase.storage
    .from(BUCKET_NAME)
    .upload(path, Buffer.from(svg), {
      upsert: true,
      contentType: "image/svg+xml",
    });
  if (error) throw error;

  const { data } = supabase.storage.from(BUCKET_NAME).getPublicUrl(path);
  return data.publicUrl;
}

async function run() {
  await ensureBucket();

  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("id, name, slug")
    .order("name", { ascending: true });

  if (error) {
    console.error("❌ Error loading colleges:", error.message);
    process.exit(1);
  }

  let updated = 0;
  for (const college of colleges) {
    if (!college.slug) continue;
    const initials = initialsFor(college.name);
    const color = colorFor(college.slug);
    const svg = makeSvg(initials, color);
    const filePath = `${college.slug}.svg`;
    const publicUrl = await uploadLogo(filePath, svg);

    const { error: updateError } = await supabase
      .from("colleges")
      .update({ logo_url: publicUrl })
      .eq("id", college.id);

    if (updateError) {
      console.log(`❌ ${college.name}: ${updateError.message}`);
    } else {
      updated += 1;
    }
  }

  console.log(`✅ Uploaded initials logos for ${updated} colleges.`);
}

run().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
