# AI Agent Demo: Investment Proposal Analyzer

**Purpose:** Demonstrate how AI can act as an autonomous agent to analyse investment proposals using strategic frameworks

**When to use:** During or after Dragon's Den exercise to show AI evaluating AI investments

---

## The Demo Prompt

Copy this into ChatGPT, Claude, or Gemini to create an AI Investment Analyzer agent:

```
You are an AI Investment Analyzer agent for RetailFlow, a regional retail company.

Your role: Systematically evaluate AI investment proposals using the frameworks from the AI-Driven Business Innovation Masterclass.

CONTEXT - RetailFlow:
- Regional retail chain (45 stores)
- Annual revenue: $180M
- CEO has $2M AI budget for this year
- Current data maturity: Level 2-3 (basic analytics, siloed data)
- Strategic priority: Defend market share against Amazon/online competitors

EVALUATION FRAMEWORKS YOU MUST USE:

1. AI TRANSFORMATION MATRIX
   - Optimize (process/incremental)
   - Enhance (strategic/incremental)
   - Revolutionize (process/transformational)
   - Transform (strategic/transformational)

2. THREE HORIZONS MODEL
   - H1 (0-12 months): Optimize core - 70% budget target
   - H2 (1-3 years): Build emerging - 20% budget target
   - H3 (3-5+ years): Create future - 10% budget target

3. AI INVESTMENT CHECKLIST (5 AI-SPECIFIC CRITERIA):
   - Data Readiness (score 0-10, need 7+ to proceed)
   - Continuous Learning Costs (30-50% annually)
   - Accuracy vs. Risk Tolerance (match requirements)
   - Explainability Requirements (regulatory/business)
   - Ethical Risk Assessment (bias, discrimination)

4. ROI THRESHOLDS:
   - H1 projects: Need >200% Year 1 ROI
   - H2 projects: Need >150% 3-year ROI
   - H3 projects: Need >100% 5-year ROI

YOUR ANALYSIS PROCESS:

When I give you an AI investment proposal, you will:

STEP 1: Classify the proposal
- Which matrix quadrant? (Optimize/Enhance/Revolutionize/Transform)
- Which horizon? (H1/H2/H3)
- What's the strategic intent?

STEP 2: Evaluate traditional criteria
- Calculate ROI % 
- Compare against horizon threshold
- Assess strategic fit with RetailFlow's priorities

STEP 3: Evaluate AI-specific criteria (THE CRITICAL PART)
- Score data readiness (0-10 using 4 factors: availability, quality, access, bias)
- Estimate ongoing learning costs (% of initial investment)
- Match AI accuracy to risk tolerance (70-80% low, 85-95% medium, 95%+ high)
- Identify explainability requirements
- Flag ethical risks (discrimination, bias, legal exposure)

STEP 4: Identify red flags
- Data readiness <7 → Must build infrastructure first
- ROI below threshold → Justify with strategic value or reject
- High ethical risk + customer-facing → Requires extensive safeguards
- Accuracy doesn't match risk level → Add human oversight or reject

STEP 5: Make recommendation
- GO (fund as proposed)
- GO WITH CONDITIONS (fund but add safeguards/budget)
- PIVOT (good idea but needs changes first)
- NO GO (reject or defer)

STEP 6: Explain your reasoning
- What frameworks drove your decision?
- What trade-offs did you make?
- What would change your recommendation?

FORMAT YOUR ANALYSIS AS:

📋 PROPOSAL CLASSIFICATION
- Matrix: [Quadrant]
- Horizon: [H1/H2/H3]
- Strategic Intent: [1 sentence]

💰 TRADITIONAL ROI ANALYSIS
- Investment: $[amount]
- 3-Year ROI: [%]
- Threshold: [% for this horizon]
- Assessment: [Pass/Fail with explanation]

🤖 AI-SPECIFIC CRITERIA
- Data Readiness: [score]/10 - [Pass/Fail]
- Continuous Learning: [% annually] - [sustainable?]
- Accuracy Match: [AI capability] vs [requirement] - [Pass/Fail]
- Explainability: [High/Medium/Low] - [concerns?]
- Ethical Risk: [Low/Medium/High] - [red flags?]

🚨 RED FLAGS (if any)
- [List critical issues that could kill this investment]

✅ RECOMMENDATION
- Decision: [GO / GO WITH CONDITIONS / PIVOT / NO GO]
- Rationale: [2-3 sentences using frameworks]
- Conditions (if applicable): [What must be added/changed]
- Budget Impact: [Final recommended amount if different from proposal]

Ready. Give me an AI investment proposal to analyze.
```

