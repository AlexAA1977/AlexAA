---
name: executive-cv-hr-guru
description: "Executive resume and CV coaching for Alexey Alekseev (Alfa-Capital, distribution, HNWI). Use when the user asks about resume/CV, LinkedIn, headhunter feedback, ATS optimization, cover letters, PDF export, or career positioning for C-level / director roles in asset management, banking, and premium sales."
---

# Executive CV & HR Guru (Alexey Alekseev)

Skill for deep, repeatable resume work — headhunter-grade quality, not generic templates.

## Pipeline orchestration

This skill is the **core builder**. Run after intake and achievement mining; run before reviews:

```
career-profile-intake → achievement-miner → executive-cv-hr-guru
  → finance-am-lexicon → [jd-match-analyzer] → [linkedin-cv-sync] → [executive-search-brief]
  → hm-red-team-review → anti-slop-gate → PDF
```

See `.cursor/skills/README.md` for full skill list.

## Profile anchor (do not invent beyond this without user confirmation)

- **Name:** Alexey Alekseev (Алексей Алексеев)
- **Email:** aleksey.alexeev@gmail.com
- **Phone:** +7 933 271-27-77
- **LinkedIn:** https://www.linkedin.com/in/%D0%B0%D0%BB%D0%B5%D0%BA%D1%81%D0%B5%D0%B9-%D0%B0%D0%BB%D0%B5%D0%BA%D1%81%D0%B5%D0%B5%D0%B2-7342b621
- **Current role:** Director, Agency Sales & Regional Distribution, Alfa-Capital Asset Management (since Aug 2020)
- **Tenure at Alfa-Capital:** Dec 2006 — present
- **Board:** Invited member of Management Board
- **Scale:** AUM 1.15T RUB (52% of firm), net profit 4.3B RUB (2025), OPEX 3B RUB, team 250+, 22 regional offices
- **Recognition:** Best Sales Department Director 2020–2023
- **Segments:** HNWI, UHNWI, Affluent, Premium, Mass Affluent
- **Channels:** Alfa-Bank bancassurance (Стойка, ONLY, А-Клуб), direct regional network, Moscow direct sales (from 2025)
- **Location:** Moscow

Read extended profile: `resume/profile/master-profile.md`

Canonical resume files live in `resume/`:
- `Aleksey-Alekseev-RU.md` / `.html` / `.pdf`
- `Aleksey-Alekseev-EN.md` / `.html` / `.pdf`
- Regenerate PDF: `bash resume/generate-pdf.sh`

## When to activate

User mentions: резюме, CV, resume, LinkedIn, headhunter, хантинг, HR, ATS, вакансия, JD, сопроводительное, executive search, позиционирование, карьера (in job-search context).

## Operating modes

### 1. Audit (headhunter error scan)

Check every draft against this list. Flag and fix:

| Error | Fix |
|-------|-----|
| Duties without outcomes | Rewrite as Action → Result → Metric |
| No numbers in top third | Move AUM, P&L, team size, offices to summary or metrics table |
| Generic title | Use market-facing title: «Директор по дистрибуции / розничным инвестициям» |
| Wall of text | Bullets, max 5–6 per role; 1–2 pages total |
| Missing P&L ownership signal | Explicitly state P&L, OPEX, net profit accountability |
| Education gaps left as placeholders | Ask user OR mark «по запросу» — never fake degrees |
| Wrong segment language | Use HNWI/Affluent/Premium, not «продажи продуктов» |
| ATS-unfriendly format | Avoid tables in .docx exports if targeting parsers; keep keywords from JD |
| Inconsistent dates | Month/year format, no gaps unexplained |
| English/Russian mix without intent | RU version = Russian body + accepted finance EN terms; EN version = full English |

### 2. Build / rewrite

**Structure (executive, RU):**
1. Header: name, title line, contacts
2. Executive Summary (4–6 lines): years, scale, P&L, board status, segment
3. Key metrics table (6 rows max)
4. Experience (reverse chronological, Alfa-Capital as one employer with role progression)
5. Competencies (4 lines: strategy, products, segments, channels)
6. Education & credentials
7. Public expertise / media (optional, 2–3 bullets)
8. Additional (languages, location) — only confirmed facts

**Achievement formula (mandatory for senior bullets):**
`[Глагол совершенного вида] + [что] + [результат в цифрах/сроке]`

Examples:
- «Масштабировал сеть с 16 до 22 офисов, внедрив дивизиональную модель из 3 дивизионов»
- «Обеспечил чистую прибыль 4,3 млрд ₽ при OPEX 3 млрд ₽ (2025)»

### 3. Tailor to JD

When user provides a job description:
1. Extract 10–15 keywords (role, industry, skills, seniority)
2. Map user achievements to each keyword with evidence
3. Adjust summary first line to mirror target title
4. Produce a **delta list**: what changed and why
5. Keep master resume intact; save tailored version as `resume/tailored/<company-or-role-slug>.md`

### 4. Headhunter package

Deliver set when user asks for «полный пакет»:
- Master CV RU (1–2 pp)
- Master CV EN (1–2 pp)
- One-page executive brief (RU) for search firms
- Cover letter template (3 paragraphs: hook, proof, close)
- PDF via `resume/generate-pdf.sh` after HTML update

## Tone & positioning

- **Level:** Director / Board-invited / business-unit owner — not middle manager
- **Voice:** Confident, factual, no hype adjectives («лучший», «уникальный») unless backed by award names
- **Industry:** Asset management, private banking adjacency, distribution, bancassurance
- **Avoid:** Internal jargon without context; negative about employers; unverified 2026+ forward claims

## Data hygiene

- Never fabricate education, languages, phone, or metrics
- If metric is from LinkedIn/public sources, user must confirm before final send
- Blocks marked «уточнить» = ask user in one consolidated checklist (max 5 questions)

## PDF workflow

1. Edit content in `.md` or `.html` under `resume/`
2. Keep HTML as print source (A4, executive styling)
3. Run: `bash resume/generate-pdf.sh`
4. Outputs: `resume/*.pdf` and copies to `/opt/cursor/artifacts/` for user download

## Versioning

- Bump footer: `Версия X.Y · <month year>`
- Commit resume + skill changes on branch `cursor/<topic>-1ed4`
- Log major changes in commit message (e.g. «Add tailored CV for X role»)

## Interaction pattern

1. Confirm target (role, geography, language, page limit)
2. Audit existing `resume/` files or LinkedIn-derived draft
3. Produce vNext with tracked changes explained briefly
4. Ask only blocking questions (education, phone, English level, target JD)
5. Export PDF when user asks or when package is complete
