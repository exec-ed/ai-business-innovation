# Why AI Innovation is Different: What Executives Must Know

## Executive Summary

Traditional innovation frameworks (Three Horizons, portfolio management, ROI analysis) are necessary but insufficient for AI. Add five AI-specific criteria: (1) Data Readiness—score 7+/10 across availability, quality, access, and bias or stop; (2) Continuous Learning—budget 30-50% annual costs vs. traditional IT's 10-15%; (3) Accuracy vs. Risk—match AI's probabilistic nature to business risk tolerance (marketing accepts 80%, healthcare needs 99%+); (4) Explainability—regulated industries require interpretable models, limiting algorithm choice and adding 10-20% cost; (5) Ethical Risk—customer-facing AI needs bias testing, diverse teams, and monitoring (budget +20-30%). Projects with high traditional ROI often have fatal AI-specific flaws. Both sets of criteria must pass.

**Reading time:** 10 minutes
**Key takeaway:** Use traditional criteria AND five AI-specific criteria—high ROI means nothing if data isn't ready or ethical risk is existential.

---

## The Core Question

**"Can't I just use my existing innovation frameworks for AI?"**

Short answer: **No.** Here's why.

Traditional innovation frameworks (like Three Horizons, portfolio management, ROI analysis) provide the **structure** for decision-making. But AI has unique characteristics that require **additional criteria** for evaluation.

Think of it this way:

- **Traditional frameworks** = How to organise your investment portfolio
- **AI-specific criteria** = What to look for when evaluating AI investments specifically

You need both.

---

## Five Ways AI Innovation is Fundamentally Different

### 1. Data Dependency: "Garbage In, AI Can't Fix It"

**Traditional IT:**
- Write code based on business rules
- Works the same regardless of data quality
- Example: "If inventory < 10, send alert" works every time

**AI:**
- Learns patterns from historical data
- Quality = data quality × algorithm quality
- Example: Predict inventory needs → useless if historical data is incomplete/biased

**What this means for you:**

✓ **Before investing in AI, assess data readiness:**
- Do we have enough historical data? (typically 1000s-100,000s of examples)
- Is the data accurate and complete?
- Are there biases in historical decisions?
- Can we access and integrate the data sources?

✓ **Budget for data infrastructure:**
- 30-40% of AI budget should go to data cleaning, integration, governance
- If data isn't ready, AI will fail no matter how good the algorithm

✓ **The Data Maturity Gate:**
- Level 1-2 (collection/integration): Can only do basic AI
- Level 3+ (predictive analytics): Ready for advanced AI
- Don't fund AI projects your data infrastructure can't support

**Red flag:** "We'll clean the data as part of the AI project"  
**Reality:** Data work is 80% of AI implementation effort

---

### 2. Continuous Learning: "AI Gets Smarter (or Dumber) Over Time"

**Traditional IT:**
- Build once, maintain occasionally
- Predictable performance
- Updates = new features added by developers

**AI:**
- Improves with more data and usage
- Performance drifts as world changes
- Requires continuous retraining

**What this means for you:**

✓ **Ongoing costs are higher than traditional IT:**
- Model monitoring (is performance degrading?)
- Retraining (quarterly? monthly? real-time?)
- Data pipeline maintenance
- Infrastructure for continuous learning

✓ **The Flywheel Effect (competitive advantage):**
- More usage → more data → better AI → more usage
- First movers can create data moats competitors can't overcome
- Example: Netflix recommendations vs. new streaming services

✓ **Strategic question:** "How will this AI improve over time?"
- Does it get better with usage? (flywheel)
- Or does it degrade as the world changes? (drift risk)
- Do we have a retraining plan and budget?

**Investment implication:** 
- Year 1: $500K development
- Years 2-5: $150K/year ongoing costs (not just $50K maintenance)

---

### 3. Probabilistic Nature: "AI is Confident, Not Certain"

**Traditional IT:**
- Deterministic: Same input = same output every time
- When it breaks, it's obvious (error message, crash)
- Example: "Apply 10% discount" always applies exactly 10%

**AI:**
- Probabilistic: Predicts with confidence levels (e.g., 87% sure)
- Fails gracefully: Wrong answer delivered with high confidence
- Example: "87% chance customer will churn" (but might be wrong)

**What this means for you:**

✓ **Risk tolerance matters:**
- High stakes (healthcare, finance, safety): Need 99%+ accuracy
- Medium stakes (marketing, recommendations): 80-90% might be fine
- Low stakes (content personalisation): 70%+ acceptable

✓ **Human-in-the-loop decisions:**
| AI Confidence | Human Role | Example |
|---------------|------------|---------|
| <70% | Human decides | Loan approval edge cases |
| 70-95% | Human reviews | Fraud detection alerts |
| >95% | Auto-approve, human audits | Standard transactions |

