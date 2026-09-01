---
name: hh-headhunter-format
description: "Format CV and brief for hh.ru, Amazing Hiring, Cornerstone, and executive search firm portals for Alexey Alekseev. Use when uploading to Russian job boards or sending to headhunters."
---

# HH & Headhunter Format

Portal-specific formatting on top of `executive-ats-export` output.

## Channels

| Channel | Max length | Format | Notes |
|---------|------------|--------|-------|
| **hh.ru** | Experience blocks 10k chars | Paste from ATS TXT; attach DOCX | Title field = target role from JD |
| **Amazing Hiring** | Profile sync | Keywords in headline | Tech-heavy; less relevant unless fintech |
| **Cornerstone / bank ATS** | Varies | DOCX from `executive-ats-export` | Use bank playbook keywords |
| **Executive search (Korn Ferry, Ward Howell, etc.)** | 1–2 pp CV + brief | PDF to partner; TXT optional | Always attach `executive-search-brief` |

## hh.ru field mapping

| hh field | CV source |
|----------|-----------|
| Желаемая должность | `target_role_primary` from master-profile or JD title |
| Зарплата | Only if user confirmed in master-profile |
| Опыт работы | Last 3 roles detailed; earlier collapsed |
| Ключевые навыки | From competencies + JD keywords (max 30 skills) |
| О себе | Executive summary (max 2000 chars) |

## Headhunter email package

When sending to search consultant:

1. **Subject:** `Confidential | [Target Role] | Alexey Alekseev | [City]`
2. **Body:** 5 sentences + attach brief + PDF
3. Attach: `resume/brief/Aleksey-Alekseev-brief-RU.md` (or PDF if generated)
4. Do not attach ATS TXT to C-level hunters unless asked

## Rules

- hh.ru: never list 15+ skills without evidence bullets
- Salary on hh: optional; use master-profile compensation field only
- For confidential search: disable hh visibility or use «не искать работу» mode — remind user

## Pipeline position

```
executive-ats-export → hh-headhunter-format (if portal named)
```

Optional; skip for direct email to known recruiter with PDF only.
