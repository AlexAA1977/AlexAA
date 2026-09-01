#!/bin/bash
set -euo pipefail

CHROME="${CHROME:-/usr/local/bin/google-chrome}"
OUT_DIR="/workspace/resume"
ARTIFACTS="/opt/cursor/artifacts"

for html in "$OUT_DIR"/Aleksey-Alekseev-*.html; do
  base="$(basename "$html" .html)"
  pdf="$OUT_DIR/$base.pdf"
  "$CHROME" \
    --headless=new \
    --disable-gpu \
    --no-sandbox \
    --user-data-dir="/tmp/chrome-pdf-$$" \
    --print-to-pdf="$pdf" \
    --no-pdf-header-footer \
    --virtual-time-budget=10000 \
    "file://$html"
  rm -rf "/tmp/chrome-pdf-$$"
  cp "$pdf" "$ARTIFACTS/$base.pdf"
  echo "Created $pdf"
done

ls -lh "$OUT_DIR"/*.pdf "$ARTIFACTS"/Aleksey-Alekseev-*.pdf
