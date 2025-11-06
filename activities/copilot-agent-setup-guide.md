# Microsoft Copilot Agent Setup Guide
## AI Investment Proposal Analyzer for RetailFlow

**Purpose:** Create a persistent AI agent that evaluates investment proposals using course frameworks

---

## Option 1: Microsoft Copilot Studio (Recommended for Organizations)

### Prerequisites:
- Microsoft 365 account with Copilot Studio access
- OR Microsoft Copilot Pro subscription

### Setup Steps:

#### 1. Access Copilot Studio
- Go to https://copilotstudio.microsoft.com/
- Sign in with your Microsoft account
- Click "Create" → "New Copilot"

#### 2. Configure Agent Basics
- **Name:** "RetailFlow AI Investment Analyzer"
- **Description:** "Evaluates AI investment proposals using strategic frameworks from AI Business Innovation Masterclass"
- **Icon:** 💼 (business briefcase)

#### 3. Set Agent Instructions

In the "Instructions" field, paste:

```
You are the AI Investment Analyzer agent for RetailFlow, a regional retail company.

ROLE: Systematically evaluate AI investment proposals using strategic frameworks.

RETAILFLOW CONTEXT:
- Regional retail chain (45 stores)
- Annual revenue: $180M
- CEO has $2M AI budget
- Data maturity: Level 2-3 (basic analytics, siloed)
- Strategic priority: Defend against Amazon/online competitors

EVALUATION FRAMEWORKS:

1. AI TRANSFORMATION MATRIX
   Classify into: Optimize, Enhance, Revolutionize, or Transform

2. THREE HORIZONS
   - H1 (0-12mo): 70% budget, needs >200% Year 1 ROI
   - H2 (1-3yr): 20% budget, needs >150% 3-year ROI
   - H3 (3-5yr): 10% budget, needs >100% 5-year ROI

3. AI-SPECIFIC CRITERIA (must pass ALL):
   - Data Readiness: Score 0-10 (need 7+)
   - Continuous Learning: Estimate ongoing costs (30-50% typical)
   - Accuracy Match: AI capability vs. risk requirement
   - Explainability: Regulatory/business needs
   - Ethical Risk: Bias, discrimination, legal exposure

ANALYSIS FORMAT:

📋 CLASSIFICATION
- Matrix Quadrant: [Which?]
- Horizon: [H1/H2/H3]
- Strategic Intent: [1 sentence]

💰 TRADITIONAL ROI
- Investment: $[amount]
- ROI: [%] over [timeframe]
- Threshold: [% for horizon]
- Status: [PASS/FAIL]

🤖 AI-SPECIFIC CRITERIA
- Data Readiness: [0-10] - [PASS/FAIL]
- Learning Costs: [%/year] - [sustainable?]
- Accuracy: [%] vs [required %] - [match?]
- Explainability: [Low/Med/High]
- Ethical Risk: [Low/Med/High] - [concerns?]

🚨 RED FLAGS
[List critical issues]

✅ RECOMMENDATION
- Decision: [GO / GO WITH CONDITIONS / PIVOT / NO GO]
- Rationale: [Why, using frameworks]
- Conditions: [What must change]
- Final Budget: [$amount]

Be critical. Your job is to find problems, not justify investments.
When in doubt, recommend caution.
```

#### 4. Add Knowledge Sources (Optional)

Upload these files to give agent context:
- `participant-materials/frameworks-reference-sheet.md`
- `participant-materials/ai-investment-checklist-interactive.html`
- `activities/investment-pitch-scenarios.md`

Click "Knowledge" → "Upload files" → Select files

#### 5. Configure Conversation Style
- **Tone:** Professional, analytical
- **Response length:** Detailed (comprehensive analysis)
- **Capabilities:** Enable web search (OFF - we want framework-based only)

#### 6. Test the Agent

Click "Test" and try:
```
Analyse this proposal:

Customer Service Chatbot
- Investment: $450,000
- Ongoing: $180,000/year
- ROI: 92% Year 1
- Handles routine inquiries, 24/7 availability
- Data: 2 years call transcripts
- Accuracy: 85%
```

Agent should provide structured analysis.

#### 7. Publish & Share

- Click "Publish"
- Get shareable link
- Share with workshop participants or use during demo

---

## Option 2: Simple Prompt (No Account Needed)

### For Quick Demo During Workshop:

Just paste this into **any** AI (ChatGPT, Claude, Gemini, Copilot):

**Copy the full prompt from:** `activities/ai-agent-demo-prompt.md`

Then paste investment proposals to analyze.

**Pros:**
- ✅ No setup required
- ✅ Works with free AI tools
- ✅ Immediate use

**Cons:**
- ❌ Not persistent (new conversation each time)
- ❌ Need to re-paste prompt for each session
- ❌ Can't share as a saved agent

---

## Option 3: GPT Custom Instructions (ChatGPT)

### For Participants to Use Post-Workshop:

