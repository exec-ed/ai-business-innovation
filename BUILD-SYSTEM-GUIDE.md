# Markdown to PDF/HTML Build System Guide

**Purpose:** Keep participant materials in sync across PDF (print) and HTML (online) formats from a single markdown source.

---

## Quick Recommendation

**Best approach for your use case: Pandoc + Make/npm scripts**

- ✅ Single command to build all formats
- ✅ Professional PDF output with proper page breaks
- ✅ Consistent styling across formats
- ✅ Works on macOS (your current platform)
- ✅ Free and open source
- ✅ No vendor lock-in

---

## Option Comparison

| Tool | PDF Quality | HTML Quality | Easy Setup | Cost | Best For |
|------|-------------|--------------|------------|------|----------|
| **Pandoc** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ | Free | Professional docs |
| **Marked 2** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | $14 | Mac users, quick setup |
| **Markdown PDF (VS Code)** | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | Free | Quick/dirty conversion |
| **Quarto** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐ | Free | Academic/complex docs |
| **DocFX/MkDocs** | ⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | Free | Documentation sites |

---

## Recommended Solution: Pandoc + NPM Scripts

### Why This Works Best

1. **Single source of truth**: Edit only markdown
2. **Batch processing**: Convert all 5 materials with one command
3. **Consistent styling**: Same CSS/LaTeX templates for all docs
4. **Version control friendly**: All configs are text files
5. **Automated**: Can run on save, pre-commit, or CI/CD

### What You'll Need

- **Pandoc** (conversion engine)
- **LaTeX distribution** (for high-quality PDFs) - MacTeX on macOS
- **Node.js** (optional, for npm scripts)
- **CSS templates** (for consistent HTML styling)
- **LaTeX templates** (for branded PDFs)

---

## Implementation: Step-by-Step

### Step 1: Install Dependencies

```bash
# Install Homebrew if not already installed
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Pandoc
brew install pandoc

# Install BasicTeX (smaller LaTeX distribution, ~100MB vs 4GB full MacTeX)
brew install --cask basictex

# Add LaTeX to PATH (add to ~/.zshrc or ~/.bash_profile)
export PATH="/Library/TeX/texbin:$PATH"

# Reload shell
source ~/.zshrc  # or source ~/.bash_profile

# Install required LaTeX packages
sudo tlmgr update --self
sudo tlmgr install titling lastpage fancyhdr geometry
```

**Time to install:** ~10 minutes

---

### Step 2: Create Build Directory Structure

```
ai-business-innovation/
├── participant-materials/           # Source markdown files
│   ├── frameworks-reference-sheet.md
│   ├── ai-investment-checklist.md
│   ├── how-to-use-retailflow.md
│   ├── retailflow-company-overview.txt (convert to .md)
│   └── personal-action-plan-worksheet.md
├── build/                          # NEW: Build system
│   ├── templates/
│   │   ├── html-template.html      # HTML template
│   │   ├── pdf-template.tex        # LaTeX template for PDFs
│   │   └── styles.css              # CSS for HTML
│   ├── scripts/
│   │   └── build.sh                # Build script
│   └── output/                     # Generated files
│       ├── pdf/
│       └── html/
├── package.json                    # NPM scripts (optional)
└── Makefile                        # Make commands (alternative)
```

---

### Step 3: Create HTML Template

