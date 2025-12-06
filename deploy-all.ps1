# Script PowerShell complet pour déployer les Edge Functions
# Usage: .\deploy-all.ps1

Write-Host "🚀 Déploiement des Edge Functions Supabase" -ForegroundColor Cyan
Write-Host ""

# Étape 1 : Se connecter
Write-Host "📋 ÉTAPE 1/5 : Connexion à Supabase" -ForegroundColor Yellow
Write-Host "💡 Appuyez sur Entrée dans le terminal pour ouvrir le navigateur" -ForegroundColor Cyan
Write-Host ""
npx supabase@latest login

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors de la connexion" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "📋 ÉTAPE 2/5 : Liaison du projet" -ForegroundColor Yellow
npx supabase@latest link --project-ref ctupecolapegiogvmwxz

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors de la liaison" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "📋 ÉTAPE 3/5 : Configuration des secrets" -ForegroundColor Yellow
Write-Host "💡 Vous devez obtenir votre SUPABASE_SERVICE_ROLE_KEY depuis:" -ForegroundColor Cyan
Write-Host "   Supabase Dashboard - Settings - API - service_role key" -ForegroundColor Gray
Write-Host ""
$supabaseUrl = "https://ctupecolapegiogvmwxz.supabase.co"
$serviceRoleKey = Read-Host "Entrez votre SUPABASE_SERVICE_ROLE_KEY" -AsSecureString
$serviceRoleKeyPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($serviceRoleKey))

Write-Host "🔐 Configuration de SUPABASE_URL..." -ForegroundColor Gray
npx supabase@latest secrets set SUPABASE_URL=$supabaseUrl

Write-Host "🔐 Configuration de SUPABASE_SERVICE_ROLE_KEY..." -ForegroundColor Gray
npx supabase@latest secrets set SUPABASE_SERVICE_ROLE_KEY=$serviceRoleKeyPlain

Write-Host ""
Write-Host "📋 ÉTAPE 4/5 : Déploiement de verify-email" -ForegroundColor Yellow
cd D:\ayna_final\application
npx supabase@latest functions deploy verify-email

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors du déploiement de verify-email" -ForegroundColor Red
    exit 1
}
Write-Host "✅ verify-email déployée avec succès" -ForegroundColor Green

Write-Host ""
Write-Host "📋 ÉTAPE 5/5 : Déploiement de reset-password" -ForegroundColor Yellow
npx supabase@latest functions deploy reset-password

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors du déploiement de reset-password" -ForegroundColor Red
    exit 1
}
Write-Host "✅ reset-password déployée avec succès" -ForegroundColor Green

Write-Host ""
Write-Host "🎉 Toutes les Edge Functions ont été déployées avec succès!" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 URLs des fonctions:" -ForegroundColor Cyan
Write-Host "   verify-email: https://ctupecolapegiogvmwxz.supabase.co/functions/v1/verify-email" -ForegroundColor Gray
Write-Host "   reset-password: https://ctupecolapegiogvmwxz.supabase.co/functions/v1/reset-password" -ForegroundColor Gray
Write-Host ""
Write-Host "📋 Prochaines étapes:" -ForegroundColor Yellow
Write-Host "   1. Push le site web sur GitHub" -ForegroundColor Gray
Write-Host "   2. Déployer sur Vercel" -ForegroundColor Gray
Write-Host "   3. Configurer les URLs dans Supabase Dashboard" -ForegroundColor Gray
Write-Host ""

