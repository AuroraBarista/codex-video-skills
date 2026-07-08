#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: make_contact_sheet.sh <input-video> <output-jpg> [fps_expr] [tile]" >&2
  echo "Example: make_contact_sheet.sh input.mp4 sheet.jpg 1/8 5x4" >&2
  exit 2
fi

INPUT="$1"
OUTPUT="$2"
FPS_EXPR="${3:-1/8}"
TILE="${4:-5x4}"

ffmpeg -hide_banner -y \
  -i "$INPUT" \
  -vf "fps=${FPS_EXPR},scale=320:-1,tile=${TILE}" \
  -frames:v 1 \
  "$OUTPUT"
