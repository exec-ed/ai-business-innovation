# Project Structure

**Last Updated:** October 30, 2025  
**Status:** ✅ Production Ready

---

## Directory Structure

```
ai-business-innovation/
├── index.html                      ← GitHub Pages landing page (root serving)
│
├── pre-readings/                   ← Executive pre-readings (REQUIRED, ~40 min)
│   ├── strategic-ai-investment.md          (15 min - portfolio thinking)
│   ├── retailflow-company-overview.md      (10 min - case study context)
│   └── what-executives-need-to-know-about-ai.md  (12 min - non-technical AI)
│
├── activities/                     ← Exercise materials and templates
│   ├── ai-capability-cards.md              (Exercise 1 - 12 capability cards)
│   ├── investment-pitch-scenarios.md       (Exercise 3 - 4 RetailFlow scenarios)
│   ├── strategic-response-scenarios.md     (Exercise 4 - 3 decision scenarios)
│   ├── ai-transformation-matrix-template.md
│   ├── investment-calculator-template.md
│   └── personal-action-plan-template.md
│
├── handouts/                       ← Reference materials
│   └── frameworks-reference-sheet.md       (All 5 frameworks)
│
├── slides/                         ← Slide deck (to be created)
│   └── README.md
│
├── FACILITATOR_GUIDE.md            ← Complete 64-page delivery guide
├── DELIVERY_TIMELINE.md            ← Minute-by-minute schedule
├── COURSE_STATUS.md                ← Readiness summary
├── README.md                       ← Course overview and quick start
└── RESTRUCTURE_SUMMARY.md          ← History of restructure decisions
```

---

## File Purposes

### Root Files

| File | Purpose | Audience |
|------|---------|----------|
| `index.html` | GitHub Pages landing page | Participants (web) |
| `README.md` | Course overview and quick start | Facilitators |
| `FACILITATOR_GUIDE.md` | Complete delivery instructions | Facilitators |
| `DELIVERY_TIMELINE.md` | Minute-by-minute schedule | Facilitators |
| `COURSE_STATUS.md` | Readiness checklist | Facilitators |

### Pre-Readings (REQUIRED for participants)

| File | Topic | Reading Time |
|------|-------|--------------|
| `strategic-ai-investment.md` | Portfolio thinking, Three Horizons, ROI | 15 minutes |
| `retailflow-company-overview.md` | Dragon's Den case study context | 10 minutes |
| `what-executives-need-to-know-about-ai.md` | Non-technical AI overview | 12 minutes |

**Total:** 37 minutes  
**Send:** 48 hours before course

### Activities

| File | Exercise | Duration | Type |
|------|----------|----------|------|
| `ai-capability-cards.md` | Exercise 1: AI Tech Radar | 45 min | Portfolio mapping |
| `investment-pitch-scenarios.md` | Exercise 3: Dragon's Den | 90 min | Investment simulation |
| `strategic-response-scenarios.md` | Exercise 4: Strategic Response | 15 min | Quick decisions |
| `ai-transformation-matrix-template.md` | Exercise 1 | - | Participant worksheet |
| `investment-calculator-template.md` | Exercise 3 | - | ROI calculator (digital) |
| `personal-action-plan-template.md` | Final | - | 90-day action plan |

### Handouts

| File | Purpose | When |
|------|---------|------|
| `frameworks-reference-sheet.md` | All 5 frameworks in one document | Take-home reference |

### Slides

| File | Purpose |
|------|---------|
| `slide-deck.md` | Presentation slides (to be created from frameworks) |

---

## GitHub Pages Publishing

### Configuration
- **Serve from:** Root (not `docs/` folder)
- **Branch:** `main`
- **Landing page:** `index.html`

### Why Root Instead of docs/?
1. **Source files in root:** Avoid duplication of markdown files
2. **Simpler structure:** All materials in one place
3. **Easier maintenance:** Edit once, publish once
4. **Same as ai-leadership-and-pm:** Consistent structure

### Publishing Workflow
1. Edit markdown files in root folders
2. Convert to HTML/PDF as needed (or serve markdown directly)
3. GitHub Pages automatically publishes from root
4. Participants access via `username.github.io/ai-business-innovation`

