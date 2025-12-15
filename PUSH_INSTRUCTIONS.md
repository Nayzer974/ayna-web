# Instructions pour pousser le site web sur GitHub

## 📦 Repository GitHub

**URL:** https://github.com/Nayzer974/ayna-web

## 🚀 Commandes pour pousser les modifications

### 1. Vérifier le statut
```powershell
cd application\web
git status
```

### 2. Ajouter tous les fichiers
```powershell
git add .
```

### 3. Créer un commit
```powershell
git commit -m "Add Privacy Policy and Terms & Conditions (FR/EN) for GDPR/store compliance"
```

### 4. Pousser vers GitHub
```powershell
git push origin main
```

## 📝 Nouveaux fichiers ajoutés

- `privacy-policy.html` - Politique de confidentialité (FR)
- `privacy-policy-en.html` - Privacy Policy (EN)
- `terms.html` - Conditions d'utilisation (FR)
- `terms-en.html` - Terms & Conditions (EN)

## 📝 Fichiers modifiés

- `index.html` - Ajout de la section "Légal" avec liens vers Privacy Policy et Terms

## ✅ Vérification

Après le push, vérifiez sur GitHub:
- https://github.com/Nayzer974/ayna-web

Les fichiers doivent être visibles dans le dépôt.

## 🔐 Authentification GitHub

Si vous rencontrez des erreurs d'authentification:

1. **Avec SSH:**
   - Vérifiez que votre clé SSH est configurée
   - `ssh -T git@github.com` pour tester

2. **Avec HTTPS:**
   - Utilisez un Personal Access Token
   - Créez-en un: GitHub → Settings → Developer settings → Personal access tokens

3. **Alternative:**
   ```powershell
   git remote set-url origin https://YOUR_TOKEN@github.com/Nayzer974/ayna-web.git
   ```

## 📋 Script PowerShell

Un script automatique est disponible:
```powershell
powershell -ExecutionPolicy Bypass -File push-to-github-compliance.ps1
```

