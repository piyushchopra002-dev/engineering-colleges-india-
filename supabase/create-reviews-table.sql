-- Create reviews table
CREATE TABLE IF NOT EXISTS reviews (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  college_id UUID NOT NULL REFERENCES colleges(id) ON DELETE CASCADE,
  user_name VARCHAR(255) NOT NULL,
  user_email VARCHAR(255),
  user_type VARCHAR(50) CHECK (user_type IN ('current_student', 'alumni', 'parent', 'visitor')),
  graduation_year INTEGER,
  branch_id UUID REFERENCES branches(id),
  
  -- Ratings (1-5)
  overall_rating DECIMAL(2,1) NOT NULL CHECK (overall_rating >= 1 AND overall_rating <= 5),
  infrastructure_rating DECIMAL(2,1) CHECK (infrastructure_rating >= 1 AND infrastructure_rating <= 5),
  academics_rating DECIMAL(2,1) CHECK (academics_rating >= 1 AND academics_rating <= 5),
  placements_rating DECIMAL(2,1) CHECK (placements_rating >= 1 AND placements_rating <= 5),
  faculty_rating DECIMAL(2,1) CHECK (faculty_rating >= 1 AND faculty_rating <= 5),
  campus_life_rating DECIMAL(2,1) CHECK (campus_life_rating >= 1 AND campus_life_rating <= 5),
  
  -- Review content
  review_title VARCHAR(255) NOT NULL,
  review_text TEXT NOT NULL,
  
  -- Pros and cons
  pros TEXT,
  cons TEXT,
  
  -- Verification
  is_verified BOOLEAN DEFAULT false,
  verification_proof TEXT,
  
  -- Moderation
  is_approved BOOLEAN DEFAULT false,
  is_featured BOOLEAN DEFAULT false,
  
  -- Helpful votes
  helpful_count INTEGER DEFAULT 0,
  not_helpful_count INTEGER DEFAULT 0,
  
  -- Timestamps
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  -- Indexes
  CONSTRAINT reviews_college_id_idx UNIQUE (college_id, user_email, created_at)
);

-- Create indexes for better query performance
CREATE INDEX idx_reviews_college_id ON reviews(college_id);
CREATE INDEX idx_reviews_overall_rating ON reviews(overall_rating);
CREATE INDEX idx_reviews_is_approved ON reviews(is_approved);
CREATE INDEX idx_reviews_created_at ON reviews(created_at DESC);
CREATE INDEX idx_reviews_is_featured ON reviews(is_featured);

-- Create review_votes table for tracking helpful votes
CREATE TABLE IF NOT EXISTS review_votes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  review_id UUID NOT NULL REFERENCES reviews(id) ON DELETE CASCADE,
  user_ip VARCHAR(45) NOT NULL,
  vote_type VARCHAR(20) CHECK (vote_type IN ('helpful', 'not_helpful')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  CONSTRAINT review_votes_unique UNIQUE (review_id, user_ip)
);

CREATE INDEX idx_review_votes_review_id ON review_votes(review_id);

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_reviews_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger to automatically update updated_at
CREATE TRIGGER trigger_reviews_updated_at
BEFORE UPDATE ON reviews
FOR EACH ROW
EXECUTE FUNCTION update_reviews_updated_at();

-- Enable Row Level Security
ALTER TABLE reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE review_votes ENABLE ROW LEVEL SECURITY;

-- RLS Policies for reviews
CREATE POLICY "Reviews are viewable by everyone" ON reviews
  FOR SELECT USING (is_approved = true);

CREATE POLICY "Anyone can insert reviews" ON reviews
  FOR INSERT WITH CHECK (true);

-- RLS Policies for review_votes
CREATE POLICY "Review votes are viewable by everyone" ON review_votes
  FOR SELECT USING (true);

CREATE POLICY "Anyone can vote on reviews" ON review_votes
  FOR INSERT WITH CHECK (true);

-- Add comments
COMMENT ON TABLE reviews IS 'Student and alumni reviews for colleges';
COMMENT ON COLUMN reviews.user_type IS 'Type of user: current_student, alumni, parent, or visitor';
COMMENT ON COLUMN reviews.is_verified IS 'Whether the review is from a verified student/alumni';
COMMENT ON COLUMN reviews.is_approved IS 'Whether the review has been approved by moderators';
COMMENT ON COLUMN reviews.is_featured IS 'Whether to feature this review prominently';
