#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: export_bt709_vertical.sh <input-mp4> <output-mp4> [crf]" >&2
  exit 2
fi

INPUT="$1"
OUTPUT="$2"
CRF="${3:-18}"

ffmpeg -hide_banner -y \
  -i "$INPUT" \
  -vf "scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,scale=in_range=auto:out_range=tv,format=yuv420p" \
  -c:v libx264 -preset fast -crf "$CRF" \
  -pix_fmt yuv420p -color_range tv -colorspace bt709 -color_primaries bt709 -color_trc bt709 \
  -c:a aac -b:a 192k -ar 48000 \
  -movflags +faststart \
  "$OUTPUT"
