-- Seed data for Best Engineering Colleges Platform
-- This script adds sample colleges, branches, rankings, faculty, and other data

-- First, insert some branches
INSERT INTO branches (name, full_name, slug, description) VALUES
('CSE', 'Computer Science and Engineering', 'cse', 'Computer Science and Engineering focuses on software development, algorithms, and computer systems'),
('ECE', 'Electronics and Communication Engineering', 'ece', 'Electronics and Communication Engineering deals with electronic devices and communication systems'),
('ME', 'Mechanical Engineering', 'me', 'Mechanical Engineering involves design, manufacturing, and maintenance of mechanical systems'),
('CE', 'Civil Engineering', 'ce', 'Civil Engineering focuses on infrastructure, construction, and structural design'),
('EE', 'Electrical Engineering', 'ee', 'Electrical Engineering deals with electrical systems, power generation, and electronics'),
('IT', 'Information Technology', 'it', 'Information Technology focuses on information systems and software applications'),
('CS', 'Computer Science', 'cs', 'Computer Science emphasizes theoretical foundations and programming'),
('EEE', 'Electrical and Electronics Engineering', 'eee', 'Combined study of electrical and electronics engineering')
ON CONFLICT (name) DO NOTHING;

-- Insert sample companies
INSERT INTO companies (name, slug, logo_url, linkedin_url, website, description) VALUES
('Google', 'google', 'https://logo.clearbit.com/google.com', 'https://www.linkedin.com/company/google', 'https://www.google.com', 'Technology company specializing in internet-related services'),
('Microsoft', 'microsoft', 'https://logo.clearbit.com/microsoft.com', 'https://www.linkedin.com/company/microsoft', 'https://www.microsoft.com', 'Multinational technology corporation'),
('Amazon', 'amazon', 'https://logo.clearbit.com/amazon.com', 'https://www.linkedin.com/company/amazon', 'https://www.amazon.com', 'E-commerce and cloud computing company'),
('Apple', 'apple', 'https://logo.clearbit.com/apple.com', 'https://www.linkedin.com/company/apple', 'https://www.apple.com', 'Technology company known for consumer electronics'),
('Meta', 'meta', 'https://logo.clearbit.com/meta.com', 'https://www.linkedin.com/company/meta', 'https://www.meta.com', 'Social media and technology company'),
('Adobe', 'adobe', 'https://logo.clearbit.com/adobe.com', 'https://www.linkedin.com/company/adobe', 'https://www.adobe.com', 'Software company specializing in creative tools'),
('Goldman Sachs', 'goldman-sachs', 'https://logo.clearbit.com/goldmansachs.com', 'https://www.linkedin.com/company/goldman-sachs', 'https://www.goldmansachs.com', 'Investment banking and financial services'),
('JP Morgan', 'jp-morgan', 'https://logo.clearbit.com/jpmorgan.com', 'https://www.linkedin.com/company/jpmorgan', 'https://www.jpmorgan.com', 'Financial services and investment banking'),
('TCS', 'tcs', 'https://logo.clearbit.com/tcs.com', 'https://www.linkedin.com/company/tata-consultancy-services', 'https://www.tcs.com', 'Tata Consultancy Services - IT services and consulting'),
('Infosys', 'infosys', 'https://logo.clearbit.com/infosys.com', 'https://www.linkedin.com/company/infosys', 'https://www.infosys.com', 'Indian multinational information technology company'),
('Wipro', 'wipro', 'https://logo.clearbit.com/wipro.com', 'https://www.linkedin.com/company/wipro', 'https://www.wipro.com', 'Indian multinational corporation providing IT services'),
('Flipkart', 'flipkart', 'https://logo.clearbit.com/flipkart.com', 'https://www.linkedin.com/company/flipkart', 'https://www.flipkart.com', 'Indian e-commerce company')
ON CONFLICT (name) DO NOTHING;

