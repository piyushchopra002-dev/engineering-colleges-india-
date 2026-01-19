# How to Add Sample Data to Your Database

## Step 1: Open Supabase SQL Editor

1. Go to your Supabase dashboard: https://supabase.com/dashboard
2. Select your project
3. Click on **SQL Editor** in the left sidebar
4. Click **New Query**

## Step 2: Copy and Run the Seed Data

1. Open the file `supabase/seed-data.sql` from your project folder
2. Copy **ALL** the content (Ctrl+A, then Ctrl+C)
3. Paste it into the Supabase SQL Editor
4. Click **Run** (or press Ctrl+Enter)
5. Wait for "Success" message

## What Data Will Be Added

✅ **6 Engineering Colleges:**
- IIT Bombay
- IIT Delhi
- IIT Madras
- NIT Trichy
- VIT Vellore
- BITS Pilani

✅ **8 Engineering Branches:**
- CSE, ECE, ME, CE, EE, IT, CS, EEE

✅ **12 Companies:**
- Google, Microsoft, Amazon, Apple, Meta, Adobe, etc.

✅ **College Data:**
- Rankings (NIRF 2023)
- Placement statistics
- Cutoffs (JEE Main/Advanced)
- Infrastructure details
- Library information
- Transport & accessibility
- Faculty profiles
- Achievements
- Events (Techfest, Cultural fests)
- City attractions

✅ **Placement Records:**
- Company-wise placement data
- Salary information
- Branch-wise statistics

## Step 3: Verify Data

After running the SQL:

1. Go to **Table Editor** in Supabase
2. Click on **colleges** table
3. You should see 6 colleges listed
4. Check other tables like:
   - `branches` - 8 branches
   - `companies` - 12 companies
   - `faculty` - Sample faculty members
   - `college_rankings` - Ranking data
   - `placement_stats` - Placement statistics

## Step 4: View on Website

1. Make sure your dev server is running: `npm run dev`
2. Visit: http://localhost:3000/colleges
3. You should now see the 6 colleges with all their data!

## Troubleshooting

**If you get errors:**
- Make sure you ran the main schema first (`supabase/schema.sql`)
- Check for duplicate key errors (some data might already exist)
- The script uses `ON CONFLICT DO NOTHING` so it's safe to run multiple times

**If tables are empty:**
- Check the SQL Editor for any error messages
- Verify all tables were created from the main schema
- Try running the seed data again

## Next Steps

After adding the data, you can:
- View colleges at: http://localhost:3000/colleges
- Compare colleges at: http://localhost:3000/compare
- Check individual college pages (e.g., /colleges/iit-bombay)
- Add more data through the admin panel or directly in Supabase
