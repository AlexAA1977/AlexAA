# CV Skills Pipeline

Persistent Cursor skills for executive resume work (Alexey Alekseev).

## Pipeline order

```
career-profile-intake
    → achievement-miner
    → executive-cv-hr-guru (build/rewrite)
    → finance-am-lexicon (terminology pass)
    → jd-match-analyzer (if vacancy provided)
    → linkedin-cv-sync (if LinkedIn alignment needed)
    → executive-search-brief (if one-pager for search firm)
    → hm-red-team-review
    → anti-slop-gate
    → PDF export (resume/generate-pdf.sh)
```

## Skills

| Skill | Tier | Invoke |
|-------|------|--------|
| `career-profile-intake` | 1 | `/career-profile-intake` |
| `achievement-miner` | 1 | `/achievement-miner` |
| `hm-red-team-review` | 1 | `/hm-red-team-review` |
| `jd-match-analyzer` | 1 | `/jd-match-analyzer` |
| `linkedin-cv-sync` | 2 | `/linkedin-cv-sync` |
| `finance-am-lexicon` | 2 | `/finance-am-lexicon` |
| `executive-search-brief` | 2 | `/executive-search-brief` |
| `anti-slop-gate` | 2 | `/anti-slop-gate` |
| `executive-cv-hr-guru` | core | `/executive-cv-hr-guru` |

## Key files

- `resume/profile/master-profile.md` — single source of truth
- `resume/Aleksey-Alekseev-RU.md` / `EN.md` — master CV
- `resume/tailored/` — JD-specific versions
- `resume/brief/` — search firm one-pagers
