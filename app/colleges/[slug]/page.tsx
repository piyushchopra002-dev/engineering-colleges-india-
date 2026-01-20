import { Metadata } from "next";
import { notFound } from "next/navigation";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { CollegeDetail } from "@/components/colleges/CollegeDetail";
import { generateCollegeStructuredData, generateBreadcrumbStructuredData } from "@/lib/seo";

// Force dynamic rendering to show fresh data immediately
export const dynamic = 'force-dynamic';
// Revalidate every hour after initial render
export const revalidate = 3600;

interface PageProps {
  params: {
    slug: string;
  };
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  try {
    const supabase = createSupabaseServerClient();
    const { data: college } = await supabase
      .from("colleges")
      .select("*")
      .eq("slug", params.slug)
      .single();

    if (college) {
      return {
        title: `${college.name} - Rankings, Placements, Cutoffs, Infrastructure`,
        description: college.description || `Complete information about ${college.name} including rankings, placements, cutoffs, infrastructure, faculty, and more.`,
        openGraph: {
          title: `${college.name} - Best Engineering Colleges`,
          description: college.description || `Complete information about ${college.name}`,
          images: college.cover_image_url ? [college.cover_image_url] : [],
        },
      };
    }
  } catch (error) {
    // Fall through to default
  }

  return {
    title: "College Not Found",
  };
}

export default async function CollegePage({ params }: PageProps) {
  let college = null;
  let rankings: any[] = [];
  let branches: any[] = [];
  let faculty: any[] = [];
  let infrastructure: any[] = [];
  let library = null;
  let transport = null;
  let achievements: any[] = [];
  let media: any[] = [];
  let events: any[] = [];

  try {
    const supabase = createSupabaseServerClient();
    const { data: collegeData, error: collegeError } = await supabase
      .from("colleges")
      .select("*")
      .eq("slug", params.slug)
      .single();

    if (collegeError || !collegeData) {
      notFound();
    }

    college = collegeData;

    // Fetch related data
    const [
      { data: rankingsData },
      { data: branchesData },
      { data: facultyData },
      { data: infrastructureData },
      { data: libraryData },
      { data: transportData },
      { data: achievementsData },
      { data: mediaData },
      { data: eventsData },
    ] = await Promise.all([
      supabase.from("college_rankings").select("*").eq("college_id", college.id).order("year", { ascending: false }),
      supabase.from("college_branches").select("*, branches(*)").eq("college_id", college.id),
      supabase.from("faculty").select("*").eq("college_id", college.id).limit(10),
      supabase.from("infrastructure").select("*").eq("college_id", college.id),
      supabase.from("libraries").select("*").eq("college_id", college.id).single(),
      supabase.from("transport").select("*").eq("college_id", college.id).single(),
      supabase.from("achievements").select("*").eq("college_id", college.id).order("year", { ascending: false }),
      supabase.from("media").select("*").eq("college_id", college.id).order("upload_date", { ascending: false }),
      supabase.from("events").select("*").eq("college_id", college.id).order("year", { ascending: false }).limit(10),
    ]);

    rankings = rankingsData || [];
    branches = branchesData || [];
    faculty = facultyData || [];
    infrastructure = infrastructureData || [];
    library = libraryData;
    transport = transportData;
    achievements = achievementsData || [];
    media = mediaData || [];
    events = eventsData || [];
  } catch (error) {
    console.error("Error fetching college data:", error);
    if (!college) {
      notFound();
    }
  }

  const structuredData = generateCollegeStructuredData(college);
  const breadcrumbData = generateBreadcrumbStructuredData([
    { name: "Home", url: "/" },
    { name: "Colleges", url: "/colleges" },
    { name: college.name, url: `/colleges/${college.slug}` },
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
      <CollegeDetail
        college={college}
        rankings={rankings}
        branches={branches}
        faculty={faculty}
        infrastructure={infrastructure}
        library={library}
        transport={transport}
        achievements={achievements}
        media={media}
        events={events}
      />
    </>
  );
}
