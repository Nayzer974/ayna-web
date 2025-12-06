// Utilitaires d'authentification communs

/**
 * Vérifie si un token est valide
 */
function isValidToken(token) {
    return token && token.length > 0;
}

/**
 * Extrait les paramètres de l'URL
 */
function getUrlParams() {
    const params = new URLSearchParams(window.location.search);
    return {
        token: params.get('token') || params.get('code'),
        token_hash: params.get('token_hash'),
        type_hash: params.get('type_hash'),
        type: params.get('type') || 'signup'
    };
}

/**
 * Affiche un message d'erreur
 */
function showErrorMessage(message, errorElementId = 'errorMessage') {
    const errorElement = document.getElementById(errorElementId);
    if (errorElement) {
        errorElement.textContent = message;
    }
    console.error('Erreur:', message);
}

/**
 * Valide un mot de passe
 */
function validatePassword(password) {
    if (!password || password.length < 6) {
        return { valid: false, message: 'Le mot de passe doit contenir au moins 6 caractères.' };
    }
    return { valid: true };
}

/**
 * Valide que deux mots de passe correspondent
 */
function validatePasswordMatch(password, confirmPassword) {
    if (password !== confirmPassword) {
        return { valid: false, message: 'Les mots de passe ne correspondent pas.' };
    }
    return { valid: true };
}

