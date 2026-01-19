require('dotenv').config({ path: '.env.local' });
const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

// Sample data arrays
const branches = ['CSE', 'ECE', 'ME', 'CE', 'EE', 'IT', 'CHEM', 'BT'];
const branchFullNames = {
  CSE: 'Computer Science and Engineering',
  ECE: 'Electronics and Communication Engineering',
  ME: 'Mechanical Engineering',
  CE: 'Civil Engineering',
  EE: 'Electrical Engineering',
  IT: 'Information Technology',
  CHEM: 'Chemical Engineering',
  BT: 'Biotechnology'
};

const categories = ['General', 'OBC', 'SC', 'ST', 'EWS'];
const examTypes = ['JEE Main', 'JEE Advanced', 'State CET'];

const companies = [
  'Google', 'Microsoft', 'Amazon', 'TCS', 'Infosys', 'Wipro', 'Accenture',
  'Goldman Sachs', 'Morgan Stanley', 'Deloitte', 'EY', 'KPMG', 'Adobe',
  'Oracle', 'IBM', 'Cognizant', 'HCL', 'Tech Mahindra', 'Capgemini',
  'Flipkart', 'Paytm', 'Ola', 'Uber', 'Swiggy', 'Zomato', 'Samsung',
  'Intel', 'Nvidia', 'Qualcomm', 'Texas Instruments', 'Bosch', 'Siemens',
  'L&T', 'Tata Steel', 'Reliance', 'ONGC', 'BHEL', 'DRDO', 'ISRO'
];

const designations = [
  'Professor', 'Associate Professor', 'Assistant Professor', 
  'Senior Professor', 'Head of Department', 'Dean'
];

const qualifications = [
  ['Ph.D.', 'M.Tech', 'B.Tech'],
  ['Ph.D.', 'M.E.', 'B.E.'],
  ['Ph.D.', 'M.S.', 'B.Tech'],
  ['M.Tech', 'B.Tech'],
  ['M.E.', 'B.E.']
];

const firstNames = [
  'Rajesh', 'Priya', 'Amit', 'Sneha', 'Vikram', 'Anjali', 'Rahul', 'Pooja',
  'Suresh', 'Divya', 'Anil', 'Kavita', 'Manoj', 'Neha', 'Sanjay', 'Meera',
  'Karthik', 'Swati', 'Deepak', 'Ritu', 'Arjun', 'Shruti', 'Naveen', 'Preeti',
  'Ravi', 'Sunita', 'Ajay', 'Nisha', 'Prakash', 'Anita'
];

const lastNames = [
  'Kumar', 'Sharma', 'Singh', 'Gupta', 'Reddy', 'Patel', 'Verma', 'Iyer',
  'Mehta', 'Nair', 'Rao', 'Joshi', 'Desai', 'Pillai', 'Agarwal', 'Malhotra',
  'Chopra', 'Sinha', 'Mishra', 'Pandey', 'Shah', 'Kapoor', 'Bansal', 'Saxena'
];

const researchAreas = {
  CSE: ['Machine Learning', 'Artificial Intelligence', 'Data Science', 'Cybersecurity', 'Cloud Computing', 'Blockchain', 'IoT'],
  ECE: ['VLSI Design', 'Signal Processing', 'Communication Systems', 'Embedded Systems', 'Microwave Engineering', '5G Networks'],
  ME: ['Thermodynamics', 'Robotics', 'Manufacturing', 'CAD/CAM', 'Automobile Engineering', 'Renewable Energy'],
  CE: ['Structural Engineering', 'Transportation', 'Environmental Engineering', 'Geotechnical Engineering', 'Construction Management'],
  EE: ['Power Systems', 'Control Systems', 'Power Electronics', 'Renewable Energy', 'Electric Vehicles', 'Smart Grid'],
  IT: ['Software Engineering', 'Database Systems', 'Web Technologies', 'Mobile Computing', 'Information Security'],
  CHEM: ['Process Engineering', 'Polymer Science', 'Catalysis', 'Biochemical Engineering', 'Environmental Engineering'],
  BT: ['Genetic Engineering', 'Bioinformatics', 'Tissue Engineering', 'Bioprocess Engineering', 'Pharmaceutical Biotechnology']
};

