# RetailFlow Data Analysis Demo
## Using Copilot to Analyse Retail Performance Data

**Purpose:** Demonstrate how AI/Copilot can analyse business data, identify trends, and create PowerPoint presentations

**Use in workshop:** Show executives how AI can augment business analysis (connects to Exercise 2 themes)

---

## The Dataset

**File:** `retailflow-mock-data.csv`

**What it contains:**
- 45 RetailFlow stores across Australia
- 14 metrics per store (revenue, costs, customers, satisfaction, etc.)
- Intentional patterns and correlations (see below)

**Columns:**
1. Store_ID (S001-S045)
2. Store_Name (location)
3. State (WA, NSW, VIC, QLD, SA, TAS, NT, ACT)
4. Region (West, East, South, North)
5. Store_Size_sqft (square footage)
6. Years_Open (store age)
7. Monthly_Revenue ($)
8. Monthly_Costs ($)
9. Customer_Count (monthly visitors)
10. Avg_Transaction ($)
11. Online_Orders_Pct (% of sales from online)
12. Customer_Satisfaction (1-5 scale)
13. Has_AI_Chatbot (Yes/No)
14. Employee_Count
15. Inventory_Turnover (times per year)

---

## Intentional Patterns (For Discovery)

### Pattern 1: AI Chatbot Impact ⭐ KEY INSIGHT
**Stores with AI Chatbot consistently show:**
- ✅ Higher customer satisfaction (+0.4-0.6 points)
- ✅ Higher online orders percentage (+8-12%)
- ✅ Higher inventory turnover (+1.0-1.5)
- ✅ Higher revenue (correlation, not causation)

**Example:**
- Sydney CBD (with chatbot): 4.5 satisfaction, 22% online, 7.8 turnover
- Melbourne Metro (no chatbot): 4.3 satisfaction, 18% online, 7.1 turnover

**Teaching moment:** "The chatbot investment we're evaluating—there's evidence it works!"

---

### Pattern 2: Store Age Inverse Correlation
**Older stores tend to have:**
- ❌ Lower revenue (declining)
- ❌ Lower customer satisfaction
- ❌ Lower online order percentage
- ❌ Lower inventory turnover

**Example:**
- Whyalla SA (22 years old): $190K revenue, 3.5 satisfaction, 7% online
- Parramatta NSW (3 years old): $740K revenue, 4.9 satisfaction, 32% online

**Teaching moment:** "Legacy stores need investment or modernization"

---

### Pattern 3: Online Orders = Higher Performance
**Stores with higher online % show:**
- ✅ Higher total revenue
- ✅ Higher customer satisfaction
- ✅ Better inventory turnover
- 📊 Clear linear correlation

**Top online stores (25%+):**
- Parramatta: 32% online, $740K revenue
- Brisbane North: 25% online, $425K revenue
- Sydney West: 28% online, $620K revenue

**Bottom online stores (6-10%):**
- Port Augusta: 6% online, $175K revenue
- Darwin: 8% online, $240K revenue
- Whyalla: 7% online, $190K revenue

**Teaching moment:** "Digital capability drives performance"

---

### Pattern 4: Regional Performance Gaps
**East region (NSW, VIC, QLD) outperforms West/South:**
- East average revenue: $485K/month
- West average revenue: $392K/month
- South average revenue: $268K/month

**Why (built into data):**
- East has more population density
- East stores have more AI chatbot adoption (60% vs 30%)
- East stores are younger on average

**Teaching moment:** "Geographic strategy matters for AI rollout"

---

### Pattern 5: Size Isn't Everything
**Store size correlates with revenue but NOT satisfaction:**
- Large stores (>16,000 sqft): High revenue, mixed satisfaction
- Small stores (<10,000 sqft): Low revenue, often low satisfaction
- Medium stores (12,000-15,000): Best satisfaction-to-size ratio

**Teaching moment:** "Bigger isn't always better—operational excellence matters"

---

## Copilot Demo Script (15 minutes)

### Setup (Before Workshop):
1. Upload `retailflow-mock-data.csv` to OneDrive or SharePoint
2. Open file in Excel Online
3. Have Copilot available in Excel
4. Prepare to project screen

### Demo Flow:

#### Part 1: Data Discovery (5 min)

