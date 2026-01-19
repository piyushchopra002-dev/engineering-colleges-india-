-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "vector";

-- Colleges table
CREATE TABLE colleges (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  short_name TEXT,
  description TEXT,
  established_year INTEGER,
  location TEXT NOT NULL,
  city TEXT NOT NULL,
  state TEXT NOT NULL,
  pincode TEXT,
  latitude DECIMAL(10, 8),
  longitude DECIMAL(11, 8),
  website TEXT,
  email TEXT,
  phone TEXT,
  approval_body TEXT[], -- AICTE, UGC, etc.
  affiliation TEXT, -- University affiliation
  college_type TEXT, -- IIT, NIT, Private, etc.
  logo_url TEXT,
  cover_image_url TEXT,
  male_female_ratio JSONB, -- {male: 60, female: 40}
  seat_matrix JSONB, -- Branch-wise seats
  fees_breakdown JSONB, -- Detailed fee structure
  infrastructure_summary TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  last_verified_at TIMESTAMP WITH TIME ZONE,
  data_confidence_score DECIMAL(3, 2) DEFAULT 0.5
);

-- College rankings
CREATE TABLE college_rankings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  ranking_type TEXT NOT NULL, -- NIRF, QS, THE, ARWU
  year INTEGER NOT NULL,
  rank INTEGER,
  category TEXT, -- Overall, Engineering, etc.
  proof_link TEXT,
  official_source_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(college_id, ranking_type, year)
);

