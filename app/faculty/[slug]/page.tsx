import { Metadata } from "next";
import { notFound } from "next/navigation";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { FacultyDetail } from "@/components/faculty/FacultyDetail";
import { generateFacultyStructuredData, generateBreadcrumbStructuredData } from "@/lib/seo";

interface PageProps {
  params: {
    slug: string;
  };
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const supabase = createSupabaseServerClient();
  const { data: faculty } = await supabase
    .from("faculty")
    .select("*, colleges(*)")
    .eq("slug", params.slug)
    .single();

  if (!faculty) {
    return {
      title: "Faculty Not Found",
    };
  }

  return {
    title: `${faculty.name} - ${faculty.designation} at ${faculty.colleges?.name}`,
    description: faculty.bio || `Faculty profile of ${faculty.name} at ${faculty.colleges?.name}`,
  };
}

export default async function FacultyPage({ params }: PageProps) {
  const supabase = createSupabaseServerClient();
  const { data: faculty } = await supabase
    .from("faculty")
    .select("*, colleges(*), branches(*)")
    .eq("slug", params.slug)
    .single();

  if (!faculty) {
    notFound();
  }

  const structuredData = generateFacultyStructuredData(faculty, faculty.colleges);
  const breadcrumbData = generateBreadcrumbStructuredData([
    { name: "Home", url: "/" },
    { name: faculty.colleges?.name || "College", url: `/colleges/${faculty.colleges?.slug}` },
    { name: faculty.name, url: `/faculty/${faculty.slug}` },
  ]);

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(structuredData) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbData) }}
      />
      <FacultyDetail faculty={faculty} />
    </>
  );
}
