# AI-Driven Business Innovation - Companion Website

This is the companion website for the AI-Driven Business Innovation masterclass.

## GitHub Pages Deployment

### Option 1: Deploy from this Repository

1. **Push this course to GitHub** (if not already there)
2. **Enable GitHub Pages:**
   - Go to repository Settings → Pages
   - Source: Deploy from a branch
   - Branch: `main` (or your default branch)
   - Folder: `/courses/02-business-innovation/docs`
   - Click Save

3. **Access your site:**
   - Will be available at: `https://[username].github.io/[repo-name]/courses/02-business-innovation/docs/`

### Option 2: Separate Repository (Recommended for cleaner URLs)

1. **Create new repository:**
   ```bash
   # Create new repo on GitHub: ai-business-innovation
   ```

2. **Copy docs folder to new repo:**
   ```bash
   # Create new local directory
   mkdir ../ai-business-innovation
   cd ../ai-business-innovation

   # Copy docs contents to root
   cp -r [path-to-execed]/courses/02-business-innovation/docs/* .

   # Initialize git
   git init
   git add .
   git commit -m "Initial commit: AI Business Innovation companion site"

   # Connect to GitHub
   git remote add origin https://github.com/[username]/ai-business-innovation.git
   git push -u origin main
   ```

3. **Enable GitHub Pages:**
   - Settings → Pages
   - Source: Deploy from a branch
   - Branch: `main`
   - Folder: `/ (root)`
   - Click Save

4. **Access your site:**
   - Will be available at: `https://[username].github.io/ai-business-innovation/`
   - Much cleaner URL!

### Option 3: Custom Domain

If you have a custom domain:

1. Follow Option 2 above
2. In repository Settings → Pages:
   - Enter your custom domain (e.g., `ai-innovation.yourdomain.com`)
3. Add CNAME record in your DNS:
   - Type: CNAME
   - Name: ai-innovation
   - Value: [username].github.io

## Site Structure

```
docs/
├── index.html          ← Main page (complete)
├── frameworks.html     ← Framework details (to be created)
├── exercises.html      ← Exercise materials (to be created)
├── calculator.html     ← Investment calculator (to be created)
├── retailflow.html     ← Case study (to be created)
├── action-plan.html    ← Action plan template (to be created)
├── facilitator.html    ← Facilitator guide (to be created)
└── README.md          ← This file
```

## Future Enhancements

Additional pages you could create:

1. **frameworks.html** - In-depth framework explanations with visuals
2. **exercises.html** - All exercise materials and instructions
3. **calculator.html** - Interactive ROI calculator tool
4. **retailflow.html** - Complete RetailFlow investment scenarios
5. **action-plan.html** - Interactive 90-day action planning tool
6. **facilitator.html** - Facilitator guide excerpts (public version)
7. **resources.html** - Reading list, articles, case studies
8. **faq.html** - Frequently asked questions about AI strategy

## Interactive Features (Future)

Consider adding:

- **Interactive AI Transformation Matrix** - Drag-and-drop capability mapping
- **ROI Calculator** - Form-based investment calculator
- **Portfolio Visualizer** - Chart showing Three Horizons balance
- **Self-Assessment Quiz** - AI maturity assessment tool
- **Video Snippets** - Short framework explanation videos

## Updating the Site

After making changes:

```bash
git add .
git commit -m "Update companion site"
git push
```

GitHub Pages will automatically rebuild (takes 1-2 minutes).

## Current Status

✅ **index.html** - Complete landing page with:
- Course overview for executives
- 5 strategic frameworks overview
- 4 exercises descriptions (highlighting Dragon's Den)
- Full daily schedule (morning & afternoon sessions)
- Resource links

🔲 **Additional pages** - Placeholder links ready for future content

## Design Notes

The companion site uses:
- **Purple/violet color scheme** (differentiates from Leadership-PM course)
- **Executive-focused language** (strategic, not operational)
- **Investment focus** (portfolio decisions, ROI, strategic positioning)
- **Dragon's Den highlight** (the signature exercise)
- **Responsive design** (mobile-friendly)
- **Clean, professional aesthetic** (appropriate for C-suite audience)

---

**Note:** The companion site complements the in-person masterclass, providing
frameworks and resources participants can reference before, during, and after
the course. It's not a replacement for the live simulation and discussion.
