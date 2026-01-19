# ⚡ Quick Deploy to Vercel - 5 Minutes

## 🚀 Fast Track Deployment

### 1️⃣ Push to GitHub (2 min)
```bash
git init
git add .
git commit -m "Deploy college website"
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

### 2️⃣ Deploy on Vercel (2 min)
1. Go to https://vercel.com
2. Sign up with GitHub
3. Click "New Project"
4. Import your repository
5. Add these environment variables:

```
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJxxxx...
SUPABASE_SERVICE_ROLE_KEY=eyJxxxx...
```

6. Click "Deploy"

### 3️⃣ Done! (1 min)
✅ Your site is live at: `https://your-project.vercel.app`

---

## 📋 Environment Variables Checklist

**Required:**
- [ ] `NEXT_PUBLIC_SUPABASE_URL`
- [ ] `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- [ ] `SUPABASE_SERVICE_ROLE_KEY`

**Optional:**
- [ ] `OPENROUTER_API_KEY`
- [ ] `NEXT_PUBLIC_GOOGLE_PLACES_API_KEY`

---

## 🔄 Update Your Site

```bash
# Make changes
git add .
git commit -m "Your update message"
git push

# Vercel auto-deploys in 2-3 minutes!
```

---

## 🆘 Quick Fixes

**Build fails?**
```bash
npm run build  # Test locally first
```

**Database not connecting?**
- Check env vars in Vercel dashboard
- Verify Supabase allows your Vercel URL

**Images not loading?**
- Already configured in `next.config.js` ✅

---

## 📱 Share Your Site

Your live URL: `https://your-project-name.vercel.app`

🎉 **That's it! Your site is live!**

For detailed guide, see: `VERCEL_DEPLOYMENT_GUIDE.md`
