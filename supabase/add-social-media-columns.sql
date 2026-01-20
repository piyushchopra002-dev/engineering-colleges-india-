-- Add social media columns to colleges table
ALTER TABLE colleges 
ADD COLUMN IF NOT EXISTS instagram_url TEXT,
ADD COLUMN IF NOT EXISTS linkedin_url TEXT,
ADD COLUMN IF NOT EXISTS facebook_url TEXT,
ADD COLUMN IF NOT EXISTS twitter_url TEXT,
ADD COLUMN IF NOT EXISTS youtube_url TEXT;

-- Add comments
COMMENT ON COLUMN colleges.instagram_url IS 'Instagram profile URL';
COMMENT ON COLUMN colleges.linkedin_url IS 'LinkedIn page URL';
COMMENT ON COLUMN colleges.facebook_url IS 'Facebook page URL';
COMMENT ON COLUMN colleges.twitter_url IS 'Twitter/X profile URL';
COMMENT ON COLUMN colleges.youtube_url IS 'YouTube channel URL';