const achievementCategories = {
  academics: [
    'Achieved 100% placement record',
    'Students qualified for GATE with top ranks',
    'Excellence in research publications',
    'Accredited with NAAC A++ Grade',
    'NBA accreditation for all programs',
    'University topper from department'
  ],
  placements: [
    'Record highest package offered',
    'Major MNC recruited maximum students',
    'International placements increased by 50%',
    'Dream companies visited campus',
    '100% placement for eligible students',
    'Average package increased significantly'
  ],
  research: [
    'Faculty published papers in top journals',
    'Received research grants from DST',
    'Patent filed for innovative technology',
    'International research collaboration established',
    'Research center inaugurated',
    'Students won research paper competition'
  ],
  student: [
    'Won national level technical competition',
    'Students represented at international conference',
    'Hackathon winners from college',
    'Student startup received funding',
    'National level sports achievement',
    'Cultural fest attracted thousands'
  ],
  sports: [
    'Won inter-college sports championship',
    'Student represented state in nationals',
    'New sports complex inaugurated',
    'Hosted national level sports event',
    'Won multiple medals in university sports'
  ],
  social_impact: [
    'Organized blood donation camp',
    'Community service initiative launched',
    'Environmental awareness campaign',
    'Rural development project undertaken',
    'Free technical training for underprivileged',
    'COVID relief activities conducted'
  ]
};

function randomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function randomElement(array) {
  return array[Math.floor(Math.random() * array.length)];
}

function generateSlug(name) {
  return name.toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '');
}

async function ensureBranches() {
  console.log('Ensuring branches exist...');
  
  for (const branchCode of branches) {
    const { data: existing } = await supabase
      .from('branches')
      .select('id')
      .eq('name', branchCode)
      .single();
    
    if (!existing) {
      await supabase.from('branches').insert({
        name: branchCode,
        full_name: branchFullNames[branchCode],
        slug: generateSlug(branchCode)
      });
      console.log(`Created branch: ${branchCode}`);
    }
  }
}

async function ensureCompanies() {
  console.log('Ensuring companies exist...');
  
  for (const companyName of companies) {
    const { data: existing } = await supabase
      .from('companies')
      .select('id')
      .eq('name', companyName)
      .single();
    
    if (!existing) {
      await supabase.from('companies').insert({
        name: companyName,
        slug: generateSlug(companyName)
      });
      console.log(`Created company: ${companyName}`);
    }
  }
}

async function getBranchMap() {
  const { data } = await supabase.from('branches').select('id, name');
  return data.reduce((map, branch) => {
    map[branch.name] = branch.id;
    return map;
  }, {});
}

async function getCompanyMap() {
  const { data } = await supabase.from('companies').select('id, name');
  return data.reduce((map, company) => {
    map[company.name] = company.id;
    return map;
  }, {});
}

async function populateFaculty(colleges, branchMap) {
  console.log('\nPopulating faculty data...');
  
  let totalFaculty = 0;
  
  for (const college of colleges) {
    // Determine number of faculty based on college type
    let facultyCount;
    if (college.college_type === 'IIT') {
      facultyCount = randomInt(80, 150);
    } else if (college.college_type === 'NIT') {
      facultyCount = randomInt(60, 120);
    } else if (college.college_type === 'IIIT') {
      facultyCount = randomInt(40, 80);
    } else {
      facultyCount = randomInt(30, 100);
    }
    
    const facultyMembers = [];
    
    for (let i = 0; i < facultyCount; i++) {
      const firstName = randomElement(firstNames);
      const lastName = randomElement(lastNames);
      const fullName = `Dr. ${firstName} ${lastName}`;
      const branch = randomElement(branches);
      const branchId = branchMap[branch];
      
      const faculty = {
        college_id: college.id,
        name: fullName,
        slug: generateSlug(fullName) + '-' + randomInt(1, 9999),
        designation: randomElement(designations),
        department: branchFullNames[branch],
        branch_id: branchId,
        qualifications: randomElement(qualifications),
        experience_years: randomInt(5, 30),
        research_interests: researchAreas[branch]
          ? [randomElement(researchAreas[branch]), randomElement(researchAreas[branch])]
          : [],
        is_verified: true,
        verification_status: 'verified'
      };
      
      facultyMembers.push(faculty);
    }
    
    if (facultyMembers.length > 0) {
      const { error } = await supabase.from('faculty').insert(facultyMembers);
      if (error) {
        console.error(`Error inserting faculty for ${college.name}:`, error.message);
      } else {
        totalFaculty += facultyMembers.length;
        console.log(`Added ${facultyMembers.length} faculty members to ${college.name}`);
      }
    }
  }
  
  console.log(`Total faculty added: ${totalFaculty}`);
}

