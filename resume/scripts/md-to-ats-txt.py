#!/usr/bin/env python3
"""Convert executive CV markdown to ATS-friendly plain text."""

from __future__ import annotations

import re
import sys
from pathlib import Path


def strip_comments(text: str) -> str:
    return re.sub(r"<!--.*?-->", "", text, flags=re.DOTALL)


def md_links_to_text(text: str) -> str:
    text = re.sub(r"\[([^\]]+)\]\(([^)]+)\)", r"\1 (\2)", text)
    return text


def convert_table_block(block: str) -> str:
    lines = [ln.strip() for ln in block.strip().splitlines() if ln.strip()]
    if len(lines) < 2:
        return block
    if not all("|" in ln for ln in lines[:2]):
        return block
    rows = []
    for ln in lines:
        if re.match(r"^\|[-\s|:]+\|$", ln):
            continue
        cells = [c.strip() for c in ln.strip("|").split("|")]
        if len(cells) >= 2:
            rows.append(cells)
    if len(rows) > 1 and rows[0][0].lower() in ("метрика", "metric", "field"):
        rows = rows[1:]
    out_rows = []
    for cells in rows:
        label = re.sub(r"\*\*", "", cells[0])
        value = re.sub(r"\*\*", "", cells[1])
        out_rows.append(f"- {label}: {value}")
    return "\n".join(out_rows) if out_rows else block


def convert_tables(text: str) -> str:
    lines = text.splitlines()
    out: list[str] = []
    i = 0
    while i < len(lines):
        if lines[i].strip().startswith("|"):
            table_lines: list[str] = []
            while i < len(lines) and lines[i].strip().startswith("|"):
                table_lines.append(lines[i])
                i += 1
            out.append(convert_table_block("\n".join(table_lines)))
        else:
            out.append(lines[i])
            i += 1
    return "\n".join(out)


def strip_md_formatting(text: str) -> str:
    text = re.sub(r"^#{1,6}\s+", "", text, flags=re.MULTILINE)
    text = re.sub(r"\*\*([^*]+)\*\*", r"\1", text)
    text = re.sub(r"\*([^*]+)\*", r"\1", text)
    text = re.sub(r"`([^`]+)`", r"\1", text)
    text = re.sub(r"^---+\s*$", "", text, flags=re.MULTILINE)
    return text


def normalize_whitespace(text: str) -> str:
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip() + "\n"


def convert(md_path: Path) -> str:
    raw = md_path.read_text(encoding="utf-8")
    text = strip_comments(raw)
    text = convert_tables(text)
    text = md_links_to_text(text)
    text = strip_md_formatting(text)
    return normalize_whitespace(text)


def main() -> int:
    if len(sys.argv) < 3:
        print("Usage: md-to-ats-txt.py <input.md> <output.txt>", file=sys.stderr)
        return 2
    src, dst = Path(sys.argv[1]), Path(sys.argv[2])
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_text(convert(src), encoding="utf-8")
    print(f"Wrote {dst}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
