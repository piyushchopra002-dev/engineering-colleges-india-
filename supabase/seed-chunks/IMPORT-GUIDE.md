# 📚 Import Guide: 500 Colleges Seed Data

## 📁 All Files Location
All files are in: `supabase/seed-chunks/`

## 📋 Import Order (Run these in Supabase SQL Editor)

### Step 1: Import Colleges (Run in order 001 → 010)

1. **seed-chunk-001.sql** (50 colleges)
   - Path: `supabase/seed-chunks/seed-chunk-001.sql`
   - Colleges: 1-50

2. **seed-chunk-002.sql** (50 colleges)
   - Path: `supabase/seed-chunks/seed-chunk-002.sql`
   - Colleges: 51-100

3. **seed-chunk-003.sql** (50 colleges)
   - Path: `supabase/seed-chunks/seed-chunk-003.sql`
   - Colleges: 101-150

4. **seed-chunk-004.sql** (50 colleges)
   - Path: `supabase/seed-chunks/seed-chunk-004.sql`
   - Colleges: 151-200

5. **seed-chunk-005.sql** (50 colleges)
   - Path: `supabase/seed-chunks/seed-chunk-005.sql`
   - Colleges: 201-250

6. **seed-chunk-006.sql** (50 colleges)
   - Path: `supabase/seed-chunks/seed-chunk-006.sql`
   - Colleges: 251-300

7. **seed-chunk-007.sql** (50 colleges)
   - Path: `supabase/seed-chunks/seed-chunk-007.sql`
   - Colleges: 301-350

8. **seed-chunk-008.sql** (50 colleges)
   - Path: `supabase/seed-chunks/seed-chunk-008.sql`
   - Colleges: 351-400

9. **seed-chunk-009.sql** (50 colleges)
   - Path: `supabase/seed-chunks/seed-chunk-009.sql`
   - Colleges: 401-450

10. **seed-chunk-010.sql** (50 colleges)
    - Path: `supabase/seed-chunks/seed-chunk-010.sql`
    - Colleges: 451-500

### Step 2: Import Relationships (Run AFTER all chunks)

11. **seed-relationships.sql** (Relationships, Rankings, Placements, Cutoffs)
    - Path: `supabase/seed-chunks/seed-relationships.sql`
    - ⚠️ Run this LAST, after all 10 chunks are imported

## 🚀 Quick Import Steps

1. Open Supabase Dashboard → Your Project → SQL Editor
2. Open each chunk file (001-010) in order
3. Copy contents → Paste in SQL Editor → Run
4. After all 10 chunks, run `seed-relationships.sql`

## 📊 Summary

- **Total Colleges**: 500
- **Total Chunks**: 10 (50 colleges each)
- **Relationships File**: 1 (links all data)

## ✅ Verification

After importing, check your database:
```sql
SELECT COUNT(*) FROM colleges;
-- Should return 500 (or 506 if you already had 6)
```
