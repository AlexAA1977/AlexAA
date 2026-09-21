---
name: english-level-calibrator
description: "Calibrate and phrase English level on Alexey Alekseev CV and cover letters without overclaiming. Use when user states intermediate/B1/B2 or before bank JD with English hard filter."
---

# English Level Calibrator

Prevents **B1 on paper / fail on interview** and **missing English = ATS reject**.

## When to activate

- User provides English level (e.g. «intermediate»)
- `jd-match-analyzer` flags English B2+ required
- Before `metrics-consistency-gate` if languages section edited

## CEFR mapping (confirm with user)

| User says | Default CEFR | CV phrasing (RU) | Safe for B2-required JD? |
|-----------|--------------|------------------|--------------------------|
| beginner / базовый | A2 | Не указывать на executive CV | No |
| intermediate | **Confirm: B1 or B2?** | See below | B1: risky |
| upper-intermediate | B2 | Английский — Upper-Intermediate (B2), business English | Yes |
| advanced | C1 | Английский — Advanced (C1) | Yes |
| fluent | C2/Near-native | Английский — свободный (C2) | Yes |

**Critical:** Russian «intermediate» often means B2 in practice — ask:

> Переговоры и презентации на английском — регулярно / иногда / редко?

## CV lines (pick one after confirmation)

**B1 (honest):**
```
Английский — Intermediate (B1); деловая переписка, рабочие встречи
```

**B2 (only if user confirms negotiations):**
```
Английский — Upper-Intermediate (B2), business English
```

**Do not use** «fluent» or B2 without user confirmation.

## Cover letter add-on (B1 + B2-required JD)

```
Готов подтвердить уровень английского на интервью; использую в деловой переписке 
и переговорах с международными партнёрами в рамках текущей роли.
```

Only if true per user.

## master-profile update

```markdown
| English | B1 / B2 / C1 — [confirmed date] |
| English notes | переговоры: да/нет; презентации: да/нет |
```

## Match score impact

| Level in CV | Bank bot with B2 filter |
|-------------|-------------------------|
| Missing | Hard filter likely |
| B1 stated | May pass human, fail bot |
| B2 stated | Filter cleared; interview risk if overstated |

## Pipeline position

```
career-profile-intake (languages) → english-level-calibrator → executive-cv-hr-guru
```

Re-run when user updates language skills.
