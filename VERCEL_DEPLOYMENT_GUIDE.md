# 🚀 Deploy to Vercel - Complete Guide

## Prerequisites

✅ GitHub account (to store your code)
✅ Vercel account (free - sign up at https://vercel.com)
✅ Supabase project (for your database)
✅ Your project working locally

---

## Step 1: Prepare Your Project

### 1.1 Create a `.env.example` file

Create this file in your project root to show what environment variables are needed:

```bash
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url_here
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key_here
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key_here

# OpenRouter AI (Optional)
OPENROUTER_API_KEY=your_openrouter_key_here

# Google Places API (Optional)
NEXT_PUBLIC_GOOGLE_PLACES_API_KEY=your_google_places_key_here
```

### 1.2 Verify `.gitignore` includes

Make sure your `.gitignore` file includes:
```
.env.local
.env*.local
.env
.vercel
```

### 1.3 Check `package.json` scripts

Your `package.json` should have these scripts (already present):
```json
{
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  }
}
```

---

## Step 2: Push to GitHub

### 2.1 Initialize Git (if not done)

```bash
git init
git add .
git commit -m "Initial commit - College Project"
```

### 2.2 Create GitHub Repository

1. Go to https://github.com
2. Click "New Repository"
3. Name it: `engineering-colleges-india` (or any name)
4. **Don't** initialize with README (you already have code)
5. Click "Create repository"

### 2.3 Push Your Code

```bash
# Replace with your GitHub username and repo name
git remote add origin https://github.com/YOUR_USERNAME/engineering-colleges-india.git
git branch -M main
git push -u origin main
```

---

## Step 3: Deploy to Vercel

### 3.1 Sign Up / Log In to Vercel

1. Go to https://vercel.com
2. Click "Sign Up" or "Log In"
3. Choose "Continue with GitHub"
4. Authorize Vercel to access your repositories

### 3.2 Import Your Project

1. Click "Add New..." → "Project"
2. Find your repository: `engineering-colleges-india`
3. Click "Import"

### 3.3 Configure Project Settings

**Framework Preset:** Next.js (auto-detected)

**Root Directory:** `./` (leave as is)

**Build Command:** `next build` (default)

**Output Directory:** `.next` (default)

**Install Command:** `npm install` (default)

---

## Step 4: Set Environment Variables

### 4.1 Get Your Supabase Credentials

1. Go to your Supabase project dashboard
2. Click "Settings" → "API"
3. Copy these values:
   - **Project URL** → `NEXT_PUBLIC_SUPABASE_URL`
   - **anon public** key → `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - **service_role** key → `SUPABASE_SERVICE_ROLE_KEY`

### 4.2 Add to Vercel

In the Vercel project settings, add these **Environment Variables**:

```
Name: NEXT_PUBLIC_SUPABASE_URL
Value: https://your-project-id.supabase.co

Name: NEXT_PUBLIC_SUPABASE_ANON_KEY
Value: your_anon_key_here

Name: SUPABASE_SERVICE_ROLE_KEY
Value: your_service_role_key_here
```

**Important:** Make sure all three environments are selected:
- ✅ Production
- ✅ Preview
- ✅ Development

### 4.3 Optional API Keys

If you're using these features, add:

```
Name: OPENROUTER_API_KEY
Value: your_openrouter_key

Name: NEXT_PUBLIC_GOOGLE_PLACES_API_KEY
Value: your_google_places_key
```

---

## Step 5: Deploy!

1. Click **"Deploy"** button
2. Wait 2-5 minutes for build to complete
3. You'll see a success screen with your live URL!

Your site will be at: `https://your-project-name.vercel.app`

---

## Step 6: Configure Custom Domain (Optional)

### 6.1 Add Domain in Vercel

1. Go to Project Settings → Domains
2. Click "Add Domain"
3. Enter your domain: `example.com`
4. Click "Add"

### 6.2 Update DNS Records

Add these records in your domain registrar (GoDaddy, Namecheap, etc.):

**For root domain (example.com):**
```
Type: A
Name: @
Value: 76.76.21.21
```

**For www subdomain:**
```
Type: CNAME
Name: www
Value: cname.vercel-dns.com
```

**Wait 24-48 hours** for DNS propagation.

---

## Step 7: Update Supabase Settings

### 7.1 Add Vercel Domain to Supabase

1. Go to Supabase Dashboard
2. Settings → API → URL Configuration
3. Add your Vercel URLs to allowed domains:
   - `https://your-project.vercel.app`
   - `https://your-custom-domain.com` (if using custom domain)

### 7.2 Update Database URLs (if needed)

In your Supabase dashboard:
1. Go to Settings → API
2. Update "Site URL" to your Vercel URL
3. Add Vercel URL to "Redirect URLs"

---

## 🎉 Your Site is Live!

Visit your URL: **https://your-project.vercel.app**

---

## 🔄 Automatic Deployments

Now, whenever you push code to GitHub:

```bash
git add .
git commit -m "Update website"
git push
```

Vercel will **automatically**:
1. Detect the push
2. Build your project
3. Deploy the changes
4. Your site updates in 2-3 minutes! 🚀

---

## 🐛 Troubleshooting

### Build Fails

**Error: "Module not found"**
```bash
# Locally, run:
npm install
git add package-lock.json
git commit -m "Update dependencies"
git push
```

**Error: "Environment variable not found"**
- Check all required env vars are added in Vercel
- Make sure they're enabled for "Production"
- Redeploy from Vercel dashboard

### Database Connection Issues

**Error: "Failed to connect to Supabase"**
1. Verify environment variables are correct
2. Check Supabase URL allows your Vercel domain
3. Ensure service role key has proper permissions

### Images Not Loading

**Error: "Invalid src prop"**
1. Check `next.config.js` has proper image domains
2. Verify image URLs are accessible
3. Check Supabase storage permissions (if using)

### Performance Issues

**Slow loading times:**
1. Enable Edge Functions in Vercel
2. Use Image Optimization (already enabled)
3. Check Supabase query performance
4. Consider adding Redis cache

---

## 📊 Monitor Your Deployment

### Vercel Analytics (Recommended)

1. Go to your Vercel project
2. Click "Analytics" tab
3. Enable Analytics (free tier available)
4. Track:
   - Page views
   - User locations
   - Performance metrics
   - Error rates

### Check Build Logs

If something goes wrong:
1. Go to Vercel Dashboard
2. Click on your deployment
3. Click "View Function Logs"
4. Check for errors

---

## ⚙️ Advanced Configuration

### Custom Build Settings

Create `vercel.json` in your project root:

```json
{
  "buildCommand": "npm run build",
  "devCommand": "npm run dev",
  "installCommand": "npm install",
  "framework": "nextjs",
  "regions": ["iad1"],
  "functions": {
    "app/api/**/*.ts": {
      "memory": 1024,
      "maxDuration": 10
    }
  }
}
```

### Environment-Specific Variables

For different environments:

**Production Only:**
```
NEXT_PUBLIC_SITE_URL=https://your-domain.com
```

**Preview/Development:**
```
NEXT_PUBLIC_SITE_URL=https://preview.vercel.app
```

---

## 🔒 Security Best Practices

### 1. Protect API Routes

Your API routes are already protected with proper authentication.

### 2. Hide Sensitive Data

✅ Never commit `.env.local` to Git
✅ Use Vercel environment variables
✅ Rotate keys regularly

### 3. Enable CORS Protection

Already configured in your middleware.

### 4. Rate Limiting

Consider adding rate limiting for API routes (optional).

---

## 📈 Performance Optimization

Your site already has:
✅ Image optimization
✅ Automatic code splitting
✅ Edge caching
✅ Gzip compression

### Additional Optimizations:

1. **Enable Edge Functions**
   - Go to Project Settings → Functions
   - Select Edge Runtime for faster responses

2. **Use Incremental Static Regeneration**
   - Already configured in your college pages
   - Updates data without full rebuilds

3. **Monitor Core Web Vitals**
   - Check Vercel Analytics
   - Optimize images that score poorly
   - Reduce JavaScript bundle size

---

## 🎯 Quick Deployment Checklist

Before deploying, verify:

- [ ] All environment variables are set
- [ ] `.gitignore` includes `.env.local`
- [ ] Database is populated with college data
- [ ] Images are loading correctly locally
- [ ] No console errors in browser
- [ ] Build succeeds locally (`npm run build`)
- [ ] All API keys are valid
- [ ] Supabase allows your domain
- [ ] Custom domain DNS is configured (if using)

---

## 🆘 Need Help?

### Vercel Support
- Documentation: https://vercel.com/docs
- Community: https://github.com/vercel/next.js/discussions
- Discord: https://discord.gg/vercel

### Common Commands

```bash
# Test build locally
npm run build
npm start

# Check for errors
npm run lint

# Pull environment variables from Vercel
vercel env pull

# Deploy to preview
vercel

# Deploy to production
vercel --prod
```

---

## 🎊 Success!

Your college website is now live on Vercel! 🚀

**Share your site:**
- Add to your resume/portfolio
- Share on LinkedIn
- Submit to college forums
- Get user feedback

**Next steps:**
1. Monitor analytics
2. Add more colleges
3. Improve SEO
4. Gather user feedback
5. Iterate and improve!

---

**Your live site:** `https://your-project.vercel.app` 🌐

**Congratulations on your deployment!** 🎉