✓ **The edge case problem:**
- AI works great 95% of the time
- But 5% of cases are wildly wrong
- Need processes to handle graceful failures

**Strategic question:** "What's the cost of being wrong?"
- Wrong product recommendation = mild annoyance
- Wrong medical diagnosis = lawsuit/death
- Match AI accuracy requirements to business risk

---

### 4. Black Box Problem: "It Works, But We Don't Know Why"

**Traditional IT:**
- Can trace every decision step-by-step
- Developers can explain "why" for any output
- Easy to debug and fix

**AI (especially deep learning):**
- Input → Black Box → Output
- "The model learned that pattern" (but which pattern?)
- Difficult to debug (is it the data? the algorithm? both?)

**What this means for you:**

✓ **Explainability requirements:**

| Context | Explainability Need | AI Approach |
|---------|---------------------|-------------|
| Regulated (banking, healthcare) | HIGH - must explain decisions | Use interpretable models (decision trees, linear models) |
| Operational (logistics, supply chain) | MEDIUM - need to trust/audit | Use model-agnostic explanations (SHAP, LIME) |
| Consumer (recommendations, search) | LOW - results speak for themselves | Use any model (deep learning OK) |

✓ **Trust and adoption:**
- People resist "computer says do X" without explanation
- Change management harder when AI can't explain reasoning
- Need transparency mechanisms even if model is black box

✓ **Regulatory compliance:**
- GDPR: "Right to explanation" for automated decisions
- Fair lending laws: Must explain loan rejections
- Healthcare: Must justify treatment recommendations
- Some AI approaches may be legally unusable

**Strategic question:** "Do we need to explain this AI's decisions?"
- If yes, limits algorithm choices (no deep neural networks)
- If no, can use most powerful techniques
- Budget for explainability tools if needed

---

### 5. Ethical & Bias Amplification: "AI at Scale = Problems at Scale"

**Traditional IT:**
- Biases exist but are human decisions
- Scale is limited by human capacity
- Easy to identify and change biased rules

**AI:**
- Learns biases from historical data
- Applies biased patterns at massive scale
- Biases hidden in model, hard to detect

**What this means for you:**

✓ **Historical data reflects past discrimination:**
- Hiring AI trained on past hires → perpetuates gender/race biases
- Credit scoring → discriminates against protected classes
- Facial recognition → works poorly on dark skin tones
- Predictive policing → over-targets minority neighborhoods

✓ **AI amplifies at scale:**
- One biased human = hundreds of bad decisions
- One biased AI = millions of bad decisions
- Reputational and legal risks are existential

✓ **Ethical AI checklist (ask for every AI project):**
- [ ] Could this AI discriminate against protected groups?
- [ ] Is our training data representative of all users?
- [ ] Have we tested for bias across demographics?
- [ ] Do we have diverse teams building this AI?
- [ ] Can we audit and explain decisions?
- [ ] What's our process if bias is discovered post-launch?

**Strategic question:** "What's the reputational risk if this AI is biased?"
- Low: Internal operations (inventory optimisation)
- Medium: Customer-facing (search rankings, recommendations)
- High: Life-impacting (hiring, lending, healthcare)

**Investment implication:**
- Budget 10-20% of AI project cost for ethics/bias testing
- High-risk AI may need ongoing bias monitoring
- Diverse teams are not optional for customer-facing AI

---

## The AI Investment Framework: Beyond Traditional ROI

Traditional ROI asks: **"What's the financial return?"**

AI ROI must also ask:

### 1. Data Readiness
- **Q:** Is our data quality sufficient?
- **Score:** 0-10 (need 7+ to proceed)
- **Budget impact:** If <7, add data infrastructure costs

### 2. Continuous Learning Plan
- **Q:** How will this AI improve over time?
- **Options:** Static / Batch retraining / Real-time learning
- **Budget impact:** Add 30% to annual costs for ongoing learning

### 3. Accuracy Requirements
- **Q:** What's acceptable failure rate?
- **Thresholds:** 99%+ / 90-95% / 80-90%
- **Budget impact:** Higher accuracy = more data + compute costs

### 4. Explainability Needs
- **Q:** Must we explain AI decisions?
- **Options:** High / Medium / Low
- **Budget impact:** High explainability limits algorithm choices

### 5. Ethical Risk Level
- **Q:** Could this AI cause discrimination or harm?
- **Options:** High / Medium / Low
- **Budget impact:** Add bias testing + diverse teams + auditing

---

## How to Use This in the Masterclass

### Morning: Classify AI Initiatives
When you map initiatives on the **AI Transformation Matrix**, also assess:
- Data readiness (0-10)
- Explainability need (High/Med/Low)
- Ethical risk (High/Med/Low)

