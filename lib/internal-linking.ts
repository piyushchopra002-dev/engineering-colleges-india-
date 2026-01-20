import { College } from "@/types";

export interface InternalLink {
  text: string;
  url: string;
  rel?: string;
}

// ============================================
// RELATED COLLEGES LINKS
// ============================================

export function getRelatedCollegesLinks(
  college: College,
  allColleges: College[]
): InternalLink[] {
  const links: InternalLink[] = [];

  // Same city colleges
  const sameCityColleges = allColleges
    .filter(
      (c) =>
        c.id !== college.id &&
        c.city === college.city &&
        c.state === college.state
    )
    .slice(0, 3);

  sameCityColleges.forEach((c) => {
    links.push({
      text: c.short_name || c.name,
      url: `/colleges/${c.slug}`,
    });
  });

  // Same category colleges
  const sameCategoryColleges = allColleges
    .filter(
      (c) =>
        c.id !== college.id &&
        c.institution_category === college.institution_category
    )
    .slice(0, 3);

  sameCategoryColleges.forEach((c) => {
    links.push({
      text: c.short_name || c.name,
      url: `/colleges/${c.slug}`,
    });
  });

  // Same state colleges
  const sameStateColleges = allColleges
    .filter(
      (c) =>
        c.id !== college.id &&
        c.state === college.state &&
        c.city !== college.city
    )
    .slice(0, 2);

  sameStateColleges.forEach((c) => {
    links.push({
      text: c.short_name || c.name,
      url: `/colleges/${c.slug}`,
    });
  });

  // Remove duplicates
  return Array.from(new Map(links.map((link) => [link.url, link])).values());
}

// ============================================
// CITY-TO-CITY LINKS
// ============================================

export function getCityLinks(
  currentCity: string,
  currentState: string,
  allCities: Array<{ city: string; state: string; count: number }>
): InternalLink[] {
  const links: InternalLink[] = [];

  // Same state cities
  const sameStateCities = allCities
    .filter(
      (c) =>
        c.state === currentState &&
        c.city !== currentCity
    )
    .sort((a, b) => b.count - a.count)
    .slice(0, 3);

  sameStateCities.forEach((c) => {
    links.push({
      text: `Engineering Colleges in ${c.city}`,
      url: `/colleges/city/${c.city.toLowerCase().replace(/\s+/g, "-")}-${c.state.toLowerCase().replace(/\s+/g, "-")}`,
    });
  });

  // Other major cities
  const otherCities = allCities
    .filter(
      (c) =>
        c.state !== currentState &&
        c.city !== currentCity
    )
    .sort((a, b) => b.count - a.count)
    .slice(0, 3);

  otherCities.forEach((c) => {
    links.push({
      text: `Engineering Colleges in ${c.city}`,
      url: `/colleges/city/${c.city.toLowerCase().replace(/\s+/g, "-")}-${c.state.toLowerCase().replace(/\s+/g, "-")}`,
    });
  });

  return links;
}

// ============================================
// COMPARISON SUGGESTIONS
// ============================================

export function getComparisonSuggestions(
  college: College,
  allColleges: College[]
): InternalLink[] {
  const links: InternalLink[] = [];

  // Find similar colleges for comparison
  const similarColleges = allColleges
    .filter(
      (c) =>
        c.id !== college.id &&
        (c.institution_category === college.institution_category ||
          c.state === college.state)
    )
    .slice(0, 5);

  similarColleges.forEach((c) => {
    const name1 = college.short_name || college.name;
    const name2 = c.short_name || c.name;
    links.push({
      text: `${name1} vs ${name2}`,
      url: `/compare/${college.slug}-vs-${c.slug}`,
    });
  });

  return links;
}

// ============================================
// RANKING CATEGORY LINKS
// ============================================

export function getRankingCategoryLinks(
  currentCategory?: string
): InternalLink[] {
  const categories = [
    { slug: "nirf-top-100", name: "NIRF Top 100 Colleges" },
    { slug: "computer-science", name: "Top Computer Science Colleges" },
    { slug: "placement-salary", name: "Best Placement Colleges" },
    { slug: "iit-rankings", name: "IIT Rankings" },
    { slug: "nit-rankings", name: "NIT Rankings" },
    { slug: "iiit-rankings", name: "IIIT Rankings" },
    { slug: "government-colleges", name: "Top Government Colleges" },
    { slug: "private-colleges", name: "Best Private Colleges" },
  ];

  return categories
    .filter((cat) => cat.slug !== currentCategory)
    .map((cat) => ({
      text: cat.name,
      url: `/rankings/${cat.slug}`,
    }));
}

