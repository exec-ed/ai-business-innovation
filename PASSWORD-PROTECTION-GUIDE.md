# Password Protection for Instructor Materials

Simple client-side password protection for GitHub Pages-hosted instructor resources.

---

## How It Works

### Overview

Instructor materials at `/instructor/` use JavaScript-based password protection:

1. **User visits protected page** → `docs/instructor/index.html` or any instructor material
2. **`auth.js` checks authentication** → Looks for valid session token
3. **If not authenticated** → Prompts for password
4. **Password is hashed** (SHA-256) and compared to stored hash
5. **If correct** → Session token stored, content revealed
6. **On logout** → Session cleared, page reloads

### Protection Level

⚠️ **This is "light" protection** - suitable for:
- ✅ Facilitation guides and teaching notes
- ✅ Exercise answer keys
- ✅ Preventing casual/accidental access
- ✅ Search engine exclusion (`<meta name="robots" content="noindex">`)

❌ **NOT suitable for:**
- Confidential company data
- Personal information
- Trade secrets
- Compliance-regulated content

**Why?** Password hash is visible in source code. Determined users can bypass it.

**For truly sensitive content:** Use a private GitHub repository with GitHub authentication.

---

## Current Setup

### Password

**Current instructor password:** `instructor2025`

### Where It's Used

Protected pages:
- `/instructor/` - Instructor portal index
- `/instructor/facilitation-guide.html` - Main facilitation guide
- `/instructor/exercise-facilitation-notes.html` - Exercise-specific notes
- `/instructor/pdf/*.pdf` - Protected PDFs

### How Users Access

1. User clicks "Instructor Login" button
2. Prompted: **"🔒 Instructor Materials Password:"**
3. Enters password
4. If correct: Redirected to instructor portal
5. Session persists until:
   - Browser tab closed
   - User clicks "Logout"
   - Session storage manually cleared

---

## Changing the Password

### Method 1: Browser Console (Easiest)

**Steps:**

1. **Open browser console** (F12 or right-click → Inspect → Console)

