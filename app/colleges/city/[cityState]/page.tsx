import { Metadata } from "next";
import { notFound } from "next/navigation";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { CityPageTemplate } from "@/components/programmatic/CityPageTemplate";
import {
  generateCityPageMeta,
  getCanonicalUrl,
  generateOGImageUrl,
} from "@/lib/programmatic-seo";
import { generateCityPageContent } from "@/lib/content-templates";
import { generateCitySchema, generateBreadcrumbStructuredData } from "@/lib/seo";
import { College } from "@/types";

interface PageProps {
  params: {
    cityState: string;
  };
}

// Parse city-state slug
function parseCityState(slug: string): { city: string; state: string } | null {
  const parts = slug.split("-");
  if (parts.length < 2) return null;

  // Last part is state, rest is city
  const state = parts[parts.length - 1];
  const city = parts.slice(0, -1).join(" ");

  return {
    city: city.charAt(0).toUpperCase() + city.slice(1),
    state: state.charAt(0).toUpperCase() + state.slice(1),
  };
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const parsed = parseCityState(params.cityState);
  if (!parsed) {
    return {
      title: "City Not Found",
    };
  }

  const { city, state } = parsed;
  const supabase = createSupabaseServerClient();

  // Get college count and top colleges
  const { data: colleges, count } = await supabase
    .from("colleges")
    .select("*", { count: "exact" })
    .ilike("city", city)
    .ilike("state", state)
    .limit(5);

  const collegeCount = count || 0;
  const meta = generateCityPageMeta(city, state, collegeCount, colleges || []);

  return {
    title: meta.title,
    description: meta.description,
    keywords: meta.keywords,
    openGraph: {
      title: meta.ogTitle || meta.title,
      description: meta.ogDescription || meta.description,
      url: getCanonicalUrl(meta.canonical || ""),
      images: [
        {
          url: generateOGImageUrl({
            type: "city",
            title: `${city}, ${state}`,
            subtitle: `${collegeCount} Engineering Colleges`,
            stats: [`${collegeCount}+ Colleges`, "Top Rankings", "Best Placements"],
          }),
          width: 1200,
          height: 630,
        },
      ],
    },
    twitter: {
      card: "summary_large_image",
      title: meta.ogTitle || meta.title,
      description: meta.ogDescription || meta.description,
    },
    alternates: {
      canonical: getCanonicalUrl(meta.canonical || ""),
    },
  };
}

export default async function CityPage({ params }: PageProps) {
  const parsed = parseCityState(params.cityState);
  if (!parsed) {
    notFound();
  }

  const { city, state } = parsed;
  const supabase = createSupabaseServerClient();

  // Fetch colleges in this city
  const { data: colleges, error } = await supabase
    .from("colleges")
    .select(`
      *,
      college_rankings (
        ranking_type,
        year,
        rank
      )
    `)
    .ilike("city", city)
    .ilike("state", state)
    .order("name", { ascending: true });

  if (error || !colleges || colleges.length === 0) {
    notFound();
  }

  // Get placement stats for colleges (get latest available year)
  const collegeIds = colleges.map((c) => c.id);
  const { data: placementStats } = await supabase
    .from("placement_stats")
    .select("college_id, year, average_salary, highest_salary, placement_percentage")
    .in("college_id", collegeIds)
    .gte("year", 2021)
    .order("year", { ascending: false })
    .order("average_salary", { ascending: false });

  // Get cutoff data (get latest available year)
  const { data: cutoffs } = await supabase
    .from("cutoffs")
    .select("college_id, closing_rank, category")
    .in("college_id", collegeIds)
    .gte("year", 2021)
    .eq("category", "General")
    .order("year", { ascending: false })
    .order("closing_rank", { ascending: true });

  // Calculate stats
  const avgPlacement =
    placementStats && placementStats.length > 0
      ? placementStats.reduce((sum, p) => sum + (p.average_salary || 0), 0) /
        placementStats.length
      : undefined;

  const topPlacement =
    placementStats && placementStats.length > 0
      ? Math.max(...placementStats.map((p) => p.highest_salary || 0))
      : undefined;

  const avgCutoff =
    cutoffs && cutoffs.length > 0
      ? cutoffs.reduce((sum, c) => sum + (c.closing_rank || 0), 0) / cutoffs.length
      : undefined;

  // Generate content
  const content = generateCityPageContent(city, state, colleges.length, {
    avgPlacement,
    topPlacement,
    avgCutoff,
  });

  // Generate structured data
  const citySchema = generateCitySchema(city, state, colleges.length);
  const breadcrumbData = generateBreadcrumbStructuredData([
    { name: "Home", url: "/" },
    { name: "Colleges", url: "/colleges" },
    { name: `${city}, ${state}`, url: `/colleges/city/${params.cityState}` },
  ]);

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(citySchema) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbData) }}
      />
      <CityPageTemplate
        city={city}
        state={state}
        colleges={colleges as College[]}
        content={content}
        placementStats={placementStats || []}
        cutoffs={cutoffs || []}
      />
    </>
  );
}

// Generate static params for popular cities
export async function generateStaticParams() {
  const supabase = createSupabaseServerClient();

  const { data: cities } = await supabase
    .from("colleges")
    .select("city, state")
    .limit(100);

  if (!cities) return [];

  // Get unique city-state combinations
  const uniqueCities = Array.from(
    new Set(cities.map((c) => `${c.city}-${c.state}`))
  ).map((key) => {
    const [city, state] = key.split("-");
    return {
      cityState: `${city.toLowerCase().replace(/\s+/g, "-")}-${state.toLowerCase().replace(/\s+/g, "-")}`,
    };
  });

  return uniqueCities.slice(0, 50); // Generate top 50 cities statically
}