-- Insert sample colleges
INSERT INTO colleges (name, slug, short_name, description, established_year, location, city, state, pincode, latitude, longitude, website, email, phone, approval_body, affiliation, college_type, logo_url, cover_image_url, male_female_ratio, seat_matrix, fees_breakdown, infrastructure_summary) VALUES
('Indian Institute of Technology Bombay', 'iit-bombay', 'IIT Bombay', 'IIT Bombay is one of the premier engineering institutes in India, known for excellence in research and education.', 1958, 'Powai, Mumbai', 'Mumbai', 'Maharashtra', '400076', 19.1334, 72.9137, 'https://www.iitb.ac.in', 'info@iitb.ac.in', '+91-22-25722545', ARRAY['AICTE', 'UGC'], 'Autonomous', 'IIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/4/4a/Indian_Institute_of_Technology_Bombay_Logo.svg/200px-Indian_Institute_of_Technology_Bombay_Logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 65, "female": 35}'::jsonb, '{"CSE": 120, "ECE": 120, "ME": 120, "CE": 60, "EE": 60}'::jsonb, '{"tuition": 200000, "hostel": 50000, "mess": 60000, "total": 310000}'::jsonb, 'State-of-the-art infrastructure with modern labs, libraries, hostels, and sports facilities.'),
('Indian Institute of Technology Delhi', 'iit-delhi', 'IIT Delhi', 'IIT Delhi is a premier engineering institute located in the capital city, known for its strong industry connections.', 1961, 'Hauz Khas, New Delhi', 'New Delhi', 'Delhi', '110016', 28.5448, 77.1927, 'https://home.iitd.ac.in', 'info@iitd.ac.in', '+91-11-26591753', ARRAY['AICTE', 'UGC'], 'Autonomous', 'IIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/5/5c/Indian_Institute_of_Technology_Delhi_Logo.svg/200px-Indian_Institute_of_Technology_Delhi_Logo.svg.png', 'https://images.unsplash.com/photo-1562774053-701939374585?w=1200', '{"male": 68, "female": 32}'::jsonb, '{"CSE": 120, "ECE": 120, "ME": 120, "CE": 60, "EE": 60}'::jsonb, '{"tuition": 200000, "hostel": 55000, "mess": 65000, "total": 320000}'::jsonb, 'Modern campus with excellent infrastructure, research facilities, and student amenities.'),
('National Institute of Technology Trichy', 'nit-trichy', 'NIT Trichy', 'NIT Trichy is one of the top NITs in India, known for excellent placements and academic programs.', 1964, 'Tanjore Main Road, Tiruchirappalli', 'Tiruchirappalli', 'Tamil Nadu', '620015', 10.7905, 78.7047, 'https://www.nitt.edu', 'admin@nitt.edu', '+91-431-2503001', ARRAY['AICTE', 'UGC'], 'Autonomous', 'NIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/8a/National_Institute_of_Technology%2C_Tiruchirappalli_logo.svg/200px-National_Institute_of_Technology%2C_Tiruchirappalli_logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 70, "female": 30}'::jsonb, '{"CSE": 120, "ECE": 120, "ME": 120, "CE": 60, "EE": 60}'::jsonb, '{"tuition": 125000, "hostel": 40000, "mess": 50000, "total": 215000}'::jsonb, 'Well-equipped campus with modern laboratories, library, hostels, and recreational facilities.'),
('Vellore Institute of Technology', 'vit-vellore', 'VIT Vellore', 'VIT Vellore is a leading private engineering institute known for its industry-oriented curriculum and placements.', 1984, 'Vellore', 'Vellore', 'Tamil Nadu', '632014', 12.9698, 79.1559, 'https://vit.ac.in', 'info@vit.ac.in', '+91-416-2243095', ARRAY['AICTE', 'UGC'], 'Deemed University', 'Private', 'https://upload.wikimedia.org/wikipedia/en/thumb/4/49/Vellore_Institute_of_Technology_logo.svg/200px-Vellore_Institute_of_Technology_logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 60, "female": 40}'::jsonb, '{"CSE": 600, "ECE": 300, "ME": 300, "CE": 180, "EE": 180}'::jsonb, '{"tuition": 350000, "hostel": 80000, "mess": 70000, "total": 500000}'::jsonb, 'Sprawling campus with world-class infrastructure, smart classrooms, and excellent facilities.'),
('Birla Institute of Technology and Science Pilani', 'bits-pilani', 'BITS Pilani', 'BITS Pilani is a premier private engineering institute known for its innovative curriculum and strong industry ties.', 1964, 'Pilani', 'Pilani', 'Rajasthan', '333031', 28.3670, 75.5880, 'https://www.bits-pilani.ac.in', 'info@pilani.bits-pilani.ac.in', '+91-1596-242210', ARRAY['AICTE', 'UGC'], 'Deemed University', 'Private', 'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/BITS_Pilani_Logo.svg/200px-BITS_Pilani_Logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 65, "female": 35}'::jsonb, '{"CSE": 200, "ECE": 150, "ME": 150, "CE": 100, "EE": 100}'::jsonb, '{"tuition": 400000, "hostel": 90000, "mess": 80000, "total": 570000}'::jsonb, 'Modern campus with excellent academic and residential facilities.'),
('Indian Institute of Technology Madras', 'iit-madras', 'IIT Madras', 'IIT Madras is renowned for its research output and strong academic programs in engineering.', 1959, 'IIT P.O., Chennai', 'Chennai', 'Tamil Nadu', '600036', 12.9915, 80.2337, 'https://www.iitm.ac.in', 'info@iitm.ac.in', '+91-44-22578500', ARRAY['AICTE', 'UGC'], 'Autonomous', 'IIT', 'https://upload.wikimedia.org/wikipedia/en/thumb/6/69/IIT_Madras_Logo.svg/200px-IIT_Madras_Logo.svg.png', 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=1200', '{"male": 67, "female": 33}'::jsonb, '{"CSE": 120, "ECE": 120, "ME": 120, "CE": 60, "EE": 60}'::jsonb, '{"tuition": 200000, "hostel": 50000, "mess": 60000, "total": 310000}'::jsonb, 'Beautiful campus with state-of-the-art facilities and research infrastructure.')
ON CONFLICT (slug) DO NOTHING;

-- Get college IDs and branch IDs for relationships
DO $$
DECLARE
    iit_bombay_id UUID;
    iit_delhi_id UUID;
    nit_trichy_id UUID;
    vit_id UUID;
    bits_id UUID;
    iit_madras_id UUID;
    cse_id UUID;
    ece_id UUID;
    me_id UUID;
    ce_id UUID;
    ee_id UUID;
BEGIN
    -- Get college IDs
    SELECT id INTO iit_bombay_id FROM colleges WHERE slug = 'iit-bombay';
    SELECT id INTO iit_delhi_id FROM colleges WHERE slug = 'iit-delhi';
    SELECT id INTO nit_trichy_id FROM colleges WHERE slug = 'nit-trichy';
    SELECT id INTO vit_id FROM colleges WHERE slug = 'vit-vellore';
    SELECT id INTO bits_id FROM colleges WHERE slug = 'bits-pilani';
    SELECT id INTO iit_madras_id FROM colleges WHERE slug = 'iit-madras';
    
    -- Get branch IDs
    SELECT id INTO cse_id FROM branches WHERE slug = 'cse';
    SELECT id INTO ece_id FROM branches WHERE slug = 'ece';
    SELECT id INTO me_id FROM branches WHERE slug = 'me';
    SELECT id INTO ce_id FROM branches WHERE slug = 'ce';
    SELECT id INTO ee_id FROM branches WHERE slug = 'ee';
    
    -- Link colleges to branches
    INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
    (iit_bombay_id, cse_id, 120, 120),
    (iit_bombay_id, ece_id, 120, 120),
    (iit_bombay_id, me_id, 120, 120),
    (iit_bombay_id, ce_id, 60, 60),
    (iit_bombay_id, ee_id, 60, 60),
    (iit_delhi_id, cse_id, 120, 120),
    (iit_delhi_id, ece_id, 120, 120),
    (iit_delhi_id, me_id, 120, 120),
    (iit_delhi_id, ce_id, 60, 60),
    (iit_delhi_id, ee_id, 60, 60),
    (nit_trichy_id, cse_id, 120, 120),
    (nit_trichy_id, ece_id, 120, 120),
    (nit_trichy_id, me_id, 120, 120),
    (nit_trichy_id, ce_id, 60, 60),
    (nit_trichy_id, ee_id, 60, 60),
    (vit_id, cse_id, 600, 600),
    (vit_id, ece_id, 300, 300),
    (vit_id, me_id, 300, 300),
    (vit_id, ce_id, 180, 180),
    (vit_id, ee_id, 180, 180),
    (bits_id, cse_id, 200, 200),
    (bits_id, ece_id, 150, 150),
    (bits_id, me_id, 150, 150),
    (bits_id, ce_id, 100, 100),
    (bits_id, ee_id, 100, 100),
    (iit_madras_id, cse_id, 120, 120),
    (iit_madras_id, ece_id, 120, 120),
    (iit_madras_id, me_id, 120, 120),
    (iit_madras_id, ce_id, 60, 60),
    (iit_madras_id, ee_id, 60, 60)
    ON CONFLICT DO NOTHING;
    
    -- Add rankings
    INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
    (iit_bombay_id, 'NIRF', 2023, 3, 'Overall', 'https://www.nirfindia.org/2023/OverallRanking.html', 'https://www.nirfindia.org'),
    (iit_bombay_id, 'NIRF', 2023, 1, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (iit_delhi_id, 'NIRF', 2023, 2, 'Overall', 'https://www.nirfindia.org/2023/OverallRanking.html', 'https://www.nirfindia.org'),
    (iit_delhi_id, 'NIRF', 2023, 2, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (iit_madras_id, 'NIRF', 2023, 1, 'Overall', 'https://www.nirfindia.org/2023/OverallRanking.html', 'https://www.nirfindia.org'),
    (iit_madras_id, 'NIRF', 2023, 3, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (nit_trichy_id, 'NIRF', 2023, 9, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (vit_id, 'NIRF', 2023, 12, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org'),
    (bits_id, 'NIRF', 2023, 25, 'Overall', 'https://www.nirfindia.org/2023/OverallRanking.html', 'https://www.nirfindia.org')
    ON CONFLICT DO NOTHING;
    
    -- Add placement stats
    INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
    (iit_bombay_id, cse_id, 2023, 120, 118, 98.33, 2500000, 2400000, 12000000, 15),
    (iit_bombay_id, ece_id, 2023, 120, 115, 95.83, 2200000, 2100000, 8000000, 8),
    (iit_delhi_id, cse_id, 2023, 120, 119, 99.17, 2450000, 2350000, 11000000, 12),
    (iit_delhi_id, ece_id, 2023, 120, 116, 96.67, 2150000, 2050000, 7500000, 7),
    (nit_trichy_id, cse_id, 2023, 120, 115, 95.83, 1800000, 1700000, 4500000, 3),
    (nit_trichy_id, ece_id, 2023, 120, 110, 91.67, 1600000, 1500000, 4000000, 2),
    (vit_id, cse_id, 2023, 600, 570, 95.00, 1200000, 1100000, 3500000, 1),
    (bits_id, cse_id, 2023, 200, 195, 97.50, 2000000, 1900000, 6000000, 5),
    (iit_madras_id, cse_id, 2023, 120, 118, 98.33, 2480000, 2380000, 11500000, 14)
    ON CONFLICT DO NOTHING;
    
    -- Add cutoffs
    INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
    (iit_bombay_id, cse_id, 'JEE Advanced', 2023, 1, 63, 'General', 'https://jeeadv.ac.in'),
    (iit_bombay_id, ece_id, 'JEE Advanced', 2023, 64, 180, 'General', 'https://jeeadv.ac.in'),
    (iit_delhi_id, cse_id, 'JEE Advanced', 2023, 1, 70, 'General', 'https://jeeadv.ac.in'),
    (iit_delhi_id, ece_id, 'JEE Advanced', 2023, 71, 190, 'General', 'https://jeeadv.ac.in'),
    (nit_trichy_id, cse_id, 'JEE Main', 2023, 1200, 2500, 'General', 'https://jeemain.nta.ac.in'),
    (nit_trichy_id, ece_id, 'JEE Main', 2023, 2501, 4500, 'General', 'https://jeemain.nta.ac.in'),
    (vit_id, cse_id, 'VITEEE', 2023, 5000, 15000, 'General', 'https://viteee.vit.ac.in'),
    (bits_id, cse_id, 'BITSAT', 2023, 200, 800, 'General', 'https://www.bitsadmission.com'),
    (iit_madras_id, cse_id, 'JEE Advanced', 2023, 1, 68, 'General', 'https://jeeadv.ac.in')
    ON CONFLICT DO NOTHING;
END $$;

-- Add infrastructure data
DO $$
DECLARE
    iit_bombay_id UUID;
    iit_delhi_id UUID;
    nit_trichy_id UUID;
    vit_id UUID;
    cse_id UUID;
BEGIN
    SELECT id INTO iit_bombay_id FROM colleges WHERE slug = 'iit-bombay';
    SELECT id INTO iit_delhi_id FROM colleges WHERE slug = 'iit-delhi';
    SELECT id INTO nit_trichy_id FROM colleges WHERE slug = 'nit-trichy';
    SELECT id INTO vit_id FROM colleges WHERE slug = 'vit-vellore';
    SELECT id INTO cse_id FROM branches WHERE slug = 'cse';
    
    INSERT INTO infrastructure (college_id, category, name, description, branch_id, details, capacity, images) VALUES
    (iit_bombay_id, 'classroom', 'Smart Classrooms', 'Fully equipped smart classrooms with projectors and audio systems', NULL, '{"ac": true, "smart_board": true, "capacity": 60}'::jsonb, 60, ARRAY['https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=800']),
    (iit_bombay_id, 'lab', 'Computer Lab', 'State-of-the-art computer laboratory', cse_id, '{"computers": 100, "software": "Latest"}'::jsonb, 100, ARRAY['https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=800']),
    (iit_bombay_id, 'hostel', 'Hostel Blocks', 'Modern hostel facilities with all amenities', NULL, '{"rooms": "AC/Non-AC", "mess": true}'::jsonb, 3000, ARRAY['https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800']),
    (iit_delhi_id, 'classroom', 'Lecture Halls', 'Spacious lecture halls with modern equipment', NULL, '{"ac": true, "projector": true}'::jsonb, 200, ARRAY['https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=800']),
    (nit_trichy_id, 'lab', 'Electronics Lab', 'Well-equipped electronics laboratory', NULL, '{"equipment": "Advanced", "instruments": "Latest"}'::jsonb, 50, ARRAY['https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=800']),
    (vit_id, 'sports', 'Sports Complex', 'Comprehensive sports facilities', NULL, '{"indoor": true, "outdoor": true}'::jsonb, 500, ARRAY['https://images.unsplash.com/photo-1576678927484-cc907957088c?w=800'])
    ON CONFLICT DO NOTHING;
    
    -- Add libraries
    INSERT INTO libraries (college_id, name, opening_hours, is_24x7, seating_capacity, digital_resources, images) VALUES
    (iit_bombay_id, 'Central Library', '{"monday": "8:00-22:00", "tuesday": "8:00-22:00", "wednesday": "8:00-22:00", "thursday": "8:00-22:00", "friday": "8:00-22:00", "saturday": "9:00-17:00", "sunday": "9:00-17:00"}'::jsonb, false, 500, '{"ebooks": 50000, "journals": 2000, "databases": 50}'::jsonb, ARRAY['https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=800']),
    (iit_delhi_id, 'Main Library', '{"monday": "8:00-22:00", "tuesday": "8:00-22:00", "wednesday": "8:00-22:00", "thursday": "8:00-22:00", "friday": "8:00-22:00", "saturday": "9:00-17:00", "sunday": "9:00-17:00"}'::jsonb, false, 600, '{"ebooks": 55000, "journals": 2200, "databases": 55}'::jsonb, ARRAY['https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=800']),
    (nit_trichy_id, 'Central Library', '{"monday": "8:00-20:00", "tuesday": "8:00-20:00", "wednesday": "8:00-20:00", "thursday": "8:00-20:00", "friday": "8:00-20:00", "saturday": "9:00-17:00", "sunday": "Closed"}'::jsonb, false, 400, '{"ebooks": 40000, "journals": 1500, "databases": 40}'::jsonb, ARRAY['https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=800'])
    ON CONFLICT DO NOTHING;
    
    -- Add transport info
    INSERT INTO transport (college_id, airport_name, airport_distance_km, airport_travel_time_minutes, railway_station_name, railway_distance_km, railway_travel_time_minutes, bus_connectivity, metro_connectivity) VALUES
    (iit_bombay_id, 'Chhatrapati Shivaji Maharaj International Airport', 18.5, 45, 'Andheri Railway Station', 8.2, 25, ARRAY['BEST Bus'], ARRAY['Metro Line 1']),
    (iit_delhi_id, 'Indira Gandhi International Airport', 12.3, 30, 'Hauz Khas Metro Station', 2.1, 10, ARRAY['DTC Bus'], ARRAY['Yellow Line', 'Magenta Line']),
    (nit_trichy_id, 'Tiruchirappalli International Airport', 22.0, 40, 'Tiruchirappalli Junction', 15.0, 30, ARRAY['TNSTC Bus'], ARRAY[]::text[]),
    (vit_id, 'Chennai International Airport', 130.0, 180, 'Katpadi Junction', 8.0, 15, ARRAY['TNSTC Bus'], ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
END $$;

-- Add sample faculty
DO $$
DECLARE
    iit_bombay_id UUID;
    iit_delhi_id UUID;
    nit_trichy_id UUID;
    cse_id UUID;
    ece_id UUID;
BEGIN
    SELECT id INTO iit_bombay_id FROM colleges WHERE slug = 'iit-bombay';
    SELECT id INTO iit_delhi_id FROM colleges WHERE slug = 'iit-delhi';
    SELECT id INTO nit_trichy_id FROM colleges WHERE slug = 'nit-trichy';
    SELECT id INTO cse_id FROM branches WHERE slug = 'cse';
    SELECT id INTO ece_id FROM branches WHERE slug = 'ece';
    
    INSERT INTO faculty (college_id, name, slug, designation, department, branch_id, qualifications, experience_years, research_interests, is_verified, verification_status) VALUES
    (iit_bombay_id, 'Dr. Rajesh Kumar', 'rajesh-kumar', 'Professor', 'Computer Science', cse_id, ARRAY['Ph.D. Computer Science, IIT Bombay', 'M.Tech. CSE, IIT Delhi'], 25, ARRAY['Machine Learning', 'Data Mining', 'Artificial Intelligence'], true, 'verified'),
    (iit_bombay_id, 'Dr. Priya Sharma', 'priya-sharma', 'Associate Professor', 'Electronics', ece_id, ARRAY['Ph.D. Electronics, Stanford University', 'M.Tech. ECE, IIT Kanpur'], 18, ARRAY['VLSI Design', 'Embedded Systems'], true, 'verified'),
    (iit_delhi_id, 'Dr. Amit Patel', 'amit-patel', 'Professor', 'Computer Science', cse_id, ARRAY['Ph.D. Computer Science, MIT', 'M.Tech. CSE, IIT Bombay'], 22, ARRAY['Computer Networks', 'Distributed Systems'], true, 'verified'),
    (nit_trichy_id, 'Dr. Suresh Reddy', 'suresh-reddy', 'Professor', 'Computer Science', cse_id, ARRAY['Ph.D. Computer Science, NIT Trichy', 'M.Tech. CSE, IIT Madras'], 20, ARRAY['Database Systems', 'Software Engineering'], true, 'verified')
    ON CONFLICT DO NOTHING;
END $$;

-- Add achievements
DO $$
DECLARE
    iit_bombay_id UUID;
    iit_delhi_id UUID;
    nit_trichy_id UUID;
BEGIN
    SELECT id INTO iit_bombay_id FROM colleges WHERE slug = 'iit-bombay';
    SELECT id INTO iit_delhi_id FROM colleges WHERE slug = 'iit-delhi';
    SELECT id INTO nit_trichy_id FROM colleges WHERE slug = 'nit-trichy';
    
    INSERT INTO achievements (college_id, title, description, year, category, is_extraordinary, proof_link) VALUES
    (iit_bombay_id, 'Ranked #1 in NIRF Engineering Rankings 2023', 'IIT Bombay achieved the top position in NIRF Engineering rankings', 2023, 'academics', true, 'https://www.nirfindia.org/2023/EngineeringRanking.html'),
    (iit_bombay_id, 'Record Placement Season', 'Highest package of ₹1.2 Crore offered to CSE student', 2023, 'placements', true, 'https://www.iitb.ac.in/placements'),
    (iit_delhi_id, 'Research Excellence Award', 'Recognized for outstanding research contributions', 2023, 'research', false, 'https://home.iitd.ac.in/research'),
    (nit_trichy_id, 'Best NIT Award', 'Awarded best NIT for overall excellence', 2023, 'academics', true, 'https://www.nitt.edu'),
    (iit_bombay_id, 'International Collaboration', 'Signed MoU with top international universities', 2023, 'academics', false, 'https://www.iitb.ac.in/international')
    ON CONFLICT DO NOTHING;
END $$;

-- Add events
DO $$
DECLARE
    iit_bombay_id UUID;
    iit_delhi_id UUID;
    nit_trichy_id UUID;
BEGIN
    SELECT id INTO iit_bombay_id FROM colleges WHERE slug = 'iit-bombay';
    SELECT id INTO iit_delhi_id FROM colleges WHERE slug = 'iit-delhi';
    SELECT id INTO nit_trichy_id FROM colleges WHERE slug = 'nit-trichy';
    
    INSERT INTO events (college_id, name, slug, event_type, description, year, images, celebrity_performances) VALUES
    (iit_bombay_id, 'Techfest', 'techfest-2023', 'technical', 'Annual technical festival with competitions and workshops', 2023, ARRAY['https://images.unsplash.com/photo-1505373877841-8d25f7d46678?w=800'], ARRAY[]::text[]),
    (iit_bombay_id, 'Mood Indigo', 'mood-indigo-2023', 'cultural', 'Asia''s largest college cultural festival', 2023, ARRAY['https://images.unsplash.com/photo-1478147427282-58a87a120781?w=800'], ARRAY['Arijit Singh', 'The Local Train']),
    (iit_delhi_id, 'Rendezvous', 'rendezvous-2023', 'cultural', 'Annual cultural fest', 2023, ARRAY['https://images.unsplash.com/photo-1478147427282-58a87a120781?w=800'], ARRAY['Badshah']),
    (nit_trichy_id, 'Pragyan', 'pragyan-2023', 'technical', 'Technical symposium', 2023, ARRAY['https://images.unsplash.com/photo-1505373877841-8d25f7d46678?w=800'], ARRAY[]::text[])
    ON CONFLICT DO NOTHING;
END $$;

-- Add city attractions
INSERT INTO city_attractions (city, state, name, slug, category, description, distance_from_city_center_km, travel_time_minutes, images, best_season, ideal_duration) VALUES
('Mumbai', 'Maharashtra', 'Gateway of India', 'gateway-of-india', 'monument', 'Historic arch monument and popular tourist spot', 25.0, 60, ARRAY['https://images.unsplash.com/photo-1529258283598-8d8fe07bcede?w=800'], 'October to March', '2-3 hours'),
('Mumbai', 'Maharashtra', 'Marine Drive', 'marine-drive', 'picnic', 'Famous promenade along the Arabian Sea', 20.0, 45, ARRAY['https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800'], 'All year', '1-2 hours'),
('New Delhi', 'Delhi', 'India Gate', 'india-gate', 'monument', 'War memorial and iconic landmark', 8.0, 20, ARRAY['https://images.unsplash.com/photo-1587474260584-136574528ed5?w=800'], 'October to March', '1-2 hours'),
('New Delhi', 'Delhi', 'Connaught Place', 'connaught-place', 'mall', 'Shopping and dining hub', 5.0, 15, ARRAY['https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800'], 'All year', '3-4 hours'),
('Tiruchirappalli', 'Tamil Nadu', 'Srirangam Temple', 'srirangam-temple', 'religious', 'Famous Hindu temple complex', 8.0, 20, ARRAY['https://images.unsplash.com/photo-1585504198199-20277593b94f?w=800'], 'All year', '2-3 hours'),
('Vellore', 'Tamil Nadu', 'Vellore Fort', 'vellore-fort', 'monument', 'Historic fort with rich heritage', 2.0, 10, ARRAY['https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800'], 'October to March', '2-3 hours')
ON CONFLICT DO NOTHING;

-- Add sample placements
DO $$
DECLARE
    iit_bombay_id UUID;
    iit_delhi_id UUID;
    nit_trichy_id UUID;
    vit_id UUID;
    google_id UUID;
    microsoft_id UUID;
    amazon_id UUID;
    cse_id UUID;
    ece_id UUID;
BEGIN
    SELECT id INTO iit_bombay_id FROM colleges WHERE slug = 'iit-bombay';
    SELECT id INTO iit_delhi_id FROM colleges WHERE slug = 'iit-delhi';
    SELECT id INTO nit_trichy_id FROM colleges WHERE slug = 'nit-trichy';
    SELECT id INTO vit_id FROM colleges WHERE slug = 'vit-vellore';
    SELECT id INTO google_id FROM companies WHERE slug = 'google';
    SELECT id INTO microsoft_id FROM companies WHERE slug = 'microsoft';
    SELECT id INTO amazon_id FROM companies WHERE slug = 'amazon';
    SELECT id INTO cse_id FROM branches WHERE slug = 'cse';
    SELECT id INTO ece_id FROM branches WHERE slug = 'ece';
    
    INSERT INTO placements (college_id, company_id, branch_id, year, salary_offered, currency, offer_type, location, is_on_campus, students_placed) VALUES
    (iit_bombay_id, google_id, cse_id, 2023, 12000000, 'INR', 'FTE', 'Bangalore', true, 8),
    (iit_bombay_id, microsoft_id, cse_id, 2023, 8000000, 'INR', 'FTE', 'Hyderabad', true, 12),
    (iit_bombay_id, amazon_id, cse_id, 2023, 7500000, 'INR', 'FTE', 'Bangalore', true, 15),
    (iit_delhi_id, google_id, cse_id, 2023, 11000000, 'INR', 'FTE', 'Bangalore', true, 6),
    (iit_delhi_id, microsoft_id, cse_id, 2023, 7800000, 'INR', 'FTE', 'Hyderabad', true, 10),
    (nit_trichy_id, microsoft_id, cse_id, 2023, 4500000, 'INR', 'FTE', 'Hyderabad', true, 8),
    (nit_trichy_id, amazon_id, cse_id, 2023, 4000000, 'INR', 'FTE', 'Bangalore', true, 12),
    (vit_id, microsoft_id, cse_id, 2023, 3500000, 'INR', 'FTE', 'Hyderabad', true, 25),
    (vit_id, amazon_id, cse_id, 2023, 3200000, 'INR', 'FTE', 'Bangalore', true, 30)
    ON CONFLICT DO NOTHING;
END $$;

COMMIT;
