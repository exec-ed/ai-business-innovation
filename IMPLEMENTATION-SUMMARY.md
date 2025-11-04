# Implementation Summary: Build System + GitHub Pages

## What I've Created

Complete automated build system for your AI Business Innovation Masterclass with:
- ✅ **GitHub Actions workflow** - Auto-builds on push
- ✅ **Single-source markdown** - Edit once, generate HTML + PDF
- ✅ **GitHub Pages integration** - Automatic deployment
- ✅ **Password protection** - Simple JS-based auth for instructor materials
- ✅ **Materials index** - Clean navigation for all resources
- ✅ **Updated landing page** - Links to generated materials

---

## Files Created

### Build System

| File | Purpose |
|------|---------|
| `.github/workflows/build-materials.yml` | GitHub Actions workflow |
| `build/scripts/build.sh` | Build script (CI + local) |
| `build/templates/material-page.html` | Template for public materials |
| `build/templates/instructor-page.html` | Template for protected materials |
| `build/templates/pdf-template.tex` | LaTeX template for PDFs |
| `build/templates/materials.css` | Styling for all material pages |
| `build/templates/auth.js` | Password protection logic |

### Documentation

| File | Purpose |
|------|---------|
| `BUILD-README.md` | Quick start + comprehensive guide |
| `BUILD-SYSTEM-GUIDE-GITHUB-PAGES.md` | Detailed technical documentation |
| `PASSWORD-PROTECTION-GUIDE.md` | Password setup + troubleshooting |
| `IMPLEMENTATION-SUMMARY.md` | This file - overview of everything |

### Generated Pages

| File | Purpose |
|------|---------|
| `docs/materials.html` | Materials index page |
| `docs/instructor/index.html` | Password-protected instructor portal |

### Modified Files

| File | Change |
|------|--------|
| `index.html` | Updated Resources section with links to materials |
| `index.html` | Added "Materials" to navigation |

---

## How It Works

### Your Workflow

```
┌─────────────────────────────────────┐
│ 1. Edit Markdown Files              │
│    participant-materials/*.md       │
│    pre-readings/*.txt               │
│    instructor-materials/*.md        │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│ 2. Commit & Push                    │
│    git add .                        │
│    git commit -m "Update materials" │
│    git push                         │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│ 3. GitHub Actions (Automatic)       │
│    • Checkout code                  │
│    • Install Pandoc + LaTeX         │
│    • Run build.sh                   │
│    • Generate HTML + PDF            │
│    • Commit to docs/                │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│ 4. GitHub Pages Deploy (Automatic)  │
│    • Detects changes to docs/       │
│    • Deploys to live site           │
│    • Live in 30-60 seconds          │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│ 5. Users Access Materials           │
│    • Browse HTML online             │
│    • Download PDFs                  │
│    • Instructor login with password │
└─────────────────────────────────────┘
```

---

## What Gets Built

### From `participant-materials/`

**Source (you edit):**
- `frameworks-reference-sheet.md`
- `ai-investment-checklist.md`
- `how-to-use-retailflow.md`
- `personal-action-plan-worksheet.md`
- `retailflow-company-overview.txt`

**Generated (automatic):**
- `docs/frameworks-reference-sheet.html` ← View online
- `docs/pdf/frameworks-reference-sheet.pdf` ← Download
- *(same pattern for all 5 files)*

### From `pre-readings/`

**Source:**
- `strategic-ai-investment.txt`
- `what-executives-need-to-know-about-ai.txt`
- `why-ai-innovation-is-different.txt`

**Generated:**
- `docs/strategic-ai-investment.html` + PDF
- `docs/what-executives-need-to-know-about-ai.html` + PDF
- `docs/why-ai-innovation-is-different.html` + PDF

### From `instructor-materials/` 🔒

**Source:**
- `facilitation-guide.md`
- `exercise-facilitation-notes.md`

**Generated (password protected):**
- `docs/instructor/facilitation-guide.html` + PDF
- `docs/instructor/exercise-facilitation-notes.html` + PDF
- `docs/instructor/index.html` ← Instructor portal

**Password:** `instructor2025`

---

## URLs (After GitHub Pages Setup)

### Main Site
- **Home:** `https://michaelborck-executive-education.github.io/ai-business-innovation/`
- **Materials:** `https://michaelborck-executive-education.github.io/ai-business-innovation/materials.html`

### Example Material URLs
- **Frameworks:** `.../frameworks-reference-sheet.html`
- **PDF:** `.../pdf/frameworks-reference-sheet.pdf`
- **Instructor:** `.../instructor/` (password protected)

---

## Next Steps: GitHub Pages Setup

### 1. Push These Changes

```bash
# Add all new files
git add .

# Commit
git commit -m "Add automated build system with GitHub Pages integration"

# Push to trigger first build
git push
```

