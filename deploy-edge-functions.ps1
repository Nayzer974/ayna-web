# Script PowerShell pour déployer les Edge Functions Supabase
# Usage: .\deploy-edge-functions.ps1

Write-Host "🚀 Déploiement des Edge Functions Supabase" -ForegroundColor Cyan
Write-Host ""

# Vérifier si Supabase CLI est installé
Write-Host "📦 Vérification de Supabase CLI..." -ForegroundColor Yellow
try {
    $supabaseVersion = supabase --version 2>&1
    Write-Host "✅ Supabase CLI installé: $supabaseVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Supabase CLI n'est pas installé" -ForegroundColor Red
    Write-Host "📥 Installation de Supabase CLI..." -ForegroundColor Yellow
    npm install -g supabase
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Erreur lors de l'installation de Supabase CLI" -ForegroundColor Red
        Write-Host "💡 Essayez manuellement: npm install -g supabase" -ForegroundColor Yellow
        exit 1
    }
    Write-Host "✅ Supabase CLI installé avec succès" -ForegroundColor Green
}

Write-Host ""
Write-Host "🔐 Connexion à Supabase..." -ForegroundColor Yellow
Write-Host "💡 Vous devrez vous connecter dans votre navigateur" -ForegroundColor Cyan
supabase login

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors de la connexion" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🔗 Liaison du projet..." -ForegroundColor Yellow
Write-Host "💡 Project Ref: ctupecolapegiogvmwxz" -ForegroundColor Cyan
supabase link --project-ref ctupecolapegiogvmwxz

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors de la liaison du projet" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🔧 Configuration des secrets..." -ForegroundColor Yellow
Write-Host "💡 Vous devez configurer les secrets manuellement:" -ForegroundColor Cyan
Write-Host "   supabase secrets set SUPABASE_URL=https://ctupecolapegiogvmwxz.supabase.co" -ForegroundColor Gray
Write-Host "   supabase secrets set SUPABASE_SERVICE_ROLE_KEY=votre_clé_service_role" -ForegroundColor Gray
Write-Host ""
$configureSecrets = Read-Host "Voulez-vous configurer les secrets maintenant? (o/n)"
if ($configureSecrets -eq "o" -or $configureSecrets -eq "O") {
    $supabaseUrl = Read-Host "Entrez SUPABASE_URL (https://ctupecolapegiogvmwxz.supabase.co)"
    $serviceRoleKey = Read-Host "Entrez SUPABASE_SERVICE_ROLE_KEY" -AsSecureString
    $serviceRoleKeyPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($serviceRoleKey))
    
    supabase secrets set SUPABASE_URL=$supabaseUrl
    supabase secrets set SUPABASE_SERVICE_ROLE_KEY=$serviceRoleKeyPlain
}

Write-Host ""
Write-Host "📤 Déploiement de verify-email..." -ForegroundColor Yellow
supabase functions deploy verify-email

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors du déploiement de verify-email" -ForegroundColor Red
    exit 1
}
Write-Host "✅ verify-email déployée avec succès" -ForegroundColor Green

Write-Host ""
Write-Host "📤 Déploiement de reset-password..." -ForegroundColor Yellow
supabase functions deploy reset-password

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors du déploiement de reset-password" -ForegroundColor Red
    exit 1
}
Write-Host "✅ reset-password déployée avec succès" -ForegroundColor Green

Write-Host ""
Write-Host "✅ Toutes les Edge Functions ont été déployées avec succès!" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 URLs des fonctions:" -ForegroundColor Cyan
Write-Host "   verify-email: https://ctupecolapegiogvmwxz.supabase.co/functions/v1/verify-email" -ForegroundColor Gray
Write-Host "   reset-password: https://ctupecolapegiogvmwxz.supabase.co/functions/v1/reset-password" -ForegroundColor Gray
Write-Host ""

