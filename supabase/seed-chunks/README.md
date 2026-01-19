# Seed Data Chunks

This directory contains the seed data split into manageable chunks for Supabase SQL Editor.

## Total: 500 colleges in 10 chunks

## How to Import:

### Step 1: Import College Chunks
Run these files **in order** (001, 002, 003, ...) in Supabase SQL Editor:
- seed-chunk-001.sql
- seed-chunk-002.sql
- seed-chunk-003.sql
- seed-chunk-004.sql
- seed-chunk-005.sql
- seed-chunk-006.sql
- seed-chunk-007.sql
- seed-chunk-008.sql
- seed-chunk-009.sql
- seed-chunk-010.sql

### Step 2: Import Relationships
After all chunks are imported, run:
- seed-relationships.sql

This will add:
- College-branch relationships
- NIRF rankings
- Placement statistics
- Cutoff data

## Notes:
- Each chunk contains ~50 colleges
- Files are safe to run multiple times (uses ON CONFLICT DO NOTHING)
- Make sure branches (CSE, ECE, ME, CE, EE) exist before running relationships
