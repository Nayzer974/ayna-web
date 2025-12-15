# Script pour pousser les nouveaux fichiers de conformité sur GitHub
# Privacy Policy et Terms & Conditions

Write-Host "=== Push AYNA Web vers GitHub ===" -ForegroundColor Cyan
Write-Host ""

# Aller dans le dossier web
Set-Location $PSScriptRoot

# Vérifier le statut Git
Write-Host "📊 Statut Git actuel:" -ForegroundColor Yellow
git status --short
Write-Host ""

# Ajouter tous les fichiers
Write-Host "➕ Ajout des fichiers..." -ForegroundColor Yellow
git add .
Write-Host ""

# Vérifier ce qui est en staging
Write-Host "📋 Fichiers en staging:" -ForegroundColor Yellow
git diff --cached --name-only
Write-Host ""

# Créer un commit
Write-Host "💾 Création du commit..." -ForegroundColor Yellow
$commitMessage = "Add Privacy Policy and Terms & Conditions (FR/EN) for GDPR/store compliance

- Add privacy-policy.html (FR) and privacy-policy-en.html (EN)
- Add terms.html (FR) and terms-en.html (EN)
- Update index.html with legal links section
- Full GDPR and store compliance implementation"

git commit -m $commitMessage
Write-Host ""

# Vérifier le remote
Write-Host "🔗 Remote configuré:" -ForegroundColor Yellow
git remote -v
Write-Host ""

# Pousser vers GitHub
Write-Host "🚀 Push vers GitHub..." -ForegroundColor Yellow
git push origin main
Write-Host ""

# Vérifier le résultat
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Push réussi!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📦 Repository: https://github.com/Nayzer974/ayna-web" -ForegroundColor Cyan
} else {
    Write-Host "❌ Erreur lors du push" -ForegroundColor Red
    Write-Host "Vérifiez votre authentification GitHub (SSH key ou Personal Access Token)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== Terminé ===" -ForegroundColor Cyan