---

## Folder Naming Rationale

### `pre-readings/` (not `content/`)
- Clear purpose: Materials to read BEFORE course
- Aligns with participant instructions
- Distinguishes from other content types

### `activities/` (not `exercises/`)
- Broader term: Includes materials, templates, scenarios
- Matches terminology in FACILITATOR_GUIDE
- Activities = exercises + templates

### `handouts/` (not `references/`)
- Clear purpose: Materials participants take home
- Traditional academic term
- Distinguishes from pre-readings

### `slides/` (not `content/`)
- Clear purpose: Presentation deck
- Renamed from ambiguous `content/`
- Matches ai-leadership-and-pm structure

---

## BYOD Requirements

### Why BYOD is Required
1. **ROI Calculator:** Exercise 3 requires spreadsheet software (Excel, Google Sheets)
2. **Executive Expectation:** C-suite participants expect to use own devices
3. **Digital Templates:** Participants can take home editable files
4. **Note-taking:** Use their preferred tools

### Minimum Device Requirements
- Laptop or tablet
- Spreadsheet software (Excel, Google Sheets, Numbers)
- Calculator functionality
- PDF reader (for handouts)

### Activity Format: Hybrid Digital/Physical
- **Digital:** Templates, calculators, action plans
- **Physical:** Flipcharts, sticky notes (for group collaboration)
- **Printed:** Frameworks reference, pitch scenarios (optional)

---

## Comparison to ai-leadership-and-pm

### Similarities
- Root-level GitHub Pages serving
- Same folder structure (pre-readings/, activities/, handouts/, slides/)
- Markdown source files
- BYOD required
- Professional publishing format

### Differences
- **Pre-readings:** Executive strategic focus (vs. practitioner operational)
- **Activities:** Investment simulation (vs. crisis management)
- **Target audience:** C-suite (vs. project managers)
- **Exercise duration:** 90-min Dragon's Den (vs. 60-min crisis sim)

---

## Migration Summary

### What Was Deleted
- `_archive/` - Draft materials (in git history)
- `activities/materials/` - Merged into `activities/`
- `activities/templates/` - Merged into `activities/`
- `content/` - Renamed to `slides/`
- `docs/` - Moved to root

### What Was Created
- 3 executive-focused pre-readings
- `slides/` folder structure
- `index.html` in root
- This `PROJECT_STRUCTURE.md` file

### What Was Moved
- All materials from `docs/` → root
- `content/` → `slides/`

---

## Next Steps for Facilitators

### 1 Week Before Course
- [ ] Enable GitHub Pages (Settings → Pages → Source: root)
- [ ] Send pre-readings to participants (3 markdown files)
- [ ] Create digital templates (Google Sheets for calculator)
- [ ] Convert frameworks reference to PDF (optional)

### Day Before Course
- [ ] Print frameworks reference (1 per participant)
- [ ] Print investment scenarios (Exercise 3)
- [ ] Test projector and AV
- [ ] Set up room for Dragon's Den breakouts

### During Course
- [ ] Confirm all participants brought devices
- [ ] Share digital template links
- [ ] Follow DELIVERY_TIMELINE.md
- [ ] Capture feedback for improvements

---

## Quick Access URLs

**When GitHub Pages is enabled:**
- Landing: `https://[username].github.io/ai-business-innovation/`
- Pre-readings: `https://[username].github.io/ai-business-innovation/pre-readings/`
- Activities: `https://[username].github.io/ai-business-innovation/activities/`
- Frameworks: `https://[username].github.io/ai-business-innovation/handouts/frameworks-reference-sheet.html`

---

## Key Principles

1. **Root serving:** Simplifies structure, avoids duplication
2. **BYOD required:** Executive expectation + functional necessity
3. **Hybrid format:** Digital templates + physical collaboration
4. **Executive-focused:** Strategic investment, not technical implementation
5. **Consistent structure:** Matches ai-leadership-and-pm for maintainability

---

**The structure is finalized and ready for course delivery.**
