# Folder Structure - Clear Separation of Concerns

## Final Organization (After Cleanup)

### 📁 `participant-materials/` - ALL PARTICIPANT-FACING CONTENT
**Purpose:** Everything participants see/use during and after workshop

**Markdown Files (converted to HTML by build script):**
- frameworks-reference-sheet.md
- strategic-prompting-guide.md
- how-to-use-retailflow.md
- retailflow-company-overview.md
- personal-action-plan-worksheet.md
- preparing-for-the-masterclass.md

**Interactive HTML Files (copied as-is to docs/):**
- ai-leadership-style-assessment.html ⭐ INTERACTIVE
- investment-calculator.html ⭐ INTERACTIVE
- ai-investment-checklist-interactive.html ⭐ INTERACTIVE
- executive-ai-prompt-library-interactive.html ⭐ INTERACTIVE

**Why here:** Single source of truth for all participant materials. Build script processes this folder.

---

### 📁 `activities/` - INSTRUCTOR-ONLY EXERCISE MATERIALS
**Purpose:** Exercise instructions and printable materials for facilitator use during workshop

**Exercise Instructions:**
- ai-assisted-strategic-analysis.md (Exercise 2 facilitator guide)
- strategic-response-scenarios.md (Exercise 4 scenarios)
- strategic-response-scenarios-interactive.md (MS Forms setup guide)

**Printable Materials:**
- ai-capability-cards.md (digital version)
- ai-capability-cards-printable.md (4 cards per A4 page - print & cut)
- README-capability-cards.md (facilitator printing guide)

