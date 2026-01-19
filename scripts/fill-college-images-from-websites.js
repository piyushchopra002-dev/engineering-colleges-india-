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

const extractLinkHref = (html, relValue) => {
  const regex = new RegExp(
    `<link[^>]*rel=["'][^"']*${relValue}[^"']*["'][^>]*href=["']([^"']+)["'][^>]*>`,
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

async function fetchWebsiteImage(websiteUrl) {
  try {
    const response = await fetch(websiteUrl, { redirect: "follow" });
    if (!response.ok) return null;
    const html = await response.text();

    const ogImage =
      extractMetaContent(html, "og:image") ||
      extractMetaContent(html, "twitter:image", "name");

    const iconHref =
      extractLinkHref(html, "icon") ||
      extractLinkHref(html, "shortcut icon") ||
      extractLinkHref(html, "apple-touch-icon");

    if (ogImage) return absolutize(websiteUrl, ogImage);
    if (iconHref) return absolutize(websiteUrl, iconHref);

    return null;
  } catch {
    return null;
  }
}

async function fillImages() {
  const limit = Number(process.argv[2] || 0);
  console.log("🔍 Loading colleges with websites...");

  const { data: colleges, error } = await supabase
    .from("colleges")
    .select("id, name, website, cover_image_url, logo_url")
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

    const hostname = new URL(websiteUrl).hostname;
    const imageUrl =
      (await fetchWebsiteImage(websiteUrl)) ||
      `https://logo.clearbit.com/${hostname}?size=512` ||
      `https://www.google.com/s2/favicons?domain=${hostname}&sz=512`;

    if (imageUrl) {
      const { error: updateError } = await supabase
        .from("colleges")
        .update({ logo_url: imageUrl })
        .eq("id", college.id);

      if (updateError) {
        console.log(`❌ ${college.name}: ${updateError.message}`);
      } else {
        updated += 1;
        console.log(`✅ ${college.name}`);
      }
    } else {
      console.log(`⚠️  ${college.name}: no image found`);
    }

    await sleep(250);
  }

  console.log(`\n✅ Done. Updated ${updated} colleges.`);
}

fillImages().catch((err) => {
  console.error("❌ Unexpected error:", err.message);
  process.exit(1);
});