---

## Example Use During Workshop

### Scenario 1: Analyse the Chatbot Proposal

**Say to the AI agent:**
> Analyse this proposal:
> 
> **Customer Service Chatbot**
> - Investment: $450,000 (Year 1)
> - Ongoing costs: $180,000/year (40% of initial)
> - Expected ROI: 92% Year 1, 180% over 3 years
> - What it does: Handle routine customer inquiries (order status, returns, store hours)
> - Current call centre: 25 agents, $1.8M/year cost
> - Expected impact: Reduce call volume by 40%, handle 24/7 inquiries
> - Data available: 2 years of call transcripts, FAQ database
> - Accuracy target: 85% (medium risk - customer satisfaction impact)
> - Vendor: Established chatbot platform (proven technology)

**AI Agent will:**
- Classify as "Optimize" (process/incremental) + H1
- Calculate that 92% ROI is BELOW 200% H1 threshold
- Evaluate data readiness (probably 7-8/10 - good FAQ data)
- Note ongoing costs are reasonable (40% is typical)
- Match 85% accuracy to medium risk (acceptable)
- Flag that this is low strategic value but safe bet
- **Recommend:** GO WITH CONDITIONS (acceptable but not exciting)

### Scenario 2: Analyse the Dynamic Pricing Proposal

**Say to the AI agent:**
> Analyse this proposal:
>
> **Dynamic Pricing Optimization**
> - Investment: $850,000 (Year 1)
> - Ongoing costs: $420,000/year (50% of initial)
> - Expected ROI: 253% Year 1, 400%+ over 3 years
> - What it does: Adjust prices in real-time based on demand, competition, inventory
> - Expected impact: 5-8% revenue increase ($9-14M), 12% margin improvement
> - Data available: 18 months pricing history, competitor data feeds
> - Accuracy: 90% (tested in pilot)
> - Risk: Customer-facing pricing decisions
> - Concerns: Potential price discrimination issues

**AI Agent will:**
- Classify as "Enhance" (strategic/incremental) + H1-H2
- Calculate that 253% ROI EXCEEDS 200% H1 threshold (strong)
- Evaluate data readiness (6-7/10 - only 18 months data)
- Note ongoing costs are HIGH (50% is upper range)
- Identify HIGH ETHICAL RISK (price discrimination lawsuits)
- Flag explainability requirement (must explain pricing to customers)
- Flag that actual cost is $850K + $420K + $420K + $420K = $2.11M over 3 years
- **Recommend:** NO GO or PIVOT - Highest ROI but unacceptable ethical risk

---

## Why This Demo is Powerful

### For Executives:
✅ **See AI using the frameworks they just learned** (Matrix, Horizons, Checklist)
✅ **AI catches what humans miss** (total 3-year cost, ethical risks)
✅ **Demonstrates structured thinking** (systematic evaluation)
✅ **Shows AI limitations** (still needs human judgment on trade-offs)

### Teaching Moments:

**Moment 1: "AI found the ethical risk!"**
- Dynamic pricing has highest ROI
- Traditional analysis says "fund this!"
- AI agent flags discrimination concerns
- **Learning:** AI-specific criteria matter

**Moment 2: "AI calculated hidden costs"**
- Chatbot looks cheap at $450K
- AI agent calculates 3-year TCO: $450K + $180K + $180K + $180K = $990K
- **Learning:** Continuous learning costs compound

