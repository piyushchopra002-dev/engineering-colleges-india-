export interface College {
  id: string;
  name: string;
  slug: string;
  short_name?: string;
  description?: string;
  established_year?: number;
  location: string;
  city: string;
  state: string;
  pincode?: string;
  latitude?: number;
  longitude?: number;
  website?: string;
  email?: string;
  phone?: string;
  approval_body?: string[];
  affiliation?: string;
  college_type?: string;
  institution_category?: "IIT" | "NIT" | "IIIT" | "Government" | "Private" | "University" | "College" | "Deemed University";
  ownership_type?: "Government" | "Private" | "Public-Private";
  jurisdiction?: "Central" | "State" | "UT";
  logo_url?: string;
  cover_image_url?: string;
  instagram_url?: string;
  linkedin_url?: string;
  facebook_url?: string;
  twitter_url?: string;
  youtube_url?: string;
  male_female_ratio?: {
    male: number;
    female: number;
  };
  seat_matrix?: Record<string, number>;
  fees_breakdown?: Record<string, any>;
  infrastructure_summary?: string;
  created_at: string;
  updated_at: string;
  last_verified_at?: string;
  data_confidence_score?: number;
}

export interface Ranking {
  id: string;
  college_id: string;
  ranking_type: "NIRF" | "QS" | "THE" | "ARWU";
  year: number;
  rank?: number;
  category?: string;
  proof_link?: string;
  official_source_url?: string;
}

export interface Branch {
  id: string;
  name: string;
  full_name?: string;
  slug: string;
  description?: string;
}

export interface Faculty {
  id: string;
  college_id: string;
  name: string;
  slug: string;
  photo_url?: string;
  designation?: string;
  department?: string;
  branch_id?: string;
  qualifications?: string[];
  experience_years?: number;
  research_interests?: string[];
  past_institutions?: string[];
  publications?: Array<{
    title: string;
    year: number;
    journal?: string;
    link?: string;
  }>;
  linkedin_url?: string;
  google_scholar_url?: string;
  email?: string;
  phone?: string;
  bio?: string;
  is_verified: boolean;
  verification_status: "pending" | "verified" | "rejected";
  rating?: number;
  feedback_count: number;
}

export interface Infrastructure {
  id: string;
  college_id: string;
  category: string;
  name?: string;
  description?: string;
  branch_id?: string;
  details?: Record<string, any>;
  capacity?: number;
  images?: string[];
}

export interface Library {
  id: string;
  college_id: string;
  name?: string;
  opening_hours?: Record<string, string>;
  is_24x7: boolean;
  seating_capacity?: number;
  digital_resources?: Record<string, any>;
  images?: string[];
}

export interface Syllabus {
  id: string;
  college_id: string;
  branch_id: string;
  semester: number;
  subjects: Array<{
    name: string;
    type: "core" | "elective";
    credits: number;
  }>;
  pdf_url?: string;
  source_url?: string;
  academic_year?: string;
}

export interface GradingSystem {
  id: string;
  college_id: string;
  system_type: "CGPA" | "GPA" | "Percentage";
  scale?: number;
  grading_type?: "relative" | "absolute";
  grade_distribution?: Record<string, any>;
  promotion_rules?: string;
  back_rules?: string;
  academic_benchmarks?: Record<string, any>;
}

export interface Transport {
  id: string;
  college_id: string;
  airport_name?: string;
  airport_distance_km?: number;
  airport_travel_time_minutes?: number;
  railway_station_name?: string;
  railway_distance_km?: number;
  railway_travel_time_minutes?: number;
  bus_connectivity?: string[];
  metro_connectivity?: string[];
  map_embed_url?: string;
}

export interface Company {
  id: string;
  name: string;
  slug: string;
  logo_url?: string;
  linkedin_url?: string;
  website?: string;
  description?: string;
}

export interface Placement {
  id: string;
  college_id: string;
  company_id: string;
  branch_id?: string;
  year: number;
  salary_offered?: number;
  currency: string;
  offer_type?: "FTE" | "Internship" | "PPO";
  location?: string;
  is_on_campus: boolean;
  students_placed?: number;
  company?: Company;
}

export interface PlacementStats {
  id: string;
  college_id: string;
  branch_id?: string;
  year: number;
  total_students?: number;
  placed_students?: number;
  placement_percentage?: number;
  average_salary?: number;
  median_salary?: number;
  highest_salary?: number;
  international_offers: number;
}

export interface Cutoff {
  id: string;
  college_id: string;
  branch_id: string;
  exam_type: string;
  year: number;
  opening_rank?: number;
  closing_rank?: number;
  opening_percentile?: number;
  closing_percentile?: number;
  category: string;
  proof_link?: string;
  official_source_url?: string;
}

export interface Event {
  id: string;
  college_id: string;
  name: string;
  slug: string;
  event_type: "cultural" | "technical" | "sports";
  description?: string;
  start_date?: string;
  end_date?: string;
  year?: number;
  images?: string[];
  posters?: string[];
  proof_links?: string[];
  celebrity_performances?: string[];
}

export interface Achievement {
  id: string;
  college_id: string;
  title: string;
  description?: string;
  year: number;
  category: "academics" | "placements" | "research" | "student" | "sports" | "social_impact";
  is_extraordinary: boolean;
  proof_link?: string;
  source_url?: string;
}

export interface CityAttraction {
  id: string;
  city: string;
  state: string;
  name: string;
  slug: string;
  category: string;
  description?: string;
  distance_from_city_center_km?: number;
  travel_time_minutes?: number;
  images?: string[];
  proof_links?: string[];
  best_season?: string;
  ideal_duration?: string;
}

export interface Media {
  id: string;
  college_id: string;
  platform: "youtube" | "instagram";
  media_type: "infrastructure" | "placements" | "events" | "campus_life" | "academics";
  title: string;
  description?: string;
  url: string;
  embed_id?: string;
  channel_name?: string;
  is_verified: boolean;
  upload_date?: string;
  thumbnail_url?: string;
}

export interface NewsArticle {
  id: string;
  college_id: string;
  title: string;
  source: string;
  url: string;
  published_date?: string;
  category?: string;
  proof_type?: string;
  image_url?: string;
}
