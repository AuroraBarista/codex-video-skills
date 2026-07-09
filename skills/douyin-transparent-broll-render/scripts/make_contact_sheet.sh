#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 || $# -gt 5 ]]; then
  cat >&2 <<'EOF'
Usage: make_contact_sheet.sh <video-file> <output-jpg> [seconds-per-frame] [tile] [cell-width]

Defaults: seconds-per-frame=15 tile=4x5 cell-width=270
EOF
  exit 2
fi

video_file="$1"
output_jpg="$2"
seconds_per_frame="${3:-15}"
tile="${4:-4x5}"
cell_width="${5:-270}"

mkdir -p "$(dirname "$output_jpg")"

ffmpeg -y \
  -i "$video_file" \
  -vf "fps=1/${seconds_per_frame},scale=${cell_width}:-1,tile=${tile}" \
  -frames:v 1 \
  -update 1 \
  -q:v 3 \
  "$output_jpg"
