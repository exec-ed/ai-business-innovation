# Simple Copilot Prompt for RetailFlow Charts

**Purpose:** Quick, simple prompt that WILL create charts

**Time:** 5 minutes

---

## THE SIMPLE PROMPT (Copy This)

```
Analyse this RetailFlow store data and create 3 charts:

1. Create a column chart showing average Monthly_Revenue by Region (East, West, South, North). Title it "Revenue by Region".

2. Create a clustered column chart comparing stores with AI chatbot vs. without. Show these 3 metrics side by side:
   - Average Monthly_Revenue
   - Average Customer_Satisfaction (multiply by 100000 so it shows on same scale)
   - Average Online_Orders_Pct
   Title it "AI Chatbot Impact".

3. Create a scatter chart with Online_Orders_Pct on X-axis and Monthly_Revenue on Y-axis. Add a trendline. Title it "Online vs Revenue".

Make the charts colorful and presentation-ready.

Then tell me in 3 bullets: What are the biggest insights from this data?
```

---

## What You'll Get

### Chart 1: Revenue by Region
- Simple bar chart
- Shows East region dominates (~$485K avg)
- South region lags (~$268K avg)
- **Insight visible:** 81% performance gap

### Chart 2: Chatbot Impact  
- Side-by-side comparison
- Shows chatbot stores perform better across ALL metrics
- **Insight visible:** +46% revenue with chatbot

### Chart 3: Online vs Revenue
- Scatter plot with trendline
- Clear upward correlation
- **Insight visible:** Online capability = revenue growth

### Plus: 3-Bullet Summary
Copilot will say something like:
1. Stores with AI chatbot generate 46% more revenue
2. Online orders % strongly predicts revenue (R² ≈ 0.78)
3. East region significantly outperforms other regions

---

## Even Simpler Version (If That Doesn't Work)

```
Compare stores where Has_AI_Chatbot = "Yes" vs "No".

Show me:
1. Average Monthly_Revenue for each group
2. Average Customer_Satisfaction for each group  
3. Average Online_Orders_Pct for each group

Create a chart showing these 3 comparisons.
```

---

## To Create PowerPoint After Charts:

```
Create a 4-slide PowerPoint:
- Slide 1: Title "RetailFlow AI Investment Analysis"
- Slide 2: The 3 key insights as bullet points
- Slide 3: Insert the chatbot comparison chart
- Slide 4: Insert the online vs revenue chart
```

---

## Demo Script (5 Minutes)

**Step 1 (1 min):** 
- Upload CSV to Excel Online
- Open Copilot

**Step 2 (30 sec):**
- Paste the simple prompt
- Hit enter

**Step 3 (2 min):**
- Watch Copilot work
- Charts appear in Excel
- Read the 3 insights aloud

**Step 4 (1 min):**
- Paste PowerPoint follow-up
- Show generated deck

**Step 5 (30 sec):**
- "That was 5 minutes. Would have taken you hours manually."
- "AI found the chatbot works. Data proves it."

---

**This simple version is more reliable and still impressive!** 📊