async function populatePlacementStats(colleges, branchMap) {
  console.log('\nPopulating placement statistics...');
  
  let totalStats = 0;
  const years = [2021, 2022, 2023, 2024];
  
  for (const college of colleges) {
    const stats = [];
    
    for (const year of years) {
      for (const branch of branches) {
        const branchId = branchMap[branch];
        const totalStudents = randomInt(60, 120);
        const placedStudents = randomInt(
          Math.floor(totalStudents * 0.75),
          Math.floor(totalStudents * 0.98)
        );
        
        // Calculate salary ranges based on college type and branch
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
        
        // CSE and IT typically have higher packages
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
        console.error(`Error inserting placement stats for ${college.name}:`, error.message);
      } else {
        totalStats += stats.length;
        console.log(`Added ${stats.length} placement stat records to ${college.name}`);
      }
    }
  }
  
  console.log(`Total placement stats added: ${totalStats}`);
}

async function populateCutoffs(colleges, branchMap) {
  console.log('\nPopulating cutoff data...');
  
  let totalCutoffs = 0;
  const years = [2021, 2022, 2023, 2024];
  
  for (const college of colleges) {
    const cutoffs = [];
    
    // Determine exam type based on college type
    let examType;
    if (college.college_type === 'IIT') {
      examType = 'JEE Advanced';
    } else if (college.college_type === 'NIT' || college.college_type === 'IIIT') {
      examType = 'JEE Main';
    } else {
      examType = randomElement(['JEE Main', 'State CET']);
    }
    
    for (const year of years) {
      for (const branch of branches) {
        const branchId = branchMap[branch];
        
        for (const category of categories) {
          let openingRank, closingRank;
          
          // Set rank ranges based on college and category
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
          
          // CSE and IT have lower ranks (more competitive)
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
        console.error(`Error inserting cutoffs for ${college.name}:`, error.message);
      } else {
        totalCutoffs += cutoffs.length;
        console.log(`Added ${cutoffs.length} cutoff records to ${college.name}`);
      }
    }
  }
  
  console.log(`Total cutoffs added: ${totalCutoffs}`);
}

async function populateAchievements(colleges) {
  console.log('\nPopulating achievements...');
  
  let totalAchievements = 0;
  const years = [2021, 2022, 2023, 2024];
  
  for (const college of colleges) {
    const achievements = [];
    
    // Generate 5-15 achievements per college
    const achievementCount = randomInt(5, 15);
    
    for (let i = 0; i < achievementCount; i++) {
      const categoryType = randomElement(Object.keys(achievementCategories));
      const title = randomElement(achievementCategories[categoryType]);
      const year = randomElement(years);
      
      achievements.push({
        college_id: college.id,
        title: title,
        description: `${college.name} ${title.toLowerCase()} in ${year}`,
        year: year,
        category: categoryType,
        is_extraordinary: Math.random() < 0.2 // 20% chance of being extraordinary
      });
    }
    
    if (achievements.length > 0) {
      const { error } = await supabase.from('achievements').insert(achievements);
      if (error) {
        console.error(`Error inserting achievements for ${college.name}:`, error.message);
      } else {
        totalAchievements += achievements.length;
        console.log(`Added ${achievements.length} achievements to ${college.name}`);
      }
    }
  }
  
  console.log(`Total achievements added: ${totalAchievements}`);
}

async function main() {
  console.log('Starting comprehensive data population...\n');
  
  try {
    // Ensure branches and companies exist
    await ensureBranches();
    await ensureCompanies();
    
    // Get all colleges
    const { data: colleges, error: collegesError } = await supabase
      .from('colleges')
      .select('id, name, college_type')
      .order('name');
    
    if (collegesError) {
      throw new Error(`Failed to fetch colleges: ${collegesError.message}`);
    }
    
    console.log(`Found ${colleges.length} colleges\n`);
    
    // Get branch and company mappings
    const branchMap = await getBranchMap();
    const companyMap = await getCompanyMap();
    
    console.log(`Branches: ${Object.keys(branchMap).length}`);
    console.log(`Companies: ${Object.keys(companyMap).length}\n`);
    
    // Populate all data
    await populateFaculty(colleges, branchMap);
    await populatePlacementStats(colleges, branchMap);
    await populateCutoffs(colleges, branchMap);
    await populateAchievements(colleges);
    
    console.log('\n✅ All data populated successfully!');
    
  } catch (error) {
    console.error('Error:', error.message);
    process.exit(1);
  }
}

main();