**File: `build/templates/html-template.html`**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$title$</title>
  <link rel="stylesheet" href="styles.css">
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
      line-height: 1.6;
      max-width: 800px;
      margin: 40px auto;
      padding: 0 20px;
      color: #333;
    }
    h1, h2, h3 { color: #2c3e50; margin-top: 1.5em; }
    h1 { border-bottom: 3px solid #3498db; padding-bottom: 10px; }
    h2 { border-bottom: 1px solid #bdc3c7; padding-bottom: 5px; }
    table { border-collapse: collapse; width: 100%; margin: 20px 0; }
    th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
    th { background-color: #3498db; color: white; }
    code { background-color: #f4f4f4; padding: 2px 6px; border-radius: 3px; }
    blockquote {
      border-left: 4px solid #3498db;
      padding-left: 20px;
      margin-left: 0;
      color: #555;
      font-style: italic;
    }
    .header { text-align: center; margin-bottom: 40px; }
    .footer {
      margin-top: 60px;
      padding-top: 20px;
      border-top: 1px solid #bdc3c7;
      text-align: center;
      font-size: 0.9em;
      color: #7f8c8d;
    }
  </style>
</head>
<body>
  <div class="header">
    <h1>AI-Driven Business Innovation Masterclass</h1>
  </div>

  $body$

  <div class="footer">
    <p>© 2025 AI Innovation Masterclass | Dr. Michael Borck</p>
  </div>
</body>
</html>
```

---

### Step 4: Create PDF Template

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

### Step 5: Create Build Script

**File: `build/scripts/build.sh`**

```bash
#!/bin/bash

# AI Innovation Masterclass - Build Script
# Converts markdown files to PDF and HTML

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Directories
SOURCE_DIR="participant-materials"
OUTPUT_PDF="build/output/pdf"
OUTPUT_HTML="build/output/html"
TEMPLATE_DIR="build/templates"

# Create output directories
mkdir -p "$OUTPUT_PDF"
mkdir -p "$OUTPUT_HTML"

# Files to convert (add/remove as needed)
FILES=(
  "frameworks-reference-sheet"
  "ai-investment-checklist"
  "how-to-use-retailflow"
  "personal-action-plan-worksheet"
)

# Special case: retailflow needs .txt to .md conversion first
RETAILFLOW_FILE="retailflow-company-overview"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}AI Innovation Masterclass - Build System${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Function to convert markdown to PDF
convert_to_pdf() {
  local filename=$1
  local source="$SOURCE_DIR/${filename}.md"
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
    -o "$output"

  if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓${NC} Created: $output\n"
  else
    echo -e "${RED}✗${NC} Failed to create PDF for $filename\n"
  fi
}

# Function to convert markdown to HTML
convert_to_html() {
  local filename=$1
  local source="$SOURCE_DIR/${filename}.md"
  local output="$OUTPUT_HTML/${filename}.html"

  echo -e "${GREEN}Converting${NC} $filename.md → HTML..."

  pandoc "$source" \
    --from markdown \
    --to html5 \
    --template="$TEMPLATE_DIR/html-template.html" \
    --standalone \
    --toc \
    --toc-depth=2 \
    -o "$output"

  if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓${NC} Created: $output\n"
  else
    echo -e "${RED}✗${NC} Failed to create HTML for $filename\n"
  fi
}

# Convert all files
for file in "${FILES[@]}"; do
  if [ -f "$SOURCE_DIR/${file}.md" ]; then
    convert_to_pdf "$file"
    convert_to_html "$file"
  else
    echo -e "${RED}✗${NC} File not found: $SOURCE_DIR/${file}.md\n"
  fi
done

# Special handling for retailflow-company-overview.txt
if [ -f "$SOURCE_DIR/${RETAILFLOW_FILE}.txt" ]; then
  echo -e "${BLUE}Special case:${NC} Converting ${RETAILFLOW_FILE}.txt..."

  # Convert TXT to markdown format (just copy with .md extension)
  cp "$SOURCE_DIR/${RETAILFLOW_FILE}.txt" "$SOURCE_DIR/${RETAILFLOW_FILE}.md"

  convert_to_pdf "$RETAILFLOW_FILE"
  convert_to_html "$RETAILFLOW_FILE"

  # Clean up temporary .md file
  rm "$SOURCE_DIR/${RETAILFLOW_FILE}.md"
fi

echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}Build complete!${NC}"
echo -e "${BLUE}========================================${NC}"
echo -e "PDFs: ${OUTPUT_PDF}/"
echo -e "HTML: ${OUTPUT_HTML}/"
```

Make it executable:
```bash
chmod +x build/scripts/build.sh
```

---

### Step 6: Alternative - NPM Scripts (Optional)

If you prefer npm over bash scripts, create **`package.json`**:

```json
{
  "name": "ai-innovation-masterclass",
  "version": "1.0.0",
  "description": "Build system for course materials",
  "scripts": {
    "build": "bash build/scripts/build.sh",
    "build:pdf": "bash build/scripts/build-pdf-only.sh",
    "build:html": "bash build/scripts/build-html-only.sh",
    "watch": "nodemon --watch participant-materials --ext md,txt --exec 'npm run build'",
    "clean": "rm -rf build/output/pdf/* build/output/html/*"
  },
  "devDependencies": {
    "nodemon": "^3.0.0"
  }
}
```

Then run:
```bash
npm install
npm run build       # Build everything
npm run watch       # Auto-rebuild on file changes
npm run clean       # Clear output directories
```

---

### Step 7: Alternative - Makefile (Optional)

For those who prefer Make, create **`Makefile`**:

```makefile
.PHONY: all pdf html clean

# Directories
SOURCE_DIR := participant-materials
OUTPUT_PDF := build/output/pdf
OUTPUT_HTML := build/output/html
TEMPLATE_DIR := build/templates

# Source files
MD_FILES := $(wildcard $(SOURCE_DIR)/*.md)
PDF_FILES := $(patsubst $(SOURCE_DIR)/%.md,$(OUTPUT_PDF)/%.pdf,$(MD_FILES))
HTML_FILES := $(patsubst $(SOURCE_DIR)/%.md,$(OUTPUT_HTML)/%.html,$(MD_FILES))

all: pdf html

pdf: $(PDF_FILES)

html: $(HTML_FILES)

$(OUTPUT_PDF)/%.pdf: $(SOURCE_DIR)/%.md
	@mkdir -p $(OUTPUT_PDF)
	pandoc $< \
		--from markdown \
		--to pdf \
		--template=$(TEMPLATE_DIR)/pdf-template.tex \
		--pdf-engine=pdflatex \
		-o $@
	@echo "✓ Created: $@"

$(OUTPUT_HTML)/%.html: $(SOURCE_DIR)/%.md
	@mkdir -p $(OUTPUT_HTML)
	pandoc $< \
		--from markdown \
		--to html5 \
		--template=$(TEMPLATE_DIR)/html-template.html \
		--standalone \
		--toc \
		-o $@
	@echo "✓ Created: $@"

clean:
	rm -rf $(OUTPUT_PDF)/* $(OUTPUT_HTML)/*

.SILENT: pdf html
```

Then run:
```bash
make all     # Build everything
make pdf     # Build only PDFs
make html    # Build only HTML
make clean   # Remove generated files
```

---

## Usage Examples

### Scenario 1: Initial Build

```bash
# Navigate to project directory
cd ~/Projects/ai-business-innovation

# Run build script
bash build/scripts/build.sh

# Output appears in:
# - build/output/pdf/
# - build/output/html/
```

### Scenario 2: Update One File

```bash
# Edit the markdown file
code participant-materials/ai-investment-checklist.md

# Rebuild everything
bash build/scripts/build.sh

# Or rebuild just that file
pandoc participant-materials/ai-investment-checklist.md \
  --from markdown \
  --to pdf \
  --template=build/templates/pdf-template.tex \
  -o build/output/pdf/ai-investment-checklist.pdf
```

### Scenario 3: Auto-Rebuild on Save

```bash
# Install nodemon globally
npm install -g nodemon

# Watch for changes and auto-rebuild
nodemon --watch participant-materials --ext md,txt --exec 'bash build/scripts/build.sh'

# Now edit any .md file and save - it rebuilds automatically!
```

### Scenario 4: Customize PDF Styling

Edit `build/templates/pdf-template.tex`:

```latex
% Change margins
\usepackage[margin=0.75in]{geometry}

% Change font
\usepackage{times}  % Times New Roman

% Change header
\lhead{RetailFlow Case Study}
\rhead{Page \thepage}
```

Then rebuild:
```bash
bash build/scripts/build.sh
```

---

## Advanced: Custom Styling per Document

If you need different styling for different documents (e.g., RetailFlow needs wider margins):

### Create Document-Specific Templates

**`build/templates/pdf-retailflow.tex`**
```latex
\documentclass[10pt,letterpaper]{article}
\usepackage[margin=1.25in]{geometry}  % Wider margins for notes
% ... rest of template
```

### Modify Build Script to Use Specific Templates

```bash
# In build.sh, add conditional logic:
if [ "$filename" == "retailflow-company-overview" ]; then
  TEMPLATE="$TEMPLATE_DIR/pdf-retailflow.tex"
else
  TEMPLATE="$TEMPLATE_DIR/pdf-template.tex"
fi

pandoc "$source" \
  --template="$TEMPLATE" \
  # ... rest of command
```

---

## Troubleshooting

### Issue: "pandoc: pdflatex not found"

**Solution:**
```bash
# Check if LaTeX is installed
which pdflatex

# If not found, install BasicTeX
brew install --cask basictex

# Add to PATH
export PATH="/Library/TeX/texbin:$PATH"
```

### Issue: "! LaTeX Error: File 'lastpage.sty' not found"

**Solution:**
```bash
sudo tlmgr install lastpage fancyhdr titling geometry
```

### Issue: PDF has ugly fonts

**Solution:** Install better LaTeX fonts
```bash
sudo tlmgr install collection-fontsrecommended
```

### Issue: HTML doesn't match PDF styling

**Solution:** Use consistent markdown formatting and test both outputs. Consider using Pandoc's `--css` option to link external stylesheets.

---

## Comparison: Alternative Tools

### Option 2: Marked 2 (macOS App) - $14

**Pros:**
- Beautiful GUI
- Live preview
- Excellent PDF export
- Custom CSS themes
- No command line needed

**Cons:**
- Manual process (can't batch easily)
- macOS only
- Costs $14

**Best for:** Solo instructors who want quick, beautiful exports without scripting

### Option 3: Quarto (Academic Publishing)

**Pros:**
- Extremely powerful
- Built-in PDF, HTML, Word, EPUB support
- Academic features (citations, cross-references)
- Great for books/reports

**Cons:**
- Steeper learning curve
- Overkill for simple documents
- Requires R installation (though doesn't require R usage)

**Best for:** Complex multi-format academic publications

### Option 4: VS Code Extension "Markdown PDF"

**Pros:**
- One-click export from VS Code
- No dependencies
- Simple setup

**Cons:**
- Lower quality PDFs
- Less control over styling
- Not suitable for professional materials

**Best for:** Quick drafts and internal documents

---

## Recommended Workflow

### Daily Editing Workflow

1. **Edit markdown files** in your favorite editor (VS Code, Typora, etc.)
2. **Auto-rebuild on save** using `npm run watch` or nodemon
3. **Preview HTML** in browser (instant feedback)
4. **Check PDF** before distribution

### Before Course Delivery

1. **Run full build**: `bash build/scripts/build.sh`
2. **Review all PDFs** for page breaks and formatting
3. **Copy to distribution folder**:
   ```bash
   cp build/output/pdf/*.pdf ~/Desktop/Masterclass-PrintReady/
   ```
4. **Upload HTML versions** to course website

### Version Control

Add to `.gitignore`:
```
# Build outputs (don't commit generated files)
build/output/

# Node modules if using npm
node_modules/

# Temporary files
*.aux
*.log
*.out
*.toc
```

Commit to git:
```bash
git add participant-materials/*.md
git add build/templates/
git add build/scripts/
git commit -m "Update participant materials"
```

---

## Summary: Your Action Plan

### Minimal Setup (15 minutes)

1. ✅ Install Pandoc: `brew install pandoc`
2. ✅ Install BasicTeX: `brew install --cask basictex`
3. ✅ Create `build/` directory structure
4. ✅ Copy templates from this guide
5. ✅ Copy build script
6. ✅ Run: `bash build/scripts/build.sh`

### Full Setup with Auto-Rebuild (30 minutes)

1. ✅ Complete minimal setup
2. ✅ Add `package.json` with npm scripts
3. ✅ Install nodemon: `npm install`
4. ✅ Run watch mode: `npm run watch`
5. ✅ Edit markdown files and see instant results

### Professional Setup (1 hour)

1. ✅ Complete full setup
2. ✅ Customize LaTeX template with your branding
3. ✅ Customize HTML template with your colors/logo
4. ✅ Create document-specific templates
5. ✅ Test all 5 materials in both formats
6. ✅ Add to version control

---

## My Recommendation for Your Use Case

**Use: Pandoc + Bash Script + NPM Watch (for convenience)**

**Why:**
- ✅ Professional-quality PDFs suitable for printing
- ✅ Clean HTML for web viewing
- ✅ Single source of truth (markdown)
- ✅ One command builds all 5 materials
- ✅ Auto-rebuild while editing (npm run watch)
- ✅ Free and open source
- ✅ Works on macOS
- ✅ Easy to customize styling
- ✅ Version control friendly

**Total setup time:** 30 minutes
**Build time per run:** <10 seconds for all 5 files

---

**Would you like me to create the actual build scripts and templates for your project, or would you prefer to set this up manually using this guide?**
