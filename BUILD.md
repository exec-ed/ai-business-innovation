# Build System Guide

## Quick Start

### Build Course Materials
```bash
bash build/scripts/build.sh
```

**Output:** 30 HTML files in `docs/` directory

### Test Locally
```bash
cd docs
python3 -m http.server 8000
# Visit http://localhost:8000
```

### Deploy to GitHub Pages
1. Push to GitHub
2. Settings → Pages → Source: main branch, /docs folder
3. Site live at: `[username].github.io/ai-business-innovation/`

---

## What Gets Built

### From participant-materials/ (6 markdown files):
- frameworks-reference-sheet.md → HTML
- strategic-prompting-guide.md → HTML
- how-to-use-retailflow.md → HTML
- retailflow-company-overview.md → HTML
- personal-action-plan-worksheet.md → HTML
- preparing-for-the-masterclass.md → HTML

### From pre-readings/ (3 markdown files):
- strategic-ai-investment.md → HTML
- what-executives-need-to-know-about-ai.md → HTML
- why-ai-innovation-is-different.md → HTML

### Interactive Tools Copied (4 HTML files):
- ai-leadership-style-assessment.html
- investment-calculator.html
- ai-investment-checklist-interactive.html
- executive-ai-prompt-library-interactive.html

### From instructor-materials/ (5 markdown files):
- facilitation-notes/facilitator-guide.md → HTML (password-protected)
- facilitation-notes/delivery-timeline.md → HTML (password-protected)
- facilitation-notes/storytelling-narratives.md → HTML (password-protected)
- exercise-guides/exercise-2-guide.md → HTML (password-protected)
- answer-keys/dragon-den-decision-rationales.md → HTML (password-protected)

**Total Output:** 30 HTML files

---

## Folder Structure

```
participant-materials/  ← Participant-facing content (source)
  ├── *.md             ← Converted to HTML by build
  └── *.html           ← Interactive tools (copied as-is)

activities/            ← Instructor-only exercise materials
  └── *.md             ← NOT published to website

instructor-materials/  ← Facilitator guides
  └── */*.md           ← Converted to password-protected HTML

docs/                  ← GitHub Pages output (GENERATED)
  ├── *.html           ← Built from sources above
  ├── css/             ← Copied from build/templates/
  └── js/              ← Copied from build/templates/

build/                 ← Build system
  ├── scripts/build.sh ← Main build script
  └── templates/       ← Pandoc templates + CSS/JS
```

---

## Key Features

### Print to PDF
Every material page has "🖨️ Print to PDF" button that opens browser print dialog.

### Interactive Tools
4 browser-based tools (no installation):
- AI Leadership Style Assessment (before/after comparison)
- AI Investment Calculator (ROI calculations)
- AI Investment Checklist (auto-scoring)
- Executive AI Prompt Library (searchable, copy-paste)

### Navigation
Dropdown "Materials" menu on all pages with 6 sections:
- Interactive Tools
- Pre-Readings
- Reference Materials
- RetailFlow Case Study
- Worksheets
- Instructor Portal

### Password Protection
Instructor materials protected with password: `instructor2025`

---

## How to Update Materials

### Update Existing Content:
1. Edit source file in `participant-materials/` or `pre-readings/`
2. Run `bash build/scripts/build.sh`
3. Test locally
4. Commit and push

### Add New Material:
1. Create .md file in `participant-materials/`
2. Add filename to FILES array in `build/scripts/build.sh`
3. Run build script
4. Add link to appropriate materials-*.html page
5. Commit and push

### Add New Interactive Tool:
1. Create .html file in `participant-materials/`
2. Add path to INTERACTIVE_FILES array in `build/scripts/build.sh`
3. Run build script
4. Add link to `materials-interactive-tools.html`
5. Commit and push

---

## Troubleshooting

**Build fails:**
- Check pandoc is installed: `pandoc --version`
- Check source files exist in correct folders

**Links broken:**
- Run build script to regenerate
- Check paths in materials-*.html pages

**CSS not updating:**
- Edit CSS in `build/templates/`
- Run build script to copy to `docs/css/`

**Password not working:**
- Default: `instructor2025`
- Hash in `docs/js/auth.js` line 19

---

For detailed documentation, see:
- FOLDER-STRUCTURE-CLARITY.md - File organisation
- instructor-materials/README.md - Instructor materials guide

**Build system is production-ready and fully automated.**