### 2. Enable GitHub Pages

1. Go to repository: https://github.com/michaelborck-executive-education/ai-business-innovation
2. Click **Settings** → **Pages** (left sidebar)
3. Under "Build and deployment":
   - **Source:** Deploy from a branch
   - **Branch:** `main`
   - **Folder:** `/docs`
4. Click **Save**

### 3. Wait for First Build

- Go to **Actions** tab
- Watch "Build Course Materials" workflow run
- Should complete in ~2-3 minutes

### 4. Visit Your Site

After build completes, GitHub Pages will deploy:
- **URL:** `https://michaelborck-executive-education.github.io/ai-business-innovation/`

### 5. Test Password Protection

- Visit: `.../instructor/`
- Enter password: `instructor2025`
- Should see instructor portal

---

## Testing Checklist

Once deployed, verify:

### Public Materials
- [ ] Home page loads (`index.html`)
- [ ] Materials index loads (`materials.html`)
- [ ] Framework reference loads (HTML)
- [ ] Framework reference PDF downloads
- [ ] All 5 participant materials work (HTML + PDF)
- [ ] All 3 pre-readings work (HTML + PDF)

### Navigation
- [ ] "Materials" link in header works
- [ ] Resource cards on home page link correctly
- [ ] "View Online" buttons work
- [ ] "Download PDF" buttons work

### Instructor Materials
- [ ] Instructor portal prompts for password
- [ ] Correct password grants access
- [ ] Incorrect password shows error
- [ ] Facilitation guide loads (HTML + PDF)
- [ ] Exercise notes load (HTML + PDF)
- [ ] Logout button works

### Build System
- [ ] GitHub Actions workflow succeeds
- [ ] Changes to markdown trigger rebuild
- [ ] Generated files appear in `docs/`
- [ ] PDFs generate correctly

---

## Customization Guide

### Change Colors

Edit `build/templates/materials.css`:

```css
:root {
  --primary: #7c3aed;        /* Purple - main brand color */
  --primary-dark: #5b21b6;   /* Darker purple - hover states */
  --secondary: #f59e0b;      /* Orange - accents */
  --dark: #1f2937;           /* Dark gray - headings */
  --light: #f3f4f6;          /* Light gray - backgrounds */
}
```

### Change Password

**Option 1: Browser Console**
```javascript
generatePasswordHash('new-password')
// Copy hash, update auth.js
```

**Option 2: Command Line**
```bash
echo -n "new-password" | shasum -a 256
# Copy hash, update auth.js
```

Then edit `build/templates/auth.js`:
```javascript
const INSTRUCTOR_PASSWORD_HASH = 'new-hash-here';
```

### Add New Material

1. Create markdown: `participant-materials/new-material.md`
2. Edit `build/scripts/build.sh`:
   ```bash
   FILES=(
     "frameworks-reference-sheet"
     # ... existing files
     "new-material"  # Add this
   )
   ```
3. Update `docs/materials.html` with link
4. Commit and push

---

## Troubleshooting

### Build Fails

**Check:**
1. GitHub Actions log (Actions tab → Failed workflow)
2. Look for markdown syntax errors
3. Verify file paths in `build.sh`

**Common issues:**
- Markdown formatting error → Fix markdown
- Missing file → Check filename in `build.sh`
- LaTeX error → Check PDF template

### Changes Don't Appear

**Wait:** 1-2 minutes for GitHub Pages to deploy

**Force refresh:** Ctrl+Shift+R (Windows) or Cmd+Shift+R (Mac)

**Check:** Did GitHub Actions succeed?

### PDFs Missing

**Cause:** LaTeX installation issue in CI

**Solution:** HTML still works. PDFs are optional. Check Actions log for LaTeX errors.

### Password Doesn't Work

**Clear session:**
```javascript
// Browser console:
sessionStorage.clear()
```

**Verify hash:** Check `auth.js` has correct hash

---

## Local Development (Optional)

If you want to build locally before pushing:

### Install Dependencies (macOS)

```bash
# Pandoc
brew install pandoc

# LaTeX (for PDFs)
brew install --cask basictex

# Add to PATH
export PATH="/Library/TeX/texbin:$PATH"

# LaTeX packages
sudo tlmgr update --self
sudo tlmgr install titling lastpage fancyhdr geometry
```

### Build Locally

```bash
bash build/scripts/build.sh
```

### Preview Locally

```bash
cd docs
python3 -m http.server 8000
# Open: http://localhost:8000
```

---

## File Structure Reference