2. **Load the auth.js file** by visiting any instructor page (you'll be prompted for password)

3. **Generate new hash in console:**
   ```javascript
   generatePasswordHash('your-new-password')
   ```

4. **Copy the output hash**
   ```
   Password hash for "your-new-password":
   a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e1f2

   Update INSTRUCTOR_PASSWORD_HASH in auth.js with this value.
   ```

5. **Edit `build/templates/auth.js`:**
   ```javascript
   // OLD:
   const INSTRUCTOR_PASSWORD_HASH = 'c8a5e0f7e5c3b7a8d9c1e4f6a2b3d5c6...';

   // NEW:
   const INSTRUCTOR_PASSWORD_HASH = 'a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6...';
   ```

6. **Commit and push:**
   ```bash
   git add build/templates/auth.js
   git commit -m "Update instructor password"
   git push
   ```

7. **Wait 1-2 minutes** for GitHub Actions to rebuild

8. **Test new password** by visiting `/instructor/` in incognito mode

---

### Method 2: Command Line (macOS/Linux)

**Steps:**

1. **Generate SHA-256 hash:**
   ```bash
   echo -n "your-new-password" | shasum -a 256
   ```

   **Important:** Use `-n` flag to avoid newline

2. **Copy the output hash** (first part before filename):
   ```
   a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e1f2  -
   ```

3. **Edit `build/templates/auth.js`:**
   ```javascript
   const INSTRUCTOR_PASSWORD_HASH = 'paste-hash-here';
   ```

4. **Commit and push**

---

### Method 3: Online SHA-256 Tool (Not Recommended)

⚠️ **Security Warning:** Never enter sensitive passwords into online tools.

For instructor materials (low security), you can use:
- https://emn178.github.io/online-tools/sha256.html
- Paste password → Copy hash → Update `auth.js`

---

## User Experience

### First Visit

```
User: *Clicks "Instructor Login" on website*

Browser: 🔒 Instructor Materials Password:

         (Contact michael.borck@curtin.edu.au if you need access)

         [          ] [Cancel] [OK]

User: *Enters "instructor2025"*

Browser: *Loads instructor portal with materials*
```

### Successful Login

User sees:
- **Instructor portal** with facilitation resources
- **"🔓 Logout"** link in footer
- **All materials accessible** without re-entering password (session persists)

### Failed Login

```
Browser: ❌ Incorrect password. Please try again.

         Contact michael.borck@curtin.edu.au if you need access.

         [OK]

Browser: *Prompts again for password*
```

### Cancel on First Prompt

```
User: *Clicks "Cancel"*

Browser: *Redirects to public home page*
```

---

## Technical Details

### Files Involved

**1. `build/templates/auth.js`**
- Password hashing logic
- Session management
- Authentication check
- Prompt UI

**2. `build/templates/instructor-page.html`**
- Protected page template
- Loads `auth.js`
- Calls `checkAuth()` on page load
- Hides content until authenticated

**3. Generated pages:**
- `docs/instructor/index.html` - Portal
- `docs/instructor/facilitation-guide.html` - Protected content
- `docs/instructor/exercise-facilitation-notes.html` - Protected content

### How Session Works

**Session Storage (Browser):**
```javascript
// On successful login:
sessionStorage.setItem('instructor_auth_token', hash);

// On page load:
const token = sessionStorage.getItem('instructor_auth_token');
if (token === INSTRUCTOR_PASSWORD_HASH) {
  // Show content
}

// On logout:
sessionStorage.removeItem('instructor_auth_token');
```

**Scope:**
- **Per-tab:** Different tabs require separate logins
- **Temporary:** Cleared when tab closes
- **Domain-specific:** Only works on your GitHub Pages domain

---

## Search Engine Exclusion

Protected pages include:
```html
<meta name="robots" content="noindex, nofollow">
```

This tells search engines:
- ❌ Don't index this page
- ❌ Don't follow links on this page

**Note:** This is a request, not enforcement. Determined crawlers may ignore it.

---

## Sharing Access with Co-Facilitators

### Option 1: Share Password (Simple)

**Email template:**

```
Subject: AI Innovation Masterclass - Instructor Access

Hi [Name],

Access to instructor materials for the AI Innovation Masterclass:

Portal: https://michaelborck-executive-education.github.io/ai-business-innovation/instructor/
Password: instructor2025

The portal contains:
- Complete facilitation guide
- Exercise-by-exercise teaching notes
- PDF versions for offline access

Session persists while browser tab is open. Click "Logout" when done.

Questions? Reply to this email.

Cheers,
Michael
```

### Option 2: Different Passwords per User (Advanced)

**Limitation:** Current implementation uses ONE password hash.

**To support multiple passwords:**

You'd need to modify `auth.js`:
```javascript
const VALID_HASHES = [
  'hash-for-password-1',
  'hash-for-password-2',
  'hash-for-password-3'
];

// Then check:
if (VALID_HASHES.includes(hash)) {
  // Authenticate
}
```

**Tradeoff:** More complex, still visible in source code

---

## Upgrading Security

If you need stronger protection, consider:

### Option 1: Private Repository

**Setup:**
1. Create separate private repo: `ai-innovation-instructor`
2. Move instructor materials there
3. Grant access to specific GitHub users
4. Link from public site: "Request access via GitHub"

**Pros:**
- ✅ Real authentication (GitHub accounts)
- ✅ Audit trail (who accessed when)
- ✅ Fine-grained permissions

**Cons:**
- ❌ Requires GitHub account
- ❌ More complex for non-technical users

### Option 2: StaticCrypt

**What it is:** Encrypts entire HTML files with AES-256

**Setup:**
```bash
npm install -g staticrypt

staticrypt docs/instructor/index.html -p your-password
```

**Pros:**
- ✅ Stronger encryption
- ✅ Content truly hidden until decrypted
- ✅ Still static hosting

**Cons:**
- ❌ Requires build step per file
- ❌ Separate password prompt per page
- ❌ Slightly slower page load

### Option 3: Backend Authentication

**Setup:**
- Use Netlify/Vercel with password protection
- Add authentication service (Auth0, Firebase)
- Move to server-side rendering

**Pros:**
- ✅ True security
- ✅ User management
- ✅ Access control

**Cons:**
- ❌ No longer static hosting
- ❌ Hosting costs
- ❌ Much more complex

---

## Troubleshooting

### Password Not Working

**Symptoms:**
- Correct password rejected
- Endless password prompts

**Fixes:**

1. **Clear session storage:**
   - Open browser console (F12)
   - Run: `sessionStorage.clear()`
   - Reload page

2. **Try incognito mode:**
   - Eliminates caching issues
   - Fresh session storage

3. **Verify hash:**
   - Check `auth.js` has correct hash
   - Regenerate hash and compare

4. **Check for typos:**
   - Password is case-sensitive
   - No spaces before/after

### Can't Remember Password

**Solution:**

1. **Read it from source code:**
   - View `docs/js/auth.js` on GitHub
   - Look for comment with current password
   - Or generate a hash of common passwords and compare

2. **Reset it:**
   - Follow "Changing the Password" steps above
   - Use browser console to generate new hash

### Session Lost on Refresh

**Expected behavior:** Session persists within same tab

**If session clears on refresh:**
- Check browser isn't in Private/Incognito mode
- Check browser allows sessionStorage
- Verify no extensions are clearing storage

---

## Best Practices

### Password Selection

**Good passwords:**
- ✅ `instructor2025` (current)
- ✅ `curtin-ai-workshop`
- ✅ `executive-ed-2025`

**Avoid:**
- ❌ `password` (too obvious)
- ❌ `123456` (too weak)
- ❌ Personal passwords (this is visible in code)

### Sharing Passwords

**Do:**
- ✅ Share via email
- ✅ Share in person
- ✅ Include in pre-course facilitator pack

**Don't:**
- ❌ Post publicly on social media
- ❌ Include in public documentation
- ❌ Commit to git comments with password in plain text

### Maintenance

**Change password when:**
- ✅ New course delivery (annual)
- ✅ Facilitator team changes
- ✅ Suspected unauthorized access

**Don't need to change:**
- After each course delivery (same facilitators)
- Every month (overkill for this use case)

---

## Summary

### What You Have

✅ **Simple password protection** for instructor materials
✅ **Session-based access** (login once per session)
✅ **Easy password changes** (browser console or command line)
✅ **Search engine exclusion** (`noindex` meta tag)
✅ **User-friendly prompts** with contact info

### What This Is Good For

✅ Protecting facilitation guides from students
✅ Preventing accidental public access
✅ Keeping materials off Google search
✅ Quick access for authorized facilitators

### What This Is NOT

❌ Cryptographically secure
❌ Compliance-grade protection
❌ Per-user authentication
❌ Access auditing/logging

**For teaching materials:** This is perfect.
**For sensitive data:** Use a private repository.

---

## Contact

**Questions about password protection?**
Email: michael.borck@curtin.edu.au

**Technical issues?**
See BUILD-README.md troubleshooting section
