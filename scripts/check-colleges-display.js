const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Missing Supabase environment variables');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkColleges() {
  console.log('🔍 Checking colleges in database...\n');

  try {
    // Check total count
    const { count, error: countError } = await supabase
      .from('colleges')
      .select('*', { count: 'exact', head: true });

    if (countError) {
      console.error('❌ Error:', countError.message);
      return;
    }

    console.log(`📊 Total Colleges: ${count}\n`);

    // Get all colleges ordered by name (same as homepage)
    const { data: allColleges, error: allError } = await supabase
      .from('colleges')
      .select('id, name, slug, city, state, college_type, created_at')
      .order('name', { ascending: true });

    if (allError) {
      console.error('❌ Error fetching colleges:', allError.message);
      return;
    }

    console.log(`✅ Found ${allColleges.length} colleges\n`);

    // Show first 12 (what homepage should show)
    console.log('📋 First 12 Colleges (Homepage Featured):');
    allColleges.slice(0, 12).forEach((college, index) => {
      console.log(`   ${index + 1}. ${college.name} (${college.city}, ${college.state})`);
      console.log(`      Type: ${college.college_type || 'N/A'}, Created: ${college.created_at || 'N/A'}`);
    });

    // Check for NULL created_at
    const nullCreatedAt = allColleges.filter(c => !c.created_at);
    if (nullCreatedAt.length > 0) {
      console.log(`\n⚠️  Warning: ${nullCreatedAt.length} colleges have NULL created_at`);
    }

    // Check if we have the original 6
    const original6 = [
      'Indian Institute of Technology Bombay',
      'National Institute of Technology Trichy',
      'Vellore Institute of Technology',
      'Birla Institute of Technology and Science Pilani',
      'Manipal Institute of Technology',
      'SRM Institute of Science and Technology'
    ];

    console.log('\n🔍 Checking for original 6 colleges:');
    original6.forEach(name => {
      const found = allColleges.find(c => c.name === name);
      if (found) {
        console.log(`   ✅ ${name}`);
      } else {
        console.log(`   ❌ ${name} - NOT FOUND`);
      }
    });

  } catch (error) {
    console.error('❌ Error:', error.message);
  }
}

checkColleges();
