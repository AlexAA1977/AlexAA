---
name: career-profile-intake
description: "Structured career profile intake for Alexey Alekseev. Use when starting resume work, filling gaps (education, languages, phone), updating master profile, or before achievement-miner / executive-cv-hr-guru. Saves to resume/profile/master-profile.md."
---

# Career Profile Intake

One-time and refresh intake. **Single source of truth** for all CV skills.

## Output file

`resume/profile/master-profile.md` — create or update. Never invent; mark unknown fields `TBD`.

## Intake checklist (ask in one message, max 2 rounds)

### Identity & contacts
- Full name (RU/EN), city, phone, email, LinkedIn URL
- Work authorization / relocation openness

### North Star (career goal)
- Target role title(s) in 12–24 months
- Target industry (УК, банк, финтех, консалтинг, board advisory)
- Geography & format (Moscow, hybrid, remote)
- Compensation range (optional, for search brief only)
- What user will NOT accept (culture, scope, travel)

### Education & credentials
- Higher education: institution, degree, year, specialty
- Candidate of sciences / MBA / НАУФОР / ЦБ certificates
- Languages with CEFR level

### Career narrative (free text)
- 3 proudest achievements (any period)
- Biggest transformation led (before → after)
- Why leaving / open to move (if applicable)

### Confirmed metrics (verify numbers)
- Current AUM, P&L, OPEX, headcount, offices
- Awards and years
- Board / committee memberships

## Profile file template

```markdown
# Master Profile — Alexey Alekseev
Last updated: YYYY-MM-DD

## Contacts
## North Star
## Education
## Languages
## Confirmed metrics
## Career narrative
## Do-not-use / constraints
```

## Rules

- Read `executive-cv-hr-guru` profile anchor for defaults; override only with user confirmation
- After intake, suggest next skill: `achievement-miner` if bullets weak, else `executive-cv-hr-guru`
- Commit profile updates with resume changes
