#!/bin/bash
# render-all.sh
# Renders all Quarto files and organizes outputs into docs/ folder

set -e  # Exit on error

echo "================================"
echo "RENDERING AI LEADERSHIP & PM MASTERCLASS"
echo "================================"

# No color codes - use plain text for compatibility

# Base directories
SOURCE_DIR="$(pwd)"
DOCS_DIR="$SOURCE_DIR/docs"

echo ""
echo "Step 1: Rendering Role Cards"
cd "$SOURCE_DIR/activities/materials/role-cards"
for file in [0-9]*.qmd; do
    [ -f "$file" ] || continue
    echo "  Rendering $file..."
    quarto render "$file"
done
# Move outputs
echo "  Moving outputs to docs/activities/..."
mv -f *.html *.pdf "$DOCS_DIR/activities/" 2>/dev/null || true

echo ""
echo "Step 2: Rendering Constraint Cards (Activity 1)"
cd "$SOURCE_DIR/activities/materials/constraint-cards"
for file in *.qmd; do
    [ -f "$file" ] || continue
    echo "  Rendering $file..."
    quarto render "$file" --to html || echo "  Warning: Could not render $file"
done
echo "  Moving outputs to docs/activities/..."
mv -f *.html "$DOCS_DIR/activities/" 2>/dev/null || true

echo ""
echo "Step 3: Rendering Crisis Cards (Activity 3)"
if [ -d "$SOURCE_DIR/activities/materials/crisis-cards" ]; then
    cd "$SOURCE_DIR/activities/materials/crisis-cards"
    for file in *.qmd; do
        [ -f "$file" ] || continue
        echo "  Rendering $file..."
        quarto render "$file" --to html || echo "  Warning: Could not render $file"
    done
    echo "  Moving outputs to docs/activities/..."
    mv -f *.html "$DOCS_DIR/activities/" 2>/dev/null || true
else
    echo "  WARNING: crisis-cards/ folder not found"
fi

echo ""
echo "Step 4: Rendering Case Briefs"
if [ -d "$SOURCE_DIR/activities/materials/case-briefs" ]; then
    cd "$SOURCE_DIR/activities/materials/case-briefs"
    for file in *.qmd; do
        [ -f "$file" ] || continue
        echo "  Rendering $file..."
        quarto render "$file"
    done
    echo "  Moving outputs to docs/activities/..."
    mv -f *.html *.pdf "$DOCS_DIR/activities/" 2>/dev/null || true
else
    echo "  WARNING: case-briefs/ folder not found - skipping"
fi

echo ""
echo "Step 5: Rendering Handouts"
cd "$SOURCE_DIR/handouts"
for file in *.qmd; do
    [ -f "$file" ] || continue
    echo "  Rendering $file..."
    quarto render "$file"
done
echo "  Moving outputs to docs/handouts/..."
mv -f *.html *.pdf "$DOCS_DIR/handouts/" 2>/dev/null || true

echo ""
echo "Step 6: Rendering Frameworks (if exist)"
if [ -d "$SOURCE_DIR/handouts/frameworks-simple" ]; then
    cd "$SOURCE_DIR/handouts/frameworks-simple"
    for file in *.qmd; do
        [ -f "$file" ] || continue
        echo "  Rendering $file..."
        quarto render "$file"
    done
    mkdir -p "$DOCS_DIR/frameworks"
    echo "  Moving outputs to docs/frameworks/..."
    mv -f *.html *.pdf "$DOCS_DIR/frameworks/" 2>/dev/null || true
else
    echo "  frameworks-simple/ folder not found, skipping"
fi

echo ""
echo "Step 7: Rendering Activities (Student-Facing)"
cd "$SOURCE_DIR/activities"
for file in *.qmd; do
    [ -f "$file" ] || continue
    echo "  Rendering $file..."
    quarto render "$file"
done
echo "  Moving outputs to docs/activities/..."
mv -f *.html *.pdf "$DOCS_DIR/activities/" 2>/dev/null || true

