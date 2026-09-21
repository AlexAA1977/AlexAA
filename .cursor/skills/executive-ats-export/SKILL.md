---
name: executive-ats-export
description: "Generate bot-friendly CV exports (plain text, DOCX) for Alexey Alekseev. Use after anti-slop-gate PASS, before employer portal upload, hh.ru, or bank ATS. PDF is for humans only."
---

# Executive ATS Export

**Rule:** PDF = people. **TXT/DOCX** = bots.

## When to activate

- User uploads CV to bank portal, hh.ru, LinkedIn Easy Apply, Amazing Hiring
- User asks: ATS, бот, парсер, docx, txt, «пройдёт ли автоматический скрининг»
- Final step after `anti-slop-gate` = CLEARED FOR SEND

## Inputs

- Source: `resume/Aleksey-Alekseev-RU.md` or tailored `resume/tailored/*.md`
- Must pass `metrics-consistency-gate` and `anti-slop-gate`

## ATS formatting rules

| Rule | Why |
|------|-----|
| **No tables** | Parsers drop grid cells; convert metrics to bullet lines |
| Standard headings | `ОПЫТ`, `ОБРАЗОВАНИЕ`, `КОМПЕТЕНЦИИ` or EN equivalents |
| Keywords in first 30% | Summary + first role bullets |
| Plain bullets (`-` or `•`) | Not nested lists deeper than 1 level |
| Contact block line 1 | Name; line 2: phone · email · city |
| No images, columns, text boxes | Breaks OCR |
| File name | `Aleksey-Alekseev-RU-ATS.txt` / `.docx` |

## Conversion checklist (manual if needed)

1. Replace metrics **table** with:
   ```
   КЛЮЧЕВЫЕ РЕЗУЛЬТАТЫ
   - AuM департамента: 1,15 трлн ₽ (52% активов УК)
   - P&L (2025): чистая прибыль 4,3 млрд ₽; OPEX 3 млрд ₽
   ...
   ```
2. Strip HTML comments `<!-- ... -->`
3. Strip markdown links to bare URL
4. Keep finance acronyms: HNWI, P&L, AUM, KPI, OPEX

## Export command

```bash
bash resume/generate-ats-export.sh [source.md]
```

Default source: `resume/Aleksey-Alekseev-RU.md`

Outputs:
- `resume/export/Aleksey-Alekseev-RU-ATS.txt`
- `resume/export/Aleksey-Alekseev-RU-ATS.docx` (if python-docx available)
- Copies to `/opt/cursor/artifacts/` when present

## Portal guidance

| Channel | Preferred format |
|---------|------------------|
| Сбер / ВТБ / ГПБ career portal | DOCX or pasted TXT |
| hh.ru | Built-in form + attach DOCX |
| Executive search firm | PDF + brief; ATS file optional |
| LinkedIn | Profile sync via `linkedin-cv-sync` |

## Output report

```markdown
# ATS Export — [file] — [date]

## Source
## Files created
## Tables converted: Y/N
## Keyword density check (top 500 words): [list top 10 terms]
## Parser risk flags
## Ready for upload: YES/NO
```

## Pipeline position

```
... → anti-slop-gate (PASS) → executive-ats-export → [linkedin-cv-sync]
```

Run **after** `generate-pdf.sh` or in parallel; never replace PDF for human sends.
