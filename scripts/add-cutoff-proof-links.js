const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function addCutoffProofLinks() {
  console.log('📎 Adding proof links to cutoffs...\n');

  // Fetch all cutoffs
  const { data: cutoffs, error: cutoffsError } = await supabase
    .from('cutoffs')
    .select('*, colleges(name, website)');

  if (cutoffsError || !cutoffs) {
    console.error('❌ Error fetching cutoffs:', cutoffsError);
    return;
  }

  console.log(`Found ${cutoffs.length} cutoff records\n`);

  let updatedCount = 0;

  for (const cutoff of cutoffs) {
    const college = cutoff.colleges;
    
    // Generate official source URLs based on exam type
    let officialSourceUrl = '';
    let proofLink = '';

    if (cutoff.exam_type === 'JEE Advanced') {
      // JoSAA (Joint Seat Allocation Authority) is the official source
      officialSourceUrl = `https://josaa.nic.in/`;
      proofLink = `https://josaa.nic.in/Result/Result/currentorcr.aspx`;
    } else if (cutoff.exam_type === 'JEE Main') {
      officialSourceUrl = `https://josaa.nic.in/`;
      proofLink = `https://josaa.nic.in/Result/Result/currentorcr.aspx`;
    } else if (cutoff.exam_type === 'GATE') {
      officialSourceUrl = `https://gate.iitd.ac.in/`;
    } else if (college?.website) {
      // Use college's official website
      officialSourceUrl = college.website;
      proofLink = `${college.website}/admissions`;
    }

    if (officialSourceUrl) {
      const { error: updateError } = await supabase
        .from('cutoffs')
        .update({
          official_source_url: officialSourceUrl,
          proof_link: proofLink || officialSourceUrl
        })
        .eq('id', cutoff.id);

      if (!updateError) {
        updatedCount++;
        if (updatedCount % 50 === 0) {
          console.log(`✅ Updated ${updatedCount} cutoffs...`);
        }
      }
    }
  }

  console.log('\n' + '='.repeat(60));
  console.log(`✅ Added proof links to ${updatedCount} cutoff records`);
  console.log('='.repeat(60));
}

addCutoffProofLinks()
  .then(() => {
    console.log('\n🎉 Proof links added successfully!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ Failed to add proof links:', error);
    process.exit(1);
  });
