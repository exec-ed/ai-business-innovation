# AI Investment Checklist

**Use this checklist to evaluate every AI initiative before investment approval.**

---

## How to Use This Checklist

1. **For each AI project:** Answer all questions in both sections
2. **Scoring:** Must pass ALL criteria in Section A (Traditional) AND Section B (AI-Specific)
3. **If any answer is "No" or score <7:** Add mitigation plan and budget before proceeding

---

## Section A: Traditional Investment Criteria

### Strategic Fit
- [ ] **Three Horizons:** Does this fit our portfolio balance?
  - Horizon 1 (optimize core): Target 60-70% of budget
  - Horizon 2 (emerging capabilities): Target 20-30% of budget
  - Horizon 3 (transformational): Target 10-15% of budget

- [ ] **Transformation Matrix:** Which quadrant does this occupy?
  - Optimize (process/incremental)
  - Enhance (strategic/incremental)
  - Revolutionize (process/transformational)
  - Transform (strategic/transformational)

- [ ] **Portfolio gaps:** Does this address a strategic gap?

### Financial ROI

Calculate value across four categories:

1. **Cost Reduction:**
   - Annual savings: $________
   - Payback period: ________ months

2. **Revenue Growth:**
   - New revenue: $________
   - Revenue retained: $________

3. **Risk Reduction:**
   - Risk avoided (quantified): $________
   - Compliance value: $________

4. **Strategic Positioning:**
   - Competitive advantage: (describe)
   - Capability building: (describe)

**Total ROI:** ________%

**ROI Threshold Met?**
- [ ] Horizon 1: >200% in Year 1
- [ ] Horizon 2: >150% over 3 years
- [ ] Horizon 3: >100% over 5 years

### Implementation Feasibility
- [ ] Resources available (budget, people, time)
- [ ] Executive sponsorship secured
- [ ] Timeline realistic (not over-optimistic)
- [ ] Dependencies identified and manageable

**If all boxes checked:** ✅ Proceed to Section B (AI-Specific Criteria)  
**If any unchecked:** ❌ Do not proceed until addressed

---

## Section B: AI-Specific Investment Criteria

### 1. Data Readiness Assessment

**Score your data readiness (0-10):**

| Factor | Score | Weight | Weighted Score |
|--------|-------|--------|----------------|
| **Data Availability:** Do we have enough historical data? | __/10 | 25% | __ |
| **Data Quality:** Is data accurate, complete, consistent? | __/10 | 30% | __ |
| **Data Access:** Can we integrate necessary data sources? | __/10 | 20% | __ |
| **Data Bias:** Is historical data representative/unbiased? | __/10 | 25% | __ |
| **TOTAL DATA READINESS SCORE** | | | __/10 |

**Interpretation:**
- **8-10:** Data ready for AI ✅
- **7:** Data ready with minor improvements ⚠️
- **<7:** Must invest in data infrastructure FIRST ❌

**Data Readiness Questions:**

- [ ] Do we have at least 1,000-10,000 examples? (More for complex AI)
- [ ] Is data quality >90% accurate and complete?
- [ ] Can we access all necessary data sources?
- [ ] Have we audited for bias in historical data?
- [ ] Do we have data governance processes?

**If score <7:** 
- **Action required:** Data infrastructure project first
- **Budget add:** 40% for data cleaning/integration
- **Timeline add:** 3-6 months for data preparation

---

### 2. Continuous Learning Plan

**How will this AI improve over time?**

- [ ] **Static AI:** Trained once, doesn't learn from new data
  - Lower ongoing cost
  - Risk of obsolescence as world changes
  - Annual cost: ~10-15% of development cost

- [ ] **Batch Retraining:** Periodic updates (monthly/quarterly)
  - Medium ongoing cost
  - Stays current with trends
  - Annual cost: ~25-30% of development cost

- [ ] **Real-time Learning:** Continuously learns from new data
  - Higher ongoing cost
  - Always improving, competitive advantage
  - Annual cost: ~35-50% of development cost

**5-Year Total Cost of Ownership:**

| Year | Development | Operations | Retraining/Learning | Total |
|------|-------------|------------|---------------------|-------|
| 1 | $__________ | $_________ | $_____________ | $_____ |
| 2 | $0 | $_________ | $_____________ | $_____ |
| 3 | $0 | $_________ | $_____________ | $_____ |
| 4 | $0 | $_________ | $_____________ | $_____ |
| 5 | $0 | $_________ | $_____________ | $_____ |
| **5-Yr TCO** | | | | **$_____** |

