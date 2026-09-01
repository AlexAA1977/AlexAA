---
name: anti-slop-gate
description: "Final quality gate before sending CV — ban clichés, enforce metric bullets, detect AI-slop and weak phrasing. Use as last step before PDF export or submission to employer/search firm."
---

# Anti-Slop Gate

Last filter. **FAIL = do not send** until P0 cleared.

## Banned phrases (RU)

Auto-flag and rewrite:
- коммуникабельный · стрессоустойчивый · ответственный · целеустремлённый
- динамичная компания · дружный коллектив · быстроразвивающаяся среда
- широкий спектр обязанностей · разносторонний опыт
- занимался · помогал · участвовал (without outcome)
- успешный · эффективный · значительный (without number)
- на высоком уровне · в полном объёме

## Banned phrases (EN)

- team player · hard worker · detail-oriented · self-starter
- passionate about · synergy · leverage · spearheaded (overused)
- responsible for (replace with P&L / built / grew / delivered)

## Bullet quality test

Each experience bullet must pass **3/4**:
1. Strong past-tense verb (RU perfective / EN active)
2. Business object (channel, product, region, team, P&L)
3. Measurable result (number, %, timeframe)
4. Scope signal (team size, budget, geography)

Fail → send to `achievement-miner` or rewrite inline.

## Structure checks

- [ ] Executive summary ≤ 6 lines
- [ ] Numbers in top third of page 1
- [ ] No placeholder (`TBD`, `уточнить`, `[добавить]`)
- [ ] Consistent date format (MMM YYYY or «месяц год»)
- [ ] 1–2 pages (brief exception: `executive-search-brief`)
- [ ] No first person («я») in RU executive CV — third person or noun phrases OK in summary

## AI-slop detectors

- 3+ buzzwords in one sentence
- Parallel bullets starting with same word
- Generic summary that could fit any director
- Lists of skills without evidence in experience

## Output

```markdown
# Anti-Slop Gate — [file] — PASS/FAIL

## P0 failures (must fix)
## P1 warnings
## Suggested rewrites (max 5)
## Final: CLEARED FOR SEND / NOT CLEARED
```

## Pipeline position

```
executive-cover-letter → metrics-consistency-gate → hm-red-team-review → anti-slop-gate
  → executive-ats-export → PDF (humans)
```

Only `CLEARED FOR SEND` may trigger `resume/generate-pdf.sh` and `resume/generate-ats-export.sh`.
