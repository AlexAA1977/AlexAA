---
name: bank-employer-playbook
description: "Employer-specific keyword playbooks and match heuristics for Alexey Alekseev targeting Sber, VTB, Gazprombank, and Alfa ecosystem transitions. Use with jd-match-analyzer for Russian top-tier banks."
---

# Bank Employer Playbook

Run **after** `jd-match-analyzer` when target employer is a major Russian bank or bank-owned AM.

## Reference data

Read: `resume/playbooks/banks-russia.md`

## Supported employers

| Slug | Employer | Best-fit roles for Alexey |
|------|----------|---------------------------|
| `sber` | Сбербанк | Дистрибуция инвестпродуктов, розничный премиум, Сбер УА |
| `vtb` | ВТБ | ВТБ Капитал, wealth, дистрибуция AM, Premier |
| `gpb` | Газпромбанк | GPB Private, wealth, ГПБ УА |
| `alfa` | Альфа-Банк / Альфа-Капитал | Internal move, ecosystem roles |

## Per-employer workflow

1. Load playbook section for employer slug
2. Merge playbook keywords with JD-specific keywords from `jd-match-analyzer`
3. Score using employer baseline (see playbook)
4. Write tailored CV: `resume/tailored/[slug]-[role-slug].md`
5. Write match report: `resume/pipeline/YYYY-MM-DD-jd-match-[slug].md`
6. Flag **competitor risk** if source = Alfa → target = Sber/VTB/GPB

## Competitor transition matrix

| From | To | Bot score impact | Human risk |
|------|-----|------------------|------------|
| Alfa ecosystem | Sber / VTB / GPB | Neutral for bot | **High** — motivation, compliance, non-compete |
| Alfa ecosystem | Other AM / fintech | Neutral | Medium |

**Cover letter mandatory** for Alfa → competitor bank. Invoke `executive-cover-letter`.

## Keyword injection rules

- Add only keywords with **evidence** in master profile
- Prefer **reframe** over invention:
  - bancassurance → кросс-продажи инвестиционных продуктов
  - omni-channel → омниканальная дистрибуция
  - events 100M → клиентский опыт и лояльность премиального сегмента
- Do **not** add employer product names (SberCRM, ВТБ Онлайн) without real usage

## Baseline match scores (typical distribution/wealth JD)

| Employer | Baseline | Alexey edge |
|----------|----------|-------------|
| Sber | ~78% | Scale, bancassurance |
| VTB | ~80% | AM / ВТБ Капитал fit |
| GPB | ~82% | HNWI / Private emphasis |
| Alfa | ~90% | Tenure, insider |

Scores are heuristics — always recalculate on real JD text.

## Output template

```markdown
# Bank Playbook Match — [Employer] — [Role] — [score]%

## Baseline vs JD-adjusted score
## Keywords added (with evidence)
## Keywords skipped (no evidence)
## Competitor risk paragraph for cover letter
## Recommended file: resume/tailored/[slug]-....md
```

## Pipeline position

```
jd-match-analyzer → bank-employer-playbook → executive-cover-letter → executive-cv-hr-guru (apply delta)
```

Skip if target is pure AM / fintech with no bank parent.
