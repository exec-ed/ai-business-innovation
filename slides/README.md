# Slide Deck for AI-Driven Business Innovation

## Overview

This folder contains the Quarto markdown slide deck for the one-day masterclass. The deck is optimized for PowerPoint presentation but can also be rendered as HTML, PDF, and DOCX formats.

## Files

- `slide-deck.qmd` - Main Quarto markdown source file
- `render-slides.sh` - Shell script to render all formats
- `_output/` - Generated output files (created when rendered)

## Slide Deck Contents

**Total slides:** ~60 slides organized into sections

### Structure

1. **Welcome & Introduction** (5 slides)
2. **SESSION 1: AI Strategy Foundations** (15 slides) - What Makes AI Different?
3. **SESSION 2: Strategic Frameworks** (12 slides) - Data Pyramid, Three Horizons
4. **SESSION 3: AI Investment Framework** (10 slides) - Investment Model, Dragon's Den setup
5. **SESSION 4: Dragon's Den** (8 slides) - Simulation and debrief
6. **Frameworks Summary** (5 slides) - All 5 frameworks recap
7. **Wrap-up** (5 slides) - Action planning, feedback

## Rendering the Slides

### Prerequisites

Install Quarto: https://quarto.org/docs/get-started/

```bash
# macOS
brew install quarto
```

### Quick Render

```bash
cd slides
./render-slides.sh
```

Or manually:
```bash
quarto render slide-deck.qmd
```

This creates:
- `slide-deck.pptx` - PowerPoint (primary format)
- `slide-deck.html` - HTML presentation
- `slide-deck.pdf` - PDF handout
- `slide-deck.docx` - Word document

## Customization

### Replace Placeholders

1. **QR Code**: Replace `[QR CODE PLACEHOLDER]` with actual QR code image
2. **Facilitator info**: Search for `[Your Name & Bio]` and update
3. **URLs**: Update `[GitHub Pages URL]` with actual course site

### Add Institutional Branding

Create `template.pptx` with your branding, then update YAML:

```yaml
format:
  pptx:
    reference-doc: template.pptx
```

## Quick Start

**Day before course:**
1. `quarto render slide-deck.qmd`
2. Open `slide-deck.pptx` 
3. Customize facilitator details
4. Test with projector

**See full documentation above for advanced customization.**