echo ""
echo "Step 8: Rendering Pilot Data"
if [ -d "$SOURCE_DIR/activities/materials/pilot-data" ]; then
    cd "$SOURCE_DIR/activities/materials/pilot-data"
    for file in *.qmd; do
        [ -f "$file" ] || continue
        echo "  Rendering $file..."
        quarto render "$file"
    done
    echo "  Moving outputs to docs/handouts/..."
    mv -f *.html *.pdf "$DOCS_DIR/handouts/" 2>/dev/null || true
else
    echo "  pilot-data/ folder not found, skipping"
fi

echo ""
echo "Step 9: Rendering Pre-Readings"
if [ -d "$SOURCE_DIR/pre-readings" ]; then
    cd "$SOURCE_DIR/pre-readings"
    for file in *.qmd; do
        [ -f "$file" ] || continue
        echo "  Rendering $file..."
        quarto render "$file"
    done
    echo "  Moving outputs to docs/pre-readings/..."
    mv -f *.html *.pdf "$DOCS_DIR/pre-readings/" 2>/dev/null || true
else
    echo "  pre-readings/ folder not found, skipping"
fi

echo ""
echo "Step 10: Rendering Content/Slides"
cd "$SOURCE_DIR/content"
for file in *.qmd *.md; do
    [ -f "$file" ] || continue
    if [ "$file" == "*.md" ]; then
        # Check if actual file exists (not just glob pattern)
        [ -e "$file" ] || continue
    fi
    echo "  Rendering $file..."
    quarto render "$file" || echo "  Warning: Could not render $file"
done
echo "  Moving outputs to docs/content/..."
mv -f *.html *.pdf *.pptx *.docx "$DOCS_DIR/content/" 2>/dev/null || true

echo ""
echo "Step 11: Rendering Instructor Materials"
mkdir -p "$DOCS_DIR/instructor"
cd "$SOURCE_DIR/instructor-materials"

# Render facilitator quick reference
echo "  Rendering facilitator-quick-reference.qmd..."
quarto render facilitator-quick-reference.qmd || echo "  Warning: Could not render facilitator-quick-reference.qmd"
mv -f facilitator-quick-reference.html "$DOCS_DIR/instructor/" 2>/dev/null || true
mv -f facilitator-quick-reference.pdf "$DOCS_DIR/instructor/" 2>/dev/null || true

# Activity 1
echo "  Rendering Activity 1 materials..."
cd "$SOURCE_DIR/instructor-materials/activity-1-pilot-scoping"
quarto render facilitation-guide.qmd || echo "  Warning: Could not render Activity 1 facilitation guide"
quarto render constraint-cards-interactive.qmd || echo "  Warning: Could not render constraint cards"
mv -f facilitation-guide.html "$DOCS_DIR/instructor/activity-1-facilitation-guide.html" 2>/dev/null || true
mv -f facilitation-guide.pdf "$DOCS_DIR/instructor/activity-1-facilitation-guide.pdf" 2>/dev/null || true
mv -f constraint-cards-interactive.html "$DOCS_DIR/instructor/activity-1-constraint-cards.html" 2>/dev/null || true
mv -f constraint-cards-interactive.pdf "$DOCS_DIR/instructor/activity-1-constraint-cards.pdf" 2>/dev/null || true

# Activity 2
echo "  Rendering Activity 2 materials..."
cd "$SOURCE_DIR/instructor-materials/activity-2-speed-dating"
quarto render facilitation-guide.qmd || echo "  Warning: Could not render Activity 2 facilitation guide"
quarto render stakeholder-cards-interactive.qmd || echo "  Warning: Could not render stakeholder cards"
mv -f facilitation-guide.html "$DOCS_DIR/instructor/activity-2-facilitation-guide.html" 2>/dev/null || true
mv -f facilitation-guide.pdf "$DOCS_DIR/instructor/activity-2-facilitation-guide.pdf" 2>/dev/null || true
mv -f stakeholder-cards-interactive.html "$DOCS_DIR/instructor/activity-2-stakeholder-cards.html" 2>/dev/null || true
mv -f stakeholder-cards-interactive.pdf "$DOCS_DIR/instructor/activity-2-stakeholder-cards.pdf" 2>/dev/null || true

