# 🔧 Guide - Déploiement des Edge Functions

Ce guide explique comment déployer les Edge Functions nécessaires pour le site web.

## 📋 Edge Functions Requises

1. **`verify-email`** - Vérification d'email
2. **`reset-password`** - Réinitialisation de mot de passe

## 🚀 Déploiement

### 1. Vérifier que Supabase CLI est installé

```bash
npm install -g supabase
```

### 2. Se connecter et lier le projet

```bash
supabase login
supabase link --project-ref ctupecolapegiogvmwxz
```

### 3. Déployer verify-email

```bash
# La fonction devrait déjà exister dans supabase/functions/verify-email/
supabase functions deploy verify-email
```

### 4. Déployer reset-password

```bash
# Créer la fonction si elle n'existe pas
supabase functions new reset-password

# Copier le code de supabase/functions/reset-password/index.ts
# (déjà créé dans le projet)

# Déployer
supabase functions deploy reset-password
```

### 5. Configurer les secrets (si pas déjà fait)

```bash
supabase secrets set SUPABASE_URL=https://ctupecolapegiogvmwxz.supabase.co
supabase secrets set SUPABASE_SERVICE_ROLE_KEY=votre_clé_service_role
```

## ✅ Vérification

### Tester verify-email

```bash
curl -X POST https://ctupecolapegiogvmwxz.supabase.co/functions/v1/verify-email \
  -H "Content-Type: application/json" \
  -d '{"token_hash": "test", "type_hash": "signup"}'
```

### Tester reset-password

```bash
curl -X POST https://ctupecolapegiogvmwxz.supabase.co/functions/v1/reset-password \
  -H "Content-Type: application/json" \
  -d '{"token_hash": "test", "type_hash": "recovery", "password": "newpassword123"}'
```

> Note : Ces tests échoueront car les tokens ne sont pas valides, mais ils confirment que les fonctions sont déployées et accessibles.

## 📚 Documentation

- [Supabase Edge Functions](https://supabase.com/docs/guides/functions)
- [Guide de déploiement complet](../GUIDE_DEPLOIEMENT_EDGE_FUNCTION.md)

