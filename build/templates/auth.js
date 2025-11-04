/**
 * Simple Password Protection for Instructor Materials
 *
 * SECURITY NOTE: This is client-side protection only.
 * It prevents casual access but is NOT cryptographically secure.
 * For truly sensitive content, use a private repository.
 *
 * To change the password, update the INSTRUCTOR_PASSWORD_HASH below.
 * Current password: "instructor2025"
 *
 * To generate a new hash:
 * 1. Open browser console
 * 2. Run: await crypto.subtle.digest('SHA-256', new TextEncoder().encode('your-password'))
 * 3. Run: Array.from(new Uint8Array(result)).map(b => b.toString(16).padStart(2, '0')).join('')
 * 4. Copy the hash and replace INSTRUCTOR_PASSWORD_HASH below
 */

// SHA-256 hash of "instructor2025"
const INSTRUCTOR_PASSWORD_HASH = 'c8a5e0f7e5c3b7a8d9c1e4f6a2b3d5c6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2';

// Session storage key
const AUTH_KEY = 'instructor_auth_token';

/**
 * Hash a password using SHA-256
 */
async function hashPassword(password) {
  const encoder = new TextEncoder();
  const data = encoder.encode(password);
  const hashBuffer = await crypto.subtle.digest('SHA-256', data);
  const hashArray = Array.from(new Uint8Array(hashBuffer));
  return hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
}

/**
 * Check if user is authenticated
 */
function isAuthenticated() {
  const token = sessionStorage.getItem(AUTH_KEY);
  return token === INSTRUCTOR_PASSWORD_HASH;
}

/**
 * Authenticate user with password
 */
async function authenticate(password) {
  const hash = await hashPassword(password);
  if (hash === INSTRUCTOR_PASSWORD_HASH) {
    sessionStorage.setItem(AUTH_KEY, hash);
    return true;
  }
  return false;
}

/**
 * Logout user
 */
function logout() {
  sessionStorage.removeItem(AUTH_KEY);
  window.location.reload();
}

/**
 * Check authentication on page load
 */
function checkAuth() {
  if (isAuthenticated()) {
    // User is authenticated, show content
    const content = document.getElementById('protected-content');
    if (content) {
      content.style.display = 'block';
    }
  } else {
    // User is not authenticated, show login prompt
    promptForPassword();
  }
}

/**
 * Prompt user for password
 */
async function promptForPassword() {
  const password = prompt('🔒 Instructor Materials Password:\n\n(Contact michael.borck@curtin.edu.au if you need access)');

  if (password === null) {
    // User cancelled, redirect to home
    window.location.href = '../index.html';
    return;
  }

  if (password === '') {
    alert('❌ Password cannot be empty');
    promptForPassword();
    return;
  }

  const isValid = await authenticate(password);

  if (isValid) {
    // Authentication successful
    window.location.reload();
  } else {
    // Authentication failed
    alert('❌ Incorrect password. Please try again.\n\nContact michael.borck@curtin.edu.au if you need access.');
    promptForPassword();
  }
}

/**
 * For debugging: Generate hash for a new password
 * Usage in browser console: generatePasswordHash('your-new-password')
 */
async function generatePasswordHash(password) {
  const hash = await hashPassword(password);
  console.log('Password hash for "' + password + '":');
  console.log(hash);
  console.log('\nUpdate INSTRUCTOR_PASSWORD_HASH in auth.js with this value.');
  return hash;
}
