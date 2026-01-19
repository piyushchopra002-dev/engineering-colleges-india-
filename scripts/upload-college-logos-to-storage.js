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

const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

const normalizeWebsite = (website) => {
  if (!website) return null;
  try {
    const url = website.startsWith("http") ? website : `https://${website}`;
    return new URL(url).toString();
  } catch {
    return null;
  }
};

const extractMetaContent = (html, name, attr = "property") => {
  const regex = new RegExp(
    `<meta[^>]*${attr}=["']${name}["'][^>]*content=["']([^"']+)["'][^>]*>`,
    "i"
  );
  const match = html.match(regex);
  return match ? match[1] : null;
};

const absolutize = (baseUrl, maybeRelative) => {
  try {
    return new URL(maybeRelative, baseUrl).toString();
  } catch {
    return null;
  }
};

async function fetchOgImage(websiteUrl) {
  try {
    const response = await fetch(websiteUrl, { redirect: "follow" });
    if (!response.ok) return null;
    const html = await response.text();
    const ogImage =
      extractMetaContent(html, "og:image") ||
      extractMetaContent(html, "twitter:image", "name");
    if (!ogImage) return null;
    return absolutize(websiteUrl, ogImage);
  } catch {
    return null;
  }
}

const extensionFromType = (contentType) => {
  if (!contentType) return "jpg";
  if (contentType.includes("png")) return "png";
  if (contentType.includes("webp")) return "webp";
  if (contentType.includes("svg")) return "svg";
  if (contentType.includes("jpeg") || contentType.includes("jpg")) return "jpg";
  return "jpg";
};

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

async function uploadLogo(path, buffer, contentType) {
  const { error } = await supabase.storage
    .from(BUCKET_NAME)
    .upload(path, buffer, { upsert: true, contentType });
  if (error) throw error;

  const { data } = supabase.storage.from(BUCKET_NAME).getPublicUrl(path);
  return data.publicUrl;
}

async function run() {
  const limit = Number(process.argv[2] || 0);
  await ensureBucket();

  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("id, name, slug, website")
    .order("name", { ascending: true });

  if (error) {
    console.error("❌ Error loading colleges:", error.message);
    process.exit(1);
  }

  const targets = limit > 0 ? colleges.slice(0, limit) : colleges;
  console.log(`🚀 Processing ${targets.length} colleges...\n`);

  let updated = 0;
  for (const college of targets) {
    const websiteUrl = normalizeWebsite(college.website);
    if (!websiteUrl) {
      continue;
    }

    const ogImageUrl = await fetchOgImage(websiteUrl);
    if (!ogImageUrl) {
      console.log(`⚠️  ${college.name}: no og:image found`);
      continue;
    }

    try {
      const imageRes = await fetch(ogImageUrl);
      if (!imageRes.ok) {
        console.log(`⚠️  ${college.name}: og:image not reachable`);
        continue;
      }

      const contentType = imageRes.headers.get("content-type") || "image/jpeg";
      const ext = extensionFromType(contentType);
      const arrayBuffer = await imageRes.arrayBuffer();
      const buffer = Buffer.from(arrayBuffer);

      const filePath = `${college.slug || college.id}.${ext}`;
      const publicUrl = await uploadLogo(filePath, buffer, contentType);

      const { error: updateError } = await supabase
        .from("colleges")
        .update({ logo_url: publicUrl })
        .eq("id", college.id);

      if (updateError) {
        console.log(`❌ ${college.name}: ${updateError.message}`);
      } else {
        updated += 1;
        console.log(`✅ ${college.name}`);
      }
    } catch (err) {
      console.log(`⚠️  ${college.name}: ${err.message}`);
    }

    await sleep(200);
  }

  console.log(`\n✅ Done. Updated ${updated} logos.`);
}

run().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
