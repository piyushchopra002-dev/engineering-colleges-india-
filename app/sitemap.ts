import { MetadataRoute } from "next";
import { createSupabaseServerClient } from "@/lib/supabase/server";

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const baseUrl = process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000";
  const supabase = createSupabaseServerClient();

  const sitemap: MetadataRoute.Sitemap = [
    {
      url: baseUrl,
      lastModified: new Date(),
      changeFrequency: "daily",
      priority: 1,
    },
    {
      url: `${baseUrl}/colleges`,
      lastModified: new Date(),
      changeFrequency: "daily",
      priority: 0.9,
    },
    {
      url: `${baseUrl}/compare`,
      lastModified: new Date(),
      changeFrequency: "weekly",
      priority: 0.8,
    },
  ];

  // Add college pages
  const { data: colleges } = await supabase
    .from("colleges")
    .select("slug, updated_at")
    .limit(5000);

  if (colleges) {
    colleges.forEach((college) => {
      sitemap.push({
        url: `${baseUrl}/colleges/${college.slug}`,
        lastModified: college.updated_at ? new Date(college.updated_at) : new Date(),
        changeFrequency: "weekly",
        priority: 0.8,
      });
    });
  }

  // Add branch pages
  const { data: branches } = await supabase.from("branches").select("slug").limit(100);

  if (branches) {
    branches.forEach((branch) => {
      sitemap.push({
        url: `${baseUrl}/branches/${branch.slug}`,
        lastModified: new Date(),
        changeFrequency: "weekly",
        priority: 0.7,
      });
    });
  }

  // Add city pages (programmatic SEO)
  const { data: cities } = await supabase
    .from("colleges")
    .select("city, state")
    .limit(200);

  if (cities) {
    const uniqueCities = Array.from(
      new Set(cities.map((c) => `${c.city}-${c.state}`))
    ).map((key) => {
      const [city, state] = key.split("-");
      return { city, state };
    });

    uniqueCities.forEach(({ city, state }) => {
      sitemap.push({
        url: `${baseUrl}/colleges/city/${encodeURIComponent(city.toLowerCase().replace(/\s+/g, "-"))}-${encodeURIComponent(state.toLowerCase().replace(/\s+/g, "-"))}`,
        lastModified: new Date(),
        changeFrequency: "weekly",
        priority: 0.8,
      });
    });
  }

  // Add comparison pages (programmatic SEO)
  if (colleges && colleges.length >= 2) {
    const iits = colleges.filter((c) => c.slug.includes("iit")).slice(0, 10);
    const nits = colleges.filter((c) => c.slug.includes("nit")).slice(0, 5);

    // IIT vs IIT comparisons
    for (let i = 0; i < Math.min(iits.length, 5); i++) {
      for (let j = i + 1; j < Math.min(iits.length, 5); j++) {
        sitemap.push({
          url: `${baseUrl}/compare/${iits[i].slug}-vs-${iits[j].slug}`,
          lastModified: new Date(),
          changeFrequency: "monthly",
          priority: 0.7,
        });
      }
    }

    // IIT vs NIT comparisons
    for (let i = 0; i < Math.min(iits.length, 3); i++) {
      for (let j = 0; j < Math.min(nits.length, 3); j++) {
        sitemap.push({
          url: `${baseUrl}/compare/${iits[i].slug}-vs-${nits[j].slug}`,
          lastModified: new Date(),
          changeFrequency: "monthly",
          priority: 0.7,
        });
      }
    }
  }

  // Add ranking pages (programmatic SEO)
  const rankingCategories = [
    "nirf-top-100",
    "computer-science",
    "placement-salary",
    "iit-rankings",
    "nit-rankings",
    "iiit-rankings",
    "government-colleges",
    "private-colleges",
  ];

  rankingCategories.forEach((category) => {
    sitemap.push({
      url: `${baseUrl}/rankings/${category}`,
      lastModified: new Date(),
      changeFrequency: "weekly",
      priority: 0.8,
    });
  });

  // Add cutoff pages (programmatic SEO)
  const cutoffRanges = [
    "under-1000",
    "1000-5000",
    "5000-10000",
    "10000-20000",
    "20000-50000",
    "50000-100000",
  ];

  cutoffRanges.forEach((range) => {
    sitemap.push({
      url: `${baseUrl}/cutoffs/${range}`,
      lastModified: new Date(),
      changeFrequency: "weekly",
      priority: 0.7,
    });
  });

  return sitemap;
}
