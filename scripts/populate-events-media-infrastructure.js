const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

// Event names by type
const culturalEvents = [
  { name: "TechFest", desc: "Annual technical and cultural festival with celebrity performances, competitions, and exhibitions" },
  { name: "SpringFest", desc: "Spring cultural festival featuring music, dance, drama, and literary events" },
  { name: "Mood Indigo", desc: "Asia's largest college cultural festival with performances, competitions, and workshops" },
  { name: "Alcheringa", desc: "Cultural extravaganza with celebrity nights, competitions, and cultural showcases" },
  { name: "Saarang", desc: "Annual social and cultural festival celebrating arts, music, and entertainment" },
  { name: "Waves", desc: "Cultural festival featuring performances, competitions, and celebrity appearances" },
  { name: "Rendezvous", desc: "Annual cultural festival with music, dance, fashion shows, and literary events" },
  { name: "Antaragni", desc: "Cultural festival showcasing student talent in performing arts and competitions" },
];

const technicalEvents = [
  { name: "Techkriti", desc: "Technical festival with robotics competitions, hackathons, and tech talks" },
  { name: "Shaastra", desc: "Technical festival featuring competitions, exhibitions, and guest lectures" },
  { name: "Cognizance", desc: "Technical extravaganza with coding competitions, workshops, and tech exhibitions" },
  { name: "E-Summit", desc: "Entrepreneurship summit with startup competitions, investor meetings, and talks" },
  { name: "Hackathon", desc: "48-hour coding marathon with innovative problem-solving challenges" },
  { name: "Robotics Challenge", desc: "Robotics competition featuring autonomous robots and engineering challenges" },
  { name: "Code Sprint", desc: "Competitive programming event with algorithmic challenges and prizes" },
  { name: "Tech Symposium", desc: "Technical symposium with paper presentations, workshops, and industry talks" },
];

const sportsEvents = [
  { name: "Inter-College Sports Meet", desc: "Annual sports competition featuring athletics, cricket, football, and other sports" },
  { name: "Cricket Tournament", desc: "Inter-college cricket championship with teams from various institutions" },
  { name: "Basketball League", desc: "Basketball tournament with competitive matches and championships" },
  { name: "Athletics Championship", desc: "Track and field events including running, jumping, and throwing competitions" },
  { name: "Football Cup", desc: "Inter-college football tournament with knockout and league formats" },
  { name: "Badminton Championship", desc: "Singles and doubles badminton competition" },
];

// YouTube video templates
const videoTemplates = [
  { type: "infrastructure", title: "Campus Tour 2024", desc: "Complete walkthrough of college campus facilities" },
  { type: "placements", title: "Placement Season Highlights", desc: "Success stories from recent placement season" },
  { type: "events", title: "Annual Fest Highlights", desc: "Best moments from annual cultural festival" },
  { type: "campus_life", title: "A Day in the Life", desc: "Student life and daily campus activities" },
  { type: "academics", title: "Department Overview", desc: "Academic facilities and teaching methodology" },
];

// Infrastructure categories
const infrastructureData = [
  { category: "Laboratories", name: "Computer Science Lab", desc: "State-of-the-art computer lab with 100+ systems", capacity: 120 },
  { category: "Laboratories", name: "Electronics Lab", desc: "Well-equipped electronics and circuits lab", capacity: 80 },
  { category: "Laboratories", name: "Mechanical Workshop", desc: "Modern workshop with CNC machines and tools", capacity: 60 },
  { category: "Laboratories", name: "Physics Lab", desc: "Advanced physics laboratory with modern equipment", capacity: 50 },
  { category: "Laboratories", name: "Chemistry Lab", desc: "Fully equipped chemistry lab with safety measures", capacity: 50 },
  { category: "Hostels", name: "Boys Hostel", desc: "Comfortable accommodation with modern amenities", capacity: 500 },
  { category: "Hostels", name: "Girls Hostel", desc: "Safe and secure hostel with all facilities", capacity: 300 },
  { category: "Sports", name: "Sports Complex", desc: "Multi-sport facility with indoor and outdoor games", capacity: 200 },
  { category: "Sports", name: "Gymnasium", desc: "Modern gym with latest equipment and trainers", capacity: 100 },
  { category: "Sports", name: "Swimming Pool", desc: "Olympic-size swimming pool with training facility", capacity: 50 },
  { category: "Academic", name: "Central Library", desc: "Digital library with 100,000+ books and journals" },
  { category: "Academic", name: "Auditorium", desc: "Modern auditorium with seating capacity and AV systems", capacity: 1000 },
  { category: "Academic", name: "Seminar Halls", desc: "Air-conditioned seminar halls with projectors", capacity: 100 },
  { category: "Facilities", name: "Cafeteria", desc: "Multi-cuisine cafeteria with hygienic food", capacity: 500 },
  { category: "Facilities", name: "Medical Center", desc: "24x7 medical facility with qualified doctors" },
  { category: "Facilities", name: "Wi-Fi Campus", desc: "High-speed internet connectivity across campus" },
];