# Activity 3
echo "  Rendering Activity 3 materials..."
cd "$SOURCE_DIR/instructor-materials/activity-3-crisis-management"
quarto render facilitation-guide.qmd || echo "  Warning: Could not render Activity 3 facilitation guide"
quarto render framework-walkthrough-crisis-1.qmd || echo "  Warning: Could not render crisis 1 walkthrough"
quarto render framework-walkthrough-crisis-2.qmd || echo "  Warning: Could not render crisis 2 walkthrough"
quarto render framework-walkthrough-crisis-3.qmd || echo "  Warning: Could not render crisis 3 walkthrough"
mv -f facilitation-guide.html "$DOCS_DIR/instructor/activity-3-facilitation-guide.html" 2>/dev/null || true
mv -f facilitation-guide.pdf "$DOCS_DIR/instructor/activity-3-facilitation-guide.pdf" 2>/dev/null || true
mv -f framework-walkthrough-crisis-1.html "$DOCS_DIR/instructor/activity-3-framework-crisis-1.html" 2>/dev/null || true
mv -f framework-walkthrough-crisis-1.pdf "$DOCS_DIR/instructor/activity-3-framework-crisis-1.pdf" 2>/dev/null || true
mv -f framework-walkthrough-crisis-2.html "$DOCS_DIR/instructor/activity-3-framework-crisis-2.html" 2>/dev/null || true
mv -f framework-walkthrough-crisis-2.pdf "$DOCS_DIR/instructor/activity-3-framework-crisis-2.pdf" 2>/dev/null || true
mv -f framework-walkthrough-crisis-3.html "$DOCS_DIR/instructor/activity-3-framework-crisis-3.html" 2>/dev/null || true
mv -f framework-walkthrough-crisis-3.pdf "$DOCS_DIR/instructor/activity-3-framework-crisis-3.pdf" 2>/dev/null || true

# Activity 4
echo "  Rendering Activity 4 materials..."
cd "$SOURCE_DIR/instructor-materials/activity-4-scale-pivot-kill"
quarto render facilitation-guide.qmd || echo "  Warning: Could not render Activity 4 facilitation guide"
quarto render facilitation-guide-detailed.qmd || echo "  Warning: Could not render detailed guide"
quarto render debrief-outline.qmd || echo "  Warning: Could not render debrief outline"
quarto render decision-framework-reference.qmd || echo "  Warning: Could not render decision framework"
mv -f facilitation-guide.html "$DOCS_DIR/instructor/activity-4-facilitation-guide.html" 2>/dev/null || true
mv -f facilitation-guide.pdf "$DOCS_DIR/instructor/activity-4-facilitation-guide.pdf" 2>/dev/null || true
mv -f facilitation-guide-detailed.html "$DOCS_DIR/instructor/activity-4-facilitation-guide-detailed.html" 2>/dev/null || true
mv -f facilitation-guide-detailed.pdf "$DOCS_DIR/instructor/activity-4-facilitation-guide-detailed.pdf" 2>/dev/null || true
mv -f debrief-outline.html "$DOCS_DIR/instructor/activity-4-debrief-outline.html" 2>/dev/null || true
mv -f debrief-outline.pdf "$DOCS_DIR/instructor/activity-4-debrief-outline.pdf" 2>/dev/null || true
mv -f decision-framework-reference.html "$DOCS_DIR/instructor/activity-4-decision-framework.html" 2>/dev/null || true
mv -f decision-framework-reference.pdf "$DOCS_DIR/instructor/activity-4-decision-framework.pdf" 2>/dev/null || true

# Feedback materials (markdown to HTML conversion)
echo "  Copying feedback materials..."
cd "$SOURCE_DIR/instructor-materials/feedback"
# Note: These are .md files, we'll just copy them for now
# Could render with pandoc if needed
cp summary.md "$DOCS_DIR/instructor/feedback-summary.md" 2>/dev/null || true
cp response.md "$DOCS_DIR/instructor/feedback-response.md" 2>/dev/null || true

echo "  ✓ Instructor materials rendered"

echo ""
echo "================================"
echo "✓ RENDERING COMPLETE"
echo "================================"
echo ""
echo "Outputs are in: $DOCS_DIR"
echo ""
echo "Next steps:"
echo "  1. Review docs/ folder"
echo "  2. Test index.html in browser"
echo "  3. Commit and push to GitHub"
echo ""
