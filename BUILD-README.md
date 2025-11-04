# AI Business Innovation - Build System

Automated build system for course materials using **GitHub Actions** + **Pandoc**.

## Overview

This repository serves dual purposes:
1. **GitHub Pages Website** - Public course materials at `https://michaelborck-executive-education.github.io/ai-business-innovation/`
2. **PDF Generation** - Print-ready materials for in-person delivery

**Single source of truth:** Markdown files → Auto-generate HTML (web) + PDF (print)

---

## Quick Start

### Workflow
```bash
# 1. Edit markdown files
vim participant-materials/frameworks-reference-sheet.md

# 2. Commit and push
git add .
git commit -m "Update frameworks"
git push

# 3. Done! GitHub Actions automatically:
#    - Builds HTML + PDF
#    - Commits to docs/
#    - GitHub Pages deploys
#    - Live in 30-60 seconds
```

---

## What Gets Built

### Participant Materials (Public)
- ✅ `frameworks-reference-sheet.md` → HTML + PDF
- ✅ `ai-investment-checklist.md` → HTML + PDF
- ✅ `how-to-use-retailflow.md` → HTML + PDF
- ✅ `retailflow-company-overview.txt` → HTML + PDF
- ✅ `personal-action-plan-worksheet.md` → HTML + PDF

### Pre-Readings (Public)
- ✅ `strategic-ai-investment.txt` → HTML + PDF
- ✅ `what-executives-need-to-know-about-ai.txt` → HTML + PDF
- ✅ `why-ai-innovation-is-different.txt` → HTML + PDF

### Instructor Materials (Password Protected) 🔒
- ✅ `facilitation-guide.md` → HTML + PDF (protected)
- ✅ `exercise-facilitation-notes.md` → HTML + PDF (protected)

**Password:** `instructor2025` (change in `build/templates/auth.js`)

---

## Directory Structure

```
ai-business-innovation/
├── .github/workflows/
│   └── build-materials.yml       # GitHub Actions workflow
│
├── participant-materials/         # SOURCE: Public materials (markdown)
│   ├── frameworks-reference-sheet.md
│   ├── ai-investment-checklist.md
│   ├── how-to-use-retailflow.md
│   ├── personal-action-plan-worksheet.md
│   └── retailflow-company-overview.txt
│
├── pre-readings/                  # SOURCE: Pre-course readings
│   ├── strategic-ai-investment.txt
│   ├── what-executives-need-to-know-about-ai.txt
│   └── why-ai-innovation-is-different.txt
│
├── instructor-materials/          # SOURCE: Protected instructor resources
│   ├── facilitation-guide.md
│   └── exercise-facilitation-notes.md
│
├── build/                         # Build system
│   ├── scripts/
│   │   └── build.sh              # Build script (CI + local)
│   └── templates/
│       ├── material-page.html    # Public material template
│       ├── instructor-page.html  # Protected material template
│       ├── pdf-template.tex      # PDF template (LaTeX)
│       ├── materials.css         # Styling
│       └── auth.js               # Password protection
│
└── docs/                          # OUTPUT: GitHub Pages serves from here
    ├── index.html                # Landing page
    ├── materials.html            # Materials index
    ├── *.html                    # Generated material pages
    ├── pdf/                      # Generated PDFs
    ├── css/                      # Copied CSS
    ├── js/                       # Copied JS
    └── instructor/               # Protected instructor area
        ├── index.html            # Instructor portal
        ├── *.html                # Protected pages
        └── pdf/                  # Protected PDFs
```

---

## GitHub Actions Workflow

**File:** `.github/workflows/build-materials.yml`

**Triggers:**
- Push to `main` branch
- Changes to `participant-materials/`, `pre-readings/`, `instructor-materials/`, or `build/`
- Manual trigger (workflow_dispatch)

**What it does:**
1. Installs Pandoc + LaTeX
2. Runs `build/scripts/build.sh`
3. Commits generated files to `docs/`
4. GitHub Pages auto-deploys

**View builds:** https://github.com/michaelborck-executive-education/ai-business-innovation/actions

---

## Local Testing (Optional)

If you want to build locally before pushing:

### Install Dependencies (macOS)

```bash
# Install Pandoc
brew install pandoc

# Install LaTeX (for PDFs)
brew install --cask basictex

# Add LaTeX to PATH (add to ~/.zshrc)
export PATH="/Library/TeX/texbin:$PATH"
source ~/.zshrc

# Install LaTeX packages
sudo tlmgr update --self
sudo tlmgr install titling lastpage fancyhdr geometry
```

### Build Locally

```bash
# Run build script
bash build/scripts/build.sh

# Outputs to:
# - docs/*.html (web pages)
# - docs/pdf/*.pdf (PDFs)
# - docs/instructor/ (protected)
```

### Preview Locally

```bash
# Serve from docs/ folder
cd docs
python3 -m http.server 8000

# Open browser to:
# http://localhost:8000
```

---

## Password Protection

### How It Works

**Instructor materials** use client-side JavaScript password protection:

1. User visits `/instructor/` or any protected page
2. JavaScript prompts for password
3. Password is hashed (SHA-256) and compared to stored hash
4. If correct, content is revealed and session persisted
5. Logout clears session

**Current password:** `instructor2025`

### Changing the Password

**Option 1: Using Browser Console**

1. Open browser console (F12)
2. Paste and run:
   ```javascript
   generatePasswordHash('your-new-password')
   ```
3. Copy the hash output
4. Edit `build/templates/auth.js`:
   ```javascript
   const INSTRUCTOR_PASSWORD_HASH = 'paste-hash-here';
   ```
5. Commit and push

**Option 2: Manual Hash Generation**

