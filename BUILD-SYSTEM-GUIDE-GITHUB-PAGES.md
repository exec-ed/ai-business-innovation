# Build System for GitHub Pages + PDF Generation

**Context:** This repository serves dual purposes:
1. **GitHub Pages website** - Public course materials (HTML)
2. **PDF generation** - Print-ready materials for in-person delivery

**Goal:** Single markdown source → automated HTML (web) + PDF (print) generation

---

## Revised Recommendation: GitHub Actions + Pandoc

### Why This Changes Everything

**Before (local-only):** Bash scripts, manual builds, local PDF generation

**Now (GitHub Pages):**
- ✅ Push markdown → auto-generate HTML + PDF
- ✅ HTML deployed to GitHub Pages automatically
- ✅ PDFs available for download from website
- ✅ Zero manual build steps
- ✅ Version control tracks everything
- ✅ Participants access materials via clean URLs

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────┐
│ 1. Edit Markdown (participant-materials/*.md)          │
│    • frameworks-reference-sheet.md                       │
│    • ai-investment-checklist.md                          │
│    • how-to-use-retailflow.md                            │
│    • personal-action-plan-worksheet.md                   │
│    • retailflow-company-overview.md (convert .txt)       │
└─────────────────────────────────────────────────────────┘
                         ↓
                    git push
                         ↓
┌─────────────────────────────────────────────────────────┐
│ 2. GitHub Actions Workflow Triggered                    │
│    • Checkout code                                       │
│    • Install Pandoc + LaTeX                              │
│    • Run build script                                    │
└─────────────────────────────────────────────────────────┘
                         ↓
           ┌─────────────┴──────────────┐
           ↓                            ↓
┌──────────────────────┐    ┌──────────────────────┐
│ 3a. Generate HTML    │    │ 3b. Generate PDF     │
│  → docs/*.html       │    │  → docs/pdf/*.pdf    │
│  (GitHub Pages)      │    │  (download links)    │
└──────────────────────┘    └──────────────────────┘
           ↓                            ↓
┌─────────────────────────────────────────────────────────┐
│ 4. GitHub Pages Deploys                                 │
│    • HTML live at: your-username.github.io/repo-name/   │
│    • PDFs downloadable from site                        │
│    • index.html links to all materials                  │
└─────────────────────────────────────────────────────────┘
```

---

## Directory Structure (Revised for GitHub Pages)

```
ai-business-innovation/
├── .github/
│   └── workflows/
│       └── build-materials.yml        # NEW: GitHub Actions workflow
│
├── participant-materials/              # Source markdown (unchanged)
│   ├── frameworks-reference-sheet.md
│   ├── ai-investment-checklist.md
│   ├── how-to-use-retailflow.md
│   ├── personal-action-plan-worksheet.md
│   └── retailflow-company-overview.txt (→ convert to .md)
│
├── build/                              # Build scripts and templates
│   ├── templates/
│   │   ├── html-template.html         # Pandoc HTML template
│   │   ├── pdf-template.tex           # Pandoc LaTeX template
│   │   └── material-page.html         # Individual material page template
│   └── scripts/
│       └── build.sh                   # Build script (for CI and local)
│
├── docs/                               # NEW: GitHub Pages root
│   ├── index.html                     # Your existing landing page
│   ├── materials.html                 # NEW: Materials index page
│   ├── frameworks-reference-sheet.html
│   ├── ai-investment-checklist.html
│   ├── how-to-use-retailflow.html
│   ├── personal-action-plan-worksheet.html
│   ├── retailflow-company-overview.html
│   ├── pdf/                           # PDFs for download
│   │   ├── frameworks-reference-sheet.pdf
│   │   ├── ai-investment-checklist.pdf
│   │   ├── how-to-use-retailflow.pdf
│   │   ├── personal-action-plan-worksheet.pdf
│   │   └── retailflow-company-overview.pdf
│   └── css/
│       └── materials.css              # Consistent styling
│
├── pre-readings/                       # Pre-readings (also convert to HTML)
│   ├── strategic-ai-investment.txt
│   ├── what-executives-need-to-know-about-ai.txt
│   └── why-ai-innovation-is-different.txt
│
└── README.md                           # Project README
```

**Key change:** Generated files go to `docs/` (GitHub Pages serves from `/docs` folder)

---

## Implementation: Step-by-Step

### Step 1: Configure GitHub Pages

**In your GitHub repository:**

1. Go to **Settings** → **Pages**
2. **Source:** Deploy from a branch
3. **Branch:** `main`
4. **Folder:** `/docs`
5. Click **Save**

**Result:** GitHub Pages will serve from `https://michaelborck-executive-education.github.io/ai-business-innovation/`

---

### Step 2: Create GitHub Actions Workflow

**File: `.github/workflows/build-materials.yml`**

```yaml
name: Build Course Materials

on:
  push:
    branches: [ main ]
    paths:
      - 'participant-materials/**'
      - 'pre-readings/**'
      - 'build/**'
      - '.github/workflows/build-materials.yml'
  workflow_dispatch:  # Allow manual triggering

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v4

    - name: Install Pandoc
      run: |
        sudo apt-get update
        sudo apt-get install -y pandoc

    - name: Install LaTeX (for PDF generation)
      run: |
        sudo apt-get install -y texlive-latex-base texlive-fonts-recommended texlive-latex-extra

    - name: Create output directories
      run: |
        mkdir -p docs/pdf
        mkdir -p docs/css

    - name: Run build script
      run: bash build/scripts/build.sh

    - name: Commit generated files
      run: |
        git config --local user.email "github-actions[bot]@users.noreply.github.com"
        git config --local user.name "github-actions[bot]"
        git add docs/
        git diff --quiet && git diff --staged --quiet || git commit -m "Auto-build course materials [skip ci]"

    - name: Push changes
      uses: ad-m/github-push-action@master
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        branch: main
```

**What this does:**
- Triggers on push to `main` when materials change
- Installs Pandoc + LaTeX in CI environment
- Runs build script
- Commits generated HTML/PDF back to repo
- GitHub Pages auto-deploys updated `docs/`

---

### Step 3: Create Build Script (CI-Compatible)

**File: `build/scripts/build.sh`**

```bash
#!/bin/bash

# Build Course Materials for GitHub Pages + PDF
# Runs in CI (GitHub Actions) or locally

set -e  # Exit on error

# Colors (work in CI logs too)
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Directories
SOURCE_DIR="participant-materials"
PREREADINGS_DIR="pre-readings"
OUTPUT_DIR="docs"
OUTPUT_PDF="docs/pdf"
TEMPLATE_DIR="build/templates"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Building Course Materials${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Create output directories
mkdir -p "$OUTPUT_DIR"
mkdir -p "$OUTPUT_PDF"
mkdir -p "$OUTPUT_DIR/css"

# Copy CSS to output
if [ -f "$TEMPLATE_DIR/materials.css" ]; then
  cp "$TEMPLATE_DIR/materials.css" "$OUTPUT_DIR/css/"
  echo -e "${GREEN}✓${NC} Copied CSS\n"
fi

# Files to convert
FILES=(
  "frameworks-reference-sheet"
  "ai-investment-checklist"
  "how-to-use-retailflow"
  "personal-action-plan-worksheet"
)

# Pre-readings to convert
PREREADING_FILES=(
  "strategic-ai-investment"
  "what-executives-need-to-know-about-ai"
  "why-ai-innovation-is-different"
)

# Function: Convert markdown to HTML for web
convert_to_html() {
  local filename=$1
  local source="$2/${filename}.md"
  local output="$OUTPUT_DIR/${filename}.html"
  local title=$(echo "$filename" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')

  echo -e "${GREEN}Converting${NC} $filename.md → HTML..."

  pandoc "$source" \
    --from markdown \
    --to html5 \
    --template="$TEMPLATE_DIR/material-page.html" \
    --standalone \
    --toc \
    --toc-depth=2 \
    --variable title="$title" \
    --variable filename="$filename" \
    --css="css/materials.css" \
    -o "$output"

  if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓${NC} Created: $output\n"
  else
    echo -e "${YELLOW}⚠${NC} Warning: Failed to create HTML for $filename\n"
  fi
}

# Function: Convert markdown to PDF for print
convert_to_pdf() {
  local filename=$1
  local source="$2/${filename}.md"
  local output="$OUTPUT_PDF/${filename}.pdf"

  echo -e "${GREEN}Converting${NC} $filename.md → PDF..."

  pandoc "$source" \
    --from markdown \
    --to pdf \
    --template="$TEMPLATE_DIR/pdf-template.tex" \
    --pdf-engine=pdflatex \
    --variable papersize=letter \
    --variable geometry:margin=1in \
    --variable fontsize=11pt \
    -o "$output" 2>/dev/null

  if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓${NC} Created: $output\n"
  else
    echo -e "${YELLOW}⚠${NC} Warning: Failed to create PDF for $filename (LaTeX may not be installed)\n"
  fi
}

# Convert participant materials
echo -e "${BLUE}Building Participant Materials...${NC}\n"
for file in "${FILES[@]}"; do
  if [ -f "$SOURCE_DIR/${file}.md" ]; then
    convert_to_html "$file" "$SOURCE_DIR"
    convert_to_pdf "$file" "$SOURCE_DIR"
  else
    echo -e "${YELLOW}⚠${NC} File not found: $SOURCE_DIR/${file}.md\n"
  fi
done

# Special case: retailflow-company-overview.txt
RETAILFLOW_FILE="retailflow-company-overview"
if [ -f "$SOURCE_DIR/${RETAILFLOW_FILE}.txt" ]; then
  echo -e "${BLUE}Converting RetailFlow (special case)...${NC}\n"

  # Convert .txt to .md temporarily
  cp "$SOURCE_DIR/${RETAILFLOW_FILE}.txt" "$SOURCE_DIR/${RETAILFLOW_FILE}.md"

  convert_to_html "$RETAILFLOW_FILE" "$SOURCE_DIR"
  convert_to_pdf "$RETAILFLOW_FILE" "$SOURCE_DIR"

  # Clean up temporary .md file
  rm "$SOURCE_DIR/${RETAILFLOW_FILE}.md"
fi

# Convert pre-readings
echo -e "${BLUE}Building Pre-Readings...${NC}\n"
for file in "${PREREADING_FILES[@]}"; do
  if [ -f "$PREREADINGS_DIR/${file}.txt" ]; then
    # Convert .txt to .md temporarily
    cp "$PREREADINGS_DIR/${file}.txt" "$PREREADINGS_DIR/${file}.md"

    convert_to_html "$file" "$PREREADINGS_DIR"
    convert_to_pdf "$file" "$PREREADINGS_DIR"

    # Clean up
    rm "$PREREADINGS_DIR/${file}.md"
  else
    echo -e "${YELLOW}⚠${NC} File not found: $PREREADINGS_DIR/${file}.txt\n"
  fi
done

echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}Build Complete!${NC}"
echo -e "${BLUE}========================================${NC}"
echo -e "HTML files: ${OUTPUT_DIR}/"
echo -e "PDF files: ${OUTPUT_PDF}/"
echo -e "\nReady for GitHub Pages deployment."
```

Make executable:
```bash
chmod +x build/scripts/build.sh
```

---

### Step 4: Create HTML Template for Material Pages

**File: `build/templates/material-page.html`**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$title$ | AI Innovation Masterclass</title>
  <link rel="stylesheet" href="css/materials.css">
</head>
<body>
  <nav class="topnav">
    <div class="container">
      <a href="index.html" class="logo">AI Business Innovation</a>
      <div class="nav-links">
        <a href="index.html">Home</a>
        <a href="materials.html">Materials</a>
        <a href="pdf/$filename$.pdf" class="download-btn">📥 Download PDF</a>
      </div>
    </div>
  </nav>

  <main class="container">
    <article class="material-content">
      <header class="material-header">
        <h1>$title$</h1>
        <div class="material-meta">
          <span>AI-Driven Business Innovation Masterclass</span>
          <a href="pdf/$filename$.pdf" class="btn-primary">Download PDF</a>
        </div>
      </header>

      $if(toc)$
      <nav id="toc" class="toc">
        <h2>Contents</h2>
        $toc$
      </nav>
      $endif$

      <div class="content">
        $body$
      </div>

      <footer class="material-footer">
        <p><a href="materials.html">← Back to All Materials</a></p>
      </footer>
    </article>
  </main>

  <footer class="site-footer">
    <div class="container">
      <p>AI-Driven Business Innovation Masterclass | Curtin Business School</p>
      <p><a href="mailto:michael.borck@curtin.edu.au">michael.borck@curtin.edu.au</a></p>
    </div>
  </footer>
</body>
</html>
```

---

### Step 5: Create CSS for Materials

**File: `build/templates/materials.css`**

```css
:root {
  --primary: #7c3aed;
  --primary-dark: #5b21b6;
  --secondary: #f59e0b;
  --dark: #1f2937;
  --light: #f3f4f6;
  --white: #ffffff;
  --text: #374151;
  --border: #e5e7eb;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', sans-serif;
  line-height: 1.7;
  color: var(--text);
  background: var(--white);
}

.container {
  max-width: 900px;
  margin: 0 auto;
  padding: 0 20px;
}

/* Navigation */
.topnav {
  background: var(--white);
  border-bottom: 2px solid var(--border);
  position: sticky;
  top: 0;
  z-index: 100;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.topnav .container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 20px;
}

.topnav .logo {
  font-size: 1.25rem;
  font-weight: 700;
  color: var(--primary);
  text-decoration: none;
}

.topnav .nav-links {
  display: flex;
  gap: 2rem;
  align-items: center;
}

.topnav .nav-links a {
  text-decoration: none;
  color: var(--text);
  font-weight: 500;
  transition: color 0.3s;
}

.topnav .nav-links a:hover {
  color: var(--primary);
}

.download-btn {
  background: var(--primary);
  color: var(--white) !important;
  padding: 0.5rem 1rem;
  border-radius: 6px;
  font-weight: 600;
}

.download-btn:hover {
  background: var(--primary-dark);
}

/* Material Content */
main {
  padding: 3rem 0;
}

.material-content {
  background: var(--white);
}

.material-header {
  margin-bottom: 3rem;
  padding-bottom: 2rem;
  border-bottom: 3px solid var(--primary);
}

.material-header h1 {
  font-size: 2.5rem;
  color: var(--dark);
  margin-bottom: 1rem;
}

.material-meta {
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: var(--text);
  font-size: 0.95rem;
}

.btn-primary {
  background: var(--primary);
  color: var(--white);
  padding: 0.75rem 1.5rem;
  border-radius: 6px;
  text-decoration: none;
  font-weight: 600;
  transition: background 0.3s;
}

.btn-primary:hover {
  background: var(--primary-dark);
}

/* Table of Contents */
.toc {
  background: var(--light);
  padding: 1.5rem;
  border-radius: 8px;
  border-left: 4px solid var(--primary);
  margin-bottom: 3rem;
}

.toc h2 {
  font-size: 1.25rem;
  margin-bottom: 1rem;
  color: var(--primary);
}

.toc ul {
  list-style: none;
  padding-left: 0;
}

.toc li {
  margin: 0.5rem 0;
}

.toc a {
  color: var(--text);
  text-decoration: none;
}

.toc a:hover {
  color: var(--primary);
  text-decoration: underline;
}

/* Content */
.content {
  font-size: 1.1rem;
}

.content h1, .content h2, .content h3 {
  color: var(--dark);
  margin-top: 2rem;
  margin-bottom: 1rem;
}

.content h1 {
  font-size: 2rem;
  border-bottom: 2px solid var(--primary);
  padding-bottom: 0.5rem;
}

.content h2 {
  font-size: 1.75rem;
  border-bottom: 1px solid var(--border);
  padding-bottom: 0.5rem;
}

.content h3 {
  font-size: 1.5rem;
}

.content p {
  margin: 1rem 0;
}

.content ul, .content ol {
  margin: 1rem 0;
  padding-left: 2rem;
}

.content li {
  margin: 0.5rem 0;
}

.content table {
  width: 100%;
  border-collapse: collapse;
  margin: 2rem 0;
}

.content th, .content td {
  border: 1px solid var(--border);
  padding: 0.75rem;
  text-align: left;
}

.content th {
  background: var(--primary);
  color: var(--white);
  font-weight: 600;
}

.content tr:nth-child(even) {
  background: var(--light);
}

.content blockquote {
  border-left: 4px solid var(--secondary);
  padding-left: 1.5rem;
  margin: 1.5rem 0;
  color: #555;
  font-style: italic;
}

.content code {
  background: var(--light);
  padding: 0.2rem 0.5rem;
  border-radius: 4px;
  font-family: 'Courier New', monospace;
  font-size: 0.9em;
}

.content pre {
  background: var(--dark);
  color: var(--white);
  padding: 1.5rem;
  border-radius: 8px;
  overflow-x: auto;
  margin: 1.5rem 0;
}

.content pre code {
  background: transparent;
  color: var(--white);
  padding: 0;
}

/* Material Footer */
.material-footer {
  margin-top: 4rem;
  padding-top: 2rem;
  border-top: 1px solid var(--border);
  text-align: center;
}

.material-footer a {
  color: var(--primary);
  text-decoration: none;
  font-weight: 600;
}

.material-footer a:hover {
  text-decoration: underline;
}

/* Site Footer */
.site-footer {
  background: var(--dark);
  color: var(--white);
  padding: 3rem 0;
  text-align: center;
  margin-top: 4rem;
}

.site-footer a {
  color: var(--secondary);
  text-decoration: none;
}

.site-footer a:hover {
  text-decoration: underline;
}

/* Responsive */
@media (max-width: 768px) {
  .topnav .nav-links {
    display: none;
  }

  .material-header h1 {
    font-size: 2rem;
  }

  .material-meta {
    flex-direction: column;
    align-items: flex-start;
    gap: 1rem;
  }
}
```

This CSS will be copied to `docs/css/materials.css` during build.

---

### Step 6: Update index.html to Link to Materials

Update your existing `index.html` to link to the generated materials:

**In the "Resources" section (around line 987), update links:**

```html
<div class="resource-card">
  <div class="resource-icon">📋</div>
  <h3>Framework Reference</h3>
  <p class="description">Complete guide to all 5 strategic frameworks</p>
  <a href="frameworks-reference-sheet.html" class="btn">View Online</a>
  <a href="pdf/frameworks-reference-sheet.pdf" class="btn" style="margin-top:0.5rem;">Download PDF</a>
</div>

<div class="resource-card">
  <div class="resource-icon">✅</div>
  <h3>Investment Checklist</h3>
  <p class="description">AI-specific evaluation criteria</p>
  <a href="ai-investment-checklist.html" class="btn">View Online</a>
  <a href="pdf/ai-investment-checklist.pdf" class="btn" style="margin-top:0.5rem;">Download PDF</a>
</div>

<div class="resource-card">
  <div class="resource-icon">📚</div>
  <h3>RetailFlow Case Study</h3>
  <p class="description">Company context for Dragon's Den</p>
  <a href="retailflow-company-overview.html" class="btn">View Online</a>
  <a href="pdf/retailflow-company-overview.pdf" class="btn" style="margin-top:0.5rem;">Download PDF</a>
</div>

<div class="resource-card">
  <div class="resource-icon">📝</div>
  <h3>Action Plan Worksheet</h3>
  <p class="description">Personal 90-day planning template</p>
  <a href="personal-action-plan-worksheet.html" class="btn">View Online</a>
  <a href="pdf/personal-action-plan-worksheet.pdf" class="btn" style="margin-top:0.5rem;">Download PDF</a>
</div>
```

---

## Usage: Your New Workflow

### Daily Editing

```bash
# 1. Edit markdown files
code participant-materials/ai-investment-checklist.md

# 2. Test build locally (optional)
bash build/scripts/build.sh

# 3. Commit and push
git add participant-materials/ai-investment-checklist.md
git commit -m "Update investment checklist criteria"
git push
```

**What happens automatically:**
1. GitHub Actions detects push
2. Runs build script in CI
3. Generates HTML + PDF
4. Commits to `docs/`
5. GitHub Pages deploys updated site
6. Live in 30-60 seconds

**Your live site:**
- Main page: `https://michaelborck-executive-education.github.io/ai-business-innovation/`
- Materials: `https://michaelborck-executive-education.github.io/ai-business-innovation/frameworks-reference-sheet.html`
- PDFs: `https://michaelborck-executive-education.github.io/ai-business-innovation/pdf/frameworks-reference-sheet.pdf`

---

### Local Testing (Optional)

If you want to preview locally before pushing:

```bash
# Install Pandoc locally (one-time)
brew install pandoc
brew install --cask basictex

# Build locally
bash build/scripts/build.sh

# Serve locally
cd docs
python3 -m http.server 8000

# Open browser to http://localhost:8000
```

---

## PDF Template (LaTeX) - Same as Before

**File: `build/templates/pdf-template.tex`**

```latex
\documentclass[11pt,letterpaper]{article}

% Packages
\usepackage[margin=1in]{geometry}
\usepackage{fancyhdr}
\usepackage{titling}
\usepackage{lastpage}
\usepackage{hyperref}
\usepackage{graphicx}
\usepackage{longtable}
\usepackage{booktabs}

% Header/Footer
\pagestyle{fancy}
\fancyhf{}
\lhead{AI Innovation Masterclass}
\rhead{\thepage\ of \pageref{LastPage}}
\renewcommand{\headrulewidth}{0.4pt}

% Title formatting
\pretitle{\begin{center}\LARGE\bfseries}
\posttitle{\par\end{center}\vskip 0.5em}

% Hyperlink setup
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=blue,
    pdfauthor={Dr. Michael Borck},
    pdftitle={$title$}
}

% Document
\begin{document}

$if(title)$
\title{$title$}
\date{}
\maketitle
$endif$

$body$

\end{document}
```

---

## Advantages of GitHub Pages Approach

### Compared to Local-Only Build:

| Feature | Local Build | GitHub Pages Build |
|---------|-------------|-------------------|
| **Edit → Deploy** | Manual: edit, build, upload | Automatic: edit, push, done |
| **Version Control** | Only source files | Source + generated files |
| **Team Collaboration** | Email PDFs | Share live URL |
| **Updates** | Re-send PDFs | URL stays current |
| **Discovery** | Send files individually | Browse from website |
| **Print-Ready PDFs** | ✅ Yes | ✅ Yes |
| **Web Viewing** | ❌ Manual upload | ✅ Automatic |
| **Hosting Cost** | $0 (local) | $0 (GitHub Pages free) |

---

## Git Configuration

### .gitignore

**Add this to `.gitignore`:**

```gitignore
# Build outputs - COMMIT THESE (they go to docs/)
# (Remove docs/ from .gitignore if it's there)

# LaTeX temporary files (don't commit)
*.aux
*.log
*.out
*.toc
*.fls
*.fdb_latexmk

# macOS
.DS_Store

# Editor
*.swp
*.swo
*~

# Node modules (if using npm)
node_modules/
```

**Important:** Unlike typical projects, we **DO commit** `docs/` because GitHub Pages serves from it.

---

## Custom Domain (Optional)

If you want a custom domain like `ai-innovation.curtin.edu.au`:

1. **Create file `docs/CNAME`:**
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

## Monitoring Builds

### View Build Status

- Go to: `https://github.com/michaelborck-executive-education/ai-business-innovation/actions`
- See all builds, logs, errors

### Build Badge (Optional)

Add to your README.md:

```markdown
![Build Status](https://github.com/michaelborck-executive-education/ai-business-innovation/workflows/Build%20Course%20Materials/badge.svg)
```

---

## Comparison: Before vs. After

### Before (Local-Only Approach)

```
You: Edit markdown
You: Run bash build/scripts/build.sh
You: Check PDFs look good
You: Manually upload PDFs to LMS/email
You: Manually create HTML versions
You: Manually upload HTML to website
You: Send participants multiple links/files
Participants: Download 5 separate PDFs
```

### After (GitHub Pages Approach)

```
You: Edit markdown
You: git push
GitHub Actions: Builds everything automatically
GitHub Pages: Deploys updated site
You: Share one URL
Participants: Browse materials on website OR download PDFs
```

**Time saved per update:** ~15 minutes
**Time saved over course lifetime:** Hours

---

## Troubleshooting

### Build Fails in GitHub Actions

**Check the workflow log:**
1. Go to Actions tab
2. Click failed workflow
3. Expand failed step
4. Look for Pandoc errors

**Common issues:**
- Markdown syntax errors → Fix markdown
- LaTeX errors → Check PDF template
- Missing files → Verify file paths

### PDFs Don't Generate

**Cause:** LaTeX installation issues in CI

**Solution:** PDFs are optional. If LaTeX fails, HTML still works. To debug:
```bash
# Test locally
bash build/scripts/build.sh
# Check for errors in PDF generation
```

### Changes Don't Appear on Site

**Wait 1-2 minutes** for GitHub Pages to deploy.

**Force refresh browser:** Ctrl+Shift+R (Windows) or Cmd+Shift+R (Mac)

**Check:** Did GitHub Actions workflow succeed?

---

## Summary: Recommended Setup

### Immediate Actions (30 minutes):

1. ✅ Create `.github/workflows/build-materials.yml`
2. ✅ Create `build/scripts/build.sh`
3. ✅ Create `build/templates/material-page.html`
4. ✅ Create `build/templates/materials.css`
5. ✅ Create `build/templates/pdf-template.tex`
6. ✅ Update `index.html` resource links
7. ✅ Configure GitHub Pages (Settings → Pages → `/docs`)
8. ✅ Push to GitHub
9. ✅ Watch first build complete
10. ✅ Visit your live site!

### Your New Reality:

- **Source of truth:** Markdown files in `participant-materials/`
- **Edit workflow:** Change markdown → git push → done
- **Distribution:** Share one URL
- **Formats:** HTML (web) + PDF (print) from same source
- **Updates:** Automatic, instant
- **Cost:** $0

---

## Next Steps

Would you like me to:

1. **Create all the build files** (workflows, templates, scripts) in your repo?
2. **Create a materials index page** (`docs/materials.html`) to list all materials?
3. **Set up the GitHub Actions workflow** ready to go?
4. **Update your existing `index.html`** with proper links?

Let me know and I'll implement the complete system for you.
