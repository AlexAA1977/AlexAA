---
name: board-c-level-positioning
description: "Choose and apply CV positioning tier for Alexey Alekseev: Director, Deputy CEO/Board member, or C-suite. Use before executive-cv-hr-guru build/rewrite when target is Правление, зам. ГД, or director level."
---

# Board & C-Level Positioning

One master profile → **three positioning tiers**. Pick tier before writing.

## When to activate

- Target: директор департамента vs зам. ГД vs член Правления vs C-suite
- User asks to «поднять уровень» резюме or «версия для Правления»
- Before `executive-cv-hr-guru` mode 2 (Build)

## Tier selector (ask if unclear)

| Tier | Target titles | Primary signal |
|------|---------------|----------------|
| **T1 — Director** | Директор департамента, Head of Distribution, Commercial Director | P&L of business unit, team, channels, KPI |
| **T2 — Board-invited / Deputy** | Зам. ГД, приглашённый член Правления, Managing Director | Strategy + P&L + governance participation |
| **T3 — C-suite / Board member** | Член Правления, CCO, CRO (commercial), CEO УК | Enterprise scope, capital allocation, stakeholders |

**Default for Alexey Alekseev today:** T2 (invited board + P&L owner). T1 for narrow JD match; T3 only with confirmed enterprise-wide scope.

## Tier templates

### T1 — Director (operator)

**Title line:** `Директор по развитию дистрибуции | P&L · AuM 1,15 трлн ₽ | HNWI & Premium`

**Summary weight:** 70% operations, 30% strategy  
**Promote:** network scale, KPI, products, channels, regional growth  
**Demote:** board to one phrase; no governance section  
**Metrics table:** full 5–6 rows  

### T2 — Board-invited / Deputy (current sweet spot)

**Title line:** `Директор по развитию дистрибуции | P&L · Участник Правления | AuM 1,15 трлн ₽`

**Summary weight:** 50% P&L/scale, 30% strategy/transformation, 20% governance  
**Add block (if facts confirmed):** `УЧАСТИЕ В ПРАВЛЕНИИ` — 2–3 bullets: decisions, committees, cross-functional  
**Promote:** divisional transformation, bancassurance at scale, 52% firm AUM  
**Page limit:** 2 pages RU  

### T3 — C-suite / Board member

**Title line:** `Руководитель бизнес-направления | Член Правления | Финансовая группа`

**Summary weight:** strategy, capital, stakeholders first; operations compressed  
**Structure change:**
- Shorter experience (last 10 years detailed; earlier = 1 line)
- Section `СТРАТЕГИЧЕСКИЙ МАНДАТ` before experience
- Governance + external relations (media, regulators if any)  
**Requires user confirmation:** enterprise P&L vs unit P&L, board voting vs invited

## Header field: `positioning_tier`

Save to `resume/profile/master-profile.md`:

```markdown
## Positioning
| Field | Value |
| positioning_tier | T1 / T2 / T3 |
| target_role_primary | ... |
```

## Output

- Tier recommendation with rationale (3 sentences)
- Delta vs current master CV
- Filename suffix: `-T1`, `-T2`, `-T3` in `resume/tailored/` when saving variants

## Rules

- Never inflate T3 without user-confirmed board mandate
- T3 CV must not read like senior sales director — reframe verbs to «формировал стратегию», «утверждал», «курировал портфель»
- Run `finance-am-lexicon` after tier application

## Pipeline position

```
career-profile-intake → achievement-miner → board-c-level-positioning → executive-cv-hr-guru
```
