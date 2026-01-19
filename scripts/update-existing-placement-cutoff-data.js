require('dotenv').config({ path: '.env.local' });
const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const branches = ['CSE', 'ECE', 'ME', 'CE', 'EE', 'IT', 'CHEM', 'BT'];
const categories = ['General', 'OBC', 'SC', 'ST', 'EWS'];

function randomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

async function getBranchMap() {
  const { data } = await supabase.from('branches').select('id, name');
  return data.reduce((map, branch) => {
    map[branch.name] = branch.id;
    return map;
  }, {});
}

async function updatePlacementStats(colleges, branchMap) {
  console.log('\nUpdating/Adding placement statistics...');
  
  let totalStats = 0;
  const years = [2021, 2022, 2023, 2024];
  
  for (const college of colleges) {
    // First, delete existing placement stats for this college
    await supabase
      .from('placement_stats')
      .delete()
      .eq('college_id', college.id);
    
    const stats = [];
    
    for (const year of years) {
      for (const branch of branches) {
        const branchId = branchMap[branch];
        if (!branchId) continue;
        
        const totalStudents = randomInt(60, 120);
        const placedStudents = randomInt(
          Math.floor(totalStudents * 0.75),
          Math.floor(totalStudents * 0.98)
        );
        
        let avgSalary, medianSalary, highestSalary;
        
        if (college.college_type === 'IIT') {
          avgSalary = randomInt(1200000, 2000000);
          medianSalary = randomInt(1000000, 1500000);
          highestSalary = randomInt(4000000, 7000000);
        } else if (college.college_type === 'NIT') {
          avgSalary = randomInt(800000, 1500000);
          medianSalary = randomInt(700000, 1200000);
          highestSalary = randomInt(2500000, 5000000);
        } else if (college.college_type === 'IIIT') {
          avgSalary = randomInt(900000, 1600000);
          medianSalary = randomInt(800000, 1300000);
          highestSalary = randomInt(3000000, 5500000);
        } else {
          avgSalary = randomInt(400000, 900000);
          medianSalary = randomInt(350000, 700000);
          highestSalary = randomInt(1500000, 3500000);
        }
        
        if (branch === 'CSE' || branch === 'IT') {
          avgSalary = Math.floor(avgSalary * 1.3);
          medianSalary = Math.floor(medianSalary * 1.3);
          highestSalary = Math.floor(highestSalary * 1.4);
        }
        
        stats.push({
          college_id: college.id,
          branch_id: branchId,
          year: year,
          total_students: totalStudents,
          placed_students: placedStudents,
          placement_percentage: ((placedStudents / totalStudents) * 100).toFixed(2),
          average_salary: avgSalary,
          median_salary: medianSalary,
          highest_salary: highestSalary,
          international_offers: randomInt(0, Math.floor(placedStudents * 0.1))
        });
      }
    }
    
    if (stats.length > 0) {
      const { error } = await supabase.from('placement_stats').insert(stats);
      if (error) {
        console.error(`Error for ${college.name}:`, error.message);
      } else {
        totalStats += stats.length;
        console.log(`✓ ${college.name}`);
      }
    }
  }
  
  console.log(`Total placement stats added: ${totalStats}`);
}

async function updateCutoffs(colleges, branchMap) {
  console.log('\nUpdating/Adding cutoff data...');
  
  let totalCutoffs = 0;
  const years = [2021, 2022, 2023, 2024];
  
  for (const college of colleges) {
    // First, delete existing cutoffs for this college
    await supabase
      .from('cutoffs')
      .delete()
      .eq('college_id', college.id);
    
    const cutoffs = [];
    
    let examType;
    if (college.college_type === 'IIT') {
      examType = 'JEE Advanced';
    } else if (college.college_type === 'NIT' || college.college_type === 'IIIT') {
      examType = 'JEE Main';
    } else {
      examType = 'JEE Main';
    }
    
    for (const year of years) {
      for (const branch of branches) {
        const branchId = branchMap[branch];
        if (!branchId) continue;
        
        for (const category of categories) {
          let openingRank, closingRank;
          
          if (college.college_type === 'IIT') {
            const baseCutoff = {
              General: [500, 5000],
              OBC: [2000, 8000],
              SC: [5000, 12000],
              ST: [8000, 15000],
              EWS: [1000, 6000]
            };
            openingRank = randomInt(...baseCutoff[category]);
            closingRank = randomInt(openingRank, openingRank + randomInt(500, 2000));
          } else if (college.college_type === 'NIT') {
            const baseCutoff = {
              General: [5000, 30000],
              OBC: [10000, 50000],
              SC: [20000, 80000],
              ST: [30000, 100000],
              EWS: [8000, 40000]
            };
            openingRank = randomInt(...baseCutoff[category]);
            closingRank = randomInt(openingRank, openingRank + randomInt(1000, 5000));
          } else {
            const baseCutoff = {
              General: [10000, 100000],
              OBC: [20000, 150000],
              SC: [40000, 200000],
              ST: [50000, 250000],
              EWS: [15000, 120000]
            };
            openingRank = randomInt(...baseCutoff[category]);
            closingRank = randomInt(openingRank, openingRank + randomInt(2000, 10000));
          }
          
          if (branch === 'CSE' || branch === 'IT') {
            openingRank = Math.floor(openingRank * 0.7);
            closingRank = Math.floor(closingRank * 0.7);
          }
          
          cutoffs.push({
            college_id: college.id,
            branch_id: branchId,
            exam_type: examType,
            year: year,
            opening_rank: openingRank,
            closing_rank: closingRank,
            category: category
          });
        }
      }
    }
    
    if (cutoffs.length > 0) {
      const { error } = await supabase.from('cutoffs').insert(cutoffs);
      if (error) {
        console.error(`Error for ${college.name}:`, error.message);
      } else {
        totalCutoffs += cutoffs.length;
        console.log(`✓ ${college.name}`);
      }
    }
  }
  
  console.log(`Total cutoffs added: ${totalCutoffs}`);
}

async function main() {
  console.log('Updating placement stats and cutoffs for all colleges...\n');
  
  try {
    const { data: colleges, error: collegesError } = await supabase
      .from('colleges')
      .select('id, name, college_type')
      .order('name');
    
    if (collegesError) {
      throw new Error(`Failed to fetch colleges: ${collegesError.message}`);
    }
    
    console.log(`Found ${colleges.length} colleges\n`);
    
    const branchMap = await getBranchMap();
    console.log(`Branches: ${Object.keys(branchMap).length}\n`);
    
    await updatePlacementStats(colleges, branchMap);
    await updateCutoffs(colleges, branchMap);
    
    console.log('\n✅ All data updated successfully!');
    
  } catch (error) {
    console.error('Error:', error.message);
    process.exit(1);
  }
}

main();
