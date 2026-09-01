---
name: hm-red-team-review
description: "Dual-lens resume critique as recruiter (30 sec) and hiring manager (3 min). Use after CV draft, before sending to employer or search firm. Flags P0/P1/P2 fixes for executive resumes."
---

# HM Red Team Review

Adversarial quality gate. **Do not rewrite entire CV in this skill** — output structured review + prioritized fixes.

## Personas

### 1. Executive Recruiter (30 seconds)
- Scans: title, summary, last role, numbers in top third
- Asks: «Would I call this person for a Director / MD distribution role?»
- Red flags: no P&L, vague title, no scale, photo of duties not outcomes

### 2. Hiring Manager (3 minutes)
- Scans: relevance to JD (if provided), leadership proof, industry fit
- Asks: «Would I spend 45 min in interview? What gaps worry me?»
- Red flags: missing board context, no channel strategy, product illiteracy, job hopping (N/A if single employer)

## Review rubric (score 1–5 each)

| Criterion | 5 = excellent |
|-----------|----------------|
| Positioning clarity | Obvious level + domain in 10 sec |
| Quantification | Metrics in summary + every major role |
| Executive tone | No junior language, no clichés |
| Credibility | No inflated/unverifiable claims |
| Structure & length | 1–2 pages, scannable |
| ATS / keywords | JD terms present naturally (if JD given) |
| Differentiation | Clear «why this person vs other directors» |

## Output template

```markdown
# Red Team Review — [filename] — [date]

## Verdict: SEND / REVISE / HOLD

## Recruiter scan (30s)
- First impression:
- Call-worthy: YES/NO — because:

## Hiring manager scan (3m)
- Fit for [target role]:
- Top 3 interview questions they'd ask:
- Gaps:

## Scores
| Criterion | Score | Note |

## Fixes
### P0 (block send)
### P1 (strongly recommended)
### P2 (polish)

## Suggested summary rewrite (2 lines max)
```

## P0 triggers (auto HOLD)

- Fabricated education or metrics
- No numbers in executive summary
- Title misaligned with target role
- Placeholder text left (`уточнить`, `TBD`) in final send version
- >2 pages without board/CEO justification

## Handoff

After fixes → `anti-slop-gate` → `executive-cv-hr-guru` for merge → PDF if requested.
