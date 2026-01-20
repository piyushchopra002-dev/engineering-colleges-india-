import { College } from "@/types";

export interface MetaTagsConfig {
  title: string;
  description: string;
  keywords?: string[];
  ogTitle?: string;
  ogDescription?: string;
  ogImage?: string;
  canonical?: string;
  robots?: string;
}

// ============================================
// CITY PAGE META GENERATION
// ============================================

export function generateCityPageMeta(
  city: string,
  state: string,
  collegeCount: number,
  topColleges?: College[]
): MetaTagsConfig {
  const currentYear = new Date().getFullYear();
  const collegeNames = topColleges?.slice(0, 3).map((c) => c.short_name || c.name).join(", ");

  return {
    title: `Top ${collegeCount} Engineering Colleges in ${city}, ${state} ${currentYear} | Rankings & Admissions`,
    description: `Discover the best engineering colleges in ${city}, ${state}. Compare ${collegeCount}+ colleges including ${collegeNames || "IITs, NITs"}. Get admission details, placements, cutoffs & rankings.`,
    keywords: [
      `engineering colleges in ${city}`,
      `best colleges in ${city}`,
      `${city} engineering admissions`,
      `top colleges ${state}`,
      `${city} placement colleges`,
      `IIT NIT in ${city}`,
    ],
    ogTitle: `${collegeCount} Best Engineering Colleges in ${city} - ${currentYear} Rankings`,
    ogDescription: `Complete guide to engineering colleges in ${city}. Compare placements, cutoffs, fees & facilities.`,
    canonical: `/colleges/city/${city.toLowerCase().replace(/\s+/g, "-")}-${state.toLowerCase().replace(/\s+/g, "-")}`,
  };
}

// ============================================
// COMPARISON PAGE META GENERATION
// ============================================

export function generateComparisonMeta(
  college1: College,
  college2: College,
  comparisonData?: {
    college1Rank?: number;
    college2Rank?: number;
    college1Placement?: number;
    college2Placement?: number;
  }
): MetaTagsConfig {
  const name1 = college1.short_name || college1.name;
  const name2 = college2.short_name || college2.name;
  const currentYear = new Date().getFullYear();

  let winnerText = "";
  if (comparisonData?.college1Rank && comparisonData?.college2Rank) {
    const winner = comparisonData.college1Rank < comparisonData.college2Rank ? name1 : name2;
    winnerText = ` ${winner} leads in rankings.`;
  }

  return {
    title: `${name1} vs ${name2} ${currentYear}: Which is Better? | Detailed Comparison`,
    description: `Compare ${name1} and ${name2} - Rankings, Placements, Cutoffs, Fees, Infrastructure & Admissions.${winnerText} Make an informed decision.`,
    keywords: [
      `${name1} vs ${name2}`,
      `${college1.name} ${college2.name} comparison`,
      `${name1} or ${name2}`,
      `difference between ${name1} and ${name2}`,
      `${name1} ${name2} which is better`,
    ],
    ogTitle: `${name1} vs ${name2}: Complete Comparison ${currentYear}`,
    ogDescription: `Head-to-head comparison of ${name1} and ${name2}. Rankings, placements, cutoffs & more.`,
    canonical: `/compare/${college1.slug}-vs-${college2.slug}`,
  };
}

// ============================================
// RANKING PAGE META GENERATION
// ============================================

export function generateRankingPageMeta(
  category: string,
  categoryDisplay: string,
  collegeCount: number,
  topColleges?: College[]
): MetaTagsConfig {
  const currentYear = new Date().getFullYear();
  const collegeNames = topColleges?.slice(0, 3).map((c) => c.short_name || c.name).join(", ");

  return {
    title: `Top ${collegeCount} ${categoryDisplay} Colleges in India ${currentYear} | Rankings & Placements`,
    description: `Explore the best ${categoryDisplay.toLowerCase()} colleges in India. Compare ${collegeCount}+ colleges including ${collegeNames || "IITs, NITs, IIITs"}. Get NIRF rankings, placements & admission details.`,
    keywords: [
      `top ${categoryDisplay.toLowerCase()} colleges`,
      `best ${categoryDisplay.toLowerCase()} colleges India`,
      `${categoryDisplay} rankings ${currentYear}`,
      `${categoryDisplay} placements`,
      `${categoryDisplay} admissions`,
    ],
    ogTitle: `${collegeCount} Best ${categoryDisplay} Colleges - ${currentYear} Rankings`,
    ogDescription: `Complete rankings of ${categoryDisplay.toLowerCase()} colleges with placements, cutoffs & fees.`,
    canonical: `/rankings/${category}`,
  };
}

// ============================================
// CUTOFF PAGE META GENERATION
// ============================================

