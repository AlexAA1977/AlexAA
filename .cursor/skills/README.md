# CV Skills Pipeline

Persistent Cursor skills for executive resume work (Alexey Alekseev).

## Full pipeline order

```
career-profile-intake
    → achievement-miner
    → board-c-level-positioning          # Tier 3 — pick T1/T2/T3 tier
    → english-level-calibrator           # Tier 3+ — if languages touched
    → executive-cv-hr-guru               # build / rewrite
    → finance-am-lexicon
    → jd-match-analyzer                  # if vacancy provided
    → bank-employer-playbook             # Tier 3 — if Sber/VTB/GPB/Alfa
    → executive-cover-letter             # Tier 3 — gaps / competitor moves
    → metrics-consistency-gate           # Tier 3 — cross-file check
    → hm-red-team-review
    → anti-slop-gate
    → executive-ats-export               # Tier 3 — TXT/DOCX for bots
    → hh-headhunter-format               # Tier 3+ — if hh.ru / headhunter portal
    → linkedin-cv-sync                   # if LinkedIn alignment needed
    → executive-search-brief             # if one-pager for search firm
    → post-bot-human-path                # Tier 3+ — if score <70% or auto-reject
```

**Human send:** PDF via `resume/generate-pdf.sh`  
**Bot upload:** TXT/DOCX via `resume/generate-ats-export.sh`

## Skills by tier

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
| `board-c-level-positioning` | 3 | `/board-c-level-positioning` |
| `executive-ats-export` | 3 | `/executive-ats-export` |
| `bank-employer-playbook` | 3 | `/bank-employer-playbook` |
| `executive-cover-letter` | 3 | `/executive-cover-letter` |
| `metrics-consistency-gate` | 3 | `/metrics-consistency-gate` |
| `hh-headhunter-format` | 3+ | `/hh-headhunter-format` |
| `english-level-calibrator` | 3+ | `/english-level-calibrator` |
| `post-bot-human-path` | 3+ | `/post-bot-human-path` |

## Key files

| Path | Purpose |
|------|---------|
| `resume/profile/master-profile.md` | Single source of truth |
| `resume/Aleksey-Alekseev-RU.md` / `EN.md` | Master CV |
| `resume/tailored/` | JD-specific versions |
| `resume/cover-letters/` | Executive cover letters |
| `resume/brief/` | Search firm one-pagers |
| `resume/playbooks/banks-russia.md` | Bank keyword playbooks |
| `resume/export/` | ATS TXT/DOCX outputs |
| `resume/pipeline/` | Review and match reports |

## Scripts

```bash
bash resume/generate-pdf.sh                    # PDF for humans
bash resume/generate-ats-export.sh             # TXT for bots
bash resume/scripts/consistency-check.sh       # metrics-consistency-gate
```

## Quick paths

| Goal | Skills to run |
|------|----------------|
| New master CV | intake → miner → board positioning → guru → lexicon → consistency → hm-review → anti-slop → PDF |
| Apply to Sber/VTB/GPB | + jd-match → bank playbook → cover letter → ATS export |
| Board-level version | board positioning **T2/T3** → guru → cover letter |
| Bot rejected | post-bot-human-path |
