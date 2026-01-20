import { Metadata } from "next";
import { notFound } from "next/navigation";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { RankingPageTemplate } from "@/components/programmatic/RankingPageTemplate";
import {
  generateRankingPageMeta,
  getCanonicalUrl,
  generateOGImageUrl,
} from "@/lib/programmatic-seo";
import { generateRankingPageContent } from "@/lib/content-templates";
import { generateRankingSchema, generateBreadcrumbStructuredData } from "@/lib/seo";
import { College } from "@/types";

interface PageProps {
  params: {
    category: string;
  };
}

// Category configurations
const CATEGORY_CONFIG: Record<
  string,
  {
    display: string;
    description: string;
    filter: (college: College, rankings: any[], placements: any[]) => boolean;
    sort: (
      a: { college: College; rank: number },
      b: { college: College; rank: number }
    ) => number;
  }
> = {
  "nirf-top-100": {
    display: "NIRF Top 100",
    description: "Top 100 engineering colleges based on NIRF rankings",
    filter: (college, rankings) => {
      const nirfRank = rankings.find(
        (r) => r.ranking_type === "NIRF" && r.year === 2024
      );
      return nirfRank && nirfRank.rank <= 100;
    },
    sort: (a, b) => a.rank - b.rank,
  },
  "computer-science": {
    display: "Computer Science",
    description: "Best colleges for Computer Science and Engineering",
    filter: (college) => true, // All colleges offer CS
    sort: (a, b) => a.rank - b.rank,
  },
  "placement-salary": {
    display: "Best Placements",
    description: "Colleges with highest placement packages",
    filter: (college, rankings, placements) => {
      return placements.some((p) => p.college_id === college.id);
    },
    sort: (a, b) => b.rank - a.rank, // Higher salary = better rank
  },
  "iit-rankings": {
    display: "IIT Rankings",
    description: "All Indian Institutes of Technology ranked",
    filter: (college) => college.institution_category === "IIT",
    sort: (a, b) => a.rank - b.rank,
  },
  "nit-rankings": {
    display: "NIT Rankings",
    description: "All National Institutes of Technology ranked",
    filter: (college) => college.institution_category === "NIT",
    sort: (a, b) => a.rank - b.rank,
  },
  "iiit-rankings": {
    display: "IIIT Rankings",
    description: "All Indian Institutes of Information Technology ranked",
    filter: (college) => college.institution_category === "IIIT",
    sort: (a, b) => a.rank - b.rank,
  },
  "government-colleges": {
    display: "Government Colleges",
    description: "Top government engineering colleges",
    filter: (college) =>
      college.ownership_type === "Government" ||
      ["IIT", "NIT", "IIIT"].includes(college.institution_category || ""),
    sort: (a, b) => a.rank - b.rank,
  },
  "private-colleges": {
    display: "Private Colleges",
    description: "Best private engineering colleges",
    filter: (college) => college.ownership_type === "Private",
    sort: (a, b) => a.rank - b.rank,
  },
};

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const config = CATEGORY_CONFIG[params.category];

  if (!config) {
    return {
      title: "Category Not Found",
    };
  }

  const supabase = createSupabaseServerClient();

  // Get college count for this category
  const { data: allColleges } = await supabase
    .from("colleges")
    .select(`
      *,
      college_rankings (ranking_type, year, rank)
    `)
    .limit(200);

  const { data: placements } = await supabase
    .from("placement_stats")
    .select("college_id, average_salary")
    .eq("year", 2024);

  let filteredColleges = allColleges?.filter((c) =>
    config.filter(c, c.college_rankings || [], placements || [])
  );

  const collegeCount = filteredColleges?.length || 0;
  const topColleges = filteredColleges?.slice(0, 5);

  const meta = generateRankingPageMeta(
    params.category,
    config.display,
    collegeCount,
    topColleges
  );

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
            type: "ranking",
            title: config.display,
            subtitle: `Top ${collegeCount} Colleges`,
            stats: ["NIRF Rankings", "Placements", "Cutoffs"],
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

export default async function RankingPage({ params }: PageProps) {
  const config = CATEGORY_CONFIG[params.category];

  if (!config) {
    notFound();
  }

  const supabase = createSupabaseServerClient();

  // Fetch all colleges with rankings
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
    .order("name", { ascending: true });

  if (error || !colleges) {
    notFound();
  }

  // Fetch placement stats
  const { data: placementStats } = await supabase
    .from("placement_stats")
    .select("*")
    .eq("year", 2024)
    .order("average_salary", { ascending: false });

  // Fetch cutoffs
  const { data: cutoffs } = await supabase
    .from("cutoffs")
    .select("college_id, closing_rank, category")
    .eq("year", 2024)
    .eq("category", "General")
    .order("closing_rank", { ascending: true });

  // Filter colleges based on category
  let filteredColleges = colleges.filter((c) =>
    config.filter(c, c.college_rankings || [], placementStats || [])
  );

  // Assign ranks based on category
  let rankedColleges: Array<{ college: College; rank: number }> = [];

  if (params.category === "placement-salary") {
    // Rank by average placement
    rankedColleges = filteredColleges
      .map((college) => {
        const placement = placementStats?.find((p) => p.college_id === college.id);
        return {
          college: college as College,
          rank: placement?.average_salary || 0,
        };
      })
      .sort((a, b) => b.rank - a.rank)
      .map((item, index) => ({ ...item, rank: index + 1 }));
  } else {
    // Rank by NIRF or default
    rankedColleges = filteredColleges
      .map((college) => {
        const nirfRank = college.college_rankings?.find(
          (r: any) => r.ranking_type === "NIRF" && r.year === 2024
        );
        return {
          college: college as College,
          rank: nirfRank?.rank || 999,
        };
      })
      .sort(config.sort);
  }

  // Generate content
  const content = generateRankingPageContent(
    params.category,
    config.display,
    rankedColleges.length
  );

  // Generate structured data
  const rankingSchema = generateRankingSchema(
    config.display,
    rankedColleges.slice(0, 50) // Top 50 for schema
  );

  const breadcrumbData = generateBreadcrumbStructuredData([
    { name: "Home", url: "/" },
    { name: "Rankings", url: "/rankings/nirf-top-100" },
    { name: config.display, url: `/rankings/${params.category}` },
  ]);

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(rankingSchema) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbData) }}
      />
      <RankingPageTemplate
        category={params.category}
        categoryDisplay={config.display}
        categoryDescription={config.description}
        rankedColleges={rankedColleges}
        content={content}
        placementStats={placementStats || []}
        cutoffs={cutoffs || []}
      />
    </>
  );
}

// Generate static params for all categories
export async function generateStaticParams() {
  return Object.keys(CATEGORY_CONFIG).map((category) => ({
    category,
  }));
}