export function generateCutoffPageMeta(
  rankRange: string,
  rangeDisplay: string,
  collegeCount: number,
  examType: string = "JEE Main"
): MetaTagsConfig {
  const currentYear = new Date().getFullYear();

  return {
    title: `Colleges for ${examType} Rank ${rangeDisplay} ${currentYear} | ${collegeCount}+ Options`,
    description: `Find ${collegeCount}+ engineering colleges accepting ${examType} rank ${rangeDisplay}. Get cutoff trends, admission chances, branch options & placement data for ${currentYear}.`,
    keywords: [
      `${examType} rank ${rangeDisplay} colleges`,
      `colleges for rank ${rangeDisplay}`,
      `${examType} ${rangeDisplay} cutoff`,
      `admission with rank ${rangeDisplay}`,
      `best colleges ${rangeDisplay} rank`,
    ],
    ogTitle: `${collegeCount} Colleges for ${examType} Rank ${rangeDisplay}`,
    ogDescription: `Complete list of colleges accepting rank ${rangeDisplay} with cutoffs, placements & fees.`,
    canonical: `/cutoffs/${rankRange}`,
  };
}

// ============================================
// BRANCH-SPECIFIC PAGE META
// ============================================

export function generateBranchPageMeta(
  branchName: string,
  branchFullName: string,
  collegeCount: number
): MetaTagsConfig {
  const currentYear = new Date().getFullYear();

  return {
    title: `Top ${collegeCount} ${branchFullName} Colleges in India ${currentYear} | Rankings & Placements`,
    description: `Discover the best ${branchFullName} (${branchName}) colleges in India. Compare ${collegeCount}+ colleges with placements, cutoffs, fees & admission details for ${currentYear}.`,
    keywords: [
      `${branchFullName} colleges`,
      `best ${branchName} colleges India`,
      `${branchName} placements`,
      `${branchName} admissions ${currentYear}`,
      `top ${branchName} engineering colleges`,
    ],
    ogTitle: `${collegeCount} Best ${branchFullName} Colleges - ${currentYear}`,
    ogDescription: `Complete guide to ${branchFullName} colleges with rankings, placements & cutoffs.`,
    canonical: `/branches/${branchName.toLowerCase().replace(/\s+/g, "-")}`,
  };
}

// ============================================
// STATE-WISE RANKING META
// ============================================

export function generateStateRankingMeta(
  state: string,
  collegeCount: number,
  topColleges?: College[]
): MetaTagsConfig {
  const currentYear = new Date().getFullYear();
  const collegeNames = topColleges?.slice(0, 3).map((c) => c.short_name || c.name).join(", ");

  return {
    title: `Top ${collegeCount} Engineering Colleges in ${state} ${currentYear} | State Rankings`,
    description: `Complete rankings of engineering colleges in ${state}. Compare ${collegeCount}+ colleges including ${collegeNames || "IITs, NITs"}. Get placements, cutoffs & admission details.`,
    keywords: [
      `engineering colleges in ${state}`,
      `best colleges ${state}`,
      `${state} engineering rankings`,
      `top colleges ${state} ${currentYear}`,
      `${state} placement colleges`,
    ],
    ogTitle: `${state} Engineering Colleges Rankings ${currentYear}`,
    ogDescription: `Explore ${collegeCount}+ engineering colleges in ${state} with complete details.`,
    canonical: `/rankings/state/${state.toLowerCase().replace(/\s+/g, "-")}`,
  };
}

// ============================================
// KEYWORD OPTIMIZATION HELPERS
// ============================================

export function insertKeywords(
  content: string,
  keywords: string[],
  density: number = 0.02
): string {
  // Simple keyword insertion - in production, use NLP for natural placement
  return content;
}

export function generateSlug(...parts: string[]): string {
  return parts
    .join("-")
    .toLowerCase()
    .replace(/[^a-z0-9-]/g, "-")
    .replace(/-+/g, "-")
    .replace(/^-|-$/g, "");
}

// ============================================
// OG IMAGE URL GENERATION
// ============================================

export function generateOGImageUrl(params: {
  type: "city" | "comparison" | "ranking" | "cutoff";
  title: string;
  subtitle?: string;
  stats?: string[];
}): string {
  const baseUrl = process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000";
  const searchParams = new URLSearchParams({
    type: params.type,
    title: params.title,
    ...(params.subtitle && { subtitle: params.subtitle }),
    ...(params.stats && { stats: params.stats.join("|") }),
  });

  return `${baseUrl}/api/og?${searchParams.toString()}`;
}

// ============================================
// CANONICAL URL HELPERS
// ============================================

export function getCanonicalUrl(path: string): string {
  const baseUrl = process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000";
  return `${baseUrl}${path.startsWith("/") ? path : `/${path}`}`;
}

// ============================================
// ROBOTS META HELPERS
// ============================================

export function getRobotsMetaTag(
  index: boolean = true,
  follow: boolean = true
): string {
  const indexValue = index ? "index" : "noindex";
  const followValue = follow ? "follow" : "nofollow";
  return `${indexValue}, ${followValue}`;
}