async function populateEventsMediaInfrastructure() {
  console.log('Starting to populate Events, Media, and Infrastructure data...\n');

  // Fetch all colleges
  const { data: colleges, error: collegesError } = await supabase
    .from('colleges')
    .select('id, name, slug, institution_category');

  if (collegesError || !colleges) {
    console.error('Error fetching colleges:', collegesError);
    return;
  }

  console.log(`Found ${colleges.length} colleges\n`);

  for (const college of colleges) {
    console.log(`Processing ${college.name}...`);

    try {
      // 1. POPULATE EVENTS
      const events = [];
      const years = [2021, 2022, 2023, 2024];

      // Add cultural events
      const culturalEvent = culturalEvents[Math.floor(Math.random() * culturalEvents.length)];
      years.forEach((year, idx) => {
        if (idx < 2) { // Add 2 cultural events
          const event = culturalEvents[idx % culturalEvents.length];
          events.push({
            college_id: college.id,
            name: event.name,
            slug: `${event.name.toLowerCase().replace(/\s+/g, '-')}-${year}`,
            event_type: 'cultural',
            description: event.desc,
            year: year,
            start_date: `${year}-02-15`,
            end_date: `${year}-02-18`,
            images: [],
            celebrity_performances: year >= 2023 ? ['Popular Band', 'Stand-up Comedian'] : []
          });
        }
      });

      // Add technical events
      years.forEach((year, idx) => {
        if (idx < 2) { // Add 2 technical events
          const event = technicalEvents[idx % technicalEvents.length];
          events.push({
            college_id: college.id,
            name: event.name,
            slug: `${event.name.toLowerCase().replace(/\s+/g, '-')}-${year}`,
            event_type: 'technical',
            description: event.desc,
            year: year,
            start_date: `${year}-03-10`,
            end_date: `${year}-03-12`,
            images: []
          });
        }
      });

      // Add sports events
      const sportsEvent = sportsEvents[Math.floor(Math.random() * sportsEvents.length)];
      events.push({
        college_id: college.id,
        name: sportsEvent.name,
        slug: `${sportsEvent.name.toLowerCase().replace(/\s+/g, '-')}-2024`,
        event_type: 'sports',
        description: sportsEvent.desc,
        year: 2024,
        start_date: '2024-01-20',
        end_date: '2024-01-25',
        images: []
      });

      // Insert events
      const { error: eventsError } = await supabase
        .from('events')
        .insert(events);

      if (eventsError) {
        console.error(`  ❌ Error inserting events:`, eventsError.message);
      } else {
        console.log(`  ✅ Added ${events.length} events`);
      }

      // 2. POPULATE MEDIA
      const media = [];

      // Add YouTube videos
      videoTemplates.forEach((template, idx) => {
        media.push({
          college_id: college.id,
          platform: 'youtube',
          media_type: template.type,
          title: `${college.name} - ${template.title}`,
          description: template.desc,
          url: `https://www.youtube.com/watch?v=dQw4w9WgXcQ`, // Placeholder
          embed_id: `video${idx + 1}`,
          channel_name: `${college.name} Official`,
          is_verified: true,
          upload_date: `2024-0${(idx % 9) + 1}-15`
        });
      });

      // Insert media
      const { error: mediaError } = await supabase
        .from('media')
        .insert(media);

      if (mediaError && !mediaError.message.includes('duplicate')) {
        console.error(`  ❌ Error inserting media:`, mediaError.message);
      } else {
        console.log(`  ✅ Added ${media.length} media items`);
      }

      // 3. POPULATE INFRASTRUCTURE
      const infrastructure = [];

      // Add infrastructure based on college type
      const isElite = ['IIT', 'NIT', 'IIIT'].includes(college.institution_category);
      const infraCount = isElite ? infrastructureData.length : Math.floor(infrastructureData.length * 0.7);

      infrastructureData.slice(0, infraCount).forEach((infra) => {
        infrastructure.push({
          college_id: college.id,
          category: infra.category,
          name: infra.name,
          description: infra.desc,
          capacity: infra.capacity || null,
          details: isElite ? { quality: 'excellent', maintenance: 'regular' } : { quality: 'good' }
        });
      });

      // Insert infrastructure
      const { error: infraError } = await supabase
        .from('infrastructure')
        .insert(infrastructure);

      if (infraError && !infraError.message.includes('duplicate')) {
        console.error(`  ❌ Error inserting infrastructure:`, infraError.message);
      } else {
        console.log(`  ✅ Added ${infrastructure.length} infrastructure items`);
      }

      console.log('');

    } catch (error) {
      console.error(`  ❌ Error processing ${college.name}:`, error.message);
    }
  }

  console.log('\n✅ Completed populating Events, Media, and Infrastructure data!');
}

// Run the script
populateEventsMediaInfrastructure()
  .then(() => {
    console.log('\n🎉 Script completed successfully!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ Script failed:', error);
    process.exit(1);
  });
