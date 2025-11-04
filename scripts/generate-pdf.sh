#!/bin/bash

# Generate PDF from HTML using Chrome headless
# Preserves CSS styling and page breaks

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Default to learning journal
FILE="${1:-learning-journal}"
HTML_FILE="$PROJECT_DIR/docs/${FILE}.html"
OUTPUT_PDF="$PROJECT_DIR/${FILE}.pdf"

echo -e "${BLUE}Generating PDF from HTML...${NC}"
echo -e "Source: $HTML_FILE"
echo -e "Output: $OUTPUT_PDF\n"

# Check if HTML file exists
if [ ! -f "$HTML_FILE" ]; then
  echo "Error: HTML file not found: $HTML_FILE"
  echo "Usage: ./scripts/generate-pdf.sh [filename]"
  echo "Example: ./scripts/generate-pdf.sh learning-journal"
  exit 1
fi

# Check if Chrome is installed
if [ ! -f "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]; then
  echo "Error: Google Chrome not found"
  echo "Please install Google Chrome or use alternative method"
  exit 1
fi

# Generate PDF using Chrome headless
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --headless \
  --disable-gpu \
  --print-to-pdf="$OUTPUT_PDF" \
  --print-to-pdf-no-header \
  --no-pdf-header-footer \
  "file://$HTML_FILE" \
  2>/dev/null

# Check if successful
if [ -f "$OUTPUT_PDF" ]; then
  SIZE=$(ls -lh "$OUTPUT_PDF" | awk '{print $5}')
  echo -e "${GREEN}✓${NC} PDF generated successfully!"
  echo -e "   File: $OUTPUT_PDF"
  echo -e "   Size: $SIZE"
else
  echo "Error: PDF generation failed"
  exit 1
fi
