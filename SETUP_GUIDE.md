# Quick Setup Guide

## Step 1: Set Up Supabase (Database)

1. Go to https://supabase.com and sign up/login
2. Click "New Project"
3. Fill in:
   - Project Name: "Engineering Colleges"
   - Database Password: (choose a strong password - save it!)
   - Region: Choose closest to you
4. Wait for project to be created (2-3 minutes)

5. Get your API keys:
   - Go to Project Settings → API
   - Copy "Project URL" → paste in `.env.local` as `NEXT_PUBLIC_SUPABASE_URL`
   - Copy "anon public" key → paste as `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - Copy "service_role" key → paste as `SUPABASE_SERVICE_ROLE_KEY`

6. Set up the database:
   - Go to SQL Editor in Supabase dashboard
   - Click "New Query"
   - Open `supabase/schema.sql` from this project
   - Copy ALL the SQL code
   - Paste into Supabase SQL Editor
   - Click "Run" (or press Ctrl+Enter)
   - Wait for "Success" message

## Step 2: Set Up OpenRouter (AI Chat - Optional)

1. Go to https://openrouter.ai
2. Sign up/login
3. Go to Keys page: https://openrouter.ai/keys
4. Click "Create Key"
5. Copy the API key
6. Paste in `.env.local` as `OPENROUTER_API_KEY`

**Note:** You can skip this if you don't need AI chat features right now.

## Step 3: Set Up Google Places API (Maps - Optional)

1. Go to https://console.cloud.google.com
2. Sign up/login (use Google account)
3. Create a new project (or select existing)
4. Enable APIs:
   - Go to "APIs & Services" → "Library"
   - Search for "Places API"
   - Click "Enable"
   - Also enable "Maps JavaScript API"
5. Create API Key:
   - Go to "APIs & Services" → "Credentials"
   - Click "Create Credentials" → "API Key"
   - Copy the key
   - Paste in `.env.local` as `NEXT_PUBLIC_GOOGLE_PLACES_API_KEY`

**Note:** You can skip this if you don't need maps features right now.

## Step 4: Update .env.local File

1. Open `.env.local` file in your project
2. Replace all the placeholder values with your actual keys:
   - `your_supabase_url_here` → Your Supabase URL
   - `your_supabase_anon_key_here` → Your Supabase anon key
   - `your_supabase_service_role_key_here` → Your Supabase service role key
   - `your_openrouter_api_key_here` → Your OpenRouter key (or leave empty)
   - `your_google_places_api_key_here` → Your Google API key (or leave empty)

## Step 5: Restart the Server

After updating `.env.local`:
1. Stop the server (Ctrl+C in terminal)
2. Run `npm run dev` again
3. Open http://localhost:3000

## Quick Start (Minimum Setup)

**Minimum to get started:**
- ✅ Supabase setup (REQUIRED)
- ⏭️ OpenRouter (can add later)
- ⏭️ Google Places (can add later)

The website will work with just Supabase! Other features will show "not configured" messages.

## Troubleshooting

**"Missing Supabase environment variables" error:**
- Make sure `.env.local` exists in project root
- Check that all Supabase keys are filled in
- Restart the dev server after changing `.env.local`

**Database errors:**
- Make sure you ran the SQL schema in Supabase
- Check that all tables were created (go to Table Editor in Supabase)

**Can't access localhost:3000:**
- Make sure `npm run dev` is running
- Check terminal for errors
- Try a different port if 3000 is busy

## Need Help?

- Supabase Docs: https://supabase.com/docs
- OpenRouter Docs: https://openrouter.ai/docs
- Google Maps Docs: https://developers.google.com/maps/documentation
