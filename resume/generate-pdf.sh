#!/bin/bash
set -euo pipefail

CHROME="${CHROME:-/usr/local/bin/google-chrome}"
OUT_DIR="/workspace/resume"
ARTIFACTS="/opt/cursor/artifacts"
mkdir -p "$ARTIFACTS"

render_pdf() {
  local html="$1"
  local pdf="$2"
  local tmpdir
  tmpdir="$(mktemp -d /tmp/chrome-pdf-XXXXXX)"
  timeout 45 "$CHROME" \
    --headless=new \
    --disable-gpu \
    --no-sandbox \
    --user-data-dir="$tmpdir" \
    --print-to-pdf="$pdf" \
    --no-pdf-header-footer \
    --virtual-time-budget=10000 \
    "file://$html" 2>/dev/null
  rm -rf "$tmpdir"
}

# Final canonical PDF
render_pdf "$OUT_DIR/Aleksey-Alekseev-RU.html" "$OUT_DIR/Aleksey-Alekseev-FINAL.pdf"
cp "$OUT_DIR/Aleksey-Alekseev-FINAL.pdf" "$OUT_DIR/Aleksey-Alekseev-RU.pdf"
cp "$OUT_DIR/Aleksey-Alekseev-FINAL.pdf" "$ARTIFACTS/Aleksey-Alekseev-FINAL.pdf"
cp "$OUT_DIR/Aleksey-Alekseev-FINAL.pdf" "$ARTIFACTS/Aleksey-Alekseev-Resume-RU.pdf"

echo "Created $OUT_DIR/Aleksey-Alekseev-FINAL.pdf"
ls -lh "$OUT_DIR/Aleksey-Alekseev-FINAL.pdf" "$ARTIFACTS/Aleksey-Alekseev-FINAL.pdf"
