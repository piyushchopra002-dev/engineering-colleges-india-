import { Metadata } from "next";
import { notFound } from "next/navigation";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { CutoffPageTemplate } from "@/components/programmatic/CutoffPageTemplate";
import {
  generateCutoffPageMeta,
  getCanonicalUrl,
  generateOGImageUrl,
} from "@/lib/programmatic-seo";
import { generateCutoffPageContent } from "@/lib/content-templates";
import { generateBreadcrumbStructuredData, generateFAQStructuredData } from "@/lib/seo";
import { College } from "@/types";

interface PageProps {
  params: {
    range: string;
  };
}

// Range configurations
const RANGE_CONFIG: Record<
  string,
  {
    display: string;
    minRank: number;
    maxRank: number;
    examType: string;
  }
> = {
  "under-1000": {
    display: "Under 1000",
    minRank: 1,
    maxRank: 1000,
    examType: "JEE Main",
  },
  "1000-5000": {
    display: "1000-5000",
    minRank: 1000,
    maxRank: 5000,
    examType: "JEE Main",
  },
  "5000-10000": {
    display: "5000-10000",
    minRank: 5000,
    maxRank: 10000,
    examType: "JEE Main",
  },
  "10000-20000": {
    display: "10000-20000",
    minRank: 10000,
    maxRank: 20000,
    examType: "JEE Main",
  },
  "20000-50000": {
    display: "20000-50000",
    minRank: 20000,
    maxRank: 50000,
    examType: "JEE Main",
  },
  "50000-100000": {
    display: "50000-100000",
    minRank: 50000,
    maxRank: 100000,
    examType: "JEE Main",
  },
};

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const config = RANGE_CONFIG[params.range];

  if (!config) {
    return {
      title: "Range Not Found",
    };
  }

  const supabase = createSupabaseServerClient();

  // Get colleges within this cutoff range
  const { data: cutoffs } = await supabase
    .from("cutoffs")
    .select("college_id, closing_rank")
    .gte("closing_rank", config.minRank)
    .lte("closing_rank", config.maxRank)
    .eq("year", 2024)
    .eq("category", "General");

  const uniqueCollegeIds = Array.from(
    new Set(cutoffs?.map((c) => c.college_id) || [])
  );

  const collegeCount = uniqueCollegeIds.length;

  const meta = generateCutoffPageMeta(
    params.range,
    config.display,
    collegeCount,
    config.examType
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
            type: "cutoff",
            title: `Rank ${config.display}`,
            subtitle: `${collegeCount} Colleges`,
            stats: ["JEE Main", "Admissions 2024", `${collegeCount}+ Options`],
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

export default async function CutoffPage({ params }: PageProps) {
  const config = RANGE_CONFIG[params.range];

  if (!config) {
    notFound();
  }

  const supabase = createSupabaseServerClient();

  // Fetch cutoffs within range
  const { data: cutoffs, error } = await supabase
    .from("cutoffs")
    .select(`
      *,
      branches (name, full_name),
      colleges (*)
    `)
    .gte("closing_rank", config.minRank)
    .lte("closing_rank", config.maxRank)
    .eq("year", 2024)
    .eq("category", "General")
    .order("closing_rank", { ascending: true });

  if (error || !cutoffs) {
    notFound();
  }

  // Get unique colleges
  const collegeMap = new Map<string, any>();
  cutoffs.forEach((cutoff) => {
    if (cutoff.colleges && !collegeMap.has(cutoff.colleges.id)) {
      collegeMap.set(cutoff.colleges.id, {
        ...cutoff.colleges,
        cutoffs: [],
      });
    }
    if (cutoff.colleges) {
      collegeMap.get(cutoff.colleges.id)?.cutoffs.push({
        branch: cutoff.branches?.name || "Unknown",
        branchFull: cutoff.branches?.full_name || "Unknown",
        closing_rank: cutoff.closing_rank,
        opening_rank: cutoff.opening_rank,
      });
    }
  });

  const colleges = Array.from(collegeMap.values());

  // Fetch placement stats for these colleges
  const collegeIds = colleges.map((c) => c.id);
  const { data: placementStats } = await supabase
    .from("placement_stats")
    .select("*")
    .in("college_id", collegeIds)
    .eq("year", 2024);

  // Generate content
  const content = generateCutoffPageContent(
    params.range,
    config.display,
    colleges.length,
    config.examType
  );

  // Generate structured data
  const faqSchema = generateFAQStructuredData(content.faqs);
  const breadcrumbData = generateBreadcrumbStructuredData([
    { name: "Home", url: "/" },
    { name: "Cutoffs", url: "/cutoffs/under-1000" },
    { name: `Rank ${config.display}`, url: `/cutoffs/${params.range}` },
  ]);

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(faqSchema) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbData) }}
      />
      <CutoffPageTemplate
        range={params.range}
        rangeDisplay={config.display}
        minRank={config.minRank}
        maxRank={config.maxRank}
        examType={config.examType}
        colleges={colleges}
        content={content}
        placementStats={placementStats || []}
      />
    </>
  );
}

// Generate static params for all ranges
export async function generateStaticParams() {
  return Object.keys(RANGE_CONFIG).map((range) => ({
    range,
  }));
}
