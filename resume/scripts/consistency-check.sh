#!/bin/bash
# Cross-file consistency check for Alexey Alekseev CV package.
set -euo pipefail

ROOT="/workspace"
REPORT="$ROOT/resume/pipeline/$(date +%Y-%m-%d)-consistency-gate.md"
FAIL=0
WARN=0

check_file() {
  local pattern="$1"
  local label="$2"
  local severity="${3:-P0}"
  local files
  files=$(grep -rl "$pattern" "$ROOT/resume" --include='*.md' 2>/dev/null | grep -v pipeline || true)
  if [[ -z "$files" ]]; then
    if [[ "$severity" == "P0" ]]; then
      echo "- **P0** Missing expected: $label ($pattern)" >> "$REPORT"
      FAIL=1
    else
      echo "- **P1** Not found: $label" >> "$REPORT"
      WARN=1
    fi
  fi
}

check_absent() {
  local pattern="$1"
  local label="$2"
  if grep -rq "$pattern" "$ROOT/resume" --include='*.md' 2>/dev/null | grep -qv pipeline; then
    echo "- **P0** Found forbidden in send-ready files: $label" >> "$REPORT"
    FAIL=1
  fi
}

mkdir -p "$ROOT/resume/pipeline"
cat > "$REPORT" << EOF
# Consistency Gate — $(date +%Y-%m-%d)

## Automated scan

EOF

# Required signals in master CV
for f in "$ROOT/resume/Aleksey-Alekseev-RU.md"; do
  [[ -f "$f" ]] || continue
  for pair in \
    "+7 933 271-27-77|Phone" \
    "1,5 трлн|AuM" \
    "4,3 млрд|Net profit" \
    "250+|Team" \
    "Приглашённый участник Правления|Board"; do
    IFS='|' read -r pat lbl <<< "$pair"
    if ! grep -q "$pat" "$f"; then
      echo "- **P0** $lbl missing in Aleksey-Alekseev-RU.md" >> "$REPORT"
      FAIL=1
    fi
  done
done

# Forbidden placeholders in non-pipeline resume md
while IFS= read -r f; do
  if grep -qE 'TBD|уточнить перед отправкой|\*уточнить' "$f" 2>/dev/null; then
    echo "- **P1** Placeholder in $f" >> "$REPORT"
    WARN=1
  fi
done < <(find "$ROOT/resume" -name '*.md' ! -path '*/pipeline/*' ! -path '*/tailored/*')

if [[ $FAIL -eq 0 && $WARN -eq 0 ]]; then
  echo "" >> "$REPORT"
  echo "## Result: **PASS**" >> "$REPORT"
  echo "Consistency gate PASSED → $REPORT"
  exit 0
elif [[ $FAIL -eq 0 ]]; then
  echo "" >> "$REPORT"
  echo "## Result: **PASS WITH WARNINGS**" >> "$REPORT"
  echo "Consistency gate PASSED with warnings → $REPORT"
  exit 0
else
  echo "" >> "$REPORT"
  echo "## Result: **FAIL**" >> "$REPORT"
  echo "Consistency gate FAILED → $REPORT"
  exit 1
fi