**Questions:**
- [ ] Have we budgeted for ongoing retraining costs?
- [ ] Do we have infrastructure for continuous learning?
- [ ] Does this AI create a data flywheel (better with usage)?
- [ ] Have we planned for model monitoring and performance tracking?

---

### 3. Accuracy Requirements & Risk Tolerance

**What's the cost of being wrong?**

**Business Impact of AI Error:**
- [ ] **Low:** Minor inconvenience (product recommendation, content ranking)
  - Acceptable accuracy: 70-80%
  - Human oversight: Minimal (audit only)

- [ ] **Medium:** Moderate impact (fraud detection, inventory optimization)
  - Acceptable accuracy: 85-95%
  - Human oversight: Review flagged cases

- [ ] **High:** Significant impact (lending, hiring, medical diagnosis)
  - Acceptable accuracy: 95-99%+
  - Human oversight: Human-in-loop for all decisions

**Match accuracy to risk:**

| AI Capability | Your Requirement | Match? |
|---------------|------------------|--------|
| Expected AI accuracy: ___% | Minimum required: ___% | ☐ Yes ☐ No |

**Human-in-Loop Decision Matrix:**

| AI Confidence | Human Role | Process |
|---------------|------------|---------|
| <70% | Human decides | AI provides information only |
| 70-90% | Human reviews | AI recommends, human approves |
| 90-95% | Human audits | AI decides, human spot-checks |
| >95% | Auto-approve | AI decides, human audits later |

**Questions:**
- [ ] Have we defined acceptable failure rate?
- [ ] Do we have process for edge cases?
- [ ] Is human oversight plan defined and budgeted?
- [ ] Have we tested AI performance on our specific use case?

**If accuracy doesn't match risk:** ❌ Do not proceed or add human oversight

---

### 4. Explainability Requirements

**Do we need to explain AI decisions?**

**Regulatory Requirements:**
- [ ] **High Explainability:** Banking, lending, healthcare, legal
  - Regulatory requirement to explain decisions
  - Algorithm choice limited (no deep neural networks)
  - Use: Decision trees, linear models, rule-based systems
  - Budget add: +15-20% for interpretable models

- [ ] **Medium Explainability:** Operations, B2B, internal processes
  - Need to trust and audit decisions
  - Algorithm choice: Any, but add explanation layer
  - Use: Model-agnostic explanations (SHAP, LIME)
  - Budget add: +10-15% for explanation tools

- [ ] **Low Explainability:** Consumer recommendations, search, personalization
  - Results speak for themselves
  - Algorithm choice: Any (including deep learning)
  - Use: Most powerful AI techniques available
  - Budget add: +0%

**Explanation Method:**
- [ ] Feature importance (which factors mattered?)
- [ ] Counterfactual (what would change the decision?)
- [ ] Similar cases (what similar examples exist?)
- [ ] Rule extraction (can we create simple rules?)

**Questions:**
- [ ] Are we in a regulated industry requiring explanations?
- [ ] Will users demand to know "why" for AI decisions?
- [ ] Have we chosen AI approach compatible with our explainability needs?
- [ ] Do we have tools/process to generate explanations?

**If high explainability needed:** Limits algorithm choices, add budget for tools

---

### 5. Ethical Risk Assessment

**Could this AI discriminate or cause harm?**

**Risk Level:**

- [ ] **High Risk:** Customer-facing, life-impacting decisions
  - Examples: Hiring, lending, medical diagnosis, criminal justice
  - Action required: Extensive bias testing + diverse teams + ongoing monitoring
  - Budget add: +20-30% for ethics/bias testing

- [ ] **Medium Risk:** Customer-facing, business impact
  - Examples: Pricing, recommendations, advertising targeting
  - Action required: Bias testing + diverse perspectives in design
  - Budget add: +10-15% for bias testing

- [ ] **Low Risk:** Internal operations, no personal impact
  - Examples: Inventory optimization, logistics, forecasting
  - Action required: Basic bias assessment
  - Budget add: +5% for bias review

**Ethical AI Checklist:**

