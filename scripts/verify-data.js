const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Missing Supabase environment variables');
  console.log('Please check your .env.local file');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function verifyData() {
  console.log('🔍 Verifying data import...\n');

  try {
    // Check colleges count
    const { count: collegeCount, error: collegeError } = await supabase
      .from('colleges')
      .select('*', { count: 'exact', head: true });

    if (collegeError) {
      console.error('❌ Error checking colleges:', collegeError.message);
    } else {
      console.log(`✅ Colleges: ${collegeCount || 0} found`);
    }

    // Check college-branch relationships
    const { count: branchCount, error: branchError } = await supabase
      .from('college_branches')
      .select('*', { count: 'exact', head: true });

    if (branchError) {
      console.error('❌ Error checking college_branches:', branchError.message);
    } else {
      console.log(`✅ College-Branch Relationships: ${branchCount || 0} found`);
    }

    // Check rankings
    const { count: rankingCount, error: rankingError } = await supabase
      .from('college_rankings')
      .select('*', { count: 'exact', head: true });

    if (rankingError) {
      console.error('❌ Error checking rankings:', rankingError.message);
    } else {
      console.log(`✅ Rankings: ${rankingCount || 0} found`);
    }

    // Check placements
    const { count: placementCount, error: placementError } = await supabase
      .from('placement_stats')
      .select('*', { count: 'exact', head: true });

    if (placementError) {
      console.error('❌ Error checking placements:', placementError.message);
    } else {
      console.log(`✅ Placement Stats: ${placementCount || 0} found`);
    }

    // Check cutoffs
    const { count: cutoffCount, error: cutoffError } = await supabase
      .from('cutoffs')
      .select('*', { count: 'exact', head: true });

    if (cutoffError) {
      console.error('❌ Error checking cutoffs:', cutoffError.message);
    } else {
      console.log(`✅ Cutoffs: ${cutoffCount || 0} found`);
    }

    // Sample a few colleges
    const { data: sampleColleges, error: sampleError } = await supabase
      .from('colleges')
      .select('name, city, state, college_type')
      .limit(5);

    if (sampleError) {
      console.error('❌ Error fetching sample colleges:', sampleError.message);
    } else if (sampleColleges && sampleColleges.length > 0) {
      console.log('\n📋 Sample Colleges:');
      sampleColleges.forEach((college, index) => {
        console.log(`   ${index + 1}. ${college.name} (${college.city}, ${college.state}) - ${college.college_type}`);
      });
    }

    console.log('\n✨ Verification complete!');
    
    if (collegeCount >= 500) {
      console.log('🎉 Success! You have 500+ colleges in your database!');
    } else if (collegeCount > 0) {
      console.log(`⚠️  You have ${collegeCount} colleges. Expected 500+.`);
    } else {
      console.log('⚠️  No colleges found. Please check your import.');
    }

  } catch (error) {
    console.error('❌ Verification failed:', error.message);
  }
}

verifyData();
