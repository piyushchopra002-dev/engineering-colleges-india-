import { Metadata } from "next";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { Hero } from "@/components/home/Hero";
import { FeaturedColleges } from "@/components/home/FeaturedColleges";
import { StatsSection } from "@/components/home/StatsSection";
import { QuickLinks } from "@/components/home/QuickLinks";
import { TrendingColleges } from "@/components/home/TrendingColleges";
import { TrustSection } from "@/components/ui/TrustBadges";
import { Testimonials } from "@/components/home/Testimonials";
import { 
  WelcomePopup, 
  NotificationToasts, 
  FloatingActionButton,
  InteractiveStatsPopup,
  LimitedOfferBanner,
  ScrollProgressBar
} from "@/components/ui/InteractiveElements";
import { PlaneAnimation } from "@/components/ui/PlaneAnimation";

export const metadata: Metadata = {
  title: "Best Engineering Colleges in India | Rankings, Placements, Cutoffs 2024",
  description:
    "Discover the best engineering colleges in India. Compare IITs, NITs, and top private colleges. Get detailed information on rankings, placements, cutoffs, infrastructure, faculty, and more.",
};

export const dynamic = "force-dynamic";

export default async function HomePage() {
  let featuredColleges: any[] = [];
  const displayCollegeCount = 500;

  // Try to fetch from database, but don't crash if it fails
  try {
    const supabase = createSupabaseServerClient();
    
    // Fetch featured colleges - order by name to show all colleges
    const { data, error } = await supabase
      .from("colleges")
      .select("id, name, slug, logo_url, cover_image_url, website, city, state, college_type, institution_category, ownership_type")
      .order("name", { ascending: true })
      .limit(12);
    
    if (!error && data) {
      featuredColleges = data;
    }

  } catch (error) {
    // Silently fail - use default values
    console.error("Database error (non-critical):", error);
  }

  return (
    <>
      {/* Graduation Cap Animation */}
      <PlaneAnimation />
      
      {/* Interactive Elements */}
      <ScrollProgressBar />
      <WelcomePopup />
      <NotificationToasts />
      <FloatingActionButton />
      <InteractiveStatsPopup />
      <LimitedOfferBanner />
      
      {/* Main Content */}
      <Hero />
      <StatsSection
        colleges={displayCollegeCount}
        cities={100}
      />
      <TrustSection />
      <FeaturedColleges colleges={featuredColleges} />
      <Testimonials />
      <TrendingColleges />
      <QuickLinks />
    </>
  );
}
