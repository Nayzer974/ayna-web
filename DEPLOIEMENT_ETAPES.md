# 🚀 Guide de Déploiement - Étapes à Suivre

## ✅ Étape 1 : Se connecter à Supabase

Ouvrez PowerShell dans le dossier `D:\ayna_final\application` et exécutez :

```powershell
npx supabase@latest login
```

1. Appuyez sur **Entrée** pour ouvrir le navigateur
2. Connectez-vous à votre compte Supabase
3. Autorisez l'accès

## ✅ Étape 2 : Lier le projet

```powershell
npx supabase@latest link --project-ref ctupecolapegiogvmwxz
```

Vous devrez peut-être entrer votre mot de passe Supabase.

## ✅ Étape 3 : Configurer les secrets

**Important** : Récupérez votre `SUPABASE_SERVICE_ROLE_KEY` depuis :
- Supabase Dashboard > Settings > API > **service_role** key (⚠️ Ne la partagez jamais !)

```powershell
npx supabase@latest secrets set SUPABASE_URL=https://ctupecolapegiogvmwxz.supabase.co
npx supabase@latest secrets set SUPABASE_SERVICE_ROLE_KEY=votre_clé_service_role_ici
```

Remplacez `votre_clé_service_role_ici` par votre vraie clé.

## ✅ Étape 4 : Déployer verify-email

```powershell
cd D:\ayna_final\application
npx supabase@latest functions deploy verify-email
```

Vous devriez voir :
```
Deployed Function verify-email
URL: https://ctupecolapegiogvmwxz.supabase.co/functions/v1/verify-email
```

## ✅ Étape 5 : Déployer reset-password

```powershell
npx supabase@latest functions deploy reset-password
```

Vous devriez voir :
```
Deployed Function reset-password
URL: https://ctupecolapegiogvmwxz.supabase.co/functions/v1/reset-password
```

## ✅ Vérification

### Vérifier que les fonctions sont déployées

```powershell
npx supabase@latest functions list
```

Vous devriez voir les deux fonctions listées.

### Tester les fonctions

#### Tester verify-email

```powershell
curl -X POST https://ctupecolapegiogvmwxz.supabase.co/functions/v1/verify-email -H "Content-Type: application/json" -d "{\"token_hash\": \"test\", \"type_hash\": \"signup\"}"
```

#### Tester reset-password

```powershell
curl -X POST https://ctupecolapegiogvmwxz.supabase.co/functions/v1/reset-password -H "Content-Type: application/json" -d "{\"token_hash\": \"test\", \"type_hash\": \"recovery\", \"password\": \"test123\"}"
```

> Note : Ces tests échoueront car les tokens ne sont pas valides, mais ils confirment que les fonctions sont déployées et accessibles.

## 📋 Commandes Complètes (Copier-Coller)

```powershell
# 1. Se connecter
npx supabase@latest login

# 2. Lier le projet
npx supabase@latest link --project-ref ctupecolapegiogvmwxz

# 3. Configurer les secrets (remplacez YOUR_SERVICE_ROLE_KEY)
npx supabase@latest secrets set SUPABASE_URL=https://ctupecolapegiogvmwxz.supabase.co
npx supabase@latest secrets set SUPABASE_SERVICE_ROLE_KEY=YOUR_SERVICE_ROLE_KEY

# 4. Déployer verify-email
cd D:\ayna_final\application
npx supabase@latest functions deploy verify-email

# 5. Déployer reset-password
npx supabase@latest functions deploy reset-password
```

## 🎯 Prochaines Étapes

Une fois les Edge Functions déployées :

1. ✅ Push le site web sur GitHub (voir `DEPLOIEMENT_GIT.md`)
2. ✅ Déployer sur Vercel (voir `DEPLOIEMENT_GIT.md`)
3. ✅ Configurer les URLs dans Supabase Dashboard

## 🐛 Dépannage

### Erreur : "Not logged in"
- Réexécutez `npx supabase@latest login`

### Erreur : "Project not found"
- Vérifiez que le project-ref est correct : `ctupecolapegiogvmwxz`

### Erreur : "Secrets not set"
- Vérifiez que vous avez bien configuré les secrets avec les bonnes valeurs

### Erreur : "Function not found"
- Vérifiez que les fichiers existent dans `supabase/functions/verify-email/index.ts` et `supabase/functions/reset-password/index.ts`

---

**Une fois terminé, les Edge Functions seront déployées et prêtes à être utilisées par le site web !** 🎉

