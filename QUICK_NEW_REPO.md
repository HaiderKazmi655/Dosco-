# Quick Guide: Create New GitHub Repository

## Current Situation
Your files are in the `Dosco-main` subfolder, and you want to create a fresh repository where all files are at the root.

## Easiest Method: Use the Script

1. **Run the setup script:**
   ```powershell
   .\setup-fresh-repo.ps1
   ```

2. **Follow the prompts** - it will:
   - Navigate to the Dosco-main folder
   - Remove old git
   - Initialize new repository
   - Help you push to GitHub

## Manual Method

### Step 1: Navigate to Project Folder
```powershell
cd Dosco-main
```

### Step 2: Remove Old Git
```powershell
Remove-Item -Recurse -Force .git -ErrorAction SilentlyContinue
```

### Step 3: Initialize New Repository
```powershell
git init
git branch -M main
git config user.name "HaiderKazmi655"
git config user.email "HaiderKazmi655@users.noreply.github.com"
```

### Step 4: Add and Commit
```powershell
git add .
git commit -m "Initial commit: Discord clone with auto-friend feature"
```

### Step 5: Create GitHub Repository

1. Go to: https://github.com/new
2. Repository name: `Dosco` (or your choice)
3. **DO NOT** check:
   - ❌ Add README
   - ❌ Add .gitignore  
   - ❌ Add license
4. Click "Create repository"

### Step 6: Push to GitHub

```powershell
# Replace 'Dosco' with your repo name
git remote add origin https://github.com/HaiderKazmi655/Dosco.git
git push -u origin main
```

**If authentication fails, use token:**
```powershell
git remote set-url origin https://HaiderKazmi655:YOUR_TOKEN@github.com/HaiderKazmi655/Dosco.git
git push -u origin main
git remote set-url origin https://github.com/HaiderKazmi655/Dosco.git
```

## Verify Structure

After pushing, your GitHub repo should have:
- ✅ `package.json` at root
- ✅ `src/` folder at root
- ✅ `public/` folder at root
- ✅ All files at root level (not nested)

## Deploy to Vercel

1. Import new repository in Vercel
2. **Root Directory:** Leave empty (files are at root)
3. Add environment variables
4. Deploy!