- [ ] **Diverse Teams:** Are protected groups represented in development team?
- [ ] **Bias Testing:** Have we tested across demographics (gender, race, age)?
- [ ] **Representative Data:** Does training data reflect all user populations?
- [ ] **Proxy Variables:** Have we identified variables that correlate with protected classes?
- [ ] **Fairness Metrics:** What definition of fairness are we using?
  - Equal opportunity (same % of qualified candidates)
  - Demographic parity (same % across all groups)
  - Individual fairness (similar people treated similarly)
- [ ] **Audit Process:** How will we monitor for bias post-launch?
- [ ] **Remediation Plan:** What do we do if bias is discovered?

**Protected Classes to Test:**
- [ ] Gender
- [ ] Race/ethnicity
- [ ] Age
- [ ] Disability status
- [ ] Other relevant demographics: ______________

**Questions:**
- [ ] Could this AI systematically disadvantage any group?
- [ ] Is our training data from a biased historical process?
- [ ] Have we tested AI performance across all user demographics?
- [ ] Do we have diverse perspectives on the development team?
- [ ] What's the reputational cost if this AI is found to be biased?

**If high ethical risk:** ❌ Do not proceed without bias testing + diverse team

---

## Decision Matrix

**Must satisfy ALL criteria:**

| Criteria | Status | Required Action |
|----------|--------|-----------------|
| **A. Traditional Criteria** | |
| Strategic fit | ☐ Pass ☐ Fail | |
| Financial ROI meets threshold | ☐ Pass ☐ Fail | |
| Implementation feasible | ☐ Pass ☐ Fail | |
| **B. AI-Specific Criteria** | |
| Data readiness ≥ 7 | ☐ Pass ☐ Fail | If <7: Data infrastructure project first |
| Continuous learning plan & budget | ☐ Pass ☐ Fail | Add 30-50% to annual costs |
| Accuracy matches risk tolerance | ☐ Pass ☐ Fail | Add human oversight or don't proceed |
| Explainability requirements met | ☐ Pass ☐ Fail | Choose interpretable AI or add tools |
| Ethical risks assessed & mitigated | ☐ Pass ☐ Fail | Add bias testing + diverse teams |

**Final Decision:**
- ☐ **APPROVED:** All criteria passed → Proceed to implementation
- ☐ **CONDITIONAL:** Some criteria failed → Address gaps and re-evaluate
- ☐ **REJECTED:** Critical criteria failed → Do not proceed

---

## Budget Impact Summary

**AI-Specific Budget Additions:**

| Factor | Add to Budget | This Project |
|--------|---------------|--------------|
| Data infrastructure (if score <7) | +40% to Year 1 | +$________ |
| Continuous learning (ongoing) | +30-50% annually | +$________ /yr |
| Human oversight (if needed) | +15-25% | +$________ |
| Explainability tools (if needed) | +10-20% | +$________ |
| Bias testing & ethics (if needed) | +10-30% | +$________ |
| **TOTAL AI-SPECIFIC ADDITIONS** | | **+$________** |

**Revised Total Investment:**
- Original estimate: $__________
- AI-specific additions: $__________
- **Revised total:** $__________

**Revised ROI:**
- Original ROI: ________%
- Revised ROI (with AI additions): ________%
- Still meets threshold? ☐ Yes ☐ No

---

## Sign-Off

**This AI investment has been evaluated and:**
- ☐ **Approved** - All criteria met, proceed with implementation
- ☐ **Approved with Conditions** - Address the following before proceeding:
  - ________________________________
  - ________________________________
- ☐ **Rejected** - Does not meet criteria, do not proceed

**Evaluation completed by:** ________________________  
**Date:** ____________  
**Next review date:** ____________

---

## Quick Reference: The 10 AI Investment Questions

Before approving ANY AI project, ensure you can answer:

1. **Data:** Is our data readiness score ≥7?
2. **Learning:** What's our continuous learning plan and 5-year TCO?
3. **Risk:** What's the cost of being wrong, and does accuracy match?
4. **Trust:** Do we need to explain decisions, and can we?
5. **Ethics:** What's the bias risk, and how will we test?
6. **Budget:** Have we added AI-specific costs (30-50% typically)?
7. **Timeline:** Have we added 3-6 months for data prep if needed?
8. **Oversight:** What's our human-in-loop plan?
9. **Monitoring:** How will we track AI performance over time?
10. **Exit:** What's our plan if the AI doesn't work or becomes biased?

**If you can't answer all 10, you're not ready to invest.**

---

**Use this checklist in every investment decision to avoid common AI failure modes.**
