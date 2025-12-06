# 🌐 Configuration du Domaine sur Vercel

## ❌ Problème : "Invalid Configuration"

Si vous voyez "Invalid Configuration" pour vos domaines, cela signifie que les enregistrements DNS ne sont pas correctement configurés.

## ✅ Solution : Configurer les DNS

### Étape 1 : Obtenir les valeurs DNS depuis Vercel

1. Dans Vercel Dashboard, allez dans votre projet
2. Cliquez sur **Settings** > **Domains**
3. Cliquez sur **Edit** à côté de `nurayna.com`
4. Vercel vous donnera les valeurs DNS à configurer

### Étape 2 : Configurer les DNS chez votre registrar

Vous devez configurer les DNS chez votre registrar (là où vous avez acheté le domaine `nurayna.com`).

#### Option A : Configuration avec CNAME (Recommandé)

Ajoutez ces enregistrements DNS :

**Pour nurayna.com :**
```
Type: CNAME
Name: @ (ou laissez vide selon votre registrar)
Value: cname.vercel-dns.com
TTL: 3600 (ou Auto)
```

**Pour www.nurayna.com :**
```
Type: CNAME
Name: www
Value: cname.vercel-dns.com
TTL: 3600 (ou Auto)
```

#### Option B : Configuration avec A Record (Alternative)

Si votre registrar ne supporte pas CNAME pour le domaine racine (@), utilisez A Records :

**Pour nurayna.com :**
```
Type: A
Name: @ (ou laissez vide)
Value: 76.76.21.21
TTL: 3600
```

**Pour www.nurayna.com :**
```
Type: CNAME
Name: www
Value: cname.vercel-dns.com
TTL: 3600
```

### Étape 3 : Vérifier la configuration

1. Attendez quelques minutes (propagation DNS peut prendre jusqu'à 48h, mais généralement 5-15 minutes)
2. Dans Vercel Dashboard, cliquez sur **"Refresh"** ou **"Verify"**
3. Le statut devrait passer de "Invalid Configuration" à "Valid Configuration"

## 🔍 Vérification DNS

Vous pouvez vérifier si les DNS sont correctement configurés avec ces commandes :

### Windows PowerShell

```powershell
# Vérifier nurayna.com
nslookup nurayna.com

# Vérifier www.nurayna.com
nslookup www.nurayna.com
```

### En ligne

- [DNS Checker](https://dnschecker.org/)
- [What's My DNS](https://www.whatsmydns.net/)

## 📋 Checklist

- [ ] Enregistrements DNS ajoutés chez le registrar
- [ ] Attendu la propagation DNS (5-15 minutes)
- [ ] Vérifié la configuration dans Vercel Dashboard
- [ ] Statut passé à "Valid Configuration"
- [ ] Site accessible sur `https://nurayna.com`
- [ ] Site accessible sur `https://www.nurayna.com`

## 🐛 Dépannage

### Le statut reste "Invalid Configuration"

1. **Vérifiez les valeurs DNS** : Assurez-vous que les valeurs correspondent exactement à celles fournies par Vercel
2. **Attendez plus longtemps** : La propagation DNS peut prendre jusqu'à 48h
3. **Vérifiez avec nslookup** : Utilisez les commandes ci-dessus pour vérifier
4. **Contactez votre registrar** : Certains registrars ont des configurations spéciales

### Le site ne charge pas

1. **Vérifiez HTTPS** : Assurez-vous d'utiliser `https://` et non `http://`
2. **Vérifiez le certificat SSL** : Vercel génère automatiquement un certificat SSL, mais cela peut prendre quelques minutes
3. **Videz le cache** : Essayez en navigation privée ou videz le cache du navigateur

## 📚 Documentation Vercel

- [Vercel DNS Documentation](https://vercel.com/docs/concepts/projects/domains)
- [Troubleshooting DNS](https://vercel.com/docs/concepts/projects/domains/troubleshooting)

---

**Une fois la configuration DNS correcte, vos domaines seront opérationnels !** 🎉