**Moment 3: "AI applied frameworks consistently"**
- Evaluates each proposal using same criteria
- No bias, no fatigue, no shortcuts
- **Learning:** Frameworks enable systematic decisions

**Moment 4: "But you still decide"**
- AI says "NO GO" to dynamic pricing due to ethics
- Committee might say "We'll accept that risk for 253% ROI"
- **Learning:** AI recommends, humans decide

---

## Facilitation Guide

### When to Demo (Two Options):

**Option A: During Dragon's Den Debrief (4:00 PM)**
After committee announces decisions:
1. "Let's see what an AI agent would recommend"
2. Paste chatbot proposal into the agent
3. Show AI's analysis on projector
4. Compare AI recommendation vs. committee decision
5. Discuss: "What did AI catch that we missed? What did we see that AI didn't?"

**Option B: As Exercise 2 Extension (12:15 PM)**
After tables finish AI-Assisted Strategic Analysis:
1. "You just used AI to analyse threats. Now let's see AI analysing AI investments."
2. Demo with one Dragon's Den scenario
3. Preview what they'll evaluate this afternoon
4. Plant seed: "You could use this technique during Dragon's Den prep"

### Recommended: Option A (Debrief)
- More impactful after they've made decisions
- Creates comparison: Human committee vs. AI agent
- Validates or challenges their thinking
- Great synthesis moment

---

## Advanced Version: Let Participants Use It

**During Dragon's Den Prep (2:00-2:30 PM):**

Say:
> "Optional: You can use this AI Investment Analyzer agent to stress-test your pitch.
> 
> Paste your proposal details. See what red flags AI identifies.
> Then address those in your pitch BEFORE the committee asks.
> 
> This is what strategic AI use looks like - using AI to strengthen your thinking."

**What might happen:**
- A team discovers their data readiness score is too low
- A team realizes their ongoing costs are 60% (unsustainable)
- A team identifies an ethical risk they hadn't considered
- They improve their pitch because AI challenged them

**This validates Exercise 2's lesson:** AI as thought partner, not answer generator.

---

## Variations for Different Scenarios

### For Fraud Detection Proposal:
Agent will identify:
- Needs 6-month data preparation (not in original timeline)
- High accuracy requirement (95%+) for financial decisions
- Explainability needed for investigations
- Strong business case but execution risk

### For Inventory Optimization:
Agent will identify:
- $1.1M exceeds $2M budget constraint significantly
- Data readiness might be weak (siloed inventory data)
- Ongoing costs make 3-year TCO $2M+ (over total budget!)
- Strong strategic fit but budget reality check needed

---

## Key Teaching Points

**After the demo, highlight:**

1. **"AI used the same frameworks you did"**
   - Not magic, just systematic application
   - Frameworks make AI more useful (structured thinking)

2. **"AI found things we missed"**
   - Total cost of ownership calculations
   - Ethical risk patterns
   - Data readiness scores
   - But you provide context AI doesn't have

3. **"This is how you'll use AI on Monday"**
   - Not to replace your judgment
   - To challenge your assumptions
   - To ensure you considered all criteria
   - To strengthen your proposals before presenting

4. **"Notice what the agent is"**
   - It's a prompt (that you could write)
   - With frameworks (that you just learned)
   - Using structured thinking (that you practiced)
   - **You could build this yourself**

---

## Success Metrics

You'll know this demo worked if:

✅ Someone says: "Oh wow, I didn't think about the 3-year ongoing costs"
✅ Someone asks: "Can we use this for our real AI proposals on Monday?"
✅ Someone realizes: "We funded [X] but AI says it's high risk"
✅ Validates the day's learning: Frameworks + AI = Better decisions

---

**This demo shows executives that they can CREATE AI agents (via prompting) that use strategic frameworks to make better decisions. That's the ultimate meta-learning moment.**
