const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function checkIITGandhinagarEvents() {
  console.log('🔍 Checking IIT Gandhinagar events...\n');

  // Get the college
  const { data: college, error: collegeError } = await supabase
    .from('colleges')
    .select('*')
    .eq('slug', 'indian-institute-of-technology-gandhinagar')
    .single();

  if (collegeError || !college) {
    console.error('❌ College not found:', collegeError);
    return;
  }

  console.log(`✅ College found: ${college.name}`);
  console.log(`   ID: ${college.id}`);
  console.log(`   Slug: ${college.slug}\n`);

  // Fetch events exactly like the page does
  const { data: events, error: eventsError } = await supabase
    .from('events')
    .select('*')
    .eq('college_id', college.id)
    .order('year', { ascending: false })
    .limit(10);

  console.log('📅 EVENTS QUERY RESULT:');
  if (eventsError) {
    console.error('❌ Error:', eventsError.message);
    console.error('   Details:', eventsError);
  } else {
    console.log(`✅ Found ${events?.length || 0} events`);
    if (events && events.length > 0) {
      console.log('\nEvent details:');
      events.forEach((event, idx) => {
        console.log(`\n${idx + 1}. ${event.name}`);
        console.log(`   ID: ${event.id}`);
        console.log(`   Type: ${event.event_type}`);
        console.log(`   Year: ${event.year}`);
        console.log(`   Description: ${event.description ? event.description.substring(0, 50) + '...' : 'N/A'}`);
        console.log(`   College ID: ${event.college_id}`);
        console.log(`   Created: ${event.created_at}`);
      });
    } else {
      console.log('\n⚠️  No events found - but they should exist!');
      
      // Let's check if there are ANY events for this college_id
      const { data: allEvents, count } = await supabase
        .from('events')
        .select('*', { count: 'exact' })
        .eq('college_id', college.id);
      
      console.log(`\n🔍 Double-checking: Total events for this college_id: ${count}`);
      if (allEvents && allEvents.length > 0) {
        console.log('Events found:');
        allEvents.forEach(e => console.log(`   - ${e.name} (${e.event_type}, ${e.year})`));
      }
    }
  }

  // Also check media to compare
  const { data: media } = await supabase
    .from('media')
    .select('*')
    .eq('college_id', college.id);
  
  console.log(`\n🎥 MEDIA (for comparison): ${media?.length || 0} items found`);
}

checkIITGandhinagarEvents()
  .then(() => {
    console.log('\n✅ Check complete!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ Check failed:', error);
    process.exit(1);
  });
