const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

// We need the service role key for schema modifications
// For now, we'll use the anon key and let the user know to run the SQL manually
const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function addSocialMediaColumns() {
  console.log('📋 To add social media columns to your database:\n');
  console.log('1. Go to your Supabase Dashboard: https://supabase.com/dashboard');
  console.log('2. Select your project');
  console.log('3. Go to "SQL Editor" in the left sidebar');
  console.log('4. Click "New Query"');
  console.log('5. Copy and paste the following SQL:\n');
  console.log('='.repeat(70));
  console.log(`
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
  `.trim());
  console.log('='.repeat(70));
  console.log('\n6. Click "Run" to execute the query');
  console.log('7. After running successfully, run: node scripts/populate-social-media-handles.js\n');
}

addSocialMediaColumns()
  .then(() => {
    console.log('✅ Instructions displayed!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('❌ Error:', error);
    process.exit(1);
  });
