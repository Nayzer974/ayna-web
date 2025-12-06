# 📦 Installation Supabase CLI sur Windows

Supabase CLI ne peut pas être installé via `npm install -g`. Voici les méthodes alternatives :

## Option 1 : Scoop (Recommandé pour Windows)

### 1. Installer Scoop (si pas déjà installé)

```powershell
# Ouvrir PowerShell en administrateur
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
```

### 2. Installer Supabase CLI

```powershell
scoop bucket add supabase https://github.com/supabase/scoop-bucket.git
scoop install supabase
```

## Option 2 : Téléchargement Direct

1. Allez sur [GitHub Releases](https://github.com/supabase/cli/releases)
2. Téléchargez `supabase_windows_amd64.zip`
3. Extrayez le fichier `supabase.exe`
4. Ajoutez le dossier au PATH Windows

## Option 3 : Chocolatey

```powershell
choco install supabase
```

## Option 4 : Utiliser npx (sans installation globale)

Vous pouvez utiliser Supabase CLI via npx sans l'installer globalement :

```powershell
npx supabase@latest login
npx supabase@latest link --project-ref ctupecolapegiogvmwxz
npx supabase@latest functions deploy verify-email
npx supabase@latest functions deploy reset-password
```

## ✅ Vérification

Après installation, vérifiez :

```powershell
supabase --version
# ou
npx supabase@latest --version
```

## 🚀 Déploiement avec npx

Si vous utilisez npx, voici les commandes complètes :

```powershell
# 1. Se connecter
npx supabase@latest login

# 2. Lier le projet
npx supabase@latest link --project-ref ctupecolapegiogvmwxz

# 3. Configurer les secrets
npx supabase@latest secrets set SUPABASE_URL=https://ctupecolapegiogvmwxz.supabase.co
npx supabase@latest secrets set SUPABASE_SERVICE_ROLE_KEY=votre_clé_service_role

# 4. Déployer verify-email
npx supabase@latest functions deploy verify-email

# 5. Déployer reset-password
npx supabase@latest functions deploy reset-password
```

