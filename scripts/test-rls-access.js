const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

// Test with anon key (what the website uses)
const supabaseAnon = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function testRLSAccess() {
  console.log('🔐 Testing RLS Access with ANON key (same as website)...\n');

  // Test events table
  const { data: events, error: eventsError } = await supabaseAnon
    .from('events')
    .select('*')
    .limit(1);

  console.log('📅 Events Table:');
  if (eventsError) {
    console.log(`   ❌ ERROR: ${eventsError.message}`);
    console.log(`   Code: ${eventsError.code}`);
  } else {
    console.log(`   ✅ Access OK - Found ${events?.length || 0} records`);
  }

  // Test media table
  const { data: media, error: mediaError } = await supabaseAnon
    .from('media')
    .select('*')
    .limit(1);

  console.log('\n🎥 Media Table:');
  if (mediaError) {
    console.log(`   ❌ ERROR: ${mediaError.message}`);
    console.log(`   Code: ${mediaError.code}`);
  } else {
    console.log(`   ✅ Access OK - Found ${media?.length || 0} records`);
  }

  // Test infrastructure table
  const { data: infrastructure, error: infraError } = await supabaseAnon
    .from('infrastructure')
    .select('*')
    .limit(1);

  console.log('\n🏛️ Infrastructure Table:');
  if (infraError) {
    console.log(`   ❌ ERROR: ${infraError.message}`);
    console.log(`   Code: ${infraError.code}`);
  } else {
    console.log(`   ✅ Access OK - Found ${infrastructure?.length || 0} records`);
  }

  // Test with a specific college query (like the website does)
  const { data: college } = await supabaseAnon
    .from('colleges')
    .select('id')
    .eq('slug', 'iit-bombay')
    .single();

  if (college) {
    console.log('\n\n🔍 Testing with IIT Bombay (like website does):');
    
    const { data: collegeEvents, error: collegeEventsError } = await supabaseAnon
      .from('events')
      .select('*')
      .eq('college_id', college.id)
      .order('year', { ascending: false })
      .limit(10);

    console.log('\n📅 Events for IIT Bombay:');
    if (collegeEventsError) {
      console.log(`   ❌ ERROR: ${collegeEventsError.message}`);
    } else {
      console.log(`   ✅ Found ${collegeEvents?.length || 0} events`);
      if (collegeEvents && collegeEvents.length > 0) {
        collegeEvents.forEach(e => console.log(`      - ${e.name} (${e.year})`));
      }
    }

    const { data: collegeMedia, error: collegeMediaError } = await supabaseAnon
      .from('media')
      .select('*')
      .eq('college_id', college.id)
      .order('upload_date', { ascending: false });

    console.log('\n🎥 Media for IIT Bombay:');
    if (collegeMediaError) {
      console.log(`   ❌ ERROR: ${collegeMediaError.message}`);
    } else {
      console.log(`   ✅ Found ${collegeMedia?.length || 0} media items`);
    }
  }

  console.log('\n' + '='.repeat(60));
  console.log('\n💡 If you see errors above, you need to enable RLS policies:');
  console.log('   1. Go to Supabase Dashboard > Authentication > Policies');
  console.log('   2. For events, media, and infrastructure tables:');
  console.log('   3. Add policy: "Enable read access for all users"');
  console.log('      - Policy name: public_read');
  console.log('      - Operation: SELECT');
  console.log('      - Target roles: public, anon');
  console.log('      - USING expression: true');
}

testRLSAccess()
  .then(() => {
    console.log('\n✅ Test complete!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ Test failed:', error);
    process.exit(1);
  });
