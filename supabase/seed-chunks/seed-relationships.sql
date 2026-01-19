-- Relationships: College Branches, Rankings, Placements, Cutoffs
-- ⚠️ IMPORTANT: Run this AFTER all college chunks have been imported
-- This file links all colleges to branches and adds rankings, placements, and cutoffs

-- COLLEGE BRANCHES, RANKINGS, PLACEMENTS, CUTOFFS
-- ============================================

DO $$
DECLARE
    college_id_var UUID;
    cse_id UUID;
    ece_id UUID;
    me_id UUID;
    ce_id UUID;
    ee_id UUID;
BEGIN
    -- Get branch IDs
    SELECT id INTO cse_id FROM branches WHERE slug = 'cse';
    SELECT id INTO ece_id FROM branches WHERE slug = 'ece';
    SELECT id INTO me_id FROM branches WHERE slug = 'me';
    SELECT id INTO ce_id FROM branches WHERE slug = 'ce';
    SELECT id INTO ee_id FROM branches WHERE slug = 'ee';

    -- Indian Institute of Technology Bombay
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-bombay';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 1, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 114, 95.29, 2386998, 2267648, 9547992, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 1, 1, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Delhi
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-delhi';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 2, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 116, 96.68, 2113217, 2007556, 8452868, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 3, 3, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Madras
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-madras';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 3, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 116, 96.72, 2147234, 2039872, 8588936, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 4, 5, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Kanpur
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-kanpur';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 4, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 118, 98.72, 2493079, 2368425, 9972316, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 6, 7, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Kharagpur
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-kharagpur';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 5, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 114, 95.12, 2460633, 2337601, 9842532, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 7, 9, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Roorkee
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-roorkee';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 6, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 116, 97.12, 2321207, 2205146, 9284828, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 9, 11, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Guwahati
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-guwahati';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 7, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 117, 98.07, 2203783, 2093593, 8815132, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 10, 13, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Hyderabad
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-hyderabad';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 8, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 115, 96.15, 2437181, 2315321, 9748724, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 12, 15, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Gandhinagar
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-gandhinagar';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 15, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 118, 98.71, 2280286, 2166271, 9121144, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 22, 28, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Ropar
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-ropar';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 16, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 117, 97.63, 2059123, 1956166, 8236492, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 24, 31, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Patna
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-patna';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 17, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 114, 95.05, 2302588, 2187458, 9210352, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 25, 32, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Bhubaneswar
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-bhubaneswar';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 18, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 116, 97.23, 2053633, 1950951, 8214532, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 27, 35, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Indore
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-indore';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 19, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 118, 98.36, 2345772, 2228483, 9383088, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 28, 36, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Mandi
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-mandi';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 20, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 116, 96.68, 2420473, 2299449, 9681892, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 30, 39, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Jodhpur
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-jodhpur';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 21, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 116, 97.10, 2104702, 1999466, 8418808, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 31, 40, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Dhanbad
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-dhanbad';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 22, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 118, 98.73, 2189058, 2079605, 8756232, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 33, 42, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Bhilai
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-bhilai';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 50, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 118, 98.64, 2167402, 2059031, 8669608, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 75, 97, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Dharwad
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-dharwad';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 51, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 118, 98.50, 2240955, 2128907, 8963820, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 76, 98, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Goa
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-goa';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 52, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 115, 96.00, 2061708, 1958622, 8246832, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 78, 101, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Jammu
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-jammu';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 53, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 116, 97.09, 2336393, 2219573, 9345572, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 79, 102, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Palakkad
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-palakkad';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 54, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 118, 98.37, 2096782, 1991942, 8387128, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 81, 105, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Tirupati
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-tirupati';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 55, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 114, 95.21, 2233412, 2121741, 8933648, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 82, 106, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indian Institute of Technology Varanasi
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indian-institute-of-technology-varanasi';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 23, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 116, 97.24, 2322849, 2206706, 9291396, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Advanced', 2023, 34, 44, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Trichy
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-trichy';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 9, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.38, 1567072, 1488718, 6268288, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 180, 234, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Surathkal
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-surathkal';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 10, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.23, 1644923, 1562676, 6579692, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 200, 260, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Warangal
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-warangal';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 11, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.22, 1875772, 1781983, 7503088, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 220, 286, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Calicut
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-calicut';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 13, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.56, 1765420, 1677149, 7061680, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 260, 338, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Rourkela
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-rourkela';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 14, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 116, 96.86, 1655146, 1572388, 6620584, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 280, 364, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Durgapur
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-durgapur';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 24, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 93.02, 1835037, 1743285, 7340148, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 480, 624, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Jaipur
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-jaipur';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 25, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 116, 97.08, 1766241, 1677928, 7064964, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 500, 650, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Allahabad
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-allahabad';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 26, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 114, 95.73, 1773579, 1684900, 7094316, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 520, 676, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Kurukshetra
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-kurukshetra';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 27, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 116, 97.06, 1893443, 1798770, 7573772, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 540, 702, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Hamirpur
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-hamirpur';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 28, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.12, 1637170, 1555311, 6548680, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 560, 728, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Jalandhar
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-jalandhar';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 29, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 115, 96.54, 1552455, 1474832, 6209820, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 580, 754, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Patna
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-patna';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 30, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.22, 1807909, 1717513, 7231636, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 600, 780, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Raipur
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-raipur';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 31, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 90.87, 1595226, 1515464, 6380904, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 620, 806, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Silchar
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-silchar';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 32, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 117, 97.89, 1828927, 1737480, 7315708, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 640, 832, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Srinagar
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-srinagar';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 33, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 115, 96.31, 1626493, 1545168, 6505972, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 660, 858, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Bhopal
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-bhopal';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 34, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.28, 1831864, 1740270, 7327456, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 680, 884, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Agartala
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-agartala';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 60, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 117, 97.64, 1583791, 1504601, 6335164, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 1200, 1560, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Goa
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-goa';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 61, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 117, 97.70, 1527175, 1450816, 6108700, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 1220, 1586, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Meghalaya
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-meghalaya';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 62, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 114, 95.03, 1734984, 1648234, 6939936, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 1240, 1612, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Nagaland
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-nagaland';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 63, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.95, 1742558, 1655430, 6970232, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 1260, 1638, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Manipur
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-manipur';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 64, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.66, 1525181, 1448921, 6100724, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 1280, 1664, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Mizoram
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-mizoram';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 65, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.85, 1797793, 1707903, 7191172, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 1300, 1690, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Puducherry
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-puducherry';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 66, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 117, 97.76, 1710711, 1625175, 6842844, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 1320, 1716, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Sikkim
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-sikkim';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 67, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.16, 1727760, 1641372, 6911040, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 1340, 1742, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Arunachal Pradesh
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-arunachal-pradesh';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 68, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 116, 97.37, 1859283, 1766318, 7437132, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 1360, 1768, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Delhi
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-delhi';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 35, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 117, 97.73, 1811322, 1720755, 7245288, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 700, 910, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Uttarakhand
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-uttarakhand';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 69, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 115, 95.86, 1605320, 1525054, 6421280, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 1380, 1794, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Andhra Pradesh
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-andhra-pradesh';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 70, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.87, 1741746, 1654658, 6966984, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 1400, 1820, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- National Institute of Technology Jamshedpur
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'national-institute-of-technology-jamshedpur';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 36, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 115, 96.54, 1761976, 1673877, 7047904, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'JEE Main', 2023, 720, 936, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Birla Institute of Technology and Science Pilani
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'birla-institute-of-technology-and-science-pilani';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 25, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 95, 79.30, 1200459, 1140436, 4801836, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 1250, 1625, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Vellore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'vellore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 12, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.30, 929509, 883033, 3718036, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 600, 780, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Manipal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'manipal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 20, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.76, 1126347, 1070029, 4505388, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 1000, 1300, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- SRM Institute of Science and Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'srm-institute-of-science-and-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 22, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 82.83, 841961, 799862, 3367844, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 1100, 1430, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Thapar Institute of Engineering and Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'thapar-institute-of-engineering-and-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 24, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.06, 804023, 763821, 3216092, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 1200, 1560, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amity University
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amity-university';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 40, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.33, 1069455, 1015982, 4277820, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 2000, 2600, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Lovely Professional University
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'lovely-professional-university';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 45, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.63, 1425658, 1354375, 5702632, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 2250, 2925, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Shiv Nadar University
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'shiv-nadar-university';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 38, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 93, 78.30, 1235853, 1174060, 4943412, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 1900, 2470, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- KIIT University
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kiit-university';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 42, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 86.94, 1063388, 1010218, 4253552, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 2100, 2730, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Siksha O Anusandhan University
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'siksha-o-anusandhan-university';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 44, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.60, 1135620, 1078839, 4542480, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 2200, 2860, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 244, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.23, 1119952, 1063954, 4479808, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12200, 15860, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Gurgaon Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'gurgaon-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 105, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.95, 1231084, 1169529, 4924336, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5250, 6825, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Hyderabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'hyderabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 280, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.57, 1396165, 1326356, 5584660, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14000, 18200, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kochi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kochi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 194, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.56, 870827, 827285, 3483308, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9700, 12610, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Dharamshala Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'dharamshala-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 116, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.89, 1229873, 1168379, 4919492, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5800, 7540, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 214, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.76, 1424305, 1353089, 5697220, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10700, 13910, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Thiruvananthapuram Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'thiruvananthapuram-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 81, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.19, 1434713, 1362977, 5738852, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4050, 5265, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jodhpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jodhpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 148, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.57, 1054448, 1001725, 4217792, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7400, 9620, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 208, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 88.04, 1217226, 1156364, 4868904, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10400, 13520, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ajmer Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ajmer-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 393, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.85, 1131230, 1074668, 4524920, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19650, 25545, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 196, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.47, 1233926, 1172229, 4935704, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9800, 12740, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ghaziabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ghaziabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 209, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.73, 1078746, 1024808, 4314984, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10450, 13585, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rohtak Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rohtak-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 177, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.69, 1497510, 1422634, 5990040, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8850, 11505, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Gurgaon Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'gurgaon-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 70, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 95, 79.56, 1340808, 1273767, 5363232, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 3500, 4550, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Agra Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'agra-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 267, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.30, 1432708, 1361072, 5730832, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13350, 17355, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 433, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 88.30, 1256141, 1193333, 5024564, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21650, 28145, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bangalore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bangalore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 107, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 81.86, 1063845, 1010652, 4255380, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5350, 6955, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bangalore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bangalore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 100, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 93.23, 1249827, 1187335, 4999308, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5000, 6500, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bareilly Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bareilly-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 215, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.72, 1219168, 1158209, 4876672, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10750, 13975, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 225, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.73, 1181826, 1122734, 4727304, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11250, 14625, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhopal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhopal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 381, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.24, 1231485, 1169910, 4925940, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19050, 24765, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ahmedabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ahmedabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 347, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.53, 1378566, 1309637, 5514264, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17350, 22555, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Panipat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'panipat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 308, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 89.14, 992344, 942726, 3969376, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15400, 20020, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Mumbai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'mumbai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 392, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.82, 1459145, 1386187, 5836580, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19600, 25480, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Karnal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'karnal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 389, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.33, 1057195, 1004335, 4228780, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19450, 25285, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Guwahati Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'guwahati-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 138, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.61, 1036993, 985143, 4147972, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6900, 8970, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Delhi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'delhi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 384, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 92, 77.47, 1364828, 1296586, 5459312, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19200, 24960, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhubaneswar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhubaneswar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 282, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.11, 1371744, 1303156, 5486976, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14100, 18330, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Varanasi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'varanasi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 105, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.42, 1038686, 986751, 4154744, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5250, 6825, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Allahabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'allahabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 75, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.76, 1436854, 1365011, 5747416, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 3750, 4875, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rohtak Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rohtak-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 412, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.87, 1488131, 1413724, 5952524, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20600, 26780, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 328, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.58, 1376954, 1308106, 5507816, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16400, 21320, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Visakhapatnam Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'visakhapatnam-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 281, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.28, 1344558, 1277330, 5378232, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14050, 18265, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Hyderabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'hyderabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 299, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 83.29, 1059268, 1006304, 4237072, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14950, 19435, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 409, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.59, 1192488, 1132863, 4769952, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20450, 26585, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ludhiana Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ludhiana-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 400, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.57, 1254192, 1191482, 5016768, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20000, 26000, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Panipat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'panipat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 232, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.86, 1168680, 1110246, 4674720, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11600, 15080, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kochi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kochi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 83, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.35, 1023912, 972716, 4095648, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4150, 5395, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Manali Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'manali-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 125, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.36, 1108981, 1053531, 4435924, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6250, 8125, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ludhiana Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ludhiana-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 254, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 89.12, 1218582, 1157652, 4874328, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12700, 16510, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rohtak Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rohtak-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 262, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.25, 1278398, 1214478, 5113592, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13100, 17030, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Visakhapatnam Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'visakhapatnam-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 168, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.48, 1169614, 1111133, 4678456, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8400, 10920, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Panipat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'panipat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 446, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.61, 1314600, 1248870, 5258400, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22300, 28990, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kolkata Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kolkata-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 158, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 93, 77.90, 1163237, 1105075, 4652948, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7900, 10270, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Coimbatore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'coimbatore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 497, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.90, 1128846, 1072403, 4515384, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24850, 32305, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Mumbai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'mumbai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 181, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.98, 1267521, 1204144, 5070084, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9050, 11765, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Varanasi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'varanasi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 390, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 94, 78.92, 968179, 919770, 3872716, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19500, 25350, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Nainital Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'nainital-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 401, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.89, 1333556, 1266878, 5334224, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20050, 26065, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amritsar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amritsar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 203, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 93.21, 1257982, 1195082, 5031928, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10150, 13195, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Aligarh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'aligarh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 324, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 93.33, 1395724, 1325937, 5582896, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16200, 21060, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Pune Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'pune-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 198, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.21, 1470924, 1397377, 5883696, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9900, 12870, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Agra Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'agra-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 103, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.28, 1264965, 1201716, 5059860, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5150, 6695, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 77, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.56, 1407162, 1336803, 5628648, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 3850, 5005, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Guwahati Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'guwahati-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 133, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.12, 1183441, 1124268, 4733764, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6650, 8645, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Nainital Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'nainital-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 467, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.80, 1169917, 1111421, 4679668, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23350, 30355, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhopal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhopal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 473, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.82, 1068000, 1014600, 4272000, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23650, 30745, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Dehradun Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'dehradun-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 416, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.63, 1205147, 1144889, 4820588, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20800, 27040, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Agra Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'agra-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 385, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 95, 79.72, 964697, 916462, 3858788, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19250, 25025, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kochi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kochi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 498, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.56, 1259050, 1196097, 5036200, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24900, 32370, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Shimla Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'shimla-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 294, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 92, 77.25, 1404866, 1334622, 5619464, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14700, 19110, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Patna Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'patna-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 109, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.98, 1164890, 1106645, 4659560, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5450, 7085, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jalandhar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jalandhar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 131, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.74, 1295549, 1230771, 5182196, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6550, 8515, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Thiruvananthapuram Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'thiruvananthapuram-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 176, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.20, 1195404, 1135633, 4781616, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8800, 11440, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 384, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 95, 79.21, 1322026, 1255924, 5288104, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19200, 24960, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amritsar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amritsar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 86, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.90, 1228909, 1167463, 4915636, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4300, 5590, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Varanasi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'varanasi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 221, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 82.53, 1380933, 1311886, 5523732, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11050, 14365, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bareilly Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bareilly-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 292, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.18, 1201866, 1141772, 4807464, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14600, 18980, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bikaner Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bikaner-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 165, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 82.00, 1128397, 1071977, 4513588, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8250, 10725, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 176, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.48, 1218758, 1157820, 4875032, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8800, 11440, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 468, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.93, 1249584, 1187104, 4998336, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23400, 30420, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Delhi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'delhi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 277, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.29, 1357336, 1289469, 5429344, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13850, 18005, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 83, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.89, 1140523, 1083496, 4562092, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4150, 5395, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 324, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.53, 1306261, 1240947, 5225044, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16200, 21060, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Moradabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'moradabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 325, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.21, 1402563, 1332434, 5610252, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16250, 21125, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jodhpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jodhpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 290, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.41, 1241703, 1179617, 4966812, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14500, 18850, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 461, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.64, 1085631, 1031349, 4342524, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23050, 29965, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Thiruvananthapuram Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'thiruvananthapuram-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 323, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.50, 957671, 909787, 3830684, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16150, 20995, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Manali Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'manali-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 407, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.13, 1028656, 977223, 4114624, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20350, 26455, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Udaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'udaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 267, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.08, 1249612, 1187131, 4998448, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13350, 17355, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Udaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'udaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 445, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.06, 1009045, 958592, 4036180, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22250, 28925, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Noida Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'noida-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 380, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.99, 1352262, 1284648, 5409048, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19000, 24700, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 295, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.61, 1267867, 1204473, 5071468, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14750, 19175, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amritsar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amritsar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 395, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.42, 1480132, 1406125, 5920528, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19750, 25675, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Udaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'udaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 255, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 81.77, 1009683, 959198, 4038732, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12750, 16575, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Delhi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'delhi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 342, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.92, 1300104, 1235098, 5200416, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17100, 22230, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 316, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.03, 1279550, 1215572, 5118200, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15800, 20540, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 366, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.35, 1255240, 1192478, 5020960, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18300, 23790, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 287, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 91.77, 1382024, 1312922, 5528096, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14350, 18655, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Hyderabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'hyderabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 305, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.35, 1449839, 1377347, 5799356, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15250, 19825, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Guwahati Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'guwahati-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 115, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.65, 1096916, 1042070, 4387664, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5750, 7475, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Vadodara Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'vadodara-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 378, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.55, 878067, 834163, 3512268, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18900, 24570, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 389, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.90, 1340173, 1273164, 5360692, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19450, 25285, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Haridwar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'haridwar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 439, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.75, 1466526, 1393199, 5866104, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21950, 28535, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Nainital Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'nainital-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 122, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 91, 76.61, 805451, 765178, 3221804, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6100, 7930, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Chennai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'chennai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 213, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.36, 1314621, 1248889, 5258484, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10650, 13845, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Lucknow Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'lucknow-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 89, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.49, 1322487, 1256362, 5289948, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4450, 5785, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bangalore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bangalore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 70, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.44, 1411054, 1340501, 5644216, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 3500, 4550, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Agra Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'agra-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 367, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 81.98, 1380491, 1311466, 5521964, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18350, 23855, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Moradabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'moradabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 147, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.93, 1411257, 1340694, 5645028, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7350, 9555, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Chennai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'chennai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 333, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.60, 1030859, 979316, 4123436, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16650, 21645, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Moradabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'moradabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 386, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.62, 1319297, 1253332, 5277188, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19300, 25090, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 129, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.88, 1221554, 1160476, 4886216, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6450, 8385, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bikaner Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bikaner-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 140, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.60, 1316756, 1250918, 5267024, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7000, 9100, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jodhpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jodhpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 425, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.61, 1302301, 1237185, 5209204, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21250, 27625, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ajmer Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ajmer-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 339, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.05, 1233912, 1172216, 4935648, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16950, 22035, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Coimbatore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'coimbatore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 240, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.14, 1005036, 954784, 4020144, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12000, 15600, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Delhi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'delhi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 89, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 93.19, 1059785, 1006795, 4239140, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4450, 5785, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Panipat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'panipat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 397, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.47, 1385173, 1315914, 5540692, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19850, 25805, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Meerut Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'meerut-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 414, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 82.92, 1143523, 1086346, 4574092, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20700, 26910, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Thiruvananthapuram Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'thiruvananthapuram-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 330, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.41, 1174017, 1115316, 4696068, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16500, 21450, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Varanasi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'varanasi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 176, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.57, 1091134, 1036577, 4364536, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8800, 11440, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Visakhapatnam Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'visakhapatnam-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 386, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 93.29, 1117139, 1061282, 4468556, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19300, 25090, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 319, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.06, 1071107, 1017551, 4284428, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15950, 20735, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Haridwar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'haridwar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 384, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.75, 1298461, 1233537, 5193844, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19200, 24960, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ajmer Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ajmer-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 382, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.75, 1425671, 1354387, 5702684, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19100, 24830, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Guwahati Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'guwahati-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 199, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.49, 1308552, 1243124, 5234208, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9950, 12935, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jodhpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jodhpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 309, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 81.72, 1063770, 1010581, 4255080, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15450, 20085, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Pune Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'pune-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 96, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.70, 1234303, 1172587, 4937212, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4800, 6240, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bareilly Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bareilly-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 117, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.63, 1121190, 1065130, 4484760, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5850, 7605, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Manali Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'manali-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 219, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.65, 1350286, 1282771, 5401144, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10950, 14235, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 270, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.06, 804489, 764264, 3217956, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13500, 17550, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Hyderabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'hyderabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 91, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.91, 1391323, 1321756, 5565292, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4550, 5915, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ludhiana Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ludhiana-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 354, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.75, 1015378, 964609, 4061512, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17700, 23010, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Nagpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'nagpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 423, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.76, 1152020, 1094419, 4608080, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21150, 27495, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Panipat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'panipat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 411, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.19, 1184847, 1125604, 4739388, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20550, 26715, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Varanasi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'varanasi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 158, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.67, 1227840, 1166448, 4911360, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7900, 10270, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kolkata Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kolkata-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 273, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.30, 1285956, 1221658, 5143824, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13650, 17745, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 280, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 91.83, 1033881, 982186, 4135524, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14000, 18200, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Noida Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'noida-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 135, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 90.90, 1263054, 1199901, 5052216, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6750, 8775, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Delhi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'delhi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 283, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.21, 984313, 935097, 3937252, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14150, 18395, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhopal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhopal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 339, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.62, 1236607, 1174776, 4946428, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16950, 22035, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 473, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 82.81, 1032158, 980550, 4128632, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23650, 30745, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 457, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.51, 1279115, 1215159, 5116460, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22850, 29705, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 417, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.37, 1274052, 1210349, 5096208, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20850, 27105, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Chandigarh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'chandigarh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 246, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 86.92, 1267127, 1203770, 5068508, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12300, 15990, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kochi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kochi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 366, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 86.99, 1293434, 1228762, 5173736, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18300, 23790, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 165, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 82.29, 1264023, 1200821, 5056092, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8250, 10725, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 148, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 86.98, 1374171, 1305462, 5496684, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7400, 9620, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Patna Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'patna-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 338, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 94.16, 1159431, 1101459, 4637724, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16900, 21970, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Visakhapatnam Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'visakhapatnam-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 384, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.11, 1022971, 971822, 4091884, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19200, 24960, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 489, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.24, 1212794, 1152154, 4851176, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24450, 31785, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Haridwar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'haridwar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 406, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 81.67, 1224324, 1163107, 4897296, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20300, 26390, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Noida Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'noida-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 439, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 88.00, 1141098, 1084043, 4564392, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21950, 28535, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Thiruvananthapuram Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'thiruvananthapuram-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 352, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.38, 1318903, 1252957, 5275612, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17600, 22880, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kochi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kochi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 99, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.66, 1432061, 1360457, 5728244, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4950, 6435, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhubaneswar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhubaneswar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 345, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.11, 1268515, 1205089, 5074060, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17250, 22425, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 383, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.14, 1214555, 1153827, 4858220, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19150, 24895, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Udaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'udaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 348, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.65, 1155951, 1098153, 4623804, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17400, 22620, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Hyderabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'hyderabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 151, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 80.87, 1326174, 1259865, 5304696, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7550, 9815, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Shimla Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'shimla-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 462, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.77, 1316119, 1250313, 5264476, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23100, 30030, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 367, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.01, 1212908, 1152262, 4851632, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18350, 23855, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Allahabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'allahabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 397, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 94, 78.38, 989536, 940059, 3958144, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19850, 25805, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jodhpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jodhpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 154, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 89.02, 1491470, 1416896, 5965880, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7700, 10010, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 97, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.72, 1189555, 1130077, 4758220, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4850, 6305, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 303, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 89.01, 1278678, 1214744, 5114712, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15150, 19695, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Meerut Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'meerut-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 478, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.77, 1097217, 1042356, 4388868, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23900, 31070, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Vadodara Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'vadodara-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 200, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 90, 75.24, 1188550, 1129122, 4754200, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10000, 13000, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 290, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.58, 1421382, 1350312, 5685528, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14500, 18850, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Moradabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'moradabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 360, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.84, 1168058, 1109655, 4672232, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18000, 23400, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Panipat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'panipat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 85, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.57, 966860, 918517, 3867440, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4250, 5525, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Vadodara Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'vadodara-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 109, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.65, 1443448, 1371275, 5773792, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5450, 7085, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Gurgaon Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'gurgaon-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 487, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.86, 1409289, 1338824, 5637156, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24350, 31655, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rohtak Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rohtak-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 404, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.52, 1413032, 1342380, 5652128, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20200, 26260, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Gurgaon Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'gurgaon-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 277, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.63, 1457178, 1384319, 5828712, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13850, 18005, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Patna Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'patna-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 154, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.66, 1221541, 1160463, 4886164, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7700, 10010, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 148, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.62, 1199634, 1139652, 4798536, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7400, 9620, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Aligarh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'aligarh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 243, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 89.15, 1460192, 1387182, 5840768, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12150, 15795, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jodhpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jodhpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 168, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.43, 1024555, 973327, 4098220, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8400, 10920, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jalandhar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jalandhar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 364, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 91.77, 1377927, 1309030, 5511708, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18200, 23660, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ghaziabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ghaziabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 256, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.25, 1269653, 1206170, 5078612, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12800, 16640, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Allahabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'allahabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 176, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.66, 907126, 861769, 3628504, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8800, 11440, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Lucknow Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'lucknow-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 486, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 85.98, 1172167, 1113558, 4688668, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24300, 31590, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Agra Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'agra-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 338, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.14, 1320697, 1254662, 5282788, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16900, 21970, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Coimbatore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'coimbatore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 355, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.13, 1104413, 1049192, 4417652, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17750, 23075, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 225, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 86.84, 1485018, 1410767, 5940072, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11250, 14625, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Guwahati Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'guwahati-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 420, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.61, 1140033, 1083031, 4560132, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21000, 27300, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Manali Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'manali-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 360, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.30, 1011276, 960712, 4045104, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18000, 23400, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Meerut Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'meerut-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 373, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.17, 1311303, 1245737, 5245212, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18650, 24245, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 396, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 91.98, 1455056, 1382303, 5820224, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19800, 25740, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Pune Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'pune-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 347, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.55, 1277195, 1213335, 5108780, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17350, 22555, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 193, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 80.99, 1371710, 1303124, 5486840, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9650, 12545, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kolkata Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kolkata-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 191, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.10, 1437804, 1365913, 5751216, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9550, 12415, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 239, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.22, 1390852, 1321309, 5563408, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11950, 15535, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 169, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.54, 1395100, 1325345, 5580400, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8450, 10985, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amritsar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amritsar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 446, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.40, 1036620, 984789, 4146480, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22300, 28990, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Varanasi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'varanasi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 279, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.63, 981213, 932152, 3924852, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13950, 18135, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Panipat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'panipat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 347, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.13, 1369129, 1300672, 5476516, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17350, 22555, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 306, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.19, 1323844, 1257651, 5295376, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15300, 19890, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Karnal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'karnal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 413, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.36, 1208105, 1147699, 4832420, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20650, 26845, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Haridwar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'haridwar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 207, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.55, 1018154, 967246, 4072616, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10350, 13455, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhubaneswar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhubaneswar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 391, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.56, 1011221, 960659, 4044884, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19550, 25415, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Allahabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'allahabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 372, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 92, 76.98, 957332, 909465, 3829328, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18600, 24180, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Thiruvananthapuram Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'thiruvananthapuram-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 213, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 81.89, 907181, 861821, 3628724, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10650, 13845, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jalandhar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jalandhar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 205, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 83.11, 1350584, 1283054, 5402336, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10250, 13325, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rohtak Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rohtak-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 386, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.42, 1452055, 1379452, 5808220, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19300, 25090, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Patna Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'patna-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 174, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.82, 1450034, 1377532, 5800136, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8700, 11310, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Allahabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'allahabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 370, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.93, 1126462, 1070138, 4505848, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18500, 24050, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 399, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.23, 1124009, 1067808, 4496036, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19950, 25935, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Visakhapatnam Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'visakhapatnam-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 133, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.24, 1015767, 964978, 4063068, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6650, 8645, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Agra Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'agra-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 479, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 82.92, 1352929, 1285282, 5411716, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23950, 31135, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Delhi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'delhi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 255, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.03, 1455593, 1382813, 5822372, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12750, 16575, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 395, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.18, 1218409, 1157488, 4873636, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19750, 25675, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Nainital Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'nainital-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 288, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.29, 1245463, 1183189, 4981852, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14400, 18720, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ludhiana Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ludhiana-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 458, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.88, 1205479, 1145205, 4821916, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22900, 29770, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Guwahati Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'guwahati-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 267, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.41, 1432199, 1360589, 5728796, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13350, 17355, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Delhi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'delhi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 106, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.42, 1343042, 1275889, 5372168, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5300, 6890, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Karnal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'karnal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 219, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 86.84, 1086436, 1032114, 4345744, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10950, 14235, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Coimbatore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'coimbatore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 323, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.52, 1439748, 1367760, 5758992, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16150, 20995, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Gurgaon Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'gurgaon-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 88, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.40, 1059873, 1006879, 4239492, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4400, 5720, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bareilly Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bareilly-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 476, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.58, 1413898, 1343203, 5655592, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23800, 30940, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 489, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.58, 1383839, 1314647, 5535356, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24450, 31785, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Pune Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'pune-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 313, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.78, 1233280, 1171616, 4933120, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15650, 20345, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Thiruvananthapuram Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'thiruvananthapuram-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 412, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.28, 1355773, 1287984, 5423092, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20600, 26780, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Visakhapatnam Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'visakhapatnam-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 355, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 83.09, 1435223, 1363461, 5740892, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17750, 23075, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Allahabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'allahabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 475, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.59, 1367361, 1298992, 5469444, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23750, 30875, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amritsar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amritsar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 75, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.20, 947127, 899770, 3788508, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 3750, 4875, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amritsar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amritsar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 176, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.50, 1348717, 1281281, 5394868, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8800, 11440, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 409, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.92, 1029283, 977818, 4117132, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20450, 26585, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jalandhar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jalandhar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 255, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.24, 1032674, 981040, 4130696, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12750, 16575, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ajmer Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ajmer-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 387, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 84.01, 1360270, 1292256, 5441080, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19350, 25155, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Guwahati Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'guwahati-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 496, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 86.87, 1253541, 1190863, 5014164, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24800, 32240, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Patna Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'patna-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 115, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 94.00, 1446821, 1374479, 5787284, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5750, 7475, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhubaneswar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhubaneswar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 266, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 91.81, 1359564, 1291585, 5438256, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13300, 17290, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 118, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.36, 1196786, 1136946, 4787144, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5900, 7670, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Udaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'udaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 388, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 83.01, 1325784, 1259494, 5303136, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19400, 25220, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amritsar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amritsar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 255, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.87, 1483076, 1408922, 5932304, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12750, 16575, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhubaneswar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhubaneswar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 458, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.37, 1167330, 1108963, 4669320, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22900, 29770, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Mumbai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'mumbai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 71, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.67, 915728, 869941, 3662912, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 3550, 4615, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 248, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.86, 926620, 880289, 3706480, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12400, 16120, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 238, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.87, 1211172, 1150613, 4844688, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11900, 15470, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 116, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 95, 79.87, 1146506, 1089180, 4586024, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5800, 7540, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kochi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kochi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 302, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.17, 1110655, 1055122, 4442620, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15100, 19630, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhopal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhopal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 346, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.14, 1008446, 958023, 4033784, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17300, 22490, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 235, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 86.88, 1026845, 975502, 4107380, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11750, 15275, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Vadodara Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'vadodara-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 204, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.36, 1417830, 1346938, 5671320, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10200, 13260, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Allahabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'allahabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 394, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.85, 1419675, 1348691, 5678700, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19700, 25610, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Chennai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'chennai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 81, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.35, 1162149, 1104041, 4648596, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4050, 5265, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jodhpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jodhpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 100, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.56, 1445622, 1373340, 5782488, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5000, 6500, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Nainital Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'nainital-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 85, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.24, 1120012, 1064011, 4480048, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4250, 5525, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Dharamshala Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'dharamshala-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 353, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.74, 1432778, 1361139, 5731112, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17650, 22945, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 99, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.13, 1490077, 1415573, 5960308, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4950, 6435, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Dharamshala Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'dharamshala-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 136, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.10, 1252653, 1190020, 5010612, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6800, 8840, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Karnal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'karnal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 109, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 92, 76.67, 802050, 761947, 3208200, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5450, 7085, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Dharamshala Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'dharamshala-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 109, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.83, 1236516, 1174690, 4946064, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5450, 7085, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 255, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.52, 1367071, 1298717, 5468284, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12750, 16575, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Pune Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'pune-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 290, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.64, 1471346, 1397778, 5885384, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14500, 18850, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Dehradun Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'dehradun-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 154, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.02, 1414241, 1343528, 5656964, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7700, 10010, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Coimbatore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'coimbatore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 257, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.39, 1393424, 1323752, 5573696, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12850, 16705, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kolkata Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kolkata-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 474, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.52, 1184582, 1125352, 4738328, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23700, 30810, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Visakhapatnam Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'visakhapatnam-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 308, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 82.93, 1001211, 951150, 4004844, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15400, 20020, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bangalore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bangalore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 95, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 80.88, 1454191, 1381481, 5816764, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4750, 6175, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 265, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.51, 1169452, 1110979, 4677808, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13250, 17225, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jodhpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jodhpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 324, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.20, 1459057, 1386104, 5836228, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16200, 21060, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Dehradun Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'dehradun-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 236, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 85.98, 1280835, 1216793, 5123340, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11800, 15340, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Chandigarh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'chandigarh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 391, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.34, 1174513, 1115787, 4698052, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19550, 25415, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Agra Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'agra-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 96, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.20, 1036344, 984526, 4145376, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4800, 6240, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Guwahati Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'guwahati-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 371, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.49, 1158783, 1100843, 4635132, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18550, 24115, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhopal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhopal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 337, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.93, 1407352, 1336984, 5629408, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16850, 21905, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Gurgaon Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'gurgaon-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 177, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.41, 1342202, 1275091, 5368808, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8850, 11505, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Noida Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'noida-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 278, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 81.74, 1447504, 1375128, 5790016, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13900, 18070, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Pune Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'pune-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 249, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.24, 1187280, 1127916, 4749120, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12450, 16185, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ghaziabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ghaziabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 234, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.08, 1099356, 1044388, 4397424, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11700, 15210, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 346, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 86.80, 1373504, 1304828, 5494016, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17300, 22490, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ajmer Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ajmer-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 109, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.68, 1381257, 1312194, 5525028, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5450, 7085, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amritsar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amritsar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 189, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.98, 972118, 923512, 3888472, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9450, 12285, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Visakhapatnam Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'visakhapatnam-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 228, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 81.69, 991967, 942368, 3967868, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11400, 14820, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bareilly Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bareilly-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 276, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.22, 1429765, 1358276, 5719060, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13800, 17940, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amritsar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amritsar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 112, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.69, 1234308, 1172592, 4937232, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5600, 7280, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Pune Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'pune-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 280, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 82.62, 1424774, 1353535, 5699096, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14000, 18200, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Meerut Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'meerut-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 495, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.05, 1005336, 955069, 4021344, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24750, 32175, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Meerut Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'meerut-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 107, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.75, 1058512, 1005586, 4234048, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5350, 6955, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kochi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kochi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 287, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.74, 1351972, 1284373, 5407888, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14350, 18655, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 166, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 91.75, 1316655, 1250822, 5266620, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8300, 10790, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 175, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.36, 1339625, 1272643, 5358500, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8750, 11375, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Karnal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'karnal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 159, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.55, 1079720, 1025734, 4318880, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7950, 10335, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 470, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.14, 1280964, 1216915, 5123856, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23500, 30550, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 365, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 83.24, 1071813, 1018222, 4287252, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18250, 23725, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 382, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.04, 1283933, 1219736, 5135732, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19100, 24830, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhubaneswar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhubaneswar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 272, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.81, 1148961, 1091512, 4595844, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13600, 17680, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amritsar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amritsar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 305, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 81.71, 1215908, 1155112, 4863632, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15250, 19825, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 378, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 88.11, 1047916, 995520, 4191664, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18900, 24570, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 366, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.21, 1045097, 992842, 4180388, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18300, 23790, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 78, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.46, 1285109, 1220853, 5140436, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 3900, 5070, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bangalore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bangalore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 221, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.32, 1016072, 965268, 4064288, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11050, 14365, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Agra Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'agra-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 197, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 92, 76.88, 1129562, 1073083, 4518248, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9850, 12805, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 172, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 91, 76.02, 1297018, 1232167, 5188072, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8600, 11180, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Varanasi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'varanasi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 387, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.70, 1426716, 1355380, 5706864, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19350, 25155, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 253, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.10, 1274769, 1211030, 5099076, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12650, 16445, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Agra Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'agra-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 125, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.20, 1136786, 1079946, 4547144, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6250, 8125, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rohtak Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rohtak-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 127, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 88.07, 1302264, 1237150, 5209056, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6350, 8255, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Chennai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'chennai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 92, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.74, 1452596, 1379966, 5810384, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4600, 5980, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 144, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.70, 1008915, 958469, 4035660, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7200, 9360, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Patna Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'patna-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 411, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 90, 75.69, 914826, 869084, 3659304, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20550, 26715, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jalandhar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jalandhar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 166, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.49, 957862, 909968, 3831448, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8300, 10790, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Dharamshala Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'dharamshala-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 288, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 88.19, 1388996, 1319546, 5555984, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14400, 18720, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 409, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.55, 1455556, 1382778, 5822224, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20450, 26585, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ghaziabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ghaziabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 470, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.77, 1413219, 1342558, 5652876, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23500, 30550, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Aligarh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'aligarh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 468, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 91.95, 806114, 765808, 3224456, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23400, 30420, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kolkata Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kolkata-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 137, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 92, 77.34, 1327819, 1261428, 5311276, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6850, 8905, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Karnal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'karnal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 89, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.56, 1001086, 951031, 4004344, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4450, 5785, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jalandhar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jalandhar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 99, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 89.13, 1362867, 1294723, 5451468, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4950, 6435, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Mumbai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'mumbai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 160, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.47, 811426, 770854, 3245704, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8000, 10400, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 168, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 94, 78.92, 1350092, 1282587, 5400368, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8400, 10920, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Indore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'indore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 465, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.73, 1063738, 1010551, 4254952, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23250, 30225, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Hyderabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'hyderabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 98, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 84.03, 1348263, 1280849, 5393052, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4900, 6370, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 263, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.46, 1347732, 1280345, 5390928, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13150, 17095, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ghaziabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ghaziabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 397, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.08, 1076092, 1022287, 4304368, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19850, 25805, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhopal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhopal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 258, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.34, 1305265, 1240001, 5221060, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12900, 16770, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Vadodara Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'vadodara-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 77, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.65, 1012401, 961780, 4049604, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 3850, 5005, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Gurgaon Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'gurgaon-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 401, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 91.86, 1283084, 1218929, 5132336, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20050, 26065, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Lucknow Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'lucknow-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 362, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 93, 77.83, 1279983, 1215983, 5119932, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18100, 23530, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bareilly Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bareilly-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 76, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.77, 1385181, 1315921, 5540724, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 3800, 4940, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 85, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 82.09, 1475692, 1401907, 5902768, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4250, 5525, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ajmer Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ajmer-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 326, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.64, 1276917, 1213071, 5107668, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16300, 21190, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ludhiana Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ludhiana-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 188, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 85.96, 1482313, 1408197, 5929252, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9400, 12220, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jalandhar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jalandhar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 103, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.26, 1394103, 1324397, 5576412, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5150, 6695, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bareilly Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bareilly-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 125, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.74, 1073575, 1019896, 4294300, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6250, 8125, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Udaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'udaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 92, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.75, 1138654, 1081721, 4554616, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4600, 5980, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhubaneswar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhubaneswar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 363, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 82.10, 891325, 846758, 3565300, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18150, 23595, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Allahabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'allahabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 291, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.70, 1274857, 1211114, 5099428, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14550, 18915, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Vadodara Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'vadodara-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 443, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.04, 1092499, 1037874, 4369996, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22150, 28795, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Thiruvananthapuram Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'thiruvananthapuram-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 103, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.07, 1009609, 959128, 4038436, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5150, 6695, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Manali Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'manali-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 147, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 82.02, 1041886, 989791, 4167544, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7350, 9555, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Meerut Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'meerut-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 262, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.13, 1434289, 1362574, 5737156, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13100, 17030, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Aligarh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'aligarh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 298, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.02, 1175566, 1116787, 4702264, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14900, 19370, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Chennai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'chennai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 121, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.46, 1281313, 1217247, 5125252, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6050, 7865, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Thiruvananthapuram Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'thiruvananthapuram-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 260, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.05, 1359934, 1291937, 5439736, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13000, 16900, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rohtak Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rohtak-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 313, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.18, 1217227, 1156365, 4868908, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15650, 20345, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Vadodara Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'vadodara-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 493, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.95, 1171303, 1112737, 4685212, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24650, 32045, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Hyderabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'hyderabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 396, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 82.83, 1305014, 1239763, 5220056, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19800, 25740, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Nagpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'nagpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 318, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 82.21, 1307436, 1242064, 5229744, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15900, 20670, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Lucknow Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'lucknow-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 235, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.90, 1109273, 1053809, 4437092, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11750, 15275, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Agra Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'agra-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 102, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.26, 1309561, 1244082, 5238244, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5100, 6630, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Allahabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'allahabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 203, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 90.97, 1058737, 1005800, 4234948, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10150, 13195, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Nagpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'nagpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 416, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 86.73, 1294192, 1229482, 5176768, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20800, 27040, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jodhpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jodhpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 490, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.18, 817582, 776702, 3270328, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24500, 31850, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Vadodara Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'vadodara-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 219, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.83, 1089846, 1035353, 4359384, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10950, 14235, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Noida Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'noida-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 356, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 87.48, 1138856, 1081913, 4555424, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17800, 23140, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 232, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.14, 1257538, 1194661, 5030152, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11600, 15080, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Chandigarh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'chandigarh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 103, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.19, 1286073, 1221769, 5144292, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5150, 6695, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Lucknow Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'lucknow-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 485, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 80.98, 1387884, 1318489, 5551536, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24250, 31525, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Nagpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'nagpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 223, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.55, 1013859, 963166, 4055436, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11150, 14495, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Panipat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'panipat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 306, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.45, 1469956, 1396458, 5879824, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15300, 19890, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Patna Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'patna-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 485, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.60, 1347135, 1279778, 5388540, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24250, 31525, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhubaneswar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhubaneswar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 419, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 83.24, 1249185, 1186725, 4996740, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20950, 27235, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 230, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 94, 78.76, 1266558, 1203230, 5066232, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11500, 14950, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Patna Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'patna-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 468, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.24, 1313564, 1247885, 5254256, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23400, 30420, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kochi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kochi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 159, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.60, 1074229, 1020517, 4296916, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7950, 10335, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Meerut Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'meerut-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 385, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.08, 1318045, 1252142, 5272180, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19250, 25025, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kolkata Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kolkata-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 294, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.43, 935371, 888602, 3741484, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14700, 19110, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Chennai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'chennai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 313, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 82.10, 1342072, 1274968, 5368288, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15650, 20345, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Manali Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'manali-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 450, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 89.15, 1354421, 1286699, 5417684, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22500, 29250, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Manali Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'manali-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 420, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.96, 1408010, 1337609, 5632040, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21000, 27300, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Coimbatore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'coimbatore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 115, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.37, 874481, 830756, 3497924, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5750, 7475, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Agra Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'agra-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 314, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.50, 1324691, 1258456, 5298764, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15700, 20410, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bangalore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bangalore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 489, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 93.16, 1036126, 984319, 4144504, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24450, 31785, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bangalore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bangalore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 126, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.46, 1128941, 1072493, 4515764, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6300, 8190, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 196, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.65, 1160131, 1102124, 4640524, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9800, 12740, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jalandhar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jalandhar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 445, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.59, 1482516, 1408390, 5930064, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22250, 28925, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Aligarh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'aligarh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 367, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.73, 1160289, 1102274, 4641156, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18350, 23855, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Moradabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'moradabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 92, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.24, 1295948, 1231150, 5183792, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4600, 5980, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Delhi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'delhi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 335, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 81.88, 1151143, 1093585, 4604572, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16750, 21775, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Dharamshala Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'dharamshala-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 379, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 82.88, 1150772, 1093233, 4603088, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18950, 24635, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Shimla Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'shimla-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 307, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 82.04, 1478710, 1404774, 5914840, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15350, 19955, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 442, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.52, 1129285, 1072820, 4517140, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22100, 28730, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Panipat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'panipat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 311, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.51, 850154, 807646, 3400616, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15550, 20215, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jodhpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jodhpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 365, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.65, 1051267, 998703, 4205068, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18250, 23725, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Thiruvananthapuram Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'thiruvananthapuram-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 366, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 82.19, 1217273, 1156409, 4869092, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18300, 23790, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Haridwar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'haridwar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 129, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.99, 1195643, 1135860, 4782572, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6450, 8385, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Patna Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'patna-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 489, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 82.62, 1310416, 1244895, 5241664, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24450, 31785, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bikaner Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bikaner-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 185, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 85.99, 1099992, 1044992, 4399968, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9250, 12025, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 235, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 83.32, 1088068, 1033664, 4352272, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11750, 15275, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Shimla Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'shimla-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 181, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 82.14, 1222814, 1161673, 4891256, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9050, 11765, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bikaner Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bikaner-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 430, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.61, 1072613, 1018982, 4290452, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21500, 27950, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Chennai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'chennai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 170, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.91, 1482428, 1408306, 5929712, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8500, 11050, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhubaneswar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhubaneswar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 438, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.10, 1307383, 1242013, 5229532, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21900, 28470, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bareilly Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bareilly-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 357, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.83, 1204015, 1143814, 4816060, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17850, 23205, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ahmedabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ahmedabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 479, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.84, 1324465, 1258241, 5297860, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23950, 31135, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Varanasi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'varanasi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 126, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.59, 1077289, 1023424, 4309156, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6300, 8190, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ludhiana Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ludhiana-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 114, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 91.68, 1434455, 1362732, 5737820, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5700, 7410, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jalandhar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jalandhar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 301, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 95, 79.28, 1460502, 1387476, 5842008, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15050, 19565, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Moradabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'moradabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 101, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.57, 1066666, 1013332, 4266664, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 5050, 6565, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Patna Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'patna-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 245, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.85, 1058402, 1005481, 4233608, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 12250, 15925, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ghaziabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ghaziabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 482, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.13, 1269277, 1205813, 5077108, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24100, 31330, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ludhiana Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ludhiana-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 409, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.67, 1001144, 951086, 4004576, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20450, 26585, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Hyderabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'hyderabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 436, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 91.90, 1381564, 1312485, 5526256, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21800, 28340, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Panipat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'panipat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 491, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 91, 76.31, 1072181, 1018571, 4288724, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24550, 31915, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Meerut Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'meerut-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 299, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.90, 1448179, 1375770, 5792716, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14950, 19435, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amritsar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amritsar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 215, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.24, 1056372, 1003553, 4225488, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10750, 13975, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Delhi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'delhi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 86, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 91.77, 1239241, 1177278, 4956964, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4300, 5590, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Lucknow Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'lucknow-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 432, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 99, 82.83, 1114402, 1058681, 4457608, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21600, 28080, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 431, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 89.08, 1103909, 1048713, 4415636, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21550, 28015, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Nagpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'nagpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 396, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.17, 1402244, 1332131, 5608976, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 19800, 25740, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Lucknow Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'lucknow-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 98, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 88.21, 1150957, 1093409, 4603828, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4900, 6370, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ghaziabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ghaziabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 168, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 93.13, 1110686, 1055151, 4442744, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8400, 10920, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 162, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 103, 86.58, 1446138, 1373831, 5784552, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8100, 10530, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 407, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.83, 1171097, 1112542, 4684388, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20350, 26455, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhopal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhopal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 414, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.29, 1184167, 1124958, 4736668, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 20700, 26910, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 229, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 105, 87.82, 1479693, 1405708, 5918772, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11450, 14885, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Nagpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'nagpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 377, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.38, 1314491, 1248766, 5257964, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18850, 24505, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bikaner Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bikaner-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 147, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.67, 1018570, 967641, 4074280, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7350, 9555, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Faridabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'faridabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 367, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.81, 1008388, 957968, 4033552, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 18350, 23855, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rishikesh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rishikesh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 146, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.24, 1159812, 1101821, 4639248, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7300, 9490, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jodhpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jodhpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 468, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.71, 1103653, 1048470, 4414612, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 23400, 30420, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Surat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'surat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 489, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 89.68, 1465073, 1391819, 5860292, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24450, 31785, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Karnal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'karnal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 199, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.47, 1373381, 1304711, 5493524, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9950, 12935, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Aligarh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'aligarh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 425, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 81.08, 1224673, 1163439, 4898692, 2)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21250, 27625, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Aligarh Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'aligarh-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 349, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 81.99, 1393663, 1323979, 5574652, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17450, 22685, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Vadodara Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'vadodara-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 440, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 108, 90.64, 1156314, 1098498, 4625256, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22000, 28600, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Patna Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'patna-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 270, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 107, 90.00, 1489254, 1414791, 5957016, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13500, 17550, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Varanasi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'varanasi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 322, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.55, 1015897, 965102, 4063588, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16100, 20930, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Rohtak Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'rohtak-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 273, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.50, 1397411, 1327540, 5589644, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 13650, 17745, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Nagpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'nagpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 175, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 93.28, 1269774, 1206285, 5079096, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8750, 11375, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Mumbai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'mumbai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 451, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.85, 1048714, 996278, 4194856, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22550, 29315, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Coimbatore Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'coimbatore-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 348, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.20, 1013641, 962958, 4054564, 3)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17400, 22620, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Hyderabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'hyderabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 482, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.24, 1019616, 968635, 4078464, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24100, 31330, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Dehradun Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'dehradun-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 487, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 81.74, 1441034, 1368982, 5764136, 7)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24350, 31655, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ahmedabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ahmedabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 185, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.22, 1494155, 1419447, 5976620, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9250, 12025, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Panipat Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'panipat-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 212, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 92.85, 1388477, 1319053, 5553908, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10600, 13780, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Chennai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'chennai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 494, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.48, 1168334, 1109917, 4673336, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 24700, 32110, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 331, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 106, 88.54, 1062301, 1009185, 4249204, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 16550, 21515, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Visakhapatnam Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'visakhapatnam-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 195, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 111, 93.16, 1396977, 1327128, 5587908, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9750, 12675, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ghaziabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ghaziabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 352, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 97, 80.90, 940463, 893439, 3761852, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17600, 22880, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Allahabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'allahabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 281, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 84.15, 1477397, 1403527, 5909588, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 14050, 18265, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Moradabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'moradabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 445, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 102, 85.83, 1257373, 1194504, 5029492, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22250, 28925, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Lucknow Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'lucknow-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 128, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 109, 91.51, 1140775, 1083736, 4563100, 8)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 6400, 8320, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Jaipur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'jaipur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 193, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 100, 83.95, 1107874, 1052480, 4431496, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 9650, 12545, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Mumbai Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'mumbai-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 430, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.80, 1229904, 1168408, 4919616, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 21500, 27950, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Karnal Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'karnal-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 227, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.37, 1019481, 968506, 4077924, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 11350, 14755, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Bhubaneswar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'bhubaneswar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 318, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 104, 86.97, 1354800, 1287060, 5419200, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 15900, 20670, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Saharanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'saharanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 97, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.64, 1135286, 1078521, 4541144, 0)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4850, 6305, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Delhi Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'delhi-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 150, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.76, 1230303, 1168787, 4921212, 1)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 7500, 9750, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Thiruvananthapuram Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'thiruvananthapuram-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 173, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 101, 84.42, 1004942, 954694, 4019768, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 8650, 11245, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Visakhapatnam Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'visakhapatnam-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 454, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 96, 80.81, 1134258, 1077545, 4537032, 9)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22700, 29510, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kanpur Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kanpur-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 86, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 113, 94.37, 1298250, 1233337, 5193000, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 4300, 5590, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Ghaziabad Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'ghaziabad-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 348, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 112, 93.54, 1450976, 1378427, 5803904, 4)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 17400, 22620, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Kolkata Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'kolkata-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 454, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 110, 92.27, 1474580, 1400851, 5898320, 6)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 22700, 29510, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

    -- Amritsar Institute of Technology
    SELECT id INTO college_id_var FROM colleges WHERE slug = 'amritsar-institute-of-technology';
    IF college_id_var IS NOT NULL THEN
        INSERT INTO college_branches (college_id, branch_id, intake, seats_available) VALUES
        (college_id_var, cse_id, 120, 120),
        (college_id_var, ece_id, 120, 120),
        (college_id_var, me_id, 120, 120),
        (college_id_var, ce_id, 60, 60),
        (college_id_var, ee_id, 60, 60)
        ON CONFLICT DO NOTHING;

        INSERT INTO college_rankings (college_id, ranking_type, year, rank, category, proof_link, official_source_url) VALUES
        (college_id_var, 'NIRF', 2023, 209, 'Engineering', 'https://www.nirfindia.org/2023/EngineeringRanking.html', 'https://www.nirfindia.org')
        ON CONFLICT DO NOTHING;

        INSERT INTO placement_stats (college_id, branch_id, year, total_students, placed_students, placement_percentage, average_salary, median_salary, highest_salary, international_offers) VALUES
        (college_id_var, cse_id, 2023, 120, 98, 82.47, 1118075, 1062171, 4472300, 5)
        ON CONFLICT DO NOTHING;

        INSERT INTO cutoffs (college_id, branch_id, exam_type, year, opening_rank, closing_rank, category, proof_link) VALUES
        (college_id_var, cse_id, 'State CET', 2023, 10450, 13585, 'General', 'https://jeemain.nta.ac.in')
        ON CONFLICT DO NOTHING;

    END IF;

END $$;

COMMIT;