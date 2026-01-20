import { College, Faculty, Branch } from "@/types";

export interface StructuredData {
  "@context": string;
  "@type": string;
  [key: string]: any;
}

export function generateStructuredData(data: any): StructuredData {
  try {
    // If data already has @context, return as is
    if (data["@context"]) {
      return data as StructuredData;
    }
    // Otherwise, add @context
    return {
      "@context": "https://schema.org",
      ...data,
    };
  } catch (error) {
    console.error("Error in generateStructuredData:", error);
    return {
      "@context": "https://schema.org",
      "@type": "WebSite",
      name: "Best Engineering Colleges in India",
    };
  }
}

export function generateCollegeStructuredData(college: College): StructuredData {
  return generateStructuredData({
    "@type": "EducationalOrganization",
    name: college.name,
    description: college.description,
    url: `${process.env.NEXT_PUBLIC_APP_URL}/colleges/${college.slug}`,
    address: {
      "@type": "PostalAddress",
      addressLocality: college.city,
      addressRegion: college.state,
      postalCode: college.pincode,
      addressCountry: "IN",
    },
    foundingDate: college.established_year?.toString(),
    ...(college.logo_url && {
      logo: {
        "@type": "ImageObject",
        url: college.logo_url,
      },
    }),
  });
}

export function generateFacultyStructuredData(faculty: Faculty, college: College): StructuredData {
  return generateStructuredData({
    "@type": "Person",
    name: faculty.name,
    jobTitle: faculty.designation,
    worksFor: {
      "@type": "EducationalOrganization",
      name: college.name,
    },
    ...(faculty.linkedin_url && {
      sameAs: [faculty.linkedin_url],
    }),
  });
}

export function generateBreadcrumbStructuredData(items: Array<{ name: string; url: string }>) {
  return generateStructuredData({
    "@type": "BreadcrumbList",
    itemListElement: items.map((item, index) => ({
      "@type": "ListItem",
      position: index + 1,
      name: item.name,
      item: item.url,
    })),
  });
}

export function generateVideoStructuredData(
  title: string,
  description: string,
  thumbnailUrl: string,
  videoUrl: string,
  uploadDate?: string
): StructuredData {
  return generateStructuredData({
    "@type": "VideoObject",
    name: title,
    description,
    thumbnailUrl,
    uploadDate: uploadDate || new Date().toISOString(),
    contentUrl: videoUrl,
    embedUrl: videoUrl,
  });
}

export function generateFAQStructuredData(faqs: Array<{ question: string; answer: string }>) {
  return generateStructuredData({
    "@type": "FAQPage",
    mainEntity: faqs.map((faq) => ({
      "@type": "Question",
      name: faq.question,
      acceptedAnswer: {
        "@type": "Answer",
        text: faq.answer,
      },
    })),
  });
}

// ============================================
// PROGRAMMATIC SEO SCHEMA GENERATORS
// ============================================

export function generateComparisonSchema(
  college1: College,
  college2: College,
  comparisonData?: {
    college1Rank?: number;
    college2Rank?: number;
    college1Placement?: number;
    college2Placement?: number;
  }
): StructuredData {
  return generateStructuredData({
    "@type": "ComparisonTable",
    name: `${college1.name} vs ${college2.name}`,
    description: `Detailed comparison between ${college1.name} and ${college2.name}`,
    itemListElement: [
      {
        "@type": "EducationalOrganization",
        name: college1.name,
        url: `${process.env.NEXT_PUBLIC_APP_URL}/colleges/${college1.slug}`,
        ...(comparisonData?.college1Rank && { rank: comparisonData.college1Rank }),
      },
      {
        "@type": "EducationalOrganization",
        name: college2.name,
        url: `${process.env.NEXT_PUBLIC_APP_URL}/colleges/${college2.slug}`,
        ...(comparisonData?.college2Rank && { rank: comparisonData.college2Rank }),
      },
    ],
  });
}

export function generateRankingSchema(
  categoryName: string,
  colleges: Array<{ college: College; rank: number }>
): StructuredData {
  return generateStructuredData({
    "@type": "ItemList",
    name: `Top ${categoryName} Engineering Colleges in India`,
    description: `Ranked list of best ${categoryName} colleges`,
    numberOfItems: colleges.length,
    itemListElement: colleges.map((item, index) => ({
      "@type": "ListItem",
      position: index + 1,
      item: {
        "@type": "EducationalOrganization",
        name: item.college.name,
        url: `${process.env.NEXT_PUBLIC_APP_URL}/colleges/${item.college.slug}`,
        address: {
          "@type": "PostalAddress",
          addressLocality: item.college.city,
          addressRegion: item.college.state,
          addressCountry: "IN",
        },
      },
    })),
  });
}

export function generateCitySchema(
  city: string,
  state: string,
  collegeCount: number
): StructuredData {
  return generateStructuredData({
    "@type": "Place",
    name: city,
    address: {
      "@type": "PostalAddress",
      addressLocality: city,
      addressRegion: state,
      addressCountry: "IN",
    },
    description: `${city} is home to ${collegeCount} engineering colleges offering quality education`,
  });
}

export function generateReviewSchema(
  college: College,
  rating: number,
  reviewCount: number
): StructuredData {
  return generateStructuredData({
    "@type": "AggregateRating",
    itemReviewed: {
      "@type": "EducationalOrganization",
      name: college.name,
      url: `${process.env.NEXT_PUBLIC_APP_URL}/colleges/${college.slug}`,
    },
    ratingValue: rating,
    bestRating: 5,
    worstRating: 1,
    ratingCount: reviewCount,
  });
}