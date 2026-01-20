const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function auditAllColleges() {
  console.log('🔍 Auditing all colleges for Events, Media, and Infrastructure...\n');

  // Fetch all colleges
  const { data: colleges, error: collegesError } = await supabase
    .from('colleges')
    .select('id, name, slug')
    .order('name');

  if (collegesError || !colleges) {
    console.error('❌ Error fetching colleges:', collegesError);
    return;
  }

  console.log(`Found ${colleges.length} colleges\n`);

  const missingData = {
    events: [],
    media: [],
    infrastructure: []
  };

  const summary = [];

  for (const college of colleges) {
    const { data: events } = await supabase
      .from('events')
      .select('id')
      .eq('college_id', college.id);

    const { data: media } = await supabase
      .from('media')
      .select('id')
      .eq('college_id', college.id);

    const { data: infrastructure } = await supabase
      .from('infrastructure')
      .select('id')
      .eq('college_id', college.id);

    const eventsCount = events?.length || 0;
    const mediaCount = media?.length || 0;
    const infraCount = infrastructure?.length || 0;

    summary.push({
      name: college.name,
      slug: college.slug,
      events: eventsCount,
      media: mediaCount,
      infrastructure: infraCount
    });

    if (eventsCount === 0) missingData.events.push(college.name);
    if (mediaCount === 0) missingData.media.push(college.name);
    if (infraCount === 0) missingData.infrastructure.push(college.name);
  }

  // Print summary
  console.log('📊 DATA SUMMARY:');
  console.log('='.repeat(80));
  console.log(`${'College Name'.padEnd(50)} Events  Media  Infra`);
  console.log('='.repeat(80));

  summary.forEach(item => {
    const status = (item.events === 0 || item.media === 0 || item.infrastructure === 0) ? '❌' : '✅';
    console.log(
      `${status} ${item.name.substring(0, 47).padEnd(47)} ${String(item.events).padStart(6)} ${String(item.media).padStart(6)} ${String(item.infrastructure).padStart(6)}`
    );
  });

  console.log('\n' + '='.repeat(80));
  console.log('\n📈 STATISTICS:');
  console.log(`   Total Colleges: ${colleges.length}`);
  console.log(`   Colleges WITH data: ${summary.filter(s => s.events > 0 && s.media > 0 && s.infrastructure > 0).length}`);
  console.log(`   Colleges MISSING Events: ${missingData.events.length}`);
  console.log(`   Colleges MISSING Media: ${missingData.media.length}`);
  console.log(`   Colleges MISSING Infrastructure: ${missingData.infrastructure.length}`);

  if (missingData.events.length > 0) {
    console.log('\n❌ Colleges MISSING Events:');
    missingData.events.forEach(name => console.log(`   - ${name}`));
  }

  if (missingData.media.length > 0) {
    console.log('\n❌ Colleges MISSING Media:');
    missingData.media.forEach(name => console.log(`   - ${name}`));
  }

  if (missingData.infrastructure.length > 0) {
    console.log('\n❌ Colleges MISSING Infrastructure:');
    missingData.infrastructure.forEach(name => console.log(`   - ${name}`));
  }

  return { summary, missingData };
}

auditAllColleges()
  .then(() => {
    console.log('\n✅ Audit complete!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ Audit failed:', error);
    process.exit(1);
  });
