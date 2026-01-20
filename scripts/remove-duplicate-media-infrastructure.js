const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function removeDuplicates() {
  console.log('🧹 Removing duplicate Media and Infrastructure entries...\n');

  // Get all colleges
  const { data: colleges } = await supabase
    .from('colleges')
    .select('id, name');

  if (!colleges) {
    console.error('❌ Could not fetch colleges');
    return;
  }

  let mediaRemoved = 0;
  let infraRemoved = 0;

  for (const college of colleges) {
    // Find duplicate media entries
    const { data: mediaItems } = await supabase
      .from('media')
      .select('*')
      .eq('college_id', college.id)
      .order('created_at', { ascending: true });

    if (mediaItems && mediaItems.length > 5) {
      // Keep only the first 5, delete the rest
      const duplicates = mediaItems.slice(5);
      const duplicateIds = duplicates.map(item => item.id);
      
      if (duplicateIds.length > 0) {
        const { error } = await supabase
          .from('media')
          .delete()
          .in('id', duplicateIds);

        if (!error) {
          mediaRemoved += duplicateIds.length;
          console.log(`✅ ${college.name}: Removed ${duplicateIds.length} duplicate media items`);
        }
      }
    }

    // Find duplicate infrastructure entries
    const { data: infraItems } = await supabase
      .from('infrastructure')
      .select('*')
      .eq('college_id', college.id)
      .order('created_at', { ascending: true });

    if (infraItems && infraItems.length > 0) {
      // Group by name to find duplicates
      const seen = new Map();
      const duplicates = [];

      infraItems.forEach(item => {
        const key = `${item.name}-${item.category}`;
        if (seen.has(key)) {
          duplicates.push(item.id);
        } else {
          seen.set(key, item.id);
        }
      });

      if (duplicates.length > 0) {
        const { error } = await supabase
          .from('infrastructure')
          .delete()
          .in('id', duplicates);

        if (!error) {
          infraRemoved += duplicates.length;
          console.log(`✅ ${college.name}: Removed ${duplicates.length} duplicate infrastructure items`);
        }
      }
    }
  }

  console.log('\n' + '='.repeat(60));
  console.log(`✅ Cleanup complete!`);
  console.log(`   Media items removed: ${mediaRemoved}`);
  console.log(`   Infrastructure items removed: ${infraRemoved}`);
  console.log('='.repeat(60));
}

removeDuplicates()
  .then(() => {
    console.log('\n🎉 All duplicates removed!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ Cleanup failed:', error);
    process.exit(1);
  });
