---
name: metrics-consistency-gate
description: "Cross-file consistency check for Alexey Alekseev CV package — metrics, titles, dates, contacts. Use before hm-red-team-review and before any external send or ATS export."
---

# Metrics Consistency Gate

**FAIL = do not send** until P0 mismatches resolved.

## When to activate

- Before `hm-red-team-review`
- After any edit to master, tailored, brief, LinkedIn sync, or cover letter
- Before `executive-ats-export` and `generate-pdf.sh`

## Files to scan

| File | Role |
|------|------|
| `resume/profile/master-profile.md` | Source of truth |
| `resume/Aleksey-Alekseev-RU.md` | Master CV |
| `resume/Aleksey-Alekseev-EN.md` | Master EN |
| `resume/tailored/*.md` | JD variants |
| `resume/brief/*.md` | Search brief |
| `resume/cover-letters/*.md` | Letters |
| `.cursor/skills/executive-cv-hr-guru/SKILL.md` | Profile anchor block |

## P0 checks (must match master-profile)

| Field | Tolerance |
|-------|-----------|
| Phone | Exact |
| Email | Exact |
| AuM department | Exact (1,15 трлн ₽ / 1.15T) |
| Net profit 2025 | Exact (4,3 млрд ₽) |
| OPEX 2025 | Exact (3 млрд ₽) |
| Team size | 250+ |
| Offices | 22 |
| Board status wording | Consistent: «Приглашённый участник Правления» |
| Current role title | Same semantic level across RU/EN |
| Education years | УрГЭУ 1995–2000; РЭУ 2003 |
| No `TBD` / `уточнить` in send-ready files | Zero tolerance |

## P1 checks (warn)

| Check | Action |
|-------|--------|
| RU vs EN title translation drift | Align via `finance-am-lexicon` |
| LinkedIn title vs CV (if sync run) | Document in pipeline report |
| Tailored CV invents keywords without master evidence | Remove or flag |
| Date format mixed | Standardize |
| English level stated in one file only | Sync or remove |

## Automated scan

```bash
bash resume/scripts/consistency-check.sh
```

Exit 0 = PASS; exit 1 = FAIL with report path.

## Manual review prompts

1. Does P&L narrative match board-level claim?
2. Are 2025 metrics marked «confirm before external send» in master?
3. Competitor bank tailored files include cover letter reference?

## Output

`resume/pipeline/YYYY-MM-DD-consistency-gate.md`

```markdown
# Consistency Gate — PASS/FAIL — [date]

## P0 failures
## P1 warnings
## Files scanned
## Recommended fixes
```

## Pipeline position

```
executive-cover-letter → metrics-consistency-gate → hm-red-team-review → anti-slop-gate
```

Only **PASS** proceeds to PDF and ATS export.
