# 🚀 Guide de Déploiement Git et Vercel

Guide complet pour pousser le site web sur Git et le déployer sur Vercel.

## 📋 Prérequis

1. **Compte GitHub** créé
2. **Compte Vercel** créé (gratuit)
3. **Git installé** sur votre machine

## 🔧 Étape 1 : Initialiser Git

```bash
# Aller dans le dossier web
cd D:\ayna_final\application\web

# Initialiser Git (si pas déjà fait)
git init

# Ajouter tous les fichiers
git add .

# Créer le premier commit
git commit -m "Initial commit: Site web AYNA - Vérification email et réinitialisation mot de passe"
```

## 🔧 Étape 2 : Créer un Repository GitHub

1. Allez sur [github.com](https://github.com)
2. Cliquez sur le bouton **"+"** en haut à droite
3. Sélectionnez **"New repository"**
4. Remplissez :
   - **Repository name** : `ayna-web` (ou un nom de votre choix)
   - **Description** : "Site web AYNA - Vérification email et réinitialisation mot de passe"
   - **Visibility** : Public ou Private (selon vos préférences)
   - **Ne cochez PAS** "Initialize with README" (on a déjà un README)
5. Cliquez sur **"Create repository"**

## 🔧 Étape 3 : Connecter le Repository Local à GitHub

```bash
# Remplacez YOUR_USERNAME par votre nom d'utilisateur GitHub
# Remplacez ayna-web par le nom de votre repository si différent

git remote add origin https://github.com/YOUR_USERNAME/ayna-web.git
git branch -M main
git push -u origin main
```

Si vous utilisez SSH au lieu de HTTPS :

```bash
git remote add origin git@github.com:YOUR_USERNAME/ayna-web.git
git branch -M main
git push -u origin main
```

## 🔧 Étape 4 : Déployer sur Vercel

### Option A : Via l'Interface Web (Recommandé)

1. Allez sur [vercel.com](https://vercel.com)
2. Cliquez sur **"Sign Up"** ou **"Log In"**
3. Cliquez sur **"Add New..."** > **"Project"**
4. Cliquez sur **"Import Git Repository"**
5. Sélectionnez votre repository `ayna-web`
6. Vercel détectera automatiquement la configuration :
   - **Framework Preset** : Other
   - **Root Directory** : `./` (ou laissez vide)
   - **Build Command** : (laissez vide, c'est un site statique)
   - **Output Directory** : (laissez vide)
7. Cliquez sur **"Deploy"**

### Option B : Via Vercel CLI

```bash
# Installer Vercel CLI globalement
npm install -g vercel

# Se connecter à Vercel
vercel login

# Aller dans le dossier web
cd D:\ayna_final\application\web

# Déployer
vercel

# Suivre les instructions :
# - Set up and deploy? Y
# - Which scope? (sélectionnez votre compte)
# - Link to existing project? N
# - Project name? ayna-web
# - Directory? ./
# - Override settings? N

# Déployer en production
vercel --prod
```

## 🔧 Étape 5 : Configurer le Domaine Personnalisé

1. Dans Vercel Dashboard, allez dans votre projet
2. Cliquez sur **"Settings"** > **"Domains"**
3. Ajoutez votre domaine : `nurayna.com`
4. Suivez les instructions pour configurer les DNS :
   - Ajoutez un enregistrement CNAME pointant vers `cname.vercel-dns.com`
   - Ou ajoutez un enregistrement A avec l'IP fournie par Vercel

## 🔧 Étape 6 : Configurer les URLs dans Supabase

1. Allez dans **Supabase Dashboard** > **Authentication** > **URL Configuration**
2. Ajoutez les URLs suivantes dans **Redirect URLs** :
   - `https://nurayna.com/oauth/consent`
   - `https://nurayna.com/verify-email.html`
   - `https://nurayna.com/reset-password.html`
   - `https://votre-projet.vercel.app/oauth/consent` (URL Vercel de secours)
   - `ayna://email-verified`
   - `ayna://reset-password-success`
3. Cliquez sur **"Save"**

## 🔧 Étape 7 : Mettre à Jour les URLs dans le Code (si nécessaire)

Si votre domaine Vercel est différent de `nurayna.com`, mettez à jour les URLs dans :

- `verify-email.html` : Ligne avec `EDGE_FUNCTION_URL`
- `reset-password.html` : Ligne avec `EDGE_FUNCTION_URL`

Ou mieux, utilisez des variables d'environnement Vercel.

## ✅ Vérification

### Tester le déploiement

1. Visitez votre site : `https://votre-projet.vercel.app`
2. Testez la page de vérification : `https://votre-projet.vercel.app/verify-email.html`
3. Testez la page de réinitialisation : `https://votre-projet.vercel.app/reset-password.html`

### Tester le flux complet

1. Créez un nouveau compte dans l'application mobile
2. Vérifiez que vous recevez l'email de vérification
3. Cliquez sur le lien dans l'email
4. Vous devriez être redirigé vers votre site Vercel
5. L'email devrait être vérifié automatiquement

## 🔄 Mises à Jour Futures

Pour mettre à jour le site après des modifications :

```bash
# Aller dans le dossier web
cd D:\ayna_final\application\web

# Faire vos modifications

# Ajouter les changements
git add .

# Créer un commit
git commit -m "Description des modifications"

# Pousser sur GitHub
git push

# Vercel déploiera automatiquement les changements
```

## 📚 Ressources

- [Documentation Vercel](https://vercel.com/docs)
- [Documentation GitHub](https://docs.github.com)
- [Guide Git](https://git-scm.com/doc)

## 🐛 Dépannage

### Erreur : "Repository not found"
- Vérifiez que le nom du repository est correct
- Vérifiez que vous avez les permissions d'accès

### Erreur : "Build failed"
- Vérifiez que tous les fichiers sont présents
- Vérifiez la configuration dans `vercel.json`

### Le site ne se met pas à jour
- Attendez quelques minutes (déploiement peut prendre 1-2 minutes)
- Videz le cache de votre navigateur
- Vérifiez les logs dans Vercel Dashboard

---

**Félicitations !** 🎉 Votre site est maintenant déployé et accessible en ligne !

