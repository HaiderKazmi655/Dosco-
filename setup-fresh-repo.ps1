# Setup Fresh GitHub Repository
# Run this from: c:\Users\Haider\Downloads\Dosco-main

Write-Host "=== Setting Up Fresh GitHub Repository ===" -ForegroundColor Cyan
Write-Host ""

# Navigate to project folder
$projectPath = Join-Path $PWD "Dosco-main"

if (-not (Test-Path $projectPath)) {
    Write-Host "ERROR: Dosco-main folder not found!" -ForegroundColor Red
    Write-Host "Current directory: $PWD" -ForegroundColor Yellow
    exit 1
}

Write-Host "Project folder: $projectPath" -ForegroundColor Green
Set-Location $projectPath

# Check for package.json
if (-not (Test-Path "package.json")) {
    Write-Host "ERROR: package.json not found in Dosco-main folder!" -ForegroundColor Red
    exit 1
}

Write-Host "✓ Found package.json" -ForegroundColor Green
Write-Host ""

# Remove old git if exists
if (Test-Path ".git") {
    Write-Host "Removing old .git folder..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force .git -ErrorAction SilentlyContinue
    Write-Host "✓ Old git removed" -ForegroundColor Green
}

# Initialize new repository
Write-Host ""
Write-Host "Initializing new Git repository..." -ForegroundColor Yellow
git init
git branch -M main

# Configure Git
Write-Host ""
Write-Host "Configuring Git..." -ForegroundColor Yellow
git config user.name "HaiderKazmi655"
git config user.email "HaiderKazmi655@users.noreply.github.com"
Write-Host "✓ Git configured" -ForegroundColor Green

# Add all files
Write-Host ""
Write-Host "Adding all files..." -ForegroundColor Yellow
git add .

# Create commit
Write-Host ""
Write-Host "Creating initial commit..." -ForegroundColor Yellow
git commit -m "Initial commit: Discord clone with auto-friend feature"
Write-Host "✓ Commit created" -ForegroundColor Green

# Get repository name
Write-Host ""
Write-Host "=== GitHub Repository Setup ===" -ForegroundColor Cyan
$repoName = Read-Host "Enter your new GitHub repository name (e.g., 'Dosco' or 'dosco-app')"

if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = "Dosco"
    Write-Host "Using default: $repoName" -ForegroundColor Yellow
}

$repoUrl = "https://github.com/HaiderKazmi655/$repoName.git"

Write-Host ""
Write-Host "Repository URL: $repoUrl" -ForegroundColor Cyan
Write-Host ""
Write-Host "IMPORTANT: Create the repository on GitHub first:" -ForegroundColor Yellow
Write-Host "  1. Go to: https://github.com/new" -ForegroundColor White
Write-Host "  2. Repository name: $repoName" -ForegroundColor White
Write-Host "  3. DO NOT initialize with README, .gitignore, or license" -ForegroundColor White
Write-Host "  4. Click 'Create repository'" -ForegroundColor White
Write-Host ""
$ready = Read-Host "Have you created the repository? (y/n)"

if ($ready -eq "y" -or $ready -eq "Y") {
    Write-Host ""
    Write-Host "Adding remote..." -ForegroundColor Yellow
    git remote add origin $repoUrl
    
    Write-Host ""
    Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
    Write-Host "You'll need a Personal Access Token as password" -ForegroundColor Gray
    Write-Host "Get one at: https://github.com/settings/tokens" -ForegroundColor Gray
    Write-Host ""
    
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✓✓✓ SUCCESS! Repository created and pushed! ✓✓✓" -ForegroundColor Green
        Write-Host ""
        Write-Host "Repository: $repoUrl" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Next steps:" -ForegroundColor Yellow
        Write-Host "  1. Deploy to Vercel using this new repository" -ForegroundColor White
        Write-Host "  2. Root Directory: Leave empty (files are at root)" -ForegroundColor White
        Write-Host "  3. Add environment variables for Supabase" -ForegroundColor White
    } else {
        Write-Host ""
        Write-Host "Push failed. Use token in URL:" -ForegroundColor Yellow
        Write-Host "  git remote set-url origin https://HaiderKazmi655:YOUR_TOKEN@github.com/HaiderKazmi655/$repoName.git" -ForegroundColor White
        Write-Host "  git push -u origin main" -ForegroundColor White
        Write-Host "  git remote set-url origin $repoUrl" -ForegroundColor White
    }
} else {
    Write-Host ""
    Write-Host "After creating the repository, run:" -ForegroundColor Yellow
    Write-Host "  git remote add origin $repoUrl" -ForegroundColor White
    Write-Host "  git push -u origin main" -ForegroundColor White
}

Write-Host ""
Write-Host "=== Complete ===" -ForegroundColor Green

