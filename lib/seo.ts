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
