const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

const sampleReviews = [
  {
    review_title: "Excellent Academic Environment and Campus Life",
    review_text: "I had an amazing experience at this college. The faculty members are highly qualified and always willing to help students. The infrastructure is world-class with modern labs and libraries. The placement opportunities are excellent with top companies visiting every year. The campus life is vibrant with various cultural and technical events throughout the year.",
    pros: "Great faculty, excellent placements, beautiful campus, active student clubs",
    cons: "Food in mess could be better, internet connectivity issues sometimes",
    overall_rating: 4.5,
    infrastructure_rating: 5.0,
    academics_rating: 4.5,
    placements_rating: 5.0,
    faculty_rating: 4.5,
    campus_life_rating: 4.0,
    user_type: "alumni",
    graduation_year: 2023,
  },
  {
    review_title: "Good College with Room for Improvement",
    review_text: "Overall it's a decent college with good academic standards. The professors are knowledgeable but some could be more approachable. The campus facilities are adequate but could be modernized. Placements are satisfactory for most branches. There are plenty of extracurricular activities to participate in.",
    pros: "Good academics, peaceful campus, affordable fees, supportive peer group",
    cons: "Limited industry exposure, outdated labs in some departments, slow administrative processes",
    overall_rating: 3.5,
    infrastructure_rating: 3.0,
    academics_rating: 4.0,
    placements_rating: 3.5,
    faculty_rating: 4.0,
    campus_life_rating: 4.0,
    user_type: "current_student",
    graduation_year: 2025,
  },
  {
    review_title: "Best Decision of My Life!",
    review_text: "Joining this institution was the best decision I ever made. The quality of education is outstanding, and the faculty truly cares about student success. Got placed in my dream company with an excellent package. The college has state-of-the-art facilities and a beautiful campus. Made lifelong friends and memories here.",
    pros: "Top-notch education, amazing placements, great infrastructure, wonderful peer group, excellent fests",
    cons: "Strict attendance policy, heavy coursework sometimes",
    overall_rating: 5.0,
    infrastructure_rating: 5.0,
    academics_rating: 5.0,
    placements_rating: 5.0,
    faculty_rating: 5.0,
    campus_life_rating: 5.0,
    user_type: "alumni",
    graduation_year: 2022,
  },
  {
    review_title: "Decent College for Engineering",
    review_text: "It's a good college for pursuing engineering education. The curriculum is well-structured and follows industry standards. Faculty members have good academic backgrounds. The placement cell is active and brings in decent companies. Campus has all basic amenities. The student community is diverse and friendly.",
    pros: "Structured curriculum, experienced faculty, good placement support, diverse student body",
    cons: "Limited research opportunities, needs better sports facilities, hostel food needs improvement",
    overall_rating: 4.0,
    infrastructure_rating: 4.0,
    academics_rating: 4.0,
    placements_rating: 4.0,
    faculty_rating: 4.0,
    campus_life_rating: 3.5,
    user_type: "current_student",
    graduation_year: 2024,
  },
];

const studentNames = [
  "Rahul Sharma", "Priya Singh", "Amit Kumar", "Sneha Patel", 
  "Vikas Gupta", "Anjali Reddy", "Rohan Mehta", "Pooja Verma",
  "Karthik Krishnan", "Divya Iyer", "Arjun Nair", "Kavya Menon",
  "Rajesh Yadav", "Neha Agarwal", "Sanjay Desai", "Ritu Malhotra"
];

async function populateReviews() {
  console.log('📝 Starting to populate sample reviews...\n');

  // Fetch 20 colleges
  const { data: colleges, error: collegesError } = await supabase
    .from('colleges')
    .select('id, name')
    .limit(20);

  if (collegesError || !colleges) {
    console.error('❌ Error fetching colleges:', collegesError);
    return;
  }

  console.log(`Found ${colleges.length} colleges to add reviews for\n`);

  let totalReviews = 0;

  for (const college of colleges) {
    // Add 2-4 reviews per college
    const numReviews = Math.floor(Math.random() * 3) + 2;

    for (let i = 0; i < numReviews; i++) {
      const sampleReview = sampleReviews[Math.floor(Math.random() * sampleReviews.length)];
      const studentName = studentNames[Math.floor(Math.random() * studentNames.length)];

      const review = {
        college_id: college.id,
        user_name: studentName,
        user_email: `${studentName.toLowerCase().replace(' ', '.')}@example.com`,
        ...sampleReview,
        is_approved: true, // Auto-approve sample reviews
        is_verified: Math.random() > 0.5, // 50% verified
        is_featured: Math.random() > 0.8, // 20% featured
        helpful_count: Math.floor(Math.random() * 50),
        not_helpful_count: Math.floor(Math.random() * 5),
      };

      const { error: insertError } = await supabase
        .from('reviews')
        .insert(review);

      if (!insertError) {
        totalReviews++;
      } else {
        console.error(`❌ Error inserting review for ${college.name}:`, insertError.message);
      }
    }

    console.log(`✅ Added reviews for ${college.name}`);
  }

  console.log('\n' + '='.repeat(60));
  console.log(`✅ Successfully added ${totalReviews} sample reviews!`);
  console.log('='.repeat(60));
}

populateReviews()
  .then(() => {
    console.log('\n🎉 Sample reviews populated successfully!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ Failed to populate reviews:', error);
    process.exit(1);
  });
