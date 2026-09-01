---
name: achievement-miner
description: "Extract and quantify career achievements for executive CVs (STAR/RISE). Use when resume bullets lack metrics, user says 'помоги вспомнить достижения', or before rewriting experience section for Alexey Alekseev / asset management / distribution roles."
---

# Achievement Miner

Turn memory and documents into headhunter-grade bullets.

## Inputs

1. `resume/profile/master-profile.md` (if exists)
2. Current `resume/Aleksey-Alekseev-*.md`
3. User answers to mining questions

## Method: RISE per achievement

| Step | Question |
|------|----------|
| **R**esult | What changed in business terms? (revenue, AUM, profit, share, NPS) |
| **I**mpact | Who benefited? (clients, bank, regions, board, team) |
| **S**cope | Scale: people, budget, geography, time |
| **E**vidence | Number + period + baseline (was X → became Y in Z months) |

## Mining interview (by role at Alfa-Capital)

Ask only unanswered areas:

**Director (2020–now)**
- P&L: revenue, net profit, OPEX — year over year?
- Network: offices opened/closed, cities, divisional model ROI?
- Partner channel: Alfa-Bank — growth %, products, A-Клуб/ONLY?
- Moscow direct sales 2025 — target vs fact?
- Board / strategic initiatives you led?

**Regional director (2009–2020)**
- First office → federal network: timeline, cities, breakeven?
- Team growth 24 → 100+: hiring, retention, productivity?
- Product mix shift (ПИФ, ДУ, ИСЖ, структурные)?

**Early roles (2006–2009)**
- Agent network model — what was invented?
- First measurable wins?

## Output format

```markdown
## [Role title] · [Period]
- [Verb] + [action] → [metric] ([timeframe])
```

Rules:
- Past tense, perfective verbs (RU): «Масштабировал», «Обеспечил», «Внедрил»
- Every bullet needs ≥1 number or %; if none, flag `NEEDS METRIC`
- Max 5 bullets per role for master CV; rest → `resume/profile/achievement-bank.md`

## Handoff

Pass mined bullets to `executive-cv-hr-guru` for assembly, then `hm-red-team-review` for critique.