**Copilot Prompt 1:**
> "Analyze this RetailFlow store performance data. What are the top 3 insights or patterns you see? Focus on what drives revenue and customer satisfaction."

**Expected AI response:**
- Stores with AI chatbots have 8-12% higher online sales
- Older stores (15+ years) significantly underperform
- Online order % strongly correlates with revenue

**Say to participants:**
> "In 30 seconds, AI found patterns that might take analysts hours to discover.
> Notice it's using the data WE collected but seeing connections we might miss."

---

#### Part 2: Specific Analysis (4 min)

**Copilot Prompt 2:**
> "Compare stores WITH AI chatbot vs. WITHOUT. Show me the difference in customer satisfaction, online orders %, and revenue. Create a comparison table."

**Expected output:**
```
WITH CHATBOT (12 stores):
- Avg Customer Satisfaction: 4.6
- Avg Online Orders %: 24.3%
- Avg Revenue: $562K

WITHOUT CHATBOT (33 stores):
- Avg Customer Satisfaction: 4.0
- Avg Online Orders %: 15.8%
- Avg Revenue: $385K

DIFFERENCE:
- +0.6 satisfaction points (+15%)
- +8.5% more online orders (+54%)
- +$177K revenue (+46%)
```

**Say to participants:**
> "This is the data-driven business case for the chatbot you're evaluating.
> Not hypothetical—based on RetailFlow's actual pilot stores."

---

#### Part 3: Identify Investment Targets (3 min)

**Copilot Prompt 3:**
> "Which 10 stores should get the AI chatbot investment next? Prioritize by: currently low online %, decent revenue base, and potential for improvement. Create a ranked list."

**Expected output:**
- Melbourne Metro (no chatbot, good revenue, only 18% online)
- Perth Central (no chatbot, good revenue, only 15% online)
- Brisbane South (already good, chatbot would optimize)
- etc.

**Say to participants:**
> "AI just did strategic portfolio allocation.
> It identified where chatbot investment has highest ROI potential.
> This is optimization AI in action—using data to make smarter decisions."

---

#### Part 4: Create Charts (3 min)

**Copilot Prompt 4:**
> "Create 3 charts:
> 1. Bar chart: Average revenue by region
> 2. Scatter plot: Store age vs. customer satisfaction
> 3. Column chart: Chatbot impact (with vs. without comparison for satisfaction, online %, revenue)
>
> Make them presentation-ready."

**Copilot will:**
- Generate 3 charts in Excel
- Professional formatting
- Clear labels

**Then say:**
> "Now let's put these in PowerPoint."

**Copilot Prompt 5:**
> "Create a PowerPoint presentation with these insights:
> - Slide 1: Title 'RetailFlow Store Performance Analysis'
> - Slide 2: Key findings (bullet points)
> - Slide 3-5: The three charts we just created
> - Slide 6: Recommendations for AI chatbot rollout"

**Copilot will:**
- Generate 6-slide PowerPoint
- Include charts
- Professional layout
- Ready to present

**Say to participants:**
> "From data to insights to presentation in 10 minutes.
> This is what AI augmentation looks like.
> You provide the strategy, AI provides the analysis speed."

---

## Key Insights Built Into the Data

### Insight 1: AI Chatbot ROI is Proven
- 12 stores have chatbots (pilot program)
- Clear performance lift across 3 metrics
- Business case: $177K revenue increase per store
- Cost: $450K initial + $180K/year ongoing
- **Payback:** 2.5 years (borderline for H1 threshold)

### Insight 2: Legacy Store Problem
- Stores 15+ years old: Avg revenue $268K
- Stores <5 years old: Avg revenue $612K
- **Implication:** Modernization (like AI) needed for legacy stores

### Insight 3: Regional Strategy
- East region: High performance, high chatbot adoption
- West region: Medium performance, low chatbot adoption (opportunity!)
- South region: Low performance, old stores (harder to save)
- **Implication:** Rollout chatbot to West first (easier wins)

### Insight 4: Online is the Future
- Every 1% increase in online orders = ~$18K revenue
- Top online stores are also youngest and highest satisfaction
- **Implication:** AI that drives online (chatbot) is strategic

