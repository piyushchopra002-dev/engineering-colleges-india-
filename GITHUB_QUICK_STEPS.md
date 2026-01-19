# 🚀 GitHub Upload - Quick Steps

## ✅ Checklist (Copy & Paste These Commands)

### Step 1: Open PowerShell in Your Project Folder
```
Location: C:\Users\chopr\OneDrive\Desktop\college project
```

### Step 2: Run These Commands (One by One)

```bash
# Check if Git is installed
git --version
```
✅ If you see a version number, continue. ❌ If error, install Git from https://git-scm.com

```bash
# Configure Git (First time only - replace with YOUR info)
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

```bash
# Initialize Git
git init
```

```bash
# Add all files
git add .
```

```bash
# Create first commit
git commit -m "Initial commit - College website"
```

```bash
# Connect to GitHub (Replace YOUR_USERNAME and REPO_NAME)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git
```

```bash
# Rename branch to main
git branch -M main
```

```bash
# Upload to GitHub
git push -u origin main
```

---

## 📋 Before Running Commands

### 1. Create GitHub Repository
1. Go to https://github.com
2. Click **"+"** → **"New repository"**
3. Name: `engineering-colleges-india`
4. Make it **Public** or **Private**
5. **DON'T** check any boxes
6. Click **"Create repository"**
7. **Keep the page open** - you'll need the URL!

### 2. Copy Your Repository URL
From the GitHub page, copy the URL that looks like:
```
https://github.com/YOUR_USERNAME/engineering-colleges-india.git
```

---

## 🎯 After Upload

Visit your repository:
```
https://github.com/YOUR_USERNAME/engineering-colleges-india
```

You should see all your files! 🎉

---

## 🔄 To Update Later

```bash
git add .
git commit -m "Describe your changes here"
git push
```

---

## 🆘 If Password Doesn't Work

You need a **Personal Access Token**:

1. GitHub → Settings → Developer settings
2. Personal access tokens → Tokens (classic)
3. Generate new token
4. Check **"repo"** box
5. Generate and **COPY** the token
6. Use token as password when pushing

---

## 📞 Need More Help?

See the full guide: **`GITHUB_UPLOAD_GUIDE.md`**

---

**Quick Reference:**
- Full Guide: `GITHUB_UPLOAD_GUIDE.md`
- Deploy to Vercel: `QUICK_DEPLOY.md`
- Vercel Details: `VERCEL_DEPLOYMENT_GUIDE.md`