```bash
# On macOS/Linux:
echo -n "your-new-password" | shasum -a 256
```

Copy the hash to `build/templates/auth.js`

### Security Note

⚠️ **This is client-side protection** - it prevents casual access but is NOT cryptographically secure.

For truly sensitive content:
- Use a separate private GitHub repository
- Use GitHub authentication
- Use a proper backend with server-side auth

**This protection is sufficient for:**
- ✅ Facilitator guides
- ✅ Teaching notes
- ✅ Exercise answer keys
- ✅ Preventing accidental public access

**NOT suitable for:**
- ❌ Confidential company data
- ❌ Personal information
- ❌ Trade secrets

---

## URLs

### Production (GitHub Pages)

**Main site:**
- Home: `https://michaelborck-executive-education.github.io/ai-business-innovation/`
- Materials: `https://michaelborck-executive-education.github.io/ai-business-innovation/materials.html`

**Participant materials:**
- Frameworks: `.../frameworks-reference-sheet.html`
- Checklist: `.../ai-investment-checklist.html`
- RetailFlow: `.../retailflow-company-overview.html`
- Action Plan: `.../personal-action-plan-worksheet.html`

**PDFs:**
- `.../pdf/frameworks-reference-sheet.pdf`
- `.../pdf/ai-investment-checklist.pdf`
- Etc.

**Instructor portal (password protected):**
- `.../instructor/`

---

## Customization

### Styling

Edit `build/templates/materials.css` to change:
- Colors (CSS variables at top)
- Fonts
- Layout
- Responsive breakpoints

### PDF Layout

Edit `build/templates/pdf-template.tex` to change:
- Margins
- Headers/footers
- Fonts
- Page numbers

### HTML Templates

- **Public materials:** `build/templates/material-page.html`
- **Instructor materials:** `build/templates/instructor-page.html`

---

## Troubleshooting

### Build Fails in GitHub Actions

**Check the workflow log:**
1. Go to Actions tab
2. Click failed workflow
3. Expand failed step
4. Look for errors

**Common issues:**
- **Markdown syntax error** → Fix markdown formatting
- **LaTeX error** → Check PDF template or markdown content
- **File not found** → Verify file paths in build script

### PDFs Not Generating

**Symptom:** HTML works, but PDFs missing

**Cause:** LaTeX installation issues in CI

**Solution:** PDFs are optional. HTML still works. To debug:
```bash
# Test locally
bash build/scripts/build.sh
# Check PDF generation output
```

### Changes Don't Appear on Site

**Wait 1-2 minutes** for GitHub Pages to deploy

**Force refresh:** Ctrl+Shift+R (Windows) or Cmd+Shift+R (Mac)

**Check:** Did GitHub Actions workflow succeed?

### Password Not Working

**Clear browser session storage:**
```javascript
// In browser console:
sessionStorage.clear()
```

**Verify hash:** Check that `INSTRUCTOR_PASSWORD_HASH` in `auth.js` matches the password you're trying

---

## Adding New Materials

### Add New Participant Material

1. **Create markdown file:**
   ```bash
   touch participant-materials/new-material.md
   ```

2. **Edit `build/scripts/build.sh`:**
   ```bash
   FILES=(
     "frameworks-reference-sheet"
     "ai-investment-checklist"
     "how-to-use-retailflow"
     "personal-action-plan-worksheet"
     "new-material"  # Add this line
   )
   ```

3. **Add to `docs/materials.html`:**
   ```html
   <div class="material-card">
     <h3>New Material</h3>
     <p>Description here</p>
     <div class="actions">
       <a href="new-material.html" class="btn-primary">View Online</a>
       <a href="pdf/new-material.pdf" class="btn-secondary">Download PDF</a>
     </div>
   </div>
   ```

4. **Commit and push:**
   ```bash
   git add .
   git commit -m "Add new material"
   git push
   ```

### Add New Instructor Material

1. **Create markdown file:**
   ```bash
   touch instructor-materials/new-guide.md
   ```

2. **Edit `build/scripts/build.sh`:**
   ```bash
   INSTRUCTOR_FILES=(
     "facilitation-guide"
     "exercise-facilitation-notes"
     "new-guide"  # Add this
   )
   ```

3. **Update `docs/instructor/index.html`** to link to it

4. **Commit and push**

---

## GitHub Pages Configuration

**Current setup:**
- **Branch:** `main`
- **Folder:** `/docs`
- **URL:** `https://michaelborck-executive-education.github.io/ai-business-innovation/`

**To verify/change:**
1. Go to repository Settings
2. Click "Pages" in left sidebar
3. Check "Build and deployment" settings

---

## Custom Domain (Optional)

To use a custom domain like `ai-innovation.curtin.edu.au`:

1. **Create `docs/CNAME`:**
   ```
   ai-innovation.curtin.edu.au
   ```

2. **Configure DNS at Curtin:**
   ```
   Type: CNAME
   Name: ai-innovation
   Value: michaelborck-executive-education.github.io
   ```

3. **In GitHub Settings → Pages:**
   - Custom domain: `ai-innovation.curtin.edu.au`
   - Enforce HTTPS: ✅

---

## Support

**Contact:** michael.borck@curtin.edu.au

**Documentation:**
- [BUILD-SYSTEM-GUIDE.md](BUILD-SYSTEM-GUIDE.md) - Original build guide
- [BUILD-SYSTEM-GUIDE-GITHUB-PAGES.md](BUILD-SYSTEM-GUIDE-GITHUB-PAGES.md) - GitHub Pages integration

**Resources:**
- [Pandoc Documentation](https://pandoc.org/MANUAL.html)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

---

## License

Course materials © 2025 Dr. Michael Borck, Curtin Business School