// ============================================
// STATE-WISE LINKS
// ============================================

export function getStateLinks(
  currentState?: string,
  allStates?: Array<{ state: string; count: number }>
): InternalLink[] {
  const defaultStates = [
    "Maharashtra",
    "Karnataka",
    "Tamil Nadu",
    "Delhi",
    "Uttar Pradesh",
    "Telangana",
    "West Bengal",
    "Gujarat",
    "Rajasthan",
    "Madhya Pradesh",
  ];

  const states = allStates || defaultStates.map((s) => ({ state: s, count: 0 }));

  return states
    .filter((s) => s.state !== currentState)
    .slice(0, 8)
    .map((s) => ({
      text: `Engineering Colleges in ${s.state}`,
      url: `/rankings/state/${s.state.toLowerCase().replace(/\s+/g, "-")}`,
    }));
}

// ============================================
// CUTOFF RANGE LINKS
// ============================================

export function getCutoffRangeLinks(currentRange?: string): InternalLink[] {
  const ranges = [
    { slug: "under-1000", name: "Colleges for Rank Under 1000" },
    { slug: "1000-5000", name: "Colleges for Rank 1000-5000" },
    { slug: "5000-10000", name: "Colleges for Rank 5000-10000" },
    { slug: "10000-20000", name: "Colleges for Rank 10000-20000" },
    { slug: "20000-50000", name: "Colleges for Rank 20000-50000" },
    { slug: "50000-100000", name: "Colleges for Rank 50000-100000" },
  ];

  return ranges
    .filter((r) => r.slug !== currentRange)
    .map((r) => ({
      text: r.name,
      url: `/cutoffs/${r.slug}`,
    }));
}

// ============================================
// BREADCRUMB GENERATION
// ============================================

export interface Breadcrumb {
  name: string;
  url: string;
}

export function generateBreadcrumbs(
  path: string,
  customLabels?: Record<string, string>
): Breadcrumb[] {
  const breadcrumbs: Breadcrumb[] = [{ name: "Home", url: "/" }];

  const segments = path.split("/").filter(Boolean);

  let currentPath = "";
  segments.forEach((segment, index) => {
    currentPath += `/${segment}`;

    let name = customLabels?.[segment] || segment;

    // Format segment name
    name = name
      .split("-")
      .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
      .join(" ");

    // Don't add URL for last segment (current page)
    breadcrumbs.push({
      name,
      url: index === segments.length - 1 ? "" : currentPath,
    });
  });

  return breadcrumbs;
}

// ============================================
// CONTEXTUAL LINKS FOR CONTENT
// ============================================

export function generateContextualLinks(
  content: string,
  availableLinks: Map<string, string>
): string {
  // Simple implementation - in production, use NLP for better context matching
  let linkedContent = content;

  availableLinks.forEach((url, keyword) => {
    const regex = new RegExp(`\\b${keyword}\\b`, "gi");
    linkedContent = linkedContent.replace(
      regex,
      `<a href="${url}" class="text-blue-600 hover:underline">${keyword}</a>`
    );
  });

  return linkedContent;
}

// ============================================
// RELATED CONTENT WIDGET DATA
// ============================================

export interface RelatedContentSection {
  title: string;
  links: InternalLink[];
}

export function getRelatedContentSections(
  pageType: "college" | "city" | "comparison" | "ranking" | "cutoff",
  context: {
    college?: College;
    city?: string;
    state?: string;
    category?: string;
    allColleges?: College[];
  }
): RelatedContentSection[] {
  const sections: RelatedContentSection[] = [];

  switch (pageType) {
    case "college":
      if (context.college && context.allColleges) {
        sections.push({
          title: "Similar Colleges",
          links: getRelatedCollegesLinks(context.college, context.allColleges),
        });
        sections.push({
          title: "Compare With",
          links: getComparisonSuggestions(context.college, context.allColleges),
        });
      }
      break;

    case "city":
      sections.push({
        title: "Other Cities",
        links: getCityLinks(context.city || "", context.state || "", []),
      });
      sections.push({
        title: "Rankings",
        links: getRankingCategoryLinks(),
      });
      break;

    case "ranking":
      sections.push({
        title: "Other Rankings",
        links: getRankingCategoryLinks(context.category),
      });
      sections.push({
        title: "By State",
        links: getStateLinks(),
      });
      break;

    case "cutoff":
      sections.push({
        title: "Other Rank Ranges",
        links: getCutoffRangeLinks(context.category),
      });
      break;
  }

  return sections;
}
