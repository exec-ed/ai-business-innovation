#!/bin/bash

# Render script for AI-Driven Business Innovation slide deck
# This script renders the Quarto markdown into all output formats

echo "========================================="
echo "Rendering AI-Driven Business Innovation"
echo "Slide Deck - All Formats"
echo "========================================="
echo ""

# Check if Quarto is installed
if ! command -v quarto &> /dev/null; then
    echo "ERROR: Quarto is not installed."
    echo "Please install from: https://quarto.org/docs/get-started/"
    exit 1
fi

# Check if slide-deck.qmd exists
if [ ! -f "slide-deck.qmd" ]; then
    echo "ERROR: slide-deck.qmd not found in current directory"
    echo "Please run this script from the slides/ folder"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p _output

echo "Rendering all formats..."
echo ""

# Render all formats
quarto render slide-deck.qmd

# Check if render was successful
if [ $? -eq 0 ]; then
    echo ""
    echo "========================================="
    echo "✅ SUCCESS! All formats rendered"
    echo "========================================="
    echo ""
    echo "Generated files:"
    echo "  📊 PowerPoint: slide-deck.pptx"
    echo "  🌐 HTML:       slide-deck.html"
    echo "  📄 PDF:        slide-deck.pdf"
    echo "  📝 DOCX:       slide-deck.docx"
    echo ""
    echo "Open slide-deck.pptx to start presenting!"
else
    echo ""
    echo "========================================="
    echo "❌ ERROR: Rendering failed"
    echo "========================================="
    echo ""
    echo "Check error messages above for details"
    exit 1
fi
