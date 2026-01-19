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

  // Add city pages
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
        url: `${baseUrl}/cities/${encodeURIComponent(city.toLowerCase().replace(/\s+/g, "-"))}-${encodeURIComponent(state.toLowerCase().replace(/\s+/g, "-"))}`,
        lastModified: new Date(),
        changeFrequency: "weekly",
        priority: 0.7,
      });
    });
  }

  return sitemap;
}
