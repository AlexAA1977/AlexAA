---
name: executive-cover-letter
description: "Write executive cover letters for Alexey Alekseev that close JD gaps honestly. Use after jd-match-analyzer or bank-employer-playbook, especially for competitor bank transitions and sub-85% match scores."
---

# Executive Cover Letter

Closes what **bots and CV cannot**: motivation, gaps, competitor narrative, board-level tone.

## When to activate

- Match score 70–84% (`jd-match-analyzer`)
- Alfa → Sber / VTB / GPB transition (`bank-employer-playbook` competitor flag)
- User asks: сопроводительное, cover letter, письмо охотнику
- Board / C-suite applications (always recommended)

## Inputs

- Tailored CV or master CV
- JD text or `resume/pipeline/*-jd-match-*.md`
- `resume/profile/master-profile.md`
- Gap list from `jd-match-analyzer` or `bank-employer-playbook`

## Structure (3 paragraphs, 250–350 words RU)

### P1 — Hook (4–5 sentences)
- Mirror **exact target title** from JD
- One scale proof: AuM / P&L / team
- Why this employer (specific, not «динамичная компания»)

### P2 — Proof (5–6 sentences)
- 2–3 achievements mapped to JD must-haves
- Use numbers from confirmed metrics only
- Board status if relevant to tier T2+

### P3 — Close (3–4 sentences)
- **Honest gap closure** (English level, no universal bank HQ, etc.)
- Availability / notice period if known
- Call to action: confidential discussion

## Gap closure patterns (do not lie)

| Gap | Cover letter angle |
|-----|-------------------|
| English B1 vs B2 required | «Рабочий английский для переговоров и отчётности; готов подтвердить на интервью» |
| No bank HQ tenure | «19 лет P&L в регулируемой УК финансовой группы — прямой аналог банковской дистрибуции инвестпродуктов» |
| Alfa → competitor | «Осознанный переход; конфиденциальность и соблюдение обязательств — приоритет» |
| No oil&gas (GPB) | «Фокус на Private/wealth; корпоративный КИБ — не заявляю экспертизу» |
| Digital/CRM thin | «Внедрял data-driven KPI по федеральной сети; детали систем — на встрече» |

## Tone

- Third person or formal first person («Обращаюсь») — user preference; default formal
- No desperation, no salary in letter unless asked
- Confidential job search: «Конфиденциальный поиск»

## Outputs

Save to:
- `resume/cover-letters/[company-slug]-[role-slug]-RU.md`
- EN version if JD is international: `...-EN.md`

Header:
```markdown
<!-- Cover letter | JD date | Match: NN% | CV: tailored file -->
```

## EN version rules

Full English; mirror structure; use `finance-am-lexicon` EN terms.

## Pipeline position

```
bank-employer-playbook OR jd-match-analyzer → executive-cover-letter → metrics-consistency-gate
```

## Never

- Fabricate English C1, CRM product names, or bank-internal projects
- Disparage Alfa or any employer
- Promise metrics user has not confirmed
