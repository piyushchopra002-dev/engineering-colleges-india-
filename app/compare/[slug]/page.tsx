import { Metadata } from "next";
import { notFound } from "next/navigation";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { ComparisonPageTemplate } from "@/components/programmatic/ComparisonPageTemplate";
import {
  generateComparisonMeta,
  getCanonicalUrl,
  generateOGImageUrl,
} from "@/lib/programmatic-seo";
import { generateComparisonPageContent } from "@/lib/content-templates";
import { generateComparisonSchema, generateBreadcrumbStructuredData } from "@/lib/seo";
import { College } from "@/types";

interface PageProps {
  params: {
    slug: string;
  };
}

// Parse comparison slug (e.g., "iit-bombay-vs-iit-delhi")
function parseComparisonSlug(slug: string): { slug1: string; slug2: string } | null {
  const parts = slug.split("-vs-");
  if (parts.length !== 2) return null;

  return {
    slug1: parts[0],
    slug2: parts[1],
  };
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const parsed = parseComparisonSlug(params.slug);
  if (!parsed) {
    return {
      title: "Comparison Not Found",
    };
  }

  const { slug1, slug2 } = parsed;
  const supabase = createSupabaseServerClient();

  // Fetch both colleges
  const { data: colleges } = await supabase
    .from("colleges")
    .select("*")
    .in("slug", [slug1, slug2]);

  if (!colleges || colleges.length !== 2) {
    return {
      title: "Comparison Not Found",
    };
  }

  const college1 = colleges.find((c) => c.slug === slug1);
  const college2 = colleges.find((c) => c.slug === slug2);

  if (!college1 || !college2) {
    return {
      title: "Comparison Not Found",
    };
  }

  // Get ranking data for meta
  const { data: rankings } = await supabase
    .from("college_rankings")
    .select("college_id, rank")
    .in("college_id", [college1.id, college2.id])
    .eq("ranking_type", "NIRF")
    .eq("year", 2024);

  const college1Rank = rankings?.find((r) => r.college_id === college1.id)?.rank;
  const college2Rank = rankings?.find((r) => r.college_id === college2.id)?.rank;

  const meta = generateComparisonMeta(college1, college2, {
    college1Rank,
    college2Rank,
  });

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
            type: "comparison",
            title: `${college1.short_name || college1.name} vs ${college2.short_name || college2.name}`,
            subtitle: "Detailed Comparison",
            stats: [
              college1Rank ? `#${college1Rank}` : "",
              "vs",
              college2Rank ? `#${college2Rank}` : "",
            ].filter(Boolean),
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

export default async function ComparisonPage({ params }: PageProps) {
  const parsed = parseComparisonSlug(params.slug);
  if (!parsed) {
    notFound();
  }

  const { slug1, slug2 } = parsed;
  const supabase = createSupabaseServerClient();

  // Fetch both colleges with all related data
  const { data: colleges, error } = await supabase
    .from("colleges")
    .select(`
      *,
      college_rankings (
        ranking_type,
        year,
        rank,
        category
      )
    `)
    .in("slug", [slug1, slug2]);

  if (error || !colleges || colleges.length !== 2) {
    notFound();
  }

  const college1 = colleges.find((c) => c.slug === slug1);
  const college2 = colleges.find((c) => c.slug === slug2);

  if (!college1 || !college2) {
    notFound();
  }

  // Fetch placement stats
  const { data: placementStats } = await supabase
    .from("placement_stats")
    .select("*")
    .in("college_id", [college1.id, college2.id])
    .order("year", { ascending: false });

  // Fetch cutoffs
  const { data: cutoffs } = await supabase
    .from("cutoffs")
    .select(`
      *,
      branches (name)
    `)
    .in("college_id", [college1.id, college2.id])
    .eq("year", 2024)
    .order("closing_rank", { ascending: true });

  // Fetch faculty count
  const { data: faculty } = await supabase
    .from("faculty")
    .select("college_id")
    .in("college_id", [college1.id, college2.id]);

  // Fetch infrastructure
  const { data: infrastructure } = await supabase
    .from("infrastructure")
    .select("*")
    .in("college_id", [college1.id, college2.id]);

  // Generate content
  const content = generateComparisonPageContent(college1, college2);

  // Generate structured data
  const college1Rank = college1.college_rankings?.find(
    (r: any) => r.ranking_type === "NIRF" && r.year === 2024
  )?.rank;
  const college2Rank = college2.college_rankings?.find(
    (r: any) => r.ranking_type === "NIRF" && r.year === 2024
  )?.rank;

  const comparisonSchema = generateComparisonSchema(college1, college2, {
    college1Rank,
    college2Rank,
  });

  const breadcrumbData = generateBreadcrumbStructuredData([
    { name: "Home", url: "/" },
    { name: "Compare", url: "/compare" },
    {
      name: `${college1.short_name || college1.name} vs ${college2.short_name || college2.name}`,
      url: `/compare/${params.slug}`,
    },
  ]);

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(comparisonSchema) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbData) }}
      />
      <ComparisonPageTemplate
        college1={college1 as College}
        college2={college2 as College}
        content={content}
        placementStats={placementStats || []}
        cutoffs={cutoffs || []}
        facultyCount={{
          [college1.id]: faculty?.filter((f) => f.college_id === college1.id).length || 0,
          [college2.id]: faculty?.filter((f) => f.college_id === college2.id).length || 0,
        }}
        infrastructure={{
          [college1.id]: infrastructure?.filter((i) => i.college_id === college1.id) || [],
          [college2.id]: infrastructure?.filter((i) => i.college_id === college2.id) || [],
        }}
      />
    </>
  );
}

// Generate static params for popular comparisons
export async function generateStaticParams() {
  const supabase = createSupabaseServerClient();

  // Get top colleges for pre-generating comparisons
  const { data: colleges } = await supabase
    .from("colleges")
    .select("slug, institution_category")
    .in("institution_category", ["IIT", "NIT", "IIIT"])
    .limit(30);

  if (!colleges || colleges.length < 2) return [];

  const comparisons: Array<{ slug: string }> = [];

  // Generate comparisons for same category colleges
  const iits = colleges.filter((c) => c.institution_category === "IIT");
  const nits = colleges.filter((c) => c.institution_category === "NIT");
  const iiits = colleges.filter((c) => c.institution_category === "IIIT");

  // IIT vs IIT comparisons
  for (let i = 0; i < Math.min(iits.length, 10); i++) {
    for (let j = i + 1; j < Math.min(iits.length, 10); j++) {
      comparisons.push({
        slug: `${iits[i].slug}-vs-${iits[j].slug}`,
      });
    }
  }

  // NIT vs NIT comparisons (top 5)
  for (let i = 0; i < Math.min(nits.length, 5); i++) {
    for (let j = i + 1; j < Math.min(nits.length, 5); j++) {
      comparisons.push({
        slug: `${nits[i].slug}-vs-${nits[j].slug}`,
      });
    }
  }

  // IIT vs NIT comparisons (select few)
  if (iits.length > 0 && nits.length > 0) {
    for (let i = 0; i < Math.min(iits.length, 3); i++) {
      for (let j = 0; j < Math.min(nits.length, 3); j++) {
        comparisons.push({
          slug: `${iits[i].slug}-vs-${nits[j].slug}`,
        });
      }
    }
  }

  return comparisons.slice(0, 100); // Limit to 100 pre-generated comparisons
}
