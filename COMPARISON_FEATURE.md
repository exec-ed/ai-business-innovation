# Before/After Comparison Feature - Implementation Guide

## What to Add to ai-leadership-style-assessment.html

### 1. Add to CSS (before @media print, around line 320):

```css
.comparison-section {
    background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
    padding: 30px;
    border-radius: 8px;
    margin-bottom: 20px;
    border: 2px solid #667eea;
}

.comparison-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 30px;
    margin-top: 20px;
}

.comparison-column {
    background: white;
    padding: 25px;
    border-radius: 8px;
}

.dimension-change {
    flex: 0 0 60px;
    text-align: right;
    font-weight: bold;
    font-size: 0.9em;
}

.dimension-change.positive { color: #16a34a; }
.dimension-change.negative { color: #dc2626; }
```

### 2. Add to HTML (in results section, around line 420):

```html
<!-- Comparison Section (only shown if previousResults exist) -->
<div class="comparison-section" id="comparisonSection" style="display: none;">
    <div class="comparison-header">
        <h3>📊 Your Learning Journey</h3>
        <p>How your leadership style evolved during today's workshop</p>
    </div>
    <div id="comparisonContent"></div>
</div>
```

### 3. Add JavaScript Functions (at end of script, around line 850):

```javascript
// Save results to localStorage
function saveResults(style, scores, timestamp) {
    const results = {
        style: style.name,
        scores: scores,
        timestamp: timestamp || Date.now()
    };
    
    // Check if this is first assessment (morning) or second (afternoon)
    const morningResults = localStorage.getItem('ai_assessment_morning');
    
    if (!morningResults) {
        localStorage.setItem('ai_assessment_morning', JSON.stringify(results));
    } else {
        localStorage.setItem('ai_assessment_afternoon', JSON.stringify(results));
    }
    
    return results;
}

// Load previous results
function loadPreviousResults() {
    const morning = localStorage.getItem('ai_assessment_morning');
    return morning ? JSON.parse(morning) : null;
}

// Show comparison if previous results exist
function showComparison(currentStyle, currentScores) {
    const previousResults = loadPreviousResults();
    
    if (!previousResults) {
        return; // No comparison to show
    }
    
    document.getElementById('comparisonSection').style.display = 'block';
    
    const content = document.getElementById('comparisonContent');
    
    // Compare styles
    const styleChanged = previousResults.style !== currentStyle.name;
    
    let comparisonHTML = `
        <div class="comparison-grid">
            <div class="comparison-column">
                <h4>🌅 This Morning</h4>
                <div class="comparison-style ${!styleChanged ? 'highlight' : ''}">
                    <h5>${previousResults.style}</h5>
                </div>
            </div>
            <div class="comparison-column">
                <h4>🌆 This Afternoon</h4>
                <div class="comparison-style ${!styleChanged ? 'highlight' : ''}">
                    <h5>${currentStyle.name}</h5>
                </div>
            </div>
        </div>
    `;
    
    // Compare dimension scores
    const dimensions = ['strategy', 'roi', 'risk', 'experimentation', 'data', 'people'];
    const dimensionNames = {
        strategy: 'Strategic Thinking',
        roi: 'ROI Focus',
        risk: 'Risk Tolerance',
        experimentation: 'Experimentation',
        data: 'Data-Driven',
        people: 'People Focus'
    };
    
    let changesHTML = '<div class="insights-box"><h4>📈 Key Changes</h4><ul>';
    let hasChanges = false;
    
    dimensions.forEach(dim => {
        const prev = previousResults.scores[dim] || 0;
        const curr = currentScores[dim] || 0;
        const change = curr - prev;
        
        if (Math.abs(change) >= 2) {
            hasChanges = true;
            let changeText = '';
            if (change > 0) {
                changeText = `Your ${dimensionNames[dim]} increased by ${change} points`;
            } else {
                changeText = `Your ${dimensionNames[dim]} decreased by ${Math.abs(change)} points`;
            }
            changesHTML += `<li>${changeText}</li>`;
        }
    });
    
    if (!hasChanges) {
        changesHTML += '<li>Your scores remained relatively stable—you have a consistent leadership approach</li>';
    }
    
    changesHTML += '</ul></div>';
    
    content.innerHTML = comparisonHTML + changesHTML;
}

// Clear previous results (for facilitators)
function clearAssessmentHistory() {
    if (confirm('Clear all previous assessment data? This will allow you to retake from scratch.')) {
        localStorage.removeItem('ai_assessment_morning');
        localStorage.removeItem('ai_assessment_afternoon');
        location.reload();
    }
}
```

### 4. Modify calculateResults() function (around line 658):

Add after line 669:
```javascript
// Save results
const timestamp = Date.now();
saveResults(style, scores, timestamp);

// Show comparison if this is second assessment
showComparison(style, scores);
```

### 5. Add to share-section buttons (around line 430):

```html
<button class="button" onclick="clearAssessmentHistory()">🗑️ Clear History</button>
```

## Usage Instructions for Facilitators

**Morning (9:00-9:10 AM):**
- Participants take assessment
- Results saved as "morning" assessment
- No comparison shown (first time)

**Afternoon (4:20-4:30 PM):**
- Participants retake same assessment
- Results saved as "afternoon" assessment
- Comparison automatically shown
- Highlights changes in scores and style

**Benefits:**
- Shows learning impact
- Validates workshop effectiveness
- Creates "aha!" moments
- Great closing activity

**Privacy:**
- Still browser-only (localStorage)
- No server transmission
- Can be cleared anytime
