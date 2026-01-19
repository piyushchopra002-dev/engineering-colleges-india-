import { Metadata } from "next";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { CollegesList } from "@/components/colleges/CollegesList";

export const metadata: Metadata = {
  title: "All Engineering Colleges in India | Complete Directory",
  description:
    "Browse complete directory of engineering colleges in India. Filter by state, city, type, and more. Compare IITs, NITs, and private colleges.",
};

export const dynamic = "force-dynamic";

export default async function CollegesPage() {
  let colleges: any[] = [];
  
  try {
    const supabase = createSupabaseServerClient();
    const { data, error } = await supabase
      .from("colleges")
      .select("id, name, slug, logo_url, cover_image_url, website, city, state, college_type, institution_category, ownership_type, established_year")
      .order("name", { ascending: true });
    
    if (!error && data) {
      colleges = data;
    }
  } catch (error) {
    console.error("Database error (non-critical):", error);
  }

  return <CollegesList colleges={colleges} />;
}
