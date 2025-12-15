# Site Web AYNA - Vérification Email et Réinitialisation Mot de Passe

Site web statique pour la vérification d'email et la réinitialisation de mot de passe de l'application AYNA.

## 📁 Structure

```
web/
├── index.html                    # Page d'accueil
├── verify-email.html             # Page de vérification d'email
├── reset-password.html           # Page de réinitialisation mot de passe
├── privacy-policy.html           # Politique de confidentialité (FR)
├── privacy-policy-en.html        # Privacy Policy (EN)
├── terms.html                    # Conditions d'utilisation (FR)
├── terms-en.html                 # Terms & Conditions (EN)
├── styles.css                    # Styles CSS communs
├── auth.js                       # Utilitaires JavaScript communs
├── vercel.json                   # Configuration Vercel
└── README.md                     # Documentation
```

## 📋 Fichiers de Conformité

Ce dépôt inclut les documents légaux requis pour la conformité GDPR et les stores:

- **Privacy Policy** (`privacy-policy.html` / `privacy-policy-en.html`)
  - Politique de confidentialité complète
  - Conforme GDPR
  - Accessible depuis l'app et les stores

- **Terms & Conditions** (`terms.html` / `terms-en.html`)
  - Conditions générales d'utilisation
  - Responsabilités et limitations
  - Contenu spirituel (non médical, non thérapeutique)

## 🚀 Déploiement sur Vercel

### Option 1 : Via GitHub (Recommandé)

1. **Créer un repository GitHub** :
   ```bash
   cd web
   git init
   git add .
   git commit -m "Initial commit: Site web AYNA"
   git branch -M main
   git remote add origin https://github.com/votre-username/ayna-web.git
   git push -u origin main
   ```

2. **Connecter à Vercel** :
   - Allez sur [vercel.com](https://vercel.com)
   - Cliquez sur "New Project"
   - Importez votre repository GitHub
   - Vercel détectera automatiquement la configuration

3. **Configurer le domaine** :
   - Dans les paramètres du projet Vercel
   - Ajoutez votre domaine `nurayna.com`
   - Configurez les DNS selon les instructions Vercel

### Option 2 : Via Vercel CLI

```bash
# Installer Vercel CLI
npm i -g vercel

# Se connecter
vercel login

# Déployer
cd web
vercel

# Déployer en production
vercel --prod
```

## 🔧 Configuration

### Variables d'environnement (si nécessaire)

Si vous devez utiliser des variables d'environnement, créez un fichier `.env.local` :

```env
SUPABASE_URL=https://ctupecolapegiogvmwxz.supabase.co
```

Puis configurez-les dans Vercel Dashboard > Settings > Environment Variables.

### URLs de redirection

Assurez-vous que les URLs suivantes sont configurées dans Supabase Dashboard :

- `https://nurayna.com/oauth/consent` (ou votre domaine Vercel)
- `https://nurayna.com/verify-email.html`
- `https://nurayna.com/reset-password.html`
- `ayna://email-verified` (deep link mobile)
- `ayna://reset-password-success` (deep link mobile)

## 📝 URLs du site

Une fois déployé, votre site sera accessible à :

- **Page d'accueil** : `https://votre-domaine.vercel.app/`
- **Vérification email** : `https://votre-domaine.vercel.app/verify-email.html`
- **Réinitialisation mot de passe** : `https://votre-domaine.vercel.app/reset-password.html`
- **OAuth consent** : `https://votre-domaine.vercel.app/oauth/consent` (redirige vers verify-email.html)

## 🔒 Sécurité

- ✅ Pas de clés API exposées dans le code
- ✅ Utilisation de Supabase Edge Functions pour les opérations sensibles
- ✅ Headers de sécurité configurés dans `vercel.json`
- ✅ Validation côté client et serveur

## 🧪 Test Local

Pour tester localement avant de déployer :

```bash
# Installer un serveur HTTP simple
npm install -g http-server

# Lancer le serveur
cd web
http-server -p 3000

# Ouvrir http://localhost:3000
```

## 📚 Documentation

- [Documentation Vercel](https://vercel.com/docs)
- [Supabase Edge Functions](https://supabase.com/docs/guides/functions)
- [Guide de déploiement Edge Function](./GUIDE_DEPLOIEMENT_EDGE_FUNCTION.md)

## ✅ Checklist de déploiement

- [ ] Code pushé sur GitHub
- [ ] Projet créé sur Vercel
- [ ] Repository connecté à Vercel
- [ ] Domaine configuré (optionnel)
- [ ] URLs de redirection configurées dans Supabase
- [ ] Edge Functions déployées (`verify-email` et `reset-password`)
- [ ] Test de vérification d'email effectué
- [ ] Test de réinitialisation de mot de passe effectué

---

**Note** : Assurez-vous que les Edge Functions `verify-email` et `reset-password` sont déployées sur Supabase avant d'utiliser ce site.

