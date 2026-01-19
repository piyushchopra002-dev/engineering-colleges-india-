-- Extended Seed Data - Additional Top Engineering Colleges
-- Run this AFTER running the main seed-data.sql file

-- Add more IITs
INSERT INTO colleges (name, slug, short_name, description, established_year, location, city, state, pincode, latitude, longitude, website, email, phone, approval_body, affiliation, college_type, logo_url, cover_image_url, male_female_ratio, seat_matrix, fees_breakdown, infrastructure_summary) VALUES
('Indian Institute of Technology Kanpur', 'iit-kanpur', 'IIT Kanpur', 'IIT Kanpur is renowned for its strong academic programs and research excellence in engineering and technology.', 1959, 'Kalyanpur, Kanpur', 'Kanpur', 'Uttar Pradesh', '208016', 26.5123, 80.2329, 'https://www.iitk.ac.in', 'info@iitk.ac.in', '+91-512-2590151', ARRAY['AICTE', 'UGC'], 'Autonomous', 'IIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/8c/Indian_Institute_of_Technology_Kanpur_Logo.svg/200px-Indian_Institute_of_Technology_Kanpur_Logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 66, "female": 34}'::jsonb, '{"CSE": 120, "ECE": 120, "ME": 120, "CE": 60, "EE": 60}'::jsonb, '{"tuition": 200000, "hostel": 50000, "mess": 60000, "total": 310000}'::jsonb, 'Modern campus with excellent research facilities and infrastructure.'),
('Indian Institute of Technology Kharagpur', 'iit-kharagpur', 'IIT Kharagpur', 'IIT Kharagpur is the oldest IIT, known for its comprehensive engineering programs and large campus.', 1951, 'Kharagpur', 'Kharagpur', 'West Bengal', '721302', 22.3149, 87.3105, 'https://www.iitkgp.ac.in', 'info@iitkgp.ac.in', '+91-3222-282005', ARRAY['AICTE', 'UGC'], 'Autonomous', 'IIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/9/9c/Indian_Institute_of_Technology_Kharagpur_Logo.svg/200px-Indian_Institute_of_Technology_Kharagpur_Logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 68, "female": 32}'::jsonb, '{"CSE": 150, "ECE": 150, "ME": 150, "CE": 80, "EE": 80}'::jsonb, '{"tuition": 200000, "hostel": 50000, "mess": 60000, "total": 310000}'::jsonb, 'Sprawling campus with extensive infrastructure and research facilities.'),
('Indian Institute of Technology Roorkee', 'iit-roorkee', 'IIT Roorkee', 'IIT Roorkee has a rich heritage and is known for excellence in engineering education and research.', 1847, 'Roorkee', 'Roorkee', 'Uttarakhand', '247667', 29.8647, 77.8970, 'https://www.iitr.ac.in', 'info@iitr.ac.in', '+91-1332-285311', ARRAY['AICTE', 'UGC'], 'Autonomous', 'IIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/3/3c/Indian_Institute_of_Technology_Roorkee_Logo.svg/200px-Indian_Institute_of_Technology_Roorkee_Logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 67, "female": 33}'::jsonb, '{"CSE": 120, "ECE": 120, "ME": 120, "CE": 60, "EE": 60}'::jsonb, '{"tuition": 200000, "hostel": 50000, "mess": 60000, "total": 310000}'::jsonb, 'Historic campus with modern facilities and excellent infrastructure.'),
('Indian Institute of Technology Guwahati', 'iit-guwahati', 'IIT Guwahati', 'IIT Guwahati is a premier institute in Northeast India, known for its scenic campus and academic excellence.', 1994, 'Amingaon, North Guwahati', 'Guwahati', 'Assam', '781039', 26.1879, 91.6919, 'https://www.iitg.ac.in', 'info@iitg.ac.in', '+91-361-2583000', ARRAY['AICTE', 'UGC'], 'Autonomous', 'IIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/8d/Indian_Institute_of_Technology_Guwahati_Logo.svg/200px-Indian_Institute_of_Technology_Guwahati_Logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 65, "female": 35}'::jsonb, '{"CSE": 120, "ECE": 120, "ME": 120, "CE": 60, "EE": 60}'::jsonb, '{"tuition": 200000, "hostel": 50000, "mess": 60000, "total": 310000}'::jsonb, 'Beautiful campus with state-of-the-art facilities.'),
('Indian Institute of Technology Hyderabad', 'iit-hyderabad', 'IIT Hyderabad', 'IIT Hyderabad is known for its innovative curriculum and strong industry-academia collaboration.', 2008, 'Kandi, Sangareddy', 'Hyderabad', 'Telangana', '502285', 17.5932, 78.1269, 'https://www.iith.ac.in', 'info@iith.ac.in', '+91-40-23016032', ARRAY['AICTE', 'UGC'], 'Autonomous', 'IIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/0/0a/Indian_Institute_of_Technology_Hyderabad_Logo.svg/200px-Indian_Institute_of_Technology_Hyderabad_Logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 64, "female": 36}'::jsonb, '{"CSE": 100, "ECE": 100, "ME": 100, "CE": 50, "EE": 50}'::jsonb, '{"tuition": 200000, "hostel": 50000, "mess": 60000, "total": 310000}'::jsonb, 'Modern campus with excellent infrastructure and research facilities.'),
('Indian Institute of Technology Bangalore', 'iit-bangalore', 'IIT Bangalore', 'IIT Bangalore is a new IIT with focus on innovation and entrepreneurship in engineering.', 2016, 'Yelahanka, Bangalore', 'Bangalore', 'Karnataka', '560064', 13.0827, 77.5806, 'https://www.iitb.ac.in', 'info@iitb.ac.in', '+91-80-22933000', ARRAY['AICTE', 'UGC'], 'Autonomous', 'IIT', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 65, "female": 35}'::jsonb, '{"CSE": 100, "ECE": 100, "ME": 100, "CE": 50, "EE": 50}'::jsonb, '{"tuition": 200000, "hostel": 50000, "mess": 60000, "total": 310000}'::jsonb, 'State-of-the-art campus with modern facilities.'),
('National Institute of Technology Surathkal', 'nit-surathkal', 'NIT Surathkal', 'NIT Surathkal is one of the top NITs, located on a beautiful beach campus in Karnataka.', 1960, 'Surathkal, Mangalore', 'Mangalore', 'Karnataka', '575025', 12.9716, 74.7831, 'https://www.nitk.ac.in', 'info@nitk.ac.in', '+91-824-2474000', ARRAY['AICTE', 'UGC'], 'Autonomous', 'NIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/4/4f/National_Institute_of_Technology_Karnataka_Logo.svg/200px-National_Institute_of_Technology_Karnataka_Logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 70, "female": 30}'::jsonb, '{"CSE": 120, "ECE": 120, "ME": 120, "CE": 60, "EE": 60}'::jsonb, '{"tuition": 125000, "hostel": 40000, "mess": 50000, "total": 215000}'::jsonb, 'Scenic beach campus with excellent infrastructure.'),
('National Institute of Technology Warangal', 'nit-warangal', 'NIT Warangal', 'NIT Warangal is one of the oldest NITs, known for strong placements and academic programs.', 1959, 'Warangal', 'Warangal', 'Telangana', '506004', 17.9689, 79.5941, 'https://www.nitw.ac.in', 'info@nitw.ac.in', '+91-870-2459191', ARRAY['AICTE', 'UGC'], 'Autonomous', 'NIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/5/5e/National_Institute_of_Technology_Warangal_Logo.svg/200px-National_Institute_of_Technology_Warangal_Logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 70, "female": 30}'::jsonb, '{"CSE": 120, "ECE": 120, "ME": 120, "CE": 60, "EE": 60}'::jsonb, '{"tuition": 125000, "hostel": 40000, "mess": 50000, "total": 215000}'::jsonb, 'Well-established campus with modern facilities.'),
('National Institute of Technology Calicut', 'nit-calicut', 'NIT Calicut', 'NIT Calicut is a premier NIT in Kerala, known for excellent academics and placements.', 1961, 'Kattangal, Calicut', 'Calicut', 'Kerala', '673601', 11.3204, 75.9349, 'https://www.nitc.ac.in', 'info@nitc.ac.in', '+91-495-2286100', ARRAY['AICTE', 'UGC'], 'Autonomous', 'NIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/6/6e/National_Institute_of_Technology_Calicut_Logo.svg/200px-National_Institute_of_Technology_Calicut_Logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 70, "female": 30}'::jsonb, '{"CSE": 120, "ECE": 120, "ME": 120, "CE": 60, "EE": 60}'::jsonb, '{"tuition": 125000, "hostel": 40000, "mess": 50000, "total": 215000}'::jsonb, 'Beautiful campus with excellent infrastructure.'),
('Delhi Technological University', 'dtu-delhi', 'DTU Delhi', 'DTU Delhi is a premier state university known for strong industry connections and placements.', 1941, 'Shahbad Daulatpur, Delhi', 'New Delhi', 'Delhi', '110042', 28.7503, 77.1177, 'https://www.dtu.ac.in', 'info@dtu.ac.in', '+91-11-27871018', ARRAY['AICTE', 'UGC'], 'State University', 'Government', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/8f/Delhi_Technological_University_logo.svg/200px-Delhi_Technological_University_logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 68, "female": 32}'::jsonb, '{"CSE": 300, "ECE": 200, "ME": 200, "CE": 100, "EE": 100}'::jsonb, '{"tuition": 150000, "hostel": 45000, "mess": 55000, "total": 250000}'::jsonb, 'Modern campus with excellent facilities.'),
('Netaji Subhas University of Technology', 'nsut-delhi', 'NSUT Delhi', 'NSUT Delhi is a leading engineering university in Delhi with strong academic programs.', 1983, 'Sector 3, Dwarka, Delhi', 'New Delhi', 'Delhi', '110078', 28.6100, 77.0430, 'https://www.nsut.ac.in', 'info@nsut.ac.in', '+91-11-25099000', ARRAY['AICTE', 'UGC'], 'State University', 'Government', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 68, "female": 32}'::jsonb, '{"CSE": 250, "ECE": 180, "ME": 180, "CE": 90, "EE": 90}'::jsonb, '{"tuition": 150000, "hostel": 45000, "mess": 55000, "total": 250000}'::jsonb, 'Well-equipped campus with modern infrastructure.'),
('Manipal Institute of Technology', 'mit-manipal', 'MIT Manipal', 'MIT Manipal is a leading private engineering institute known for excellent infrastructure and placements.', 1957, 'Manipal', 'Manipal', 'Karnataka', '576104', 13.3470, 74.7880, 'https://manipal.edu/mit.html', 'info@manipal.edu', '+91-820-2571201', ARRAY['AICTE', 'UGC'], 'Deemed University', 'Private', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 62, "female": 38}'::jsonb, '{"CSE": 400, "ECE": 250, "ME": 250, "CE": 150, "EE": 150}'::jsonb, '{"tuition": 320000, "hostel": 75000, "mess": 65000, "total": 460000}'::jsonb, 'World-class campus with excellent facilities.'),
('SRM Institute of Science and Technology', 'srm-chennai', 'SRM Chennai', 'SRM Chennai is a leading private engineering institute with strong industry partnerships.', 1985, 'Kattankulathur, Chennai', 'Chennai', 'Tamil Nadu', '603203', 12.8222, 80.0444, 'https://www.srmist.edu.in', 'info@srmist.edu.in', '+91-44-27417000', ARRAY['AICTE', 'UGC'], 'Deemed University', 'Private', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 60, "female": 40}'::jsonb, '{"CSE": 500, "ECE": 300, "ME": 300, "CE": 200, "EE": 200}'::jsonb, '{"tuition": 300000, "hostel": 70000, "mess": 60000, "total": 430000}'::jsonb, 'Sprawling campus with modern infrastructure.'),
('Thapar Institute of Engineering and Technology', 'thapar-patiala', 'Thapar Patiala', 'Thapar Patiala is a premier private engineering institute known for strong placements and academics.', 1956, 'Patiala', 'Patiala', 'Punjab', '147004', 30.3398, 76.3869, 'https://www.thapar.edu', 'info@thapar.edu', '+91-175-2393021', ARRAY['AICTE', 'UGC'], 'Deemed University', 'Private', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 65, "female": 35}'::jsonb, '{"CSE": 300, "ECE": 200, "ME": 200, "CE": 120, "EE": 120}'::jsonb, '{"tuition": 280000, "hostel": 65000, "mess": 60000, "total": 405000}'::jsonb, 'Well-established campus with excellent facilities.')
ON CONFLICT (slug) DO NOTHING;