If participants have ChatGPT Plus:

1. Go to ChatGPT Settings
2. Click "Personalization" → "Custom Instructions"
3. Under "How would you like ChatGPT to respond?", paste:

```
When I ask you to analyse an AI investment proposal, use this framework:

[PASTE THE AGENT INSTRUCTIONS FROM ABOVE]

For all other questions, respond normally.
```

**Benefit:** Agent behaviour persists across all ChatGPT sessions

---

## Option 4: Claude Projects (Anthropic Claude)

### For Participants with Claude Pro:

1. Go to https://claude.ai
2. Click "Projects" → "New Project"
3. Name: "AI Investment Analyzer"
4. In "Project Instructions", paste the agent prompt
5. Add "Custom Instructions": Upload frameworks-reference-sheet.md

**Benefit:** 
- Agent remembers context across conversations
- Can analyse multiple proposals in one session
- Knowledge base persists

---

## Recommended Approach for Workshop

### For Facilitator Demo:
**Use Option 2** (Simple Prompt)
- Paste into free Copilot/ChatGPT/Gemini
- No login, no setup
- Project on screen
- Analyse 1-2 proposals live

### For Participant Use:
**Provide Option 2** (Simple Prompt)
- Include in workshop materials
- Participants paste into their preferred AI
- Use during Dragon's Den prep (optional)
- Take home for Monday

### For Advanced Users:
**Mention Options 1, 3, 4**
- "If you want this agent permanently available..."
- "Use Copilot Studio, ChatGPT Custom Instructions, or Claude Projects"
- Show how to set up
- Optional post-workshop activity

---

## What to Tell Participants

**During the demo:**
> "This is an AI agent I created using the frameworks you just learned.
> 
> It's not a special tool—it's just a well-structured prompt.
> 
> YOU could create this. In fact, you practiced the technique this morning in Exercise 2.
> 
> This is what strategic AI use looks like:
> - Clear role ('You are an investment analyzer')
> - Specific frameworks (Matrix, Horizons, Checklist)
> - Structured output (classification → analysis → recommendation)
> - Critical thinking (find problems, not justify)
> 
> On Monday, you could create an agent for YOUR domain using YOUR frameworks.
> That's the real power—not using AI tools, but creating AI agents that think strategically."

---

## Example Demo Script

**Step 1: Set up the agent** (2 min)
- Open ChatGPT/Copilot on projector
- Paste agent prompt from `ai-agent-demo-prompt.md`
- AI confirms: "Ready. Give me an AI investment proposal to analyze."

**Step 2: Submit a proposal** (1 min)
- Choose: Dynamic Pricing (most dramatic)
- Paste proposal details
- AI starts analyzing...

**Step 3: Show the analysis** (3 min)
- Read AI's classification (Enhance, H1-H2)
- Read AI's ROI analysis (253% - PASSES threshold)
- Read AI's data readiness score (6-7/10 - BORDERLINE)
- **Stop at ethical risk:** "HIGH - Price discrimination concerns"
- Read AI's red flags: "Legal liability, reputational damage, ongoing bias monitoring"
- **AI recommends:** NO GO or PIVOT despite 253% ROI

**Step 4: Discussion** (4 min)
> "The AI caught the ethical risk. Did your committee?
> 
> Traditional ROI says: Fund this! 253% return!
> AI-specific analysis says: Too risky despite ROI.
> 
> This is why frameworks matter. And why AI + Frameworks is powerful.
> 
> What did AI see that you didn't?
> What did YOU see that AI didn't? (Maybe market context, competitive pressure)
> 
> Who makes the final call? You do. But AI makes you think harder."

**Total time: 10 minutes**

---

## Advanced: Agent Conversation

After initial analysis, you can probe deeper:

**Follow-up Question 1:**
> "What if we add a 'fairness audit' process with 3rd party review? Would that change your recommendation?"

**AI might respond:**
> "That mitigates ethical risk but adds $50K+ annually in audit costs. New 3-year TCO: $2.2M+. 
> ROI drops from 253% to ~180%. Still passes H2 threshold (150%).
> Recommendation changes to: GO WITH CONDITIONS if RetailFlow commits to transparency and ongoing fairness monitoring."

**Follow-up Question 2:**
> "Compare this to the Chatbot proposal. Which is better investment?"

**AI might respond:**
> "Chatbot: Lower ROI (92%) but low risk, proven technology, data ready.
> Dynamic Pricing: Higher ROI (253%) but high ethical risk, legal exposure, data borderline.
> 
> Recommendation: Fund Chatbot for H1 (safe, predictable). 
> Defer Dynamic Pricing to H2 after building better data governance and fairness processes."

**This shows:**
- AI can compare proposals
- AI can update recommendations based on new info
- AI reasons through trade-offs
- But YOU frame the questions

---

**The prompt is ready to use! Copy from activities/ai-agent-demo-prompt.md and paste into any AI tool.** 🤖
