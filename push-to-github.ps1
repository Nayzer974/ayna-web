# Script pour pousser le site web sur GitHub
# Usage: .\push-to-github.ps1

Write-Host "🚀 Push du site web AYNA sur GitHub" -ForegroundColor Cyan
Write-Host ""

# Vérifier que Git est initialisé
if (-not (Test-Path .git)) {
    Write-Host "❌ Git n'est pas initialisé dans ce dossier" -ForegroundColor Red
    exit 1
}

# Vérifier si un remote existe déjà
$remoteExists = git remote | Select-String -Pattern "origin"
if ($remoteExists) {
    Write-Host "✅ Remote 'origin' existe déjà" -ForegroundColor Green
    git remote -v
    Write-Host ""
    $push = Read-Host "Voulez-vous pousser vers ce remote? (o/n)"
    if ($push -eq "o" -or $push -eq "O") {
        Write-Host "📤 Push vers GitHub..." -ForegroundColor Yellow
        git push -u origin main
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ Code poussé avec succès!" -ForegroundColor Green
        } else {
            Write-Host "❌ Erreur lors du push" -ForegroundColor Red
        }
        exit 0
    }
}

# Si pas de remote, demander l'URL
Write-Host "📋 Configuration du remote GitHub" -ForegroundColor Yellow
Write-Host ""
Write-Host "💡 Créez d'abord un repository sur GitHub:" -ForegroundColor Cyan
Write-Host "   1. Allez sur https://github.com/new" -ForegroundColor Gray
Write-Host "   2. Nom du repository: ayna-web (ou un nom de votre choix)" -ForegroundColor Gray
Write-Host "   3. Description: Site web AYNA - Vérification email et réinitialisation mot de passe" -ForegroundColor Gray
Write-Host "   4. Visibilité: Public ou Private" -ForegroundColor Gray
Write-Host "   5. NE COCHEZ PAS 'Initialize with README'" -ForegroundColor Gray
Write-Host "   6. Cliquez sur 'Create repository'" -ForegroundColor Gray
Write-Host ""
$githubUsername = Read-Host "Entrez votre nom d'utilisateur GitHub"
$repoName = Read-Host "Entrez le nom du repository (par défaut: ayna-web)"
if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = "ayna-web"
}

$remoteUrl = "https://github.com/$githubUsername/$repoName.git"
Write-Host ""
Write-Host "🔗 Ajout du remote: $remoteUrl" -ForegroundColor Yellow
git remote add origin $remoteUrl

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Remote ajouté avec succès" -ForegroundColor Green
    Write-Host ""
    Write-Host "📤 Push vers GitHub..." -ForegroundColor Yellow
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✅ Code poussé avec succès sur GitHub!" -ForegroundColor Green
        Write-Host ""
        Write-Host "🌐 Votre repository: https://github.com/$githubUsername/$repoName" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "📋 Prochaines étapes:" -ForegroundColor Yellow
        Write-Host "   1. Connecter le repository à Vercel" -ForegroundColor Gray
        Write-Host "   2. Vercel déploiera automatiquement le site" -ForegroundColor Gray
    } else {
        Write-Host "❌ Erreur lors du push" -ForegroundColor Red
        Write-Host "💡 Vérifiez que:" -ForegroundColor Yellow
        Write-Host "   - Le repository existe sur GitHub" -ForegroundColor Gray
        Write-Host "   - Vous avez les permissions d'écriture" -ForegroundColor Gray
        Write-Host "   - Vous êtes authentifié avec GitHub" -ForegroundColor Gray
    }
} else {
    Write-Host "❌ Erreur lors de l'ajout du remote" -ForegroundColor Red
}

