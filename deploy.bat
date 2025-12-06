@echo off
REM Script de déploiement pour le site web AYNA (Windows)
REM Usage: deploy.bat "Message du commit"

echo 🚀 Déploiement du site web AYNA
echo.

REM Vérifier que Git est initialisé
if not exist ".git" (
    echo 📦 Initialisation de Git...
    git init
    git branch -M main
)

REM Ajouter tous les fichiers
echo 📝 Ajout des fichiers...
git add .

REM Créer un commit
if "%1"=="" (
    set COMMIT_MSG=Update: Mise à jour du site web
) else (
    set COMMIT_MSG=%1
)

echo 💾 Création du commit: %COMMIT_MSG%
git commit -m "%COMMIT_MSG%"

REM Vérifier si un remote existe
git remote | findstr /C:"origin" >nul
if %errorlevel% equ 0 (
    echo 📤 Push vers GitHub...
    git push origin main
    echo.
    echo ✅ Déploiement terminé !
    echo 🌐 Vercel déploiera automatiquement les changements
) else (
    echo.
    echo ⚠️  Aucun remote 'origin' configuré
    echo 📋 Pour configurer GitHub, exécutez:
    echo    git remote add origin https://github.com/VOTRE_USERNAME/ayna-web.git
    echo    git push -u origin main
)

pause

