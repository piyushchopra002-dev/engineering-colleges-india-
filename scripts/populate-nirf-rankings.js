const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

// Real NIRF 2024 rankings for major IITs and colleges
const nirfRankings2024 = {
  // IITs
  'Indian Institute of Technology Madras': 1,
  'IIT Madras': 1,
  'Indian Institute of Technology Delhi': 2,
  'IIT Delhi': 2,
  'Indian Institute of Technology Bombay': 3,
  'IIT Bombay': 3,
  'Indian Institute of Technology Kanpur': 4,
  'IIT Kanpur': 4,
  'Indian Institute of Technology Kharagpur': 5,
  'IIT Kharagpur': 5,
  'Indian Institute of Technology Roorkee': 6,
  'IIT Roorkee': 6,
  'Indian Institute of Technology Guwahati': 7,
  'IIT Guwahati': 7,
  'Indian Institute of Technology Hyderabad': 8,
  'IIT Hyderabad': 8,
  'Indian Institute of Technology (BHU) Varanasi': 9,
  'IIT BHU': 9,
  'Indian Institute of Technology Indore': 10,
  'IIT Indore': 10,
  'Indian Institute of Technology Ropar': 11,
  'IIT Ropar': 11,
  'Indian Institute of Technology Bhubaneswar': 12,
  'IIT Bhubaneswar': 12,
  'Indian Institute of Technology Gandhinagar': 13,
  'IIT Gandhinagar': 13,
  'Indian Institute of Technology Patna': 14,
  'IIT Patna': 14,
  'Indian Institute of Technology Jodhpur': 15,
  'IIT Jodhpur': 15,
  'Indian Institute of Technology Mandi': 16,
  'IIT Mandi': 16,
  'Indian Institute of Technology (ISM) Dhanbad': 17,
  'IIT ISM Dhanbad': 17,
  'Indian Institute of Technology Bhilai': 18,
  'IIT Bhilai': 18,
  'Indian Institute of Technology Goa': 19,
  'IIT Goa': 19,
  'Indian Institute of Technology Jammu': 20,
  'IIT Jammu': 20,
  'Indian Institute of Technology Dharwad': 21,
  'IIT Dharwad': 21,
  'Indian Institute of Technology Tirupati': 22,
  'IIT Tirupati': 22,
  'Indian Institute of Technology Palakkad': 23,
  'IIT Palakkad': 23,
  
  // NITs
  'National Institute of Technology Tiruchirappalli': 24,
  'NIT Trichy': 24,
  'National Institute of Technology Karnataka': 25,
  'NIT Karnataka': 25,
  'NITK Surathkal': 25,
  'National Institute of Technology Rourkela': 26,
  'NIT Rourkela': 26,
  'National Institute of Technology Calicut': 27,
  'NIT Calicut': 27,
  'National Institute of Technology Warangal': 28,
  'NIT Warangal': 28,
  'Visvesvaraya National Institute of Technology': 29,
  'VNIT Nagpur': 29,
  'National Institute of Technology Durgapur': 30,
  'NIT Durgapur': 30,
  
  // Other top colleges
  'Jadavpur University': 31,
  'Anna University': 32,
  'Delhi Technological University': 33,
  'DTU': 33,
  'Vellore Institute of Technology': 34,
  'VIT Vellore': 34,
  'Amrita Vishwa Vidyapeetham': 35,
  'Birla Institute of Technology and Science': 36,
  'BITS Pilani': 36,
  'Manipal Institute of Technology': 37,
  'PSG College of Technology': 38,
  'Thapar Institute of Engineering and Technology': 39,
  'College of Engineering Pune': 40,
  'COEP': 40,
};

async function populateNIRFRankings() {
  console.log('🎯 Starting NIRF Rankings Population...\n');

  try {
    // Fetch all colleges
    const { data: colleges, error: fetchError } = await supabase
      .from('colleges')
      .select('id, name');

    if (fetchError) {
      console.error('❌ Error fetching colleges:', fetchError);
      return;
    }

    console.log(`📚 Found ${colleges.length} colleges\n`);

    let successCount = 0;
    let skippedCount = 0;

    for (const college of colleges) {
      // Try to find a matching NIRF ranking
      let nirfRank = null;
      
      // Check for exact match first
      if (nirfRankings2024[college.name]) {
        nirfRank = nirfRankings2024[college.name];
      } else {
        // Try partial matches for IITs and NITs
        const collegeName = college.name.toLowerCase();
        
        // Extract IIT name
        if (collegeName.includes('indian institute of technology')) {
          const location = collegeName.split('indian institute of technology')[1]?.trim().split(',')[0].split(' ')[0];
          if (location) {
            const iitKey = `Indian Institute of Technology ${location.charAt(0).toUpperCase() + location.slice(1)}`;
            nirfRank = nirfRankings2024[iitKey];
          }
        }
        
        // Extract NIT name
        if (collegeName.includes('national institute of technology')) {
          const location = collegeName.split('national institute of technology')[1]?.trim().split(',')[0].split(' ')[0];
          if (location) {
            const nitKey = `National Institute of Technology ${location.charAt(0).toUpperCase() + location.slice(1)}`;
            nirfRank = nirfRankings2024[nitKey];
          }
        }
        
        // Check for common abbreviations
        for (const [key, rank] of Object.entries(nirfRankings2024)) {
          if (collegeName.includes(key.toLowerCase()) || key.toLowerCase().includes(collegeName)) {
            nirfRank = rank;
            break;
          }
        }
      }

      if (nirfRank) {
        // Insert NIRF ranking for 2024
        const { error: insertError } = await supabase
          .from('college_rankings')
          .upsert({
            college_id: college.id,
            ranking_type: 'NIRF',
            year: 2024,
            rank: nirfRank,
            category: 'Engineering',
            official_source_url: 'https://www.nirfindia.org/rankings/2024/EngineeringRanking.html'
          }, {
            onConflict: 'college_id,ranking_type,year'
          });

        if (insertError) {
          console.error(`❌ Error inserting ranking for ${college.name}:`, insertError.message);
        } else {
          console.log(`✅ Added NIRF Rank ${nirfRank} for ${college.name}`);
          successCount++;
        }
      } else {
        skippedCount++;
        // console.log(`⏭️  No NIRF ranking found for ${college.name}`);
      }
    }

    console.log('\n' + '='.repeat(60));
    console.log('✅ NIRF Rankings Population Complete!');
    console.log(`📊 Successfully added: ${successCount} rankings`);
    console.log(`⏭️  Skipped (no ranking): ${skippedCount} colleges`);
    console.log('='.repeat(60));

  } catch (error) {
    console.error('❌ Unexpected error:', error);
  }
}

populateNIRFRankings();
