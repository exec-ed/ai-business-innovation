#!/bin/bash

# Build Course Materials for GitHub Pages + PDF
# Runs in CI (GitHub Actions) or locally

set -e  # Exit on error

# Colors (work in CI logs too)
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Directories
SOURCE_DIR="participant-materials"
PREREADINGS_DIR="pre-readings"
INSTRUCTOR_DIR="instructor-materials"
OUTPUT_DIR="docs"
OUTPUT_PDF="docs/pdf"
OUTPUT_INSTRUCTOR="docs/instructor"
OUTPUT_INSTRUCTOR_PDF="docs/instructor/pdf"
TEMPLATE_DIR="build/templates"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Building Course Materials${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Create output directories
mkdir -p "$OUTPUT_DIR"
mkdir -p "$OUTPUT_PDF"
mkdir -p "$OUTPUT_DIR/css"
mkdir -p "$OUTPUT_DIR/js"
mkdir -p "$OUTPUT_INSTRUCTOR"
mkdir -p "$OUTPUT_INSTRUCTOR_PDF"

# Copy CSS and JS to output
if [ -f "$TEMPLATE_DIR/materials.css" ]; then
  cp "$TEMPLATE_DIR/materials.css" "$OUTPUT_DIR/css/"
  echo -e "${GREEN}✓${NC} Copied CSS\n"
fi

if [ -f "$TEMPLATE_DIR/auth.js" ]; then
  cp "$TEMPLATE_DIR/auth.js" "$OUTPUT_DIR/js/"
  echo -e "${GREEN}✓${NC} Copied auth.js\n"
fi

# Participant materials to convert (markdown to HTML)
FILES=(
  "frameworks-reference-sheet"
  "how-to-use-retailflow"
  "retailflow-company-overview"
  "personal-action-plan-worksheet"
  "strategic-prompting-guide"
  "preparing-for-the-masterclass"
)
# Note: ai-investment-checklist and executive-ai-prompt-library now exist ONLY as interactive HTML (no markdown source)

# Pre-readings to convert
PREREADING_FILES=(
  "strategic-ai-investment"
  "what-executives-need-to-know-about-ai"
  "why-ai-innovation-is-different"
)

# Instructor materials to convert (will be password protected)
# Note: These are in subdirectories of instructor-materials/
INSTRUCTOR_FILES=(
  "facilitation-notes/facilitator-guide"
  "facilitation-notes/delivery-timeline"
  "facilitation-notes/storytelling-narratives"
  "exercise-guides/exercise-2-guide"
  "answer-keys/dragon-den-decision-rationales"
)

# Function: Convert markdown to HTML for web
convert_to_html() {
  local filename=$1
  local source_dir=$2
  local output_dir=$3
  local template=${4:-"material-page.html"}

  local source="$source_dir/${filename}.md"
  # Use basename for output (no subdirectory paths)
  local output_basename=$(basename "$filename")
  local output="$output_dir/${output_basename}.html"
  local title=$(echo "$output_basename" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')

  # Handle .txt files
  if [ ! -f "$source" ]; then
    source="$source_dir/${filename}.txt"
  fi

  if [ ! -f "$source" ]; then
    echo -e "${YELLOW}⚠${NC} Warning: File not found: $source\n"
    return
  fi

  echo -e "${GREEN}Converting${NC} $(basename $source) → HTML..."

  pandoc "$source" \
    --from markdown \
    --to html5 \
    --template="$TEMPLATE_DIR/$template" \
    --standalone \
    --toc \
    --toc-depth=2 \
    --variable title="$title" \
    --variable filename="$output_basename" \
    --css="css/materials.css" \
    -o "$output" 2>/dev/null

  if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓${NC} Created: $output\n"
  else
    echo -e "${RED}✗${NC} Failed to create HTML for $filename\n"
  fi
}

# Function: Convert markdown to PDF for print
convert_to_pdf() {
  local filename=$1
  local source_dir=$2
  local output_dir=$3

  local source="$source_dir/${filename}.md"
  # Use basename for output (no subdirectory paths)
  local output_basename=$(basename "$filename")
  local output="$output_dir/${output_basename}.pdf"

  # Handle .txt files
  if [ ! -f "$source" ]; then
    source="$source_dir/${filename}.txt"
  fi

  if [ ! -f "$source" ]; then
    echo -e "${YELLOW}⚠${NC} Warning: File not found: $source\n"
    return
  fi

  echo -e "${GREEN}Converting${NC} $(basename $source) → PDF..."

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
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}Building Participant Materials${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

for file in "${FILES[@]}"; do
  convert_to_html "$file" "$SOURCE_DIR" "$OUTPUT_DIR"
  # Skip PDF generation locally (enable in CI with LaTeX)
  # convert_to_pdf "$file" "$SOURCE_DIR" "$OUTPUT_PDF"
done

# Note: retailflow-company-overview.md now included in FILES array above

# Convert pre-readings
echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}Building Pre-Readings${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

for file in "${PREREADING_FILES[@]}"; do
  convert_to_html "$file" "$PREREADINGS_DIR" "$OUTPUT_DIR"
  # Skip PDF generation locally (enable in CI with LaTeX)
  # convert_to_pdf "$file" "$PREREADINGS_DIR" "$OUTPUT_PDF"
done

# Convert instructor materials (with password protection)
echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}Building Instructor Materials (Password Protected)${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

for file in "${INSTRUCTOR_FILES[@]}"; do
  # Extract filename without path for output
  filename=$(basename "$file")
  # Full path for source
  source_path="$INSTRUCTOR_DIR/$file"
  
  # Check if source exists
  if [ -f "${source_path}.md" ]; then
    # Convert using full path
    convert_to_html "$file" "$INSTRUCTOR_DIR" "$OUTPUT_INSTRUCTOR" "instructor-page.html"
    # Skip PDF generation locally (enable in CI with LaTeX)
    # convert_to_pdf "$file" "$INSTRUCTOR_DIR" "$OUTPUT_INSTRUCTOR_PDF"
  else
    echo -e "${YELLOW}⚠${NC} Warning: Instructor file not found: ${source_path}.md\n"
  fi
done

# Build instructor materials index
echo -e "${GREEN}Creating${NC} instructor materials index...\n"
cat > "$OUTPUT_INSTRUCTOR/index.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Instructor Materials | AI Innovation Masterclass</title>
  <link rel="stylesheet" href="../css/materials.css">
  <script src="../js/auth.js"></script>
</head>
<body onload="checkAuth()">
  <nav class="topnav">
    <div class="container">
      <a href="../index.html" class="logo">AI Business Innovation</a>
      <div class="nav-links">
        <a href="../index.html">Home</a>
        <a href="../materials.html">Public Materials</a>
      </div>
    </div>
  </nav>

  <main class="container" id="protected-content" style="display:none;">
    <article class="material-content">
      <header class="material-header">
        <h1>🔒 Instructor Materials</h1>
        <p style="color: #7f8c8d;">Password-protected resources for course facilitators</p>
      </header>

      <div class="content">
        <h2>Facilitation Resources</h2>

        <div class="resource-grid" style="display: grid; gap: 2rem; margin: 2rem 0;">
          <div class="resource-item" style="border: 2px solid #e5e7eb; padding: 1.5rem; border-radius: 8px;">
            <h3>📖 Facilitation Guide</h3>
            <p>Complete delivery guide with timing, activities, and teaching notes</p>
            <div style="margin-top: 1rem;">
              <a href="facilitation-guide.html" class="btn-primary">View Online</a>
              <a href="pdf/facilitation-guide.pdf" class="btn-secondary" style="margin-left: 1rem;">Download PDF</a>
            </div>
          </div>

          <div class="resource-item" style="border: 2px solid #e5e7eb; padding: 1.5rem; border-radius: 8px;">
            <h3>💡 Exercise Facilitation Notes</h3>
            <p>Detailed notes for running each exercise effectively</p>
            <div style="margin-top: 1rem;">
              <a href="exercise-facilitation-notes.html" class="btn-primary">View Online</a>
              <a href="pdf/exercise-facilitation-notes.pdf" class="btn-secondary" style="margin-left: 1rem;">Download PDF</a>
            </div>
          </div>
        </div>

        <hr style="margin: 3rem 0; border: none; border-top: 1px solid #e5e7eb;">

        <p style="text-align: center; color: #7f8c8d;">
          <a href="#" onclick="logout(); return false;" style="color: #e74c3c; font-weight: 600;">🔓 Logout</a>
        </p>
      </div>
    </article>
  </main>

  <footer class="site-footer">
    <div class="container">
      <p>AI-Driven Business Innovation Masterclass | Curtin Business School</p>
    </div>
  </footer>
</body>
</html>
EOF

echo -e "${GREEN}✓${NC} Created instructor materials index\n"

# Copy interactive HTML files (already HTML, no conversion needed)
echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}Copying Interactive Tools${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

INTERACTIVE_FILES=(
  "participant-materials/ai-investment-checklist-interactive.html"
  "participant-materials/executive-ai-prompt-library-interactive.html"
  "participant-materials/investment-calculator.html"
  "participant-materials/ai-leadership-style-assessment.html"
)

for file in "${INTERACTIVE_FILES[@]}"; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    cp "$file" "$OUTPUT_DIR/$filename"
    echo -e "${GREEN}✓${NC} Copied: $filename\n"
  else
    echo -e "${YELLOW}⚠${NC} Warning: Interactive file not found: $file\n"
  fi
done

echo -e "\n${BLUE}========================================${NC}"
echo -e "${GREEN}Build Complete!${NC}"
echo -e "${BLUE}========================================${NC}"
echo -e "HTML files: ${OUTPUT_DIR}/"
echo -e "PDF files: ${OUTPUT_PDF}/"
echo -e "Instructor materials: ${OUTPUT_INSTRUCTOR}/ ${YELLOW}(password protected)${NC}"
echo -e "\nReady for GitHub Pages deployment."