-- Link new colleges to branches and add data
DO $$
DECLARE
    iit_kanpur_id UUID;
    iit_kharagpur_id UUID;
    iit_roorkee_id UUID;
    iit_guwahati_id UUID;
    iit_hyderabad_id UUID;
    iit_bangalore_id UUID;
    nit_surathkal_id UUID;
    nit_warangal_id UUID;
    nit_calicut_id UUID;
    dtu_id UUID;
    nsut_id UUID;
    mit_id UUID;
    srm_id UUID;
    thapar_id UUID;
    cse_id UUID;
    ece_id UUID;
    me_id UUID;
    ce_id UUID;
    ee_id UUID;
BEGIN
    -- Get college IDs
    SELECT id INTO iit_kanpur_id FROM colleges WHERE slug = 'iit-kanpur';
    SELECT id INTO iit_kharagpur_id FROM colleges WHERE slug = 'iit-kharagpur';
    SELECT id INTO iit_roorkee_id FROM colleges WHERE slug = 'iit-roorkee';
    SELECT id INTO iit_guwahati_id FROM colleges WHERE slug = 'iit-guwahati';
    SELECT id INTO iit_hyderabad_id FROM colleges WHERE slug = 'iit-hyderabad';
    SELECT id INTO iit_bangalore_id FROM colleges WHERE slug = 'iit-bangalore';
    SELECT id INTO nit_surathkal_id FROM colleges WHERE slug = 'nit-surathkal';
    SELECT id INTO nit_warangal_id FROM colleges WHERE slug = 'nit-warangal';
    SELECT id INTO nit_calicut_id FROM colleges WHERE slug = 'nit-calicut';
    SELECT id INTO dtu_id FROM colleges WHERE slug = 'dtu-delhi';
    SELECT id INTO nsut_id FROM colleges WHERE slug = 'nsut-delhi';
    SELECT id INTO mit_id FROM colleges WHERE slug = 'mit-manipal';
    SELECT id INTO srm_id FROM colleges WHERE slug = 'srm-chennai';
    SELECT id INTO thapar_id FROM colleges WHERE slug = 'thapar-patiala';
    
    -- Get branch IDs
    SELECT id INTO cse_id FROM branches WHERE slug = 'cse';
    SELECT id INTO ece_id FROM branches WHERE slug = 'ece';
    SELECT id INTO me_id FROM branches WHERE slug = 'me';
    SELECT id INTO ce_id FROM branches WHERE slug = 'ce';
    SELECT id INTO ee_id FROM branches WHERE slug = 'ee';
    
    -- Link colleges to branches
    INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
    (iit_kanpur_id, cse_id, 120, 120), (iit_kanpur_id, ece_id, 120, 120), (iit_kanpur_id, me_id, 120, 120), (iit_kanpur_id, ce_id, 60, 60), (iit_kanpur_id, ee_id, 60, 60),
    (iit_kharagpur_id, cse_id, 150, 150), (iit_kharagpur_id, ece_id, 150, 150), (iit_kharagpur_id, me_id, 150, 150), (iit_kharagpur_id, ce_id, 80, 80), (iit_kharagpur_id, ee_id, 80, 80),
    (iit_roorkee_id, cse_id, 120, 120), (iit_roorkee_id, ece_id, 120, 120), (iit_roorkee_id, me_id, 120, 120), (iit_roorkee_id, ce_id, 60, 60), (iit_roorkee_id, ee_id, 60, 60),
    (iit_guwahati_id, cse_id, 120, 120), (iit_guwahati_id, ece_id, 120, 120), (iit_guwahati_id, me_id, 120, 120), (iit_guwahati_id, ce_id, 60, 60), (iit_guwahati_id, ee_id, 60, 60),
    (iit_hyderabad_id, cse_id, 100, 100), (iit_hyderabad_id, ece_id, 100, 100), (iit_hyderabad_id, me_id, 100, 100), (iit_hyderabad_id, ce_id, 50, 50), (iit_hyderabad_id, ee_id, 50, 50),
    (iit_bangalore_id, cse_id, 100, 100), (iit_bangalore_id, ece_id, 100, 100), (iit_bangalore_id, me_id, 100, 100), (iit_bangalore_id, ce_id, 50, 50), (iit_bangalore_id, ee_id, 50, 50),
    (nit_surathkal_id, cse_id, 120, 120), (nit_surathkal_id, ece_id, 120, 120), (nit_surathkal_id, me_id, 120, 120), (nit_surathkal_id, ce_id, 60, 60), (nit_surathkal_id, ee_id, 60, 60),
    (nit_warangal_id, cse_id, 120, 120), (nit_warangal_id, ece_id, 120, 120), (nit_warangal_id, me_id, 120, 120), (nit_warangal_id, ce_id, 60, 60), (nit_warangal_id, ee_id, 60, 60),
    (nit_calicut_id, cse_id, 120, 120), (nit_calicut_id, ece_id, 120, 120), (nit_calicut_id, me_id, 120, 120), (nit_calicut_id, ce_id, 60, 60), (nit_calicut_id, ee_id, 60, 60),
    (dtu_id, cse_id, 300, 300), (dtu_id, ece_id, 200, 200), (dtu_id, me_id, 200, 200), (dtu_id, ce_id, 100, 100), (dtu_id, ee_id, 100, 100),
    (nsut_id, cse_id, 250, 250), (nsut_id, ece_id, 180, 180), (nsut_id, me_id, 180, 180), (nsut_id, ce_id, 90, 90), (nsut_id, ee_id, 90, 90),
    (mit_id, cse_id, 400, 400), (mit_id, ece_id, 250, 250), (mit_id, me_id, 250, 250), (mit_id, ce_id, 150, 150), (mit_id, ee_id, 150, 150),
    (srm_id, cse_id, 500, 500), (srm_id, ece_id, 300, 300), (srm_id, me_id, 300, 300), (srm_id, ce_id, 200, 200), (srm_id, ee_id, 200, 200),
    (thapar_id, cse_id, 300, 300), (thapar_id, ece_id, 200, 200), (thapar_id, me_id, 200, 200), (thapar_id, ce_id, 120, 120), (thapar_id, ee_id, 120, 120)
    ON CONFLICT DO NOTHING;
    
    -- Add rankings
    INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
    (iit_kanpur_id, 'NIRF', 2023, 4, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (iit_kharagpur_id, 'NIRF', 2023, 5, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (iit_roorkee_id, 'NIRF', 2023, 6, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (iit_guwahati_id, 'NIRF', 2023, 7, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (iit_hyderabad_id, 'NIRF', 2023, 8, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (nit_surathkal_id, 'NIRF', 2023, 10, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (nit_warangal_id, 'NIRF', 2023, 11, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (nit_calicut_id, 'NIRF', 2023, 13, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (dtu_id, 'NIRF', 2023, 15, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (nsut_id, 'NIRF', 2023, 18, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (mit_id, 'NIRF', 2023, 20, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (srm_id, 'NIRF', 2023, 22, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (thapar_id, 'NIRF', 2023, 24, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
    ON CONFLICT DO NOTHING;
    
    -- Add placement stats
    INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
    (iit_kanpur_id, cse_id, 2023, 120, 117, 97.50, 2400000, 2300000, 11000000, 12),
    (iit_kharagpur_id, cse_id, 2023, 150, 146, 97.33, 2350000, 2250000, 10500000, 10),
    (iit_roorkee_id, cse_id, 2023, 120, 116, 96.67, 2300000, 2200000, 10000000, 8),
    (iit_guwahati_id, cse_id, 2023, 120, 115, 95.83, 2200000, 2100000, 9500000, 6),
    (iit_hyderabad_id, cse_id, 2023, 100, 97, 97.00, 2250000, 2150000, 9800000, 7),
    (nit_surathkal_id, cse_id, 2023, 120, 114, 95.00, 1750000, 1650000, 4200000, 2),
    (nit_warangal_id, cse_id, 2023, 120, 113, 94.17, 1700000, 1600000, 4000000, 2),
    (nit_calicut_id, cse_id, 2023, 120, 112, 93.33, 1650000, 1550000, 3800000, 1),
    (dtu_id, cse_id, 2023, 300, 285, 95.00, 1500000, 1400000, 3500000, 1),
    (nsut_id, cse_id, 2023, 250, 235, 94.00, 1450000, 1350000, 3300000, 1),
    (mit_id, cse_id, 2023, 400, 375, 93.75, 1300000, 1200000, 3200000, 1),
    (srm_id, cse_id, 2023, 500, 460, 92.00, 1200000, 1100000, 3000000, 0),
    (thapar_id, cse_id, 2023, 300, 280, 93.33, 1400000, 1300000, 3400000, 1)
    ON CONFLICT DO NOTHING;
    
    -- Add cutoffs
    INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
    (iit_kanpur_id, cse_id, 'JEE Advanced', 2023, 1, 75, 'General', 'https://jeeadv.ac.in'),
    (iit_kharagpur_id, cse_id, 'JEE Advanced', 2023, 1, 85, 'General', 'https://jeeadv.ac.in'),
    (iit_roorkee_id, cse_id, 'JEE Advanced', 2023, 1, 90, 'General', 'https://jeeadv.ac.in'),
    (iit_guwahati_id, cse_id, 'JEE Advanced', 2023, 1, 95, 'General', 'https://jeeadv.ac.in'),
    (iit_hyderabad_id, cse_id, 'JEE Advanced', 2023, 1, 100, 'General', 'https://jeeadv.ac.in'),
    (nit_surathkal_id, cse_id, 'JEE Main', 2023, 1500, 3000, 'General', 'https://jeemain.nta.ac.in'),
    (nit_warangal_id, cse_id, 'JEE Main', 2023, 1800, 3500, 'General', 'https://jeemain.nta.ac.in'),
    (nit_calicut_id, cse_id, 'JEE Main', 2023, 2000, 4000, 'General', 'https://jeemain.nta.ac.in'),
    (dtu_id, cse_id, 'JEE Main', 2023, 3000, 6000, 'General', 'https://jeemain.nta.ac.in'),
    (nsut_id, cse_id, 'JEE Main', 2023, 3500, 7000, 'General', 'https://jeemain.nta.ac.in'),
    (mit_id, cse_id, 'MET', 2023, 5000, 20000, 'General', 'https://manipal.edu'),
    (srm_id, cse_id, 'SRMJEE', 2023, 8000, 30000, 'General', 'https://srmist.edu.in'),
    (thapar_id, cse_id, 'JEE Main', 2023, 5000, 12000, 'General', 'https://jeemain.nta.ac.in')
    ON CONFLICT DO NOTHING;
END $$;

COMMIT;
