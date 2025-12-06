# 📤 Instructions pour pousser sur GitHub

## ✅ Étape 1 : Créer le repository sur GitHub

1. Allez sur https://github.com/new
2. **Repository name** : `ayna-web` (ou un nom de votre choix)
3. **Description** : `Site web AYNA - Vérification email et réinitialisation mot de passe`
4. **Visibility** : Public ou Private (selon vos préférences)
5. ⚠️ **NE COCHEZ PAS** "Initialize with README"
6. Cliquez sur **"Create repository"**

## ✅ Étape 2 : Connecter le repository local

Une fois le repository créé, exécutez ces commandes dans PowerShell :

```powershell
cd D:\ayna_final\application\web

# Remplacez YOUR_USERNAME par votre nom d'utilisateur GitHub
# Remplacez ayna-web par le nom de votre repository si différent
git remote add origin https://github.com/YOUR_USERNAME/ayna-web.git

# Pousser le code
git push -u origin main
```

## ✅ Alternative : Via SSH

Si vous préférez utiliser SSH :

```powershell
git remote add origin git@github.com:YOUR_USERNAME/ayna-web.git
git push -u origin main
```

## ✅ Vérification

Après le push, vous devriez voir votre code sur :
`https://github.com/YOUR_USERNAME/ayna-web`

## 🚀 Prochaine étape : Déployer sur Vercel

Une fois le code sur GitHub :
1. Allez sur [vercel.com](https://vercel.com)
2. Cliquez sur "New Project"
3. Importez votre repository `ayna-web`
4. Vercel détectera automatiquement la configuration
5. Cliquez sur "Deploy"

---

**Le code est déjà commité et prêt à être poussé !** 🎉

