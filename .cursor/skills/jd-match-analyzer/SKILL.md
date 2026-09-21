---
name: jd-match-analyzer
description: "Parse job descriptions, compute CV match score, keyword gaps, and tailoring plan for Alexey Alekseev. Use when user shares a vacancy link or JD text, asks 'насколько подхожу', or needs tailored CV for a specific role."
---

# JD Match Analyzer

Master CV stays intact; tailoring is a **delta**.

## Inputs

- JD text or URL (fetch if possible)
- `resume/Aleksey-Alekseev-RU.md` or EN master
- Optional: `resume/profile/master-profile.md`

## Step 1 — Parse JD

Extract:
- Title, company, location, seniority
- Must-have (hard) vs nice-to-have (soft)
- 15–25 keywords: skills, products, segments, leadership scope
- Hidden signals: P&L, board, transformation, digital, international

## Step 2 — Match matrix

| JD requirement | Evidence in CV | Strength (0–3) | Gap action |
|----------------|----------------|----------------|------------|
| ... | bullet or NONE | 0=none 3=strong | ADD / REFRAME / SKIP |

**Match score** = weighted % (must-have 70%, nice-to-have 30%).

Interpretation:
- **85%+** — strong apply, tailor summary + top bullets
- **70–84%** — apply with reframing + cover letter addressing gaps
- **<70%** — honest gap analysis; recommend network intro or pass

## Step 3 — Tailoring plan

Output without editing master file:

```markdown
# JD Match — [Company] — [Role] — [score]%

## Keywords to add (natural placement)
## Summary adjustment (proposed paragraph)
## Bullets to promote / demote
## Cover letter angle (3 bullets)
## Risks recruiter will probe
```

## Step 4 — Save tailored draft

Write: `resume/tailored/[company-slug]-[role-slug].md`

Header block:
```markdown
<!-- Tailored from master vX.Y | JD date | Match: NN% -->
```

Apply edits via `executive-cv-hr-guru` mode 3 (Tailor to JD).

## Rules

- Never claim skills user lacks — use REFRAME or flag gap in cover letter
- For asset management / banking JDs, run `finance-am-lexicon` for terminology alignment
- For Sber / VTB / GPB, run `bank-employer-playbook` after this skill
- Russian JD → RU tailored file; international → EN
- If match <85%, invoke `executive-cover-letter`
