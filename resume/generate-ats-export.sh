#!/bin/bash
# Generate ATS-friendly TXT (and optional DOCX) from markdown CV.
set -euo pipefail

OUT_DIR="/workspace/resume/export"
ARTIFACTS="/opt/cursor/artifacts"
SRC="${1:-/workspace/resume/Aleksey-Alekseev-RU.md}"
BASE="$(basename "$SRC" .md)"

mkdir -p "$OUT_DIR" "$ARTIFACTS"

python3 /workspace/resume/scripts/md-to-ats-txt.py \
  "$SRC" \
  "$OUT_DIR/${BASE}-ATS.txt"

cp "$OUT_DIR/${BASE}-ATS.txt" "$ARTIFACTS/${BASE}-ATS.txt" 2>/dev/null || true

# Optional DOCX via pandoc
if command -v pandoc >/dev/null 2>&1; then
  pandoc "$SRC" -o "$OUT_DIR/${BASE}-ATS.docx"
  cp "$OUT_DIR/${BASE}-ATS.docx" "$ARTIFACTS/${BASE}-ATS.docx" 2>/dev/null || true
  echo "Created $OUT_DIR/${BASE}-ATS.docx"
else
  echo "pandoc not installed — TXT only (sufficient for most ATS paste)"
fi

echo "Created $OUT_DIR/${BASE}-ATS.txt"
ls -lh "$OUT_DIR/${BASE}-ATS.txt"