**Scenario Documents:**
- investment-pitch-scenarios.md (Dragon's Den 4 scenarios)

**Templates (instructor reference, not for distribution):**
- ai-transformation-matrix-template.md
- investment-calculator-template.md (superseded by interactive HTML)
- personal-action-plan-template.md

**Why here:** Instructors need these during workshop delivery. NOT published to participant-facing website.

---

### 📁 `instructor-materials/` - FACILITATOR GUIDES
**Purpose:** Complete delivery instructions, teaching notes, answer keys

**Subdirectories:**
- `facilitation-notes/` - Complete delivery guides
  - facilitator-guide.md (64-page complete guide)
  - delivery-timeline.md (minute-by-minute schedule)
  - storytelling-narratives.md (teaching stories)
  - day-review-and-improvements.md (schedule optimization)
  
- `exercise-guides/` - Exercise facilitation
  - exercise-2-guide.md (AI-Assisted Strategic Analysis)
  
- `answer-keys/` - Answer keys and rationales
  - dragon-den-decision-rationales.md
  - exercise-2-ai-responses.md
  
- `wisdom-ai/` - Background reading for facilitators
  - Various .txt files with AI thought leadership

**Why here:** Facilitator preparation and delivery support. Some converted to HTML for password-protected instructor portal.

---

### 📁 `pre-readings/` - REQUIRED PRE-COURSE READINGS
**Purpose:** Materials participants must read 48 hours before course

**Files:**
- strategic-ai-investment.md (15 min)
- what-executives-need-to-know-about-ai.md (12 min)
- why-ai-innovation-is-different.md (10 min)

**Why separate:** Emphasizes these are PRE-course requirements, not day-of materials.

**Build:** Converted to HTML and linked from materials-pre-readings.html

---

### 📁 `docs/` - GITHUB PAGES OUTPUT (GENERATED)
**Purpose:** Built website served on GitHub Pages

**Main Pages (hand-written, not generated):**
- index.html
- overview.html
- frameworks.html
- exercises.html ✅ UPDATED to match current 4 exercises
- schedule.html
- materials.html (hub page)

**Materials Section Pages (hand-written):**
- materials-interactive-tools.html
- materials-pre-readings.html
- materials-reference.html
- materials-case-study.html
- materials-worksheets.html

**Generated Content (from build script):**
- 6 participant material pages (from participant-materials/*.md)
- 3 pre-reading pages (from pre-readings/*.md)
- 4 interactive tools (copied from participant-materials/*.html)
- 5 instructor pages (from instructor-materials/*/*)

**Why here:** Single static website folder for GitHub Pages. DO NOT edit generated files directly - edit source files and rebuild.

---

### 📁 `build/` - BUILD SYSTEM
**Purpose:** Convert markdown to HTML and deploy to docs/

**Structure:**
- `scripts/build.sh` - Main build script
- `templates/` - Pandoc HTML templates
  - material-page.html (participant pages)
  - instructor-page.html (password-protected pages)
  - pdf-template.tex (unused - PDF disabled)

**What build does:**
1. Converts participant-materials/*.md → docs/*.html
2. Converts pre-readings/*.md → docs/*.html
3. Converts instructor-materials/*/*.md → docs/instructor/*.html
4. Copies participant-materials/*.html → docs/*.html (interactive tools)
5. Copies CSS/JS assets

---

## File Type Guide

### Markdown (.md) Files
**Purpose:** Source files that get converted to HTML
**Located in:** participant-materials/, pre-readings/, instructor-materials/, activities/
**Action:** Edit these, then run build script to regenerate HTML

### Interactive HTML (.html) Files  
**Purpose:** Self-contained tools with JavaScript (calculator, assessment, etc.)
**Located in:** participant-materials/ (source), docs/ (deployed)
**Action:** Edit in participant-materials/, run build to copy to docs/

### Static HTML (.html) Files
**Purpose:** Hand-written pages (index, exercises, materials hub, etc.)
**Located in:** docs/ only
**Action:** Edit directly in docs/ (not generated)

---

## What Gets Published to Participants?

### Via GitHub Pages (docs/ folder):
✅ Pre-readings (3 md → html)
✅ Reference materials (6 md → html)
✅ Interactive tools (4 html → copied)
✅ Worksheets (2 md → html)
✅ Navigation pages (5 html hand-written)

### NOT Published (instructor-only):
❌ activities/ folder (exercise instructions, printable cards)
❌ instructor-materials/ folder (except password-protected portal)
❌ build/ folder (build system)

---

## Decision Log - Markdown vs Interactive HTML

### Kept Both (Different Use Cases):
- frameworks-reference-sheet: .md → HTML (static reference, no interactivity needed)
- strategic-prompting-guide: .md → HTML (static examples, no interactivity needed)

### Deleted Markdown (Interactive HTML is Superior):
- ❌ ai-investment-checklist.md (interactive version has auto-scoring)
- ❌ executive-ai-prompt-library.md (interactive version has search/filter/copy)

### Templates (Instructor Reference Only):
- investment-calculator-template.md (superseded by interactive HTML)
- personal-action-plan-template.md (worksheet version exists)
- ai-transformation-matrix-template.md (used during exercises)

---

## Clear Rules Going Forward

### To Add New Participant Material:

**If static content:**
1. Create .md file in `participant-materials/`
2. Run `bash build/scripts/build.sh`
3. HTML appears in `docs/`
4. Link from appropriate materials-*.html page

**If interactive tool:**
1. Create .html file in `participant-materials/`
2. Add to INTERACTIVE_FILES array in build.sh
3. Run build script
4. Link from materials-interactive-tools.html

**If instructor material:**
1. Create .md file in `instructor-materials/[subdirectory]/`
2. Add to INSTRUCTOR_FILES array in build.sh
3. Run build script
4. Appears in docs/instructor/ (password-protected)

### To Update Website:
1. Edit source files (not docs/ generated files)
2. Run `bash build/scripts/build.sh`
3. Test locally: `cd docs && python3 -m http.server 8000`
4. Commit and push
5. GitHub Pages auto-deploys

---

**Status: CLEAN, ORGANIZED, NO DUPLICATION** ✅

All materials aligned. Clear separation between instructor and participant content. 
Build system handles everything automatically. Ready for production use.
