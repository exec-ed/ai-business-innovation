# Executive AI Prompt Library
**Ready-to-use prompts for strategic decision-making**

---

## How to Use This Library

**This is your prompt cookbook.** Each prompt is:
- ✅ Ready to copy/paste (customize the [BRACKETED] sections)
- ✅ Tested in real business contexts
- ✅ Designed for strategic/executive decisions
- ✅ Organised by use case

**Quick start:**
1. Find the use case that matches your need
2. Copy the prompt
3. Replace [BRACKETED PLACEHOLDERS] with your specifics
4. Paste into ChatGPT, Claude, or similar AI
5. Engage with the output (don't just accept first response)

---

## Table of Contents

### Strategic Planning
- [Portfolio Audit](#portfolio-audit)
- [Strategic Roadmap Development](#strategic-roadmap)
- [Competitive Landscape Analysis](#competitive-landscape)
- [Market Entry Strategy](#market-entry)

### AI Investment Decisions
- [AI Opportunity Identification](#ai-opportunities)
- [Investment Risk Assessment](#investment-risk)
- [Data Readiness Evaluation](#data-readiness)
- [Build vs. Buy Analysis](#build-vs-buy)

### Risk & Ethics
- [Bias Risk Assessment](#bias-risk)
- [Ethical Implications Analysis](#ethical-analysis)
- [Regulatory Compliance Check](#regulatory-compliance)
- [Failure Scenario Planning](#failure-scenarios)

### Stakeholder Management
- [Stakeholder Objection Handling](#stakeholder-objections)
- [Board Presentation Prep](#board-prep)
- [Change Management Planning](#change-management)
- [Executive Communication](#executive-communication)

### Advanced Techniques
- [Reverse Prompting](#reverse-prompting-advanced)
- [Multi-Perspective Debate](#multi-perspective)
- [Red Team Analysis](#red-team)
- [Second-Order Effects](#second-order)

---

## Strategic Planning

### Portfolio Audit {#portfolio-audit}

**When to use:** Reviewing your current AI initiatives to identify gaps and balance

```
You are a strategic portfolio consultant specializing in AI investments.

Our current AI portfolio:
[LIST YOUR CURRENT AI INITIATIVES - e.g., "Chatbot for customer service, predictive maintenance, fraud detection"]

Industry context: [YOUR INDUSTRY]
Annual AI budget: [$ AMOUNT]
Organisation size: [EMPLOYEES/REVENUE]

Analyse our portfolio using Three Horizons Model:
1. What % is in each horizon (H1: 0-12mo, H2: 1-3yr, H3: 3-5yr)?
2. Are we balanced (target: 70% H1, 20% H2, 10% H3)?
3. What strategic gaps exist?
4. What should we add, drop, or pivot?

Be critical. Identify over-investment in optimization vs. transformation.
```

**Follow-up prompts:**
- "Which initiative should we kill or deprioritize and why?"
- "What H3 transformation initiative should we start exploring?"
- "How does this compare to competitors in [INDUSTRY]?"

---

### Strategic Roadmap Development {#strategic-roadmap}

**When to use:** Building a 3-year AI strategy

```
You are a Chief AI Strategy Officer. Help me develop a 3-year AI roadmap.

Current state:
- Data maturity level: [1-5]
- Current AI capabilities: [DESCRIBE]
- Key business challenges: [TOP 3]
- Competitive pressure: [DESCRIBE]

Ask me 10 strategic questions to ensure a comprehensive roadmap covering:
- Quick wins (0-6 months)
- Capability building (6-18 months)
- Transformation initiatives (18-36 months)
- Data infrastructure needs
- Organisational readiness
- Risk mitigation

Ask ONE question at a time. Probe my answers before moving to next question.
```

**Why this works:** Reverse prompting reveals blind spots in your planning

---

### Competitive Landscape Analysis {#competitive-landscape}

**When to use:** Understanding how competitors are using AI

```
You are a competitive intelligence analyst for [YOUR INDUSTRY].

My company: [BRIEF DESCRIPTION]

Competitive context:
- Top 3 competitors: [NAME THEM]
- Our market position: [DESCRIBE]

Analysis request:
1. What AI capabilities are competitors likely developing?
2. Which competitor is most advanced in AI? What evidence?
3. What AI-driven threats should we worry about in next 12 months?
4. What "blind spot" opportunities exist that competitors are missing?
5. Should we be first-mover, fast-follower, or wait-and-see? Why?

Be specific. Use examples from similar industries if [INDUSTRY] data is limited.
```

**Follow-up prompts:**
- "If you were [COMPETITOR], how would you use AI to attack our market position?"
- "What early warning signs indicate competitor is gaining AI advantage?"

---

### Market Entry Strategy {#market-entry}

**When to use:** Entering new markets or launching AI-powered offerings

```
You are a market entry strategist with AI expertise.

Our opportunity:
- New market/offering: [DESCRIBE]
- Why now: [RATIONALE]
- Investment: [$AMOUNT]
- Target: [CUSTOMER SEGMENT]

Analyse this market entry:
1. What AI capabilities are "table stakes" (must-have to compete)?
2. What AI capabilities could differentiate us (competitive advantage)?
3. What's the data cold-start problem? (How do we get initial training data?)
4. What are go-to-market risks specific to AI offerings?
5. Should we launch MVP or wait until AI is production-ready?

Consider both offensive (growth) and defensive (competition) perspectives.
```

---

## AI Investment Decisions

### AI Opportunity Identification {#ai-opportunities}

**When to use:** Brainstorming where AI could create value

```
You are an AI innovation consultant for [YOUR INDUSTRY].

About my business:
- Core operations: [DESCRIBE]
- Biggest bottleneck: [WHAT'S SLOW/EXPENSIVE/ERROR-PRONE]
- Customer pain points: [TOP 3]
- Competitors are doing: [DESCRIBE AI USES]

Help me identify AI opportunities I'm missing:

1. What repetitive decisions could AI automate or augment?
2. What data do we collect but not fully use?
3. Where could AI create "flywheel effects" (better with usage)?
4. What customer problems could AI solve better than humans?
5. What "unsexy" backend processes have huge ROI potential?

Think broadly: automation, prediction, personalization, optimization, generation.
Prioritize by: ROI potential, data readiness, competitive urgency.
```

**Advanced version:**
Add: "For each opportunity, estimate: Data readiness (0-10), ROI timeline (months), Risk level (Low/Med/High)"

---

### Investment Risk Assessment {#investment-risk}

**When to use:** Evaluating a specific AI investment before approval

```
You are a Chief Risk Officer evaluating this AI investment proposal:

Project: [NAME AND DESCRIPTION]
Budget: [$AMOUNT]
Timeline: [MONTHS]
Expected ROI: [% AND TIMEFRAME]

Use the AI Investment Checklist framework:

1. DATA READINESS (score 0-10):
   - Do we have sufficient training data?
   - Is data quality acceptable?
   - Are there biases in historical data?

2. CONTINUOUS LEARNING:
   - What are realistic ongoing costs (% of initial)?
   - How often must models be retrained?
   - What happens if we stop retraining?

3. ACCURACY VS. RISK:
   - What's acceptable failure rate?
   - What's the cost of being wrong?
   - Does AI capability match our requirements?

4. EXPLAINABILITY:
   - Must we explain AI decisions (regulatory/operational)?
   - Does this limit algorithm choices?
   - What's the transparency plan?

5. ETHICAL RISKS:
   - Could this discriminate against protected groups?
   - What's our bias testing plan?
   - What's reputational risk if biased?

For each criterion: Identify red flags, estimate hidden costs, recommend go/no-go.
Be critical—your job is to find problems, not justify the investment.
```

**This is your AI Investment Checklist in prompt form.**

---

### Data Readiness Evaluation {#data-readiness}

**When to use:** Before funding AI, assess if data is actually ready

```
You are a Chief Data Officer evaluating data readiness for this AI initiative:

Proposed AI use case: [DESCRIBE]
AI approach: [e.g., predictive model, classification, recommendation engine]

Current data landscape:
- Data sources: [LIST SYSTEMS: CRM, ERP, etc.]
- Data quality: [KNOWN ISSUES]
- Data volume: [ROUGH AMOUNT]
- Historical timeframe: [YEARS OF DATA]

Assess data readiness (score 0-10):

1. AVAILABILITY: Do we have enough data? (ML typically needs 1000s-100,000s examples)
2. QUALITY: Is data accurate, complete, consistent?
3. ACCESS: Can we integrate necessary sources?
4. BIAS: Is historical data representative/unbiased?

For each dimension:
- What's the score and why?
- What's missing or problematic?
- How long to fix (months)?
- What's cost to remediate?

Final recommendation: 
- If <7: "Stop. Fund data infrastructure first."
- If 7-8: "Proceed with caution. Address [SPECIFIC GAPS] in parallel."
- If 9-10: "Data ready. Green light."
```

---

### Build vs. Buy Analysis {#build-vs-buy}

**When to use:** Deciding whether to build custom AI or buy commercial solution

```
You are a technology strategy consultant analysing build vs. buy for:

AI capability needed: [DESCRIBE]
Business criticality: [Low/Medium/High]
Differentiation potential: [Commodity/Competitive advantage/Core differentiation]

Current context:
- Internal AI capabilities: [TEAM SIZE, EXPERTISE]
- Budget: [$AMOUNT]
- Timeline pressure: [URGENT/MODERATE/PATIENT]

Analyse both options:

BUILD CUSTOM:
- Pros: Control, differentiation, data privacy
- Cons: Time, expertise, ongoing maintenance
- Best if: [CONDITIONS]
- Risk level: [ASSESSMENT]

BUY COMMERCIAL:
- Pros: Speed, proven solution, vendor support
- Cons: Vendor lock-in, less differentiation, recurring costs
- Best if: [CONDITIONS]
- Risk level: [ASSESSMENT]

HYBRID (buy platform, customize):
- Pros: [IDENTIFY]
- Cons: [IDENTIFY]

Recommendation with rationale.
Consider: strategic importance, data sensitivity, time-to-market, total cost of ownership.
```

---

## Risk & Ethics

### Bias Risk Assessment {#bias-risk}

**When to use:** Evaluating potential discrimination risks in customer-facing AI

```
You are an AI ethics auditor assessing bias risk for:

AI system: [DESCRIBE - e.g., "fraud detection", "dynamic pricing", "hiring tool"]
Scope: [WHO IT AFFECTS]
Decision impact: [Low/Medium/High - life-impacting?]

Historical context:
- Training data source: [DESCRIBE]
- Known biases in current process: [IF ANY]
- Protected groups affected: [e.g., race, gender, age, disability]

Conduct bias risk assessment:

1. INHERENT RISK LEVEL (High/Med/Low):
   - Is this customer-facing?
   - Does it make life-impacting decisions?
   - Are protected classes involved?

2. DATA BIAS LIKELIHOOD:
   - Could historical data reflect past discrimination?
   - Are there proxy variables (correlate with protected class)?
   - Is training data representative of all user populations?

3. POTENTIAL HARMS:
   - What's worst-case discriminatory outcome?
   - What's reputational damage if bias discovered?
   - What's legal liability?

4. MITIGATION PLAN:
   - What bias testing is needed? (Fairness metrics, demographic testing)
   - Do we need diverse development team?
   - External audit required?
   - Ongoing monitoring plan?

Estimate cost of proper bias mitigation: [% of project budget].
Red flags that should stop project: [IDENTIFY].
```

**Critical for high-stakes AI like hiring, lending, pricing, fraud detection.**

---

### Ethical Implications Analysis {#ethical-analysis}

**When to use:** Broader ethical review beyond just bias

```
You are an AI ethics philosopher analysing this AI system:

System: [DESCRIBE]
Purpose: [BUSINESS GOAL]
Users affected: [WHO]

Conduct ethical analysis across multiple dimensions:

1. AUTONOMY: Does this preserve human agency or undermine it?
   - Can users override AI decisions?
   - Is AI transparent about its role?

2. FAIRNESS: Could this create unjust outcomes?
   - Disparate impact on groups?
   - Access inequality?

3. PRIVACY: What surveillance or data concerns?
   - What data is collected?
   - Could this be weaponized?

4. ACCOUNTABILITY: Who's responsible if it fails?
   - Can we explain decisions?
   - Is there recourse for affected users?

5. SOCIAL IMPACT: What systemic effects?
   - Job displacement?
   - Power concentration?
   - Democratic implications?

For each: Identify concerns, rate severity (Low/Med/High), propose safeguards.

Final ethical scorecard: Should we proceed? Under what conditions?
```

**Use this for societally-impactful AI, not just routine business systems.**

---

### Regulatory Compliance Check {#regulatory-compliance}

**When to use:** Ensuring AI complies with regulations (GDPR, CCPA, industry-specific)

```
You are a regulatory compliance attorney specializing in AI.

AI system: [DESCRIBE]
Jurisdiction: [COUNTRIES/REGIONS]
Industry: [SECTOR - some have specific AI regulations]
Personal data involved: [YES/NO - what types]

Analyse regulatory compliance:

1. GDPR (if EU users):
   - Right to explanation: Can we explain AI decisions?
   - Right to human review: Do we have override process?
   - Data minimization: Using only necessary data?
   - Legitimate interest: Is AI use justified?

2. SECTOR-SPECIFIC (e.g., healthcare, financial services):
   - What industry regulations apply?
   - Are there approval/validation requirements?
   - Prohibited uses of AI?

3. ALGORITHMIC ACCOUNTABILITY LAWS:
   - Does this jurisdiction require bias audits?
   - Transparency requirements?
   - Impact assessments needed?

4. LIABILITY CONSIDERATIONS:
   - Who's liable if AI harms someone?
   - Insurance implications?
   - Contractual protections needed?

Identify: 
- Compliance gaps (what we must fix)
- Regulatory risks (potential violations)
- Documentation needed (audits, impact assessments)

If non-compliant: Estimated cost/time to achieve compliance.
```

---

### Failure Scenario Planning {#failure-scenarios}

**When to use:** Red-teaming your AI project (what could go wrong?)

```
You are a "pre-mortem" facilitator. It's 12 months from now.

This AI project just failed catastrophically: [PROJECT NAME AND DESCRIPTION]

Walk me through the failure:

1. INITIAL WARNING SIGNS (Months 1-3):
   - What early indicators did we ignore?
   - Which assumptions proved wrong?

2. ESCALATION (Months 4-8):
   - How did problems compound?
   - What stakeholders resisted?
   - What technical issues emerged?

3. CATASTROPHIC FAILURE (Month 9-12):
   - What was the trigger event?
   - What's the damage? (Financial, reputational, operational)
   - Why didn't we catch it earlier?

4. ROOT CAUSE ANALYSIS:
   - Was this technical failure, business failure, or organisational failure?
   - What could we have done differently?

Now: For each failure scenario, what should we monitor NOW to prevent it?

Give me 3 most likely failure scenarios (ranked by likelihood × impact).
```

**"Pre-mortem" technique: Imagine failure to prevent it.**

---

## Stakeholder Management

### Stakeholder Objection Handling {#stakeholder-objections}

**When to use:** Preparing for tough questions about your AI proposal

```
You are a skeptical [ROLE: CFO/Board Member/VP Operations] who doubts this AI investment:

Proposal: [YOUR AI PROJECT]
Budget: [$AMOUNT]
Claimed benefits: [ROI/IMPROVEMENTS]

Your concerns:
- Wasting money on AI hype
- Data quality insufficient
- Organisation not ready for change
- Ethical/legal risks
- Unproven technology

Ask me your 10 toughest questions. Push hard on:
- ROI assumptions (too optimistic?)
- Data readiness (really ready?)
- Risk mitigation (have we thought this through?)
- Alternative approaches (why not [ALTERNATIVE]?)
- Opportunity cost (what else could we fund?)

After each of my answers, probe deeper if my answer is weak.
Your goal: Expose holes in the proposal.
```

**Practice this before executive presentations. Strengthens your business case.**

**Follow-up:**
After the grilling, ask: "Based on my answers, what should I strengthen in my proposal?"

---

### Board Presentation Prep {#board-prep}

**When to use:** Preparing a board-level AI strategy presentation

```
You are a board presentation coach specializing in AI strategy.

My presentation topic: [AI STRATEGY/INVESTMENT]
Board composition: [DESCRIBE - technical expertise? industry backgrounds?]
Time available: [MINUTES]
Key decision: [WHAT I NEED BOARD TO APPROVE]

Help me structure a compelling board presentation:

1. OPENING (1-2 min):
   - What hook captures attention immediately?
   - What's the strategic imperative (why now)?

2. SITUATION ANALYSIS (3-5 min):
   - Competitive threats from AI
   - Current state (what we're missing)
   - Cost of inaction

3. STRATEGIC APPROACH (5-7 min):
   - Portfolio strategy (Three Horizons)
   - Key initiatives and rationale
   - Resource requirements

4. RISK MITIGATION (3-5 min):
   - What could go wrong?
   - How we'll mitigate
   - Governance and oversight

5. DECISION REQUEST (2 min):
   - What I need from board (approval, budget, authority)
   - Clear ask

For each section:
- Key message (one sentence)
- Supporting evidence
- Anticipated questions
- Visuals needed

What questions will each board member ask based on their background?
```

---

### Change Management Planning {#change-management}

**When to use:** Planning organisational change for AI adoption

```
You are a change management consultant specializing in AI transformation.

AI initiative: [DESCRIBE]
Affected employees: [NUMBER, ROLES]
Change magnitude: [MINOR/MODERATE/TRANSFORMATIVE]
Timeline: [MONTHS]

Analyse change resistance:

1. WHO WILL RESIST AND WHY:
   - Which roles feel threatened?
   - What fears will emerge? (job loss, skill obsolescence, loss of control)
   - Who are informal influencers?

2. RESISTANCE TACTICS TO EXPECT:
   - Active (sabotage, vocal opposition)
   - Passive (slow adoption, workarounds)

3. STAKEHOLDER MAPPING:
   - Champions: [WHO WILL SUPPORT?]
   - Fence-sitters: [WHO CAN BE INFLUENCED?]
   - Blockers: [WHO WILL RESIST?]

4. CHANGE MANAGEMENT PLAN:
   - Communication strategy (what messages, when, through whom)
   - Training plan (what skills gaps)
   - Quick wins (early proof points)
   - Leadership modeling (what executives must do)
   - Feedback mechanisms (how to surface concerns)

What % of project budget should be change management? (Often 30-40%)
What early warning signs indicate change is failing?
```

---

### Executive Communication {#executive-communication}

**When to use:** Communicating AI strategy to different executive audiences

```
You are an executive communications specialist.

My message: [AI STRATEGY/DECISION]

Adapt this message for three audiences:

1. CEO/BOARD (strategic lens):
   - Lead with: [BUSINESS IMPACT]
   - Frame as: [COMPETITIVE NECESSITY/GROWTH OPPORTUNITY/RISK MITIGATION]
   - Key metric: [ROI/MARKET SHARE/STRATEGIC POSITIONING]
   - One slide, three bullets

2. CFO (financial lens):
   - Lead with: [FINANCIAL IMPACT]
   - Address: Total cost of ownership, payback period, budget implications
   - Quantify: All benefits and costs
   - Risk mitigation: Financial downside protection
   - One slide, ROI calculation

3. CTO (technical lens):
   - Lead with: [TECHNICAL APPROACH]
   - Address: Architecture, integration, data requirements, security
   - Timeline: Technical milestones
   - Resource needs: Team, tools, infrastructure
   - One slide, technical architecture

4. VP OPERATIONS (practical lens):
   - Lead with: [OPERATIONAL IMPROVEMENT]
   - Address: Process changes, training needs, timeline
   - Concerns: Disruption, employee impact, transition plan
   - One slide, implementation roadmap

For each: What questions will they ask? What objections? How to address?
```

---

## Advanced Techniques

### Reverse Prompting (Advanced) {#reverse-prompting-advanced}

**When to use:** When you don't know what you don't know

```
You are an expert on [DOMAIN].

Your role: Ask ME questions to help me think more deeply about [TOPIC/DECISION].

About my situation: [BRIEF CONTEXT]

Your task:
1. Start with open-ended questions that reveal my assumptions
2. Based on my answers, probe deeper into gaps or inconsistencies
3. Challenge me when my thinking is fuzzy or contradictory
4. Help me discover what I'm not considering

Ask ONE question at a time. Wait for my answer before next question.

After 5-7 questions, synthesize: "Based on your answers, here's what I observe about your thinking..."

Begin with your first question now.
```

**This is the "Socratic method" - AI as your thinking coach.**

---

### Multi-Perspective Debate {#multi-perspective}

**When to use:** Exploring a decision from multiple angles

```
You are facilitating a debate on: [DECISION]

Participants (you play all roles):
1. "The Optimist" - strongest case for [OPTION A]
2. "The Pessimist" - strongest case against [OPTION A]
3. "The Pragmatist" - middle ground/hybrid approach
4. "The Contrarian" - unconventional perspective nobody else sees

Context: [PROVIDE KEY FACTS]

Conduct 3 rounds of debate:
- Round 1: Each presents opening argument (2-3 sentences each)
- Round 2: Each responds to others' arguments
- Round 3: Each makes final case

Label each speaker. Keep responses concise (2-3 sentences max).

After debate, provide neutral analysis:
- Strongest arguments from each perspective
- Key trade-offs revealed
- What additional information would help decide
- Your recommendation (if forced to choose)

Begin the debate now.
```

**Gets you 4 perspectives in one prompt.**

---

### Red Team Analysis {#red-team}

**When to use:** Attacking your own strategy to find weaknesses

```
You are a "Red Team" hired to attack this AI strategy:

Our strategy: [DESCRIBE AI PLANS]
Budget: [$AMOUNT]
Timeline: [TIMEFRAME]
Expected outcomes: [GOALS]

Your mission: Find every weakness, flaw, and blind spot.

Attack vectors:
1. STRATEGY FLAWS:
   - Faulty assumptions
   - Ignored threats
   - Overly optimistic projections

2. EXECUTION RISKS:
   - Data not ready (despite claims)
   - Organisation not ready
   - Technical complexity underestimated

3. COMPETITIVE RESPONSE:
   - How will competitors counter?
   - What if they move first?

4. UNINTENDED CONSEQUENCES:
   - What could go wrong?
   - Second-order effects?

5. ALTERNATIVE REALITY:
   - What if market shifts?
   - What if technology changes?

For each weakness: Rate severity (1-10), likelihood (1-10), impact if realized.
Prioritize top 5 vulnerabilities we MUST address.

Be brutal. Your job is to break this strategy, not defend it.
```

---

### Second-Order Effects {#second-order}

**When to use:** Understanding ripple effects of AI decisions

```
You are a systems thinker analysing second-order effects of:

Primary action: [DESCRIBE AI INITIATIVE/DECISION]

Walk me through the causal chain:

FIRST-ORDER EFFECTS (immediate, obvious):
- What happens directly as a result?

SECOND-ORDER EFFECTS (6-12 months later):
- Those effects cause what other changes?
- What adjustments do stakeholders make?
- What new behaviours emerge?

THIRD-ORDER EFFECTS (12-24 months later):
- What systemic shifts occur?
- What feedback loops are created?
- What unintended consequences?

For each order:
- Positive effects (opportunities)
- Negative effects (risks)
- Probability (high/med/low)

Focus especially on:
- Employee behaviour changes
- Competitive responses
- Customer reaction shifts
- Organisational dynamics

What second-order effect is most likely to surprise us?
```

**Critical for transformational AI - immediate effects are easy to see, systemic shifts are not.**

---

## Prompt Engineering Tips

### Anatomy of a Great Prompt

```
[ROLE] You are a [specific expert role]

[CONTEXT] 
Current situation: [relevant facts]
Constraints: [limitations]
Stakeholders: [who's involved]

[TASK]
What I need: [specific request]
Format: [how to structure output]
Depth: [level of detail]

[CRITERIA]
Evaluate using: [framework/criteria]
Prioritize: [what matters most]
Consider: [additional factors]

[OUTPUT]
Provide: [specific deliverable]
Include: [must-have elements]
Format as: [structure - list, table, narrative]
```

### Meta-Prompts

**Improve any prompt:**
```
Here's a prompt I want to use:

[PASTE YOUR PROMPT]

Suggest 3 ways to improve this prompt for:
- Clarity (is my ask specific enough?)
- Context (have I provided enough information?)
- Output quality (will this get useful results?)

Rewrite the prompt incorporating your suggestions.
```

**Generate prompts:**
```
I need to [DESCRIBE GOAL - e.g., "evaluate vendor proposals for AI platforms"].

Create a prompt I can use with AI that will help me [ACHIEVE GOAL].

The prompt should:
- Assign AI an appropriate expert role
- Provide structured analysis framework
- Request specific output format
- Challenge my assumptions

Provide the ready-to-use prompt.
```

---

## Quick Reference Card

### The 3 Techniques You Practiced

**1. Risk Deep-Dive**
```
You are a [INDUSTRY] consultant. We're considering [X]. 
Help identify risks we're missing: 
What are we underestimating? Second-order effects? Early warning signs?
```

**2. Reverse Prompting**
```
You are an expert on [TOPIC]. Ask ME questions to help me 
discover opportunities I'm overlooking about [SITUATION]. 
Ask one question at a time.
```

**3. AI Debate**
```
You are "The Advocate" arguing for [OPTION A]. 
You are "The Skeptic" arguing for [OPTION B]. 
Context: [SITUATION]. Debate this decision (3-4 sentences each).
```

### Remember

- ✅ Provide context before asking
- ✅ Be specific about what you want
- ✅ Assign AI a role (expert, skeptic, etc.)
- ✅ Ask for structured output
- ✅ Use follow-up prompts (go deeper)
- ✅ Combine human judgment + AI analysis

---

## Prompt Library Maintenance

**This is a living document. Add your own prompts:**

**Template for new prompts:**
```
### [Descriptive Name] {#anchor-link}

**When to use:** [SITUATION]

[PROMPT TEXT WITH [PLACEHOLDERS]]

**Follow-up prompts:**
- [USEFUL FOLLOW-UP 1]
- [USEFUL FOLLOW-UP 2]

**Why this works:** [EXPLANATION]
```

**Share prompts that work:**
- What strategic decisions did this help?
- What insights did it generate?
- How did you customize it?

---

## Examples From This Morning

**During Exercise 2, participants used:**

**Risk Deep-Dive (Retail industry):**
> "You are a strategic retail consultant. We identified these AI threats: online-first competitors with dynamic pricing, Amazon launching private label with AI-powered product development, direct-to-consumer brands using AI for customer acquisition. What are we missing or underestimating?"

**AI Response highlighted:**
- Second-order effect: If competitors use AI for personalization, your customer data becomes less valuable over time (they learn faster)
- Missed threat: Vertical integration by tech platforms (Amazon, Google) using AI to compete in your space
- Early warning: Monitor customer acquisition cost trends (if competitors' CAC dropping, they're using AI)

**This identified threats the team hadn't considered.**

---

## Monday Morning Prompts

**When you get back to office, try these first:**

**1. Audit your pending AI proposal:**
```
You are a Chief Risk Officer. We're about to approve this AI investment:

[PASTE YOUR PROPOSAL]

Use the AI Investment Checklist: assess data readiness, continuous learning costs, 
accuracy requirements, explainability, and ethical risks.

Be critical. Identify red flags we should address before approval.
```

**2. Improve your AI strategy:**
```
You are a strategy consultant. Here's our current AI strategy:

[PASTE YOUR STRATEGY DOC]

Ask me 5 questions that will reveal blind spots, faulty assumptions, or 
missed opportunities in this strategy. Ask one at a time.
```

**3. Prepare for stakeholder meeting:**
```
You are a skeptical [ROLE] who opposes this AI initiative:

[DESCRIBE YOUR PROPOSAL]

What are your strongest objections? What tough questions will you ask?

Help me strengthen my proposal by exposing its weaknesses.
```

---

**Save this library. Use it daily. Add your own prompts. Share what works.**

**The executives who master prompt engineering will make better strategic decisions.**
