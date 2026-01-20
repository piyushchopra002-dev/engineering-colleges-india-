const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function verifyData() {
  console.log('Verifying Events, Media, and Infrastructure data...\n');

  // Check events
  const { data: events, error: eventsError } = await supabase
    .from('events')
    .select('*')
    .limit(5);

  console.log('📅 EVENTS:');
  if (eventsError) {
    console.error('Error:', eventsError.message);
  } else {
    console.log(`Total fetched: ${events?.length || 0}`);
    if (events && events.length > 0) {
      console.log('Sample event:', events[0]);
    }
  }

  // Check media
  const { data: media, error: mediaError } = await supabase
    .from('media')
    .select('*')
    .limit(5);

  console.log('\n🎥 MEDIA:');
  if (mediaError) {
    console.error('Error:', mediaError.message);
  } else {
    console.log(`Total fetched: ${media?.length || 0}`);
    if (media && media.length > 0) {
      console.log('Sample media:', media[0]);
    }
  }

  // Check infrastructure
  const { data: infrastructure, error: infraError } = await supabase
    .from('infrastructure')
    .select('*')
    .limit(5);

  console.log('\n🏛️ INFRASTRUCTURE:');
  if (infraError) {
    console.error('Error:', infraError.message);
  } else {
    console.log(`Total fetched: ${infrastructure?.length || 0}`);
    if (infrastructure && infrastructure.length > 0) {
      console.log('Sample infrastructure:', infrastructure[0]);
    }
  }

  // Get a specific college and its data
  console.log('\n\n🔍 CHECKING IIT BOMBAY SPECIFICALLY:');
  const { data: college } = await supabase
    .from('colleges')
    .select('id, name, slug')
    .eq('slug', 'iit-bombay')
    .single();

  if (college) {
    console.log('College:', college.name);
    
    const { data: collegeEvents } = await supabase
      .from('events')
      .eq('college_id', college.id)
      .select('*');
    
    const { data: collegeMedia } = await supabase
      .from('media')
      .eq('college_id', college.id)
      .select('*');
    
    const { data: collegeInfra } = await supabase
      .from('infrastructure')
      .eq('college_id', college.id)
      .select('*');

    console.log(`- Events: ${collegeEvents?.length || 0}`);
    console.log(`- Media: ${collegeMedia?.length || 0}`);
    console.log(`- Infrastructure: ${collegeInfra?.length || 0}`);
    
    if (collegeEvents && collegeEvents.length > 0) {
      console.log('\nSample event for IIT Bombay:');
      console.log(collegeEvents[0]);
    }
  }
}

verifyData()
  .then(() => {
    console.log('\n✅ Verification complete!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ Verification failed:', error);
    process.exit(1);
  });