### Afternoon: Dragon's Den Investment Decisions
When evaluating AI investments, score each on:

**Traditional criteria:**
- ROI (cost reduction, revenue growth, risk reduction, strategic positioning)
- Strategic fit (Three Horizons, portfolio balance)

**AI-specific criteria (NEW):**
- Data readiness score (0-10, need 7+ to proceed)
- Continuous learning plan (Yes/No)
- Accuracy requirements match AI capabilities (Yes/No)
- Explainability addressed (Yes/No)
- Ethical risk assessed and mitigated (Yes/No)

**Decision rule:** Must pass BOTH traditional AND AI-specific criteria.

---

## The Five Questions for Every AI Investment

Before approving any AI initiative, ask:

### 1. Data Question
"Is our data quality and quantity sufficient for this AI?"
- If no: Budget 40% for data infrastructure first
- If yes: Proceed but budget for ongoing data pipeline maintenance

### 2. Learning Question
"How will this AI improve over time, and what does that cost?"
- Static AI: Lower ongoing cost, but may become obsolete
- Learning AI: Higher cost, but builds competitive moat

### 3. Risk Question
"What's the cost of being wrong, and does AI accuracy match our risk tolerance?"
- High risk + low accuracy = don't proceed
- High risk + high accuracy = proceed with human oversight
- Low risk + any accuracy = proceed but monitor

### 4. Trust Question
"Do we need to explain AI decisions, and can we?"
- Regulated industries: Must use explainable AI (limits choices)
- Operational: Need audit trails and explanations
- Consumer-facing: Less critical if results are good

### 5. Ethics Question
"Could this AI discriminate, and how do we prevent it?"
- Customer-facing: Mandatory bias testing
- Life-impacting: Extensive testing + diverse teams + ongoing monitoring
- Internal operations: Lower priority but still assess

**If you can't answer all five, you're not ready to invest.**

---

## Common Mistakes Executives Make with AI

### Mistake 1: "Our data is in SAP, we're ready for AI"
**Reality:** Having data ≠ having AI-ready data
- Need: Cleaned, integrated, sufficient volume, unbiased
- Action: Data readiness assessment before funding AI

### Mistake 2: "AI is like traditional software development"
**Reality:** AI requires continuous investment, not build-once
- Need: Budget for retraining, monitoring, data pipelines
- Action: Calculate TCO over 5 years, not just Year 1

### Mistake 3: "The vendor says 95% accuracy is great"
**Reality:** Depends on your risk tolerance
- Need: Match accuracy to business impact of errors
- Action: Define acceptable failure rate before buying AI

### Mistake 4: "We'll deal with bias if it becomes a problem"
**Reality:** Post-launch bias fixes are 10x more expensive + PR disaster
- Need: Proactive bias testing in development
- Action: Diverse teams + ethical AI checklist from day 1

### Mistake 5: "AI will figure it out"
**Reality:** AI learns what you teach it (garbage in = garbage out)
- Need: High-quality training data that represents desired outcomes
- Action: Audit training data before training models

---

## Summary: The AI Investment Decision Tree

```
Traditional Investment Criteria
├── Strategic fit? (Three Horizons, portfolio balance)
├── Financial ROI? (Cost reduction, revenue growth, risk, strategic)
└── Implementation feasible? (Resources, timeline, capabilities)
    └── YES → Proceed to AI-Specific Criteria

AI-Specific Investment Criteria
├── Data readiness score ≥ 7?
│   ├── NO → Invest in data infrastructure first
│   └── YES → Continue
├── Continuous learning plan & budget?
│   ├── NO → Add 30% to annual costs
│   └── YES → Continue
├── Accuracy requirements match AI capabilities?
│   ├── NO → Add human-in-loop or don't proceed
│   └── YES → Continue
├── Explainability requirements addressed?
│   ├── NO → Choose interpretable algorithms or add explainability tools
│   └── YES → Continue
└── Ethical risks assessed & mitigated?
    ├── NO → Add bias testing, diverse teams, audit plan
    └── YES → APPROVED TO PROCEED
```

**Both sets of criteria must be satisfied.**

---

## Key Takeaways

1. **AI is different:** Data-dependent, continuous learning, probabilistic, black box, ethical risks

2. **Different evaluation criteria:** Must add AI-specific criteria to traditional ROI analysis

3. **Higher ongoing costs:** 30-40% for data + continuous learning + monitoring

4. **Risk management is critical:** Match AI accuracy to business risk tolerance

5. **Ethics are not optional:** Bias at scale = existential reputational risk

6. **Five questions:** Data? Learning? Risk? Trust? Ethics?

7. **Use both frameworks:** Traditional investment criteria + AI-specific criteria

---