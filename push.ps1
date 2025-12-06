# Script simple pour pousser sur GitHub
Write-Host "Push vers GitHub" -ForegroundColor Cyan
Write-Host ""
Write-Host "Creer d'abord un repository sur GitHub:" -ForegroundColor Yellow
Write-Host "1. Allez sur https://github.com/new" -ForegroundColor Gray
Write-Host "2. Nom: ayna-web" -ForegroundColor Gray
Write-Host "3. NE COCHEZ PAS Initialize with README" -ForegroundColor Gray
Write-Host "4. Cliquez sur Create repository" -ForegroundColor Gray
Write-Host ""
$repoUrl = Read-Host "Entrez l'URL de votre repository GitHub (ex: https://github.com/USERNAME/ayna-web.git)"

if ($repoUrl) {
    Write-Host "Ajout du remote..." -ForegroundColor Yellow
    git remote add origin $repoUrl
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Push vers GitHub..." -ForegroundColor Yellow
        git push -u origin main
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Code pousse avec succes!" -ForegroundColor Green
        } else {
            Write-Host "Erreur lors du push" -ForegroundColor Red
        }
    } else {
        Write-Host "Erreur: Remote existe peut-etre deja" -ForegroundColor Red
        Write-Host "Essayez: git remote set-url origin $repoUrl" -ForegroundColor Yellow
    }
} else {
    Write-Host "URL non fournie" -ForegroundColor Red
}

