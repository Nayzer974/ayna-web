# ✅ Étapes Finales pour Héberger le Site

## 📋 Checklist Complète

### ✅ Déjà Fait

- [x] Edge Functions déployées (`verify-email` et `reset-password`)
- [x] Site web créé (pages HTML, CSS, JS)
- [x] Code poussé sur GitHub
- [x] Configuration Vercel corrigée
- [x] Projet déployé sur Vercel (ayna-web-pi.vercel.app fonctionne)

### 🔄 À Faire Maintenant

#### 1. Pousser la correction de vercel.json (si pas déjà fait)

```powershell
cd D:\ayna_final\application\web
git add vercel.json
git commit -m "Fix: Correction configuration Vercel"
git push
```

#### 2. Configurer les DNS pour nurayna.com

**Dans votre registrar (là où vous avez acheté le domaine) :**

Ajoutez ces enregistrements DNS :

```
Type: CNAME
Name: @ (ou laissez vide)
Value: cname.vercel-dns.com
TTL: 3600

Type: CNAME
Name: www
Value: cname.vercel-dns.com
TTL: 3600
```

**Où configurer :**
- Si vous utilisez **Namecheap** : Domain List > Manage > Advanced DNS
- Si vous utilisez **GoDaddy** : DNS Management
- Si vous utilisez **Cloudflare** : DNS > Records
- Si vous utilisez **Google Domains** : DNS > Custom records

#### 3. Attendre la propagation DNS

- Généralement : 5-15 minutes
- Maximum : 48 heures
- Vous pouvez vérifier avec : `nslookup nurayna.com`

#### 4. Vérifier dans Vercel

1. Allez dans Vercel Dashboard > Votre Projet > Settings > Domains
2. Cliquez sur **"Refresh"** ou **"Verify"** à côté de `nurayna.com`
3. Le statut devrait passer à **"Valid Configuration"** ✅

#### 5. Configurer les URLs dans Supabase

Une fois le domaine fonctionnel, configurez les URLs de redirection :

1. Allez dans **Supabase Dashboard**
2. **Authentication** > **URL Configuration**
3. Ajoutez dans **Redirect URLs** :
   ```
   https://nurayna.com/oauth/consent
   https://nurayna.com/verify-email.html
   https://nurayna.com/reset-password.html
   https://www.nurayna.com/oauth/consent
   https://www.nurayna.com/verify-email.html
   https://www.nurayna.com/reset-password.html
   ayna://email-verified
   ayna://reset-password-success
   ```
4. Cliquez sur **Save**

#### 6. Tester le site

- ✅ `https://nurayna.com` → Devrait afficher la page d'accueil
- ✅ `https://nurayna.com/verify-email.html` → Page de vérification
- ✅ `https://nurayna.com/reset-password.html` → Page de réinitialisation
- ✅ `https://nurayna.com/oauth/consent` → Devrait rediriger vers verify-email.html

## 🎯 Résumé des Actions

1. **DNS** : Configurer CNAME chez votre registrar
2. **Attendre** : Propagation DNS (5-15 min)
3. **Vérifier** : Dans Vercel Dashboard
4. **Configurer** : URLs dans Supabase Dashboard
5. **Tester** : Accéder au site

## 📚 Guides Disponibles

- `CONFIGURATION_DOMAINE_VERCEL.md` - Guide détaillé DNS
- `DEPLOIEMENT_GIT.md` - Guide Git et Vercel
- `README.md` - Documentation générale

---

**Une fois les DNS configurés, votre site sera accessible sur nurayna.com !** 🚀