```
ai-business-innovation/
│
├── .github/workflows/
│   └── build-materials.yml          ← AUTO-BUILD TRIGGER
│
├── participant-materials/            ← EDIT THESE
│   ├── frameworks-reference-sheet.md
│   ├── ai-investment-checklist.md
│   ├── how-to-use-retailflow.md
│   ├── personal-action-plan-worksheet.md
│   └── retailflow-company-overview.txt
│
├── pre-readings/                     ← EDIT THESE
│   ├── strategic-ai-investment.txt
│   ├── what-executives-need-to-know-about-ai.txt
│   └── why-ai-innovation-is-different.txt
│
├── instructor-materials/             ← EDIT THESE (protected)
│   ├── facilitation-guide.md
│   └── exercise-facilitation-notes.md
│
├── build/                            ← BUILD CONFIGURATION
│   ├── scripts/build.sh
│   └── templates/
│       ├── material-page.html
│       ├── instructor-page.html
│       ├── pdf-template.tex
│       ├── materials.css
│       └── auth.js
│
├── docs/                             ← GENERATED (don't edit)
│   ├── index.html                   ← Landing page (you edited)
│   ├── materials.html               ← Materials index (generated)
│   ├── *.html                       ← Material pages (generated)
│   ├── pdf/*.pdf                    ← PDFs (generated)
│   ├── css/materials.css            ← Copied from build/
│   ├── js/auth.js                   ← Copied from build/
│   └── instructor/                  ← Protected area
│       ├── index.html
│       ├── *.html
│       └── pdf/*.pdf
│
├── BUILD-README.md                   ← START HERE
├── BUILD-SYSTEM-GUIDE-GITHUB-PAGES.md
├── PASSWORD-PROTECTION-GUIDE.md
└── IMPLEMENTATION-SUMMARY.md         ← YOU ARE HERE
```

---

## Key Features Summary

### ✅ Single Source of Truth
- Edit markdown once
- Generates HTML + PDF automatically
- Consistent formatting across formats

### ✅ Zero-Click Publishing
- Push to GitHub
- Automatic build
- Live in 60 seconds

### ✅ Password Protection
- Instructor materials protected
- Simple password: `instructor2025`
- Session-based (login once per session)

### ✅ Professional Presentation
- Clean, responsive design
- Matching your existing site style
- Print-ready PDFs

### ✅ Easy Maintenance
- Add new materials: 3 steps
- Change password: 1 file edit
- Update content: edit markdown

---

## Cost

**Total cost:** $0

- ✅ GitHub Pages: Free for public repos
- ✅ GitHub Actions: 2,000 minutes/month free (builds take ~2 min)
- ✅ Pandoc: Free and open source
- ✅ LaTeX: Free and open source

---

## Support Resources

### Documentation
- **Quick start:** `BUILD-README.md`
- **Full technical guide:** `BUILD-SYSTEM-GUIDE-GITHUB-PAGES.md`
- **Password guide:** `PASSWORD-PROTECTION-GUIDE.md`

### External Resources
- [Pandoc Manual](https://pandoc.org/MANUAL.html)
- [GitHub Pages Docs](https://docs.github.com/en/pages)
- [GitHub Actions Docs](https://docs.github.com/en/actions)

### Contact
**Michael Borck:** michael.borck@curtin.edu.au

---

## What's Next?

### Immediate (Required)
1. ✅ Push changes to GitHub
2. ✅ Enable GitHub Pages in repository settings
3. ✅ Wait for first build
4. ✅ Test site and materials

### Soon (Recommended)
1. ⏳ Add actual content to instructor materials
2. ⏳ Test build with real markdown files
3. ⏳ Share instructor password with co-facilitators
4. ⏳ Add to pre-course email template

### Later (Optional)
1. 🔄 Custom domain (e.g., `ai-innovation.curtin.edu.au`)
2. 🔄 Google Analytics tracking
3. 🔄 Feedback form integration
4. 🔄 Auto-generate materials index from directory

---

## Success Criteria

You'll know it's working when:

✅ You edit a markdown file
✅ Push to GitHub
✅ GitHub Actions builds successfully
✅ HTML appears on website
✅ PDF downloads work
✅ Instructor password protects materials
✅ Participants can access public materials
✅ Facilitators can access protected materials

**Expected time to full deployment:** 5-10 minutes after first push

---

## Summary

### What You Can Do Now

**Edit materials:**
```bash
vim participant-materials/frameworks-reference-sheet.md
git add .
git commit -m "Update frameworks"
git push
# Wait 60 seconds → Live on website
```

**Share with participants:**
```
Materials: https://michaelborck-executive-education.github.io/ai-business-innovation/materials.html
```

**Share with facilitators:**
```
Instructor portal: https://michaelborck-executive-education.github.io/ai-business-innovation/instructor/
Password: instructor2025
```

### What You DON'T Need to Do

❌ Manually build HTML
❌ Manually build PDFs
❌ Manually upload to website
❌ Maintain separate web and print versions
❌ Email materials to participants
❌ Worry about keeping formats in sync

---

**Everything is ready. Just push and go!** 🚀