### Insight 5: Size vs. Efficiency Trade-off
- Largest stores (18,000+ sqft): High revenue but lower margins
- Medium stores (12,000-15,000 sqft): Best efficiency
- **Implication:** AI to optimize operations (inventory turnover matters)

---

## Questions AI Could Answer

### Strategic Questions:
1. "Which stores should get AI chatbot first?" (rollout priority)
2. "What's the ROI of chatbot based on pilot data?" (business case)
3. "Should we invest in old stores or focus on new ones?" (portfolio)
4. "How does online capability affect overall performance?" (digital strategy)

### Analytical Questions:
1. "What's the correlation between online orders % and revenue?" (r² = 0.78)
2. "Do larger stores have better margins?" (No—costs scale too)
3. "Which region has the biggest performance gap?" (South)
4. "What predicts customer satisfaction best?" (Online %, AI chatbot, store age)

### Investment Questions:
1. "If chatbot costs $450K and increases revenue by $177K/year, what's the payback?" (2.5 years)
2. "How many stores should we roll out to this year with $2M budget?" (4 stores at $450K each)
3. "Which stores have the best cost structure for AI investment?" (medium-sized, decent revenue)

---

## Why This Demo Works

### For Executives:
✅ **Familiar domain:** Retail store data (relatable)
✅ **Clear patterns:** Not subtle—executives will see the insights
✅ **Connects to Dragon's Den:** Chatbot is one of the 4 proposals
✅ **Shows speed:** 10 minutes vs. hours of manual analysis
✅ **Demonstrates limitations:** AI finds patterns, YOU interpret strategic meaning

### Teaching Moments:

**"AI found the chatbot works"**
- Data proves the pilot succeeded
- Validates the Dragon's Den business case
- But AI doesn't know: Can we afford it? Is it strategic priority?

**"AI created the presentation"**
- From CSV → insights → PowerPoint in minutes
- But AI doesn't know: What story should we tell? What's the strategic narrative?
- Human adds: Context, stakes, recommendations

**"This is augmentation, not replacement"**
- AI does: Fast analysis, chart generation, pattern detection
- Human does: Strategy, interpretation, decision-making
- Together: Better and faster than either alone

---

## Facilitation Tips

### When to Demo:

**Option A: During Exercise 2 (11:45 AM)**
- After tables finish human brainstorming
- Before they use AI for strategic analysis
- Shows: "Here's what AI can do with structured data"
- Then: "Now you'll use AI for strategic thinking"

**Option B: During Lunch Prep (12:15 PM)**
- Quick 10-min demo while people are settling
- Energizes post-exercise discussion
- Sets expectation for afternoon AI use

**Option C: During Dragon's Den Debrief (4:05 PM)**
- After investment decisions made
- Show: "Here's the data supporting the chatbot decision"
- Validates committee's analysis (or challenges it)

**Recommended: Option A** (sets up Exercise 2)

### What to Say:

**Opening:**
> "Before you use AI for strategic analysis, let me show you what AI can do with RetailFlow's store data in 10 minutes."

**During demo:**
> "Notice: I'm prompting AI, evaluating its output, asking follow-ups.
> I'm the editor-in-chief. AI is the research assistant.
> Same model you'll use in the next exercise."

**Closing:**
> "This took 10 minutes. Traditional analysis: 4-6 hours.
> 
> But AI didn't tell me WHAT to do—it showed me patterns.
> I still decide: Should we fund chatbot? Which stores first? What's the strategy?
> 
> Now you'll practice this with strategic threats and opportunities."

---

## Advanced: Let Participants Try

**If time allows (Exercise 2 extended):**

1. Share the CSV file with tables
2. Tables upload to their own Excel/Sheets
3. Use Copilot/ChatGPT to analyse
4. Compare insights across tables

**Prompt for participants:**
> "Analyze this RetailFlow data. If you had $2M to invest in AI across these stores, where would you invest and why? Consider: chatbot rollout, inventory optimization, or dynamic pricing."

**What they'll discover:**
- Different tables find different patterns
- AI helps quantify intuitions
- Data informs but doesn't decide strategy
- Same data → different strategic conclusions (based on assumptions)

---

## File Formats

### Option 1: CSV (Provided)
- `retailflow-mock-data.csv`
- Works with: Excel, Google Sheets, any Copilot
- Import and analyse

