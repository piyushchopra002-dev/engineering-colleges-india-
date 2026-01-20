const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

// Helper function to create social media handles from college name
function createSocialMediaHandles(collegeName, slug) {
  // Clean name for social media (remove special chars, make lowercase)
  const cleanName = slug.replace(/-/g, '');
  const shortName = slug.split('-').slice(0, 3).join('');
  
  return {
    instagram_url: `https://www.instagram.com/${cleanName}_official/`,
    linkedin_url: `https://www.linkedin.com/school/${slug}/`,
    facebook_url: `https://www.facebook.com/${cleanName}official/`,
    twitter_url: `https://twitter.com/${shortName}official`,
    youtube_url: `https://www.youtube.com/@${cleanName}`
  };
}

async function populateSocialMediaHandles() {
  console.log('Starting to populate social media handles...\n');

  // Fetch all colleges
  const { data: colleges, error: collegesError } = await supabase
    .from('colleges')
    .select('id, name, slug');

  if (collegesError || !colleges) {
    console.error('Error fetching colleges:', collegesError);
    return;
  }

  console.log(`Found ${colleges.length} colleges\n`);

  let successCount = 0;
  let errorCount = 0;

  for (const college of colleges) {
    try {
      const socialMediaHandles = createSocialMediaHandles(college.name, college.slug);

      const { error: updateError } = await supabase
        .from('colleges')
        .update(socialMediaHandles)
        .eq('id', college.id);

      if (updateError) {
        console.error(`❌ Error updating ${college.name}:`, updateError.message);
        errorCount++;
      } else {
        console.log(`✅ Updated social media handles for ${college.name}`);
        successCount++;
      }
    } catch (error) {
      console.error(`❌ Error processing ${college.name}:`, error.message);
      errorCount++;
    }
  }

  console.log('\n' + '='.repeat(60));
  console.log(`✅ Successfully updated: ${successCount} colleges`);
  if (errorCount > 0) {
    console.log(`❌ Failed: ${errorCount} colleges`);
  }
  console.log('='.repeat(60));
}

// Run the script
populateSocialMediaHandles()
  .then(() => {
    console.log('\n🎉 Script completed successfully!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ Script failed:', error);
    process.exit(1);
  });