-- Branches/Departments
CREATE TABLE branches (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL UNIQUE, -- CSE, ECE, ME, etc.
  full_name TEXT,
  slug TEXT UNIQUE NOT NULL,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- College branches (many-to-many)
CREATE TABLE college_branches (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
  intake INTEGER,
  seats_available INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(college_id, branch_id)
);

-- Faculty profiles
CREATE TABLE faculty (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  slug TEXT NOT NULL,
  photo_url TEXT,
  designation TEXT, -- Professor, Associate Professor, etc.
  department TEXT,
  branch_id UUID REFERENCES branches(id),
  qualifications TEXT[],
  experience_years INTEGER,
  research_interests TEXT[],
  past_institutions TEXT[],
  publications JSONB, -- Array of publication objects
  linkedin_url TEXT,
  google_scholar_url TEXT,
  email TEXT,
  phone TEXT,
  bio TEXT,
  is_verified BOOLEAN DEFAULT FALSE,
  verification_status TEXT DEFAULT 'pending', -- pending, verified, rejected
  rating DECIMAL(3, 2),
  feedback_count INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(college_id, slug)
);

-- Academic infrastructure
CREATE TABLE infrastructure (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  category TEXT NOT NULL, -- classroom, lab, library, hostel, sports, etc.
  name TEXT,
  description TEXT,
  branch_id UUID REFERENCES branches(id), -- NULL for general infrastructure
  details JSONB, -- AC/non-AC, smart classroom, etc.
  capacity INTEGER,
  images TEXT[], -- Array of image URLs
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Library details
CREATE TABLE libraries (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  name TEXT,
  opening_hours JSONB, -- {monday: "9:00-18:00", ...}
  is_24x7 BOOLEAN DEFAULT FALSE,
  seating_capacity INTEGER,
  digital_resources JSONB, -- {ebooks: 10000, journals: 500, ...}
  images TEXT[],
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Syllabus
CREATE TABLE syllabi (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
  semester INTEGER NOT NULL,
  subjects JSONB, -- Array of subject objects with name, type (core/elective), credits
  pdf_url TEXT,
  source_url TEXT,
  academic_year TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(college_id, branch_id, semester)
);

-- Grading system
CREATE TABLE grading_systems (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  system_type TEXT NOT NULL, -- CGPA, GPA, Percentage
  scale DECIMAL(3, 2), -- e.g., 10.0 for CGPA
  grading_type TEXT, -- relative, absolute
  grade_distribution JSONB,
  promotion_rules TEXT,
  back_rules TEXT,
  academic_benchmarks JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Transport & accessibility
CREATE TABLE transport (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  airport_name TEXT,
  airport_distance_km DECIMAL(8, 2),
  airport_travel_time_minutes INTEGER,
  railway_station_name TEXT,
  railway_distance_km DECIMAL(8, 2),
  railway_travel_time_minutes INTEGER,
  bus_connectivity TEXT[],
  metro_connectivity TEXT[],
  map_embed_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Companies
CREATE TABLE companies (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL UNIQUE,
  slug TEXT UNIQUE NOT NULL,
  logo_url TEXT,
  linkedin_url TEXT,
  website TEXT,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Placements
CREATE TABLE placements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  company_id UUID REFERENCES companies(id) ON DELETE CASCADE,
  branch_id UUID REFERENCES branches(id),
  year INTEGER NOT NULL,
  salary_offered DECIMAL(12, 2),
  currency TEXT DEFAULT 'INR',
  offer_type TEXT, -- FTE, Internship, PPO
  location TEXT,
  is_on_campus BOOLEAN DEFAULT TRUE,
  students_placed INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(college_id, company_id, branch_id, year)
);

-- Placement statistics
CREATE TABLE placement_stats (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  branch_id UUID REFERENCES branches(id),
  year INTEGER NOT NULL,
  total_students INTEGER,
  placed_students INTEGER,
  placement_percentage DECIMAL(5, 2),
  average_salary DECIMAL(12, 2),
  median_salary DECIMAL(12, 2),
  highest_salary DECIMAL(12, 2),
  international_offers INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(college_id, branch_id, year)
);

-- Cutoffs
CREATE TABLE cutoffs (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
  exam_type TEXT NOT NULL, -- JEE Main, JEE Advanced, etc.
  year INTEGER NOT NULL,
  opening_rank INTEGER,
  closing_rank INTEGER,
  opening_percentile DECIMAL(5, 2),
  closing_percentile DECIMAL(5, 2),
  category TEXT, -- General, OBC, SC, ST, etc.
  proof_link TEXT,
  official_source_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(college_id, branch_id, exam_type, year, category)
);

-- Events
CREATE TABLE events (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  slug TEXT NOT NULL,
  event_type TEXT NOT NULL, -- cultural, technical, sports
  description TEXT,
  start_date DATE,
  end_date DATE,
  year INTEGER,
  images TEXT[],
  posters TEXT[],
  proof_links TEXT[],
  celebrity_performances TEXT[],
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(college_id, slug, year)
);

-- Achievements
CREATE TABLE achievements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT,
  year INTEGER NOT NULL,
  category TEXT NOT NULL, -- academics, placements, research, student, sports, social_impact
  is_extraordinary BOOLEAN DEFAULT FALSE,
  proof_link TEXT,
  source_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- City attractions
CREATE TABLE city_attractions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  city TEXT NOT NULL,
  state TEXT NOT NULL,
  name TEXT NOT NULL,
  slug TEXT NOT NULL,
  category TEXT NOT NULL, -- mall, cafe, monument, museum, religious, picnic, etc.
  description TEXT,
  distance_from_city_center_km DECIMAL(8, 2),
  travel_time_minutes INTEGER,
  images TEXT[],
  proof_links TEXT[],
  best_season TEXT,
  ideal_duration TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(city, slug)
);

-- Media (YouTube, Instagram)
CREATE TABLE media (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  platform TEXT NOT NULL, -- youtube, instagram
  media_type TEXT NOT NULL, -- infrastructure, placements, events, campus_life, academics
  title TEXT NOT NULL,
  description TEXT,
  url TEXT NOT NULL,
  embed_id TEXT, -- YouTube video ID or Instagram post ID
  channel_name TEXT,
  is_verified BOOLEAN DEFAULT FALSE,
  upload_date DATE,
  thumbnail_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- News & media links
CREATE TABLE news_articles (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  source TEXT NOT NULL,
  url TEXT NOT NULL,
  published_date DATE,
  category TEXT, -- ranking, placement, event, achievement
  proof_type TEXT, -- newspaper, online, press_release
  image_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- User saved colleges
CREATE TABLE user_saved_colleges (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  college_id UUID REFERENCES colleges(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(user_id, college_id)
);

-- Comparisons
CREATE TABLE comparisons (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  college_ids UUID[] NOT NULL,
  branch_id UUID REFERENCES branches(id),
  comparison_data JSONB,
  share_token TEXT UNIQUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Chat history
CREATE TABLE chat_history (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  session_id TEXT NOT NULL,
  message TEXT NOT NULL,
  response TEXT,
  context_data JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Admin users (extend auth.users)
CREATE TABLE admin_users (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  role TEXT DEFAULT 'admin', -- admin, moderator, editor
  permissions JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes for performance
CREATE INDEX idx_colleges_slug ON colleges(slug);
CREATE INDEX idx_colleges_city ON colleges(city);
CREATE INDEX idx_colleges_state ON colleges(state);
CREATE INDEX idx_faculty_college ON faculty(college_id);
CREATE INDEX idx_faculty_slug ON faculty(slug);
CREATE INDEX idx_placements_college_year ON placements(college_id, year);
CREATE INDEX idx_cutoffs_college_branch ON cutoffs(college_id, branch_id);
CREATE INDEX idx_events_college_year ON events(college_id, year);
CREATE INDEX idx_achievements_college_year ON achievements(college_id, year);
CREATE INDEX idx_media_college ON media(college_id);
CREATE INDEX idx_city_attractions_city ON city_attractions(city);

-- Full-text search indexes
CREATE INDEX idx_colleges_search ON colleges USING gin(to_tsvector('english', name || ' ' || COALESCE(description, '')));
CREATE INDEX idx_faculty_search ON faculty USING gin(to_tsvector('english', name || ' ' || COALESCE(bio, '')));

-- Functions for updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_colleges_updated_at BEFORE UPDATE ON colleges
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_faculty_updated_at BEFORE UPDATE ON faculty
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_infrastructure_updated_at BEFORE UPDATE ON infrastructure
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_syllabi_updated_at BEFORE UPDATE ON syllabi
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_grading_systems_updated_at BEFORE UPDATE ON grading_systems
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_events_updated_at BEFORE UPDATE ON events
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_achievements_updated_at BEFORE UPDATE ON achievements
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_media_updated_at BEFORE UPDATE ON media
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
