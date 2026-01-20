const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function checkCollegeData(collegeSlug) {
  console.log(`\n🔍 Checking data for: ${collegeSlug}\n`);

  // Get the college
  const { data: college, error: collegeError } = await supabase
    .from('colleges')
    .select('id, name, slug')
    .eq('slug', collegeSlug)
    .single();

  if (collegeError || !college) {
    console.error('❌ College not found:', collegeError?.message);
    return;
  }

  console.log(`✅ College found: ${college.name}`);
  console.log(`   ID: ${college.id}\n`);

  // Check events
  const { data: events, error: eventsError, count: eventsCount } = await supabase
    .from('events')
    .select('*', { count: 'exact' })
    .eq('college_id', college.id);

  console.log(`📅 EVENTS: ${events?.length || 0} found`);
  if (events && events.length > 0) {
    events.forEach(event => {
      console.log(`   - ${event.name} (${event.event_type}, ${event.year})`);
    });
  }

  // Check media
  const { data: media, error: mediaError } = await supabase
    .from('media')
    .select('*')
    .eq('college_id', college.id);

  console.log(`\n🎥 MEDIA: ${media?.length || 0} found`);
  if (media && media.length > 0) {
    media.forEach(item => {
      console.log(`   - ${item.title} (${item.platform}, ${item.media_type})`);
    });
  }

  // Check infrastructure
  const { data: infrastructure, error: infraError } = await supabase
    .from('infrastructure')
    .select('*')
    .eq('college_id', college.id);

  console.log(`\n🏛️ INFRASTRUCTURE: ${infrastructure?.length || 0} found`);
  if (infrastructure && infrastructure.length > 0) {
    const categories = {};
    infrastructure.forEach(item => {
      categories[item.category] = (categories[item.category] || 0) + 1;
    });
    Object.entries(categories).forEach(([cat, count]) => {
      console.log(`   - ${cat}: ${count} items`);
    });
  }

  console.log('\n' + '='.repeat(60));
}

// Check multiple popular colleges
async function checkMultipleColleges() {
  const colleges = [
    'iit-bombay',
    'iit-delhi', 
    'iit-madras',
    'bits-pilani',
    'nit-trichy'
  ];

  for (const slug of colleges) {
    await checkCollegeData(slug);
  }
}

checkMultipleColleges()
  .then(() => {
    console.log('\n✅ Check complete!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ Check failed:', error);
    process.exit(1);
  });
