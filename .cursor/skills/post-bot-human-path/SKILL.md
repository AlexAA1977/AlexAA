---
name: post-bot-human-path
description: "Strategy when ATS bots reject or score low for Alexey Alekseev C-level applications — executive search, referrals, LinkedIn, direct HR. Use when match below 70% or user reports auto-rejection."
---

# Post-Bot Human Path

Bots are **30–40%** of director hires and **<10%** of board hires. This skill routes around parsers.

## When to activate

- Match score <70% on strong-fit role (user wants to proceed anyway)
- User reports: «отказ без ответа», «не прошёл автоматический отбор»
- Target is Правление / зам. ГД
- Competitor bank transition (Alfa → Sber/VTB/GPB)

## Decision tree

```
Match < 70%?
├─ YES → Gap real? 
│   ├─ YES → Network path OR pass (honest)
│   └─ NO  → ATS export fix + reapply
└─ NO  → Direct apply + parallel network path
```

## Tactics (priority order for C-level)

### 1. Executive search consultant (highest ROI)
- Send `executive-search-brief` + PDF, not portal upload
- Subject: confidential, target role, one proof metric
- Ask consultant to bypass ATS with verbal shortlist

### 2. Referral / weak tie
- LinkedIn: mutual connection to hiring manager or HR BP
- Message template (RU, 4 sentences): role fit + one metric + confidential ask for 15-min call

### 3. Direct HR / hiring manager (InMail)
- Attach brief, not 5-page CV
- Reference public employer priority (wealth, digital distribution)

### 4. Portal reapply (lowest for board+)
- Fix: `executive-ats-export` DOCX, complete all required fields including English
- Re-run `jd-match-analyzer` for keyword injection

### 5. Industry visibility
- Media quotes already in CV — offer expert comment to trade press (long game)

## Alfa → competitor bank protocol

1. Never apply cold on portal as first move
2. Use search firm or trusted referral
3. `executive-cover-letter` with confidentiality paragraph
4. Timing: avoid earnings / sensitive deal periods (user judgment)

## Outputs

`resume/pipeline/YYYY-MM-DD-human-path-[employer].md`

```markdown
# Human Path Plan — [Employer] — [Role]

## Why bot may have failed
## Recommended primary channel
## Message draft (search consultant / referral)
## Do not do list
## Timeline (7 / 14 / 30 days)
```

## Pipeline position

```
jd-match-analyzer (score <70% OR user reports reject) → post-bot-human-path
```

Complements; does not replace tailored CV work.
