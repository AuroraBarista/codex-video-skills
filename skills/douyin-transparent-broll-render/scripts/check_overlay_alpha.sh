#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: $0 <frames-dir> [expected-frame-count]" >&2
  exit 2
fi

frames_dir="$1"
expected_count="${2:-}"

if [[ ! -d "$frames_dir" ]]; then
  echo "Frames directory not found: $frames_dir" >&2
  exit 1
fi

tmp_file="$(mktemp)"
trap 'rm -f "$tmp_file"' EXIT

find "$frames_dir" -name 'overlay-*.png' | sort > "$tmp_file"
count="$(wc -l < "$tmp_file" | tr -d ' ')"

if [[ "$count" -eq 0 ]]; then
  echo "No overlay PNG files found in: $frames_dir" >&2
  exit 1
fi

if [[ -n "$expected_count" && "$count" != "$expected_count" ]]; then
  echo "Frame count mismatch: expected $expected_count, got $count" >&2
  exit 1
fi

mid_line=$((count / 2 + 1))
first="$(sed -n '1p' "$tmp_file")"
middle="$(sed -n "${mid_line}p" "$tmp_file")"
last="$(sed -n "${count}p" "$tmp_file")"

echo "Frame count: $count"
echo "Checking alpha/dimensions:"
printf '%s\n%s\n%s\n' "$first" "$middle" "$last"

if command -v sips >/dev/null 2>&1; then
  sips_output="$(sips -g hasAlpha -g pixelWidth -g pixelHeight "$first" "$middle" "$last")"
  echo "$sips_output"
  if echo "$sips_output" | grep -q 'hasAlpha: no'; then
    echo "At least one checked PNG does not have alpha." >&2
    exit 1
  fi
else
  echo "sips not found; skipped alpha metadata check." >&2
fi
