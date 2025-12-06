# 🚀 Déploiement Automatique des Edge Functions

## Option 1 : Script PowerShell (Windows)

```powershell
# Exécuter le script
cd D:\ayna_final\application\web
.\deploy-edge-functions.ps1
```

Le script va :
1. ✅ Vérifier/installer Supabase CLI
2. ✅ Vous connecter à Supabase
3. ✅ Lier le projet
4. ✅ Configurer les secrets (optionnel)
5. ✅ Déployer `verify-email`
6. ✅ Déployer `reset-password`

## Option 2 : Commandes Manuelles

### 1. Installer Supabase CLI

```bash
npm install -g supabase
```

### 2. Se connecter

```bash
supabase login
```

Une fenêtre de navigateur s'ouvrira pour vous connecter.

### 3. Lier le projet

```bash
supabase link --project-ref ctupecolapegiogvmwxz
```

### 4. Configurer les secrets

**Important** : Vous devez obtenir votre `SUPABASE_SERVICE_ROLE_KEY` depuis :
- Supabase Dashboard > Settings > API > service_role key

```bash
supabase secrets set SUPABASE_URL=https://ctupecolapegiogvmwxz.supabase.co
supabase secrets set SUPABASE_SERVICE_ROLE_KEY=votre_clé_service_role_ici
```

### 5. Déployer verify-email

```bash
cd D:\ayna_final\application
supabase functions deploy verify-email
```

### 6. Déployer reset-password

```bash
supabase functions deploy reset-password
```

## ✅ Vérification

Après le déploiement, vous devriez voir :

```
Deployed Function verify-email
URL: https://ctupecolapegiogvmwxz.supabase.co/functions/v1/verify-email

Deployed Function reset-password
URL: https://ctupecolapegiogvmwxz.supabase.co/functions/v1/reset-password
```

## 🧪 Test

### Tester verify-email

```bash
curl -X POST https://ctupecolapegiogvmwxz.supabase.co/functions/v1/verify-email \
  -H "Content-Type: application/json" \
  -d "{\"token_hash\": \"test\", \"type_hash\": \"signup\"}"
```

### Tester reset-password

```bash
curl -X POST https://ctupecolapegiogvmwxz.supabase.co/functions/v1/reset-password \
  -H "Content-Type: application/json" \
  -d "{\"token_hash\": \"test\", \"type_hash\": \"recovery\", \"password\": \"test123\"}"
```

> Note : Ces tests échoueront car les tokens ne sont pas valides, mais ils confirment que les fonctions sont déployées.

## 📚 Documentation

- [Supabase Edge Functions](https://supabase.com/docs/guides/functions)
- [Guide complet](../GUIDE_DEPLOIEMENT_EDGE_FUNCTION.md)

