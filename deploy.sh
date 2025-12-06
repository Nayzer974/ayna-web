#!/bin/bash

# Script de déploiement pour le site web AYNA
# Usage: ./deploy.sh "Message du commit"

echo "🚀 Déploiement du site web AYNA"
echo ""

# Vérifier que Git est initialisé
if [ ! -d ".git" ]; then
    echo "📦 Initialisation de Git..."
    git init
    git branch -M main
fi

# Ajouter tous les fichiers
echo "📝 Ajout des fichiers..."
git add .

# Créer un commit
if [ -z "$1" ]; then
    COMMIT_MSG="Update: Mise à jour du site web"
else
    COMMIT_MSG="$1"
fi

echo "💾 Création du commit: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

# Vérifier si un remote existe
if git remote | grep -q "origin"; then
    echo "📤 Push vers GitHub..."
    git push origin main
    echo ""
    echo "✅ Déploiement terminé !"
    echo "🌐 Vercel déploiera automatiquement les changements"
else
    echo ""
    echo "⚠️  Aucun remote 'origin' configuré"
    echo "📋 Pour configurer GitHub, exécutez:"
    echo "   git remote add origin https://github.com/VOTRE_USERNAME/ayna-web.git"
    echo "   git push -u origin main"
fi