### Option 2: Excel with Pre-built Charts (Optional)
If you want to save time:
- Create Excel file with charts already made
- Show "before AI" vs. "with AI analysis"
- Demonstrates what AI can generate

### Option 3: Google Sheets (For BYOD)
- Upload CSV to Google Drive
- Share link with participants
- Works with Gemini in Google Sheets

---

## Expected AI-Generated Charts

### Chart 1: Revenue by Region
**Type:** Bar chart
**Shows:** East region dominates ($485K avg), South lags ($268K avg)
**Insight:** Regional strategy needed

### Chart 2: Store Age vs. Customer Satisfaction
**Type:** Scatter plot with trendline
**Shows:** Negative correlation (older stores = lower satisfaction)
**Insight:** Legacy modernization opportunity

### Chart 3: Chatbot Impact Comparison
**Type:** Grouped column chart
**Shows:** With vs. Without chatbot across 3 metrics
**Insight:** Clear performance lift from AI investment

### Chart 4: Online Orders % vs. Revenue (Optional)
**Type:** Scatter plot with trendline
**Shows:** Strong positive correlation (r² ≈ 0.78)
**Insight:** Digital capability drives revenue

---

## Connection to Course Content

### Links to Exercise 2 (AI-Assisted Strategic Analysis):
- This demo shows AI analysing QUANTITATIVE data (numbers, patterns)
- Exercise 2 shows AI analysing QUALITATIVE strategy (threats, opportunities)
- Both use same principle: AI augments human thinking

### Links to Dragon's Den:
- Chatbot data supports the business case
- Shows evidence-based decision making
- Data informs which proposal to fund

### Links to Frameworks:
- **Data Value Pyramid:** This is Level 3 (Descriptive Analytics) → Level 4 (Predictive)
- **AI Transformation Matrix:** This is "Optimize" quadrant (process improvement)
- **Three Horizons:** Using data to prioritize H1 investments

---

## Troubleshooting

### "Copilot isn't finding patterns"
**Solution:** Be more specific
- Don't ask: "Analyze this data"
- Ask: "Compare stores with AI chatbot vs. without. Show average revenue, satisfaction, and online order % for each group."

### "Charts are ugly"
**Solution:** Ask for refinement
- "Make this chart presentation-ready with better colours and clear labels"
- "Create a professional bar chart showing revenue by region"

### "AI is making stuff up"
**Solution:** Ground in data
- "Only use data from this spreadsheet. Do not make assumptions."
- "Show me the calculation you used to get that number."

### "We don't have Copilot in Excel"
**Alternative:** 
- Export data to CSV
- Use ChatGPT with Code Interpreter (ChatGPT Plus)
- Or use Google Sheets with Gemini
- Or use Claude with file upload

---

## What Participants Learn

### Surface Learning:
- AI can analyse data quickly
- AI can generate charts
- AI can create presentations

### Deep Learning:
- AI is TOOL for augmentation, not replacement
- YOU provide: Questions, context, strategic interpretation
- AI provides: Speed, pattern detection, visualization
- Together: Better decisions, faster

### Strategic Insight:
> "If AI can help YOU (executives with deep expertise) analyse data better and faster...
> 
> Imagine what it can do for your organisation when deployed thoughtfully.
> 
> This validates the AI investment you're evaluating.
> The chatbot proposal? We just proved with data that it works."

---

## Success Metrics

Demo worked if:

✅ Participants say: "I could use this for my business data on Monday"
✅ Someone asks: "Can you share that dataset so I can try?"
✅ During Dragon's Den, someone references: "The data showed chatbot increases satisfaction by 0.6 points"
✅ Validates Exercise 2: AI as thought partner for analysis

---

## Optional: More Advanced Analysis

If participants want to go deeper:

### Predictive Analysis:
> "Based on stores with chatbots, predict the revenue impact if we roll out to all stores without chatbots. Show me the projected revenue increase and ROI."

### Regression Analysis:
> "What factors best predict customer satisfaction? Run a regression with: store age, online %, chatbot (yes/no), store size, region."

### Optimization:
> "With $2M budget and $450K per chatbot deployment, which stores should we prioritize to maximize total revenue impact?"

---

**The dataset is ready to use! Upload to Excel and start prompting Copilot.** 📊

**File:** `activities/retailflow-mock-data.csv`
