#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 3 || $# -gt 7 ]]; then
  cat >&2 <<'EOF'
Usage: composite_overlay_sequence.sh <source-video> <overlay-pattern> <output-mp4> [fps] [start-number] [crf] [preset]

Example:
  composite_overlay_sequence.sh "7月8日/7月8日.mov" "remotion/overlay-frames/overlay-%04d.png" "exports/final.mp4" 30 0 18 medium
EOF
  exit 2
fi

source_video="$1"
overlay_pattern="$2"
output_mp4="$3"
fps="${4:-30}"
start_number="${5:-0}"
crf="${6:-18}"
preset="${7:-medium}"

mkdir -p "$(dirname "$output_mp4")"

ffmpeg -y \
  -i "$source_video" \
  -framerate "$fps" -start_number "$start_number" -i "$overlay_pattern" \
  -filter_complex "[0:v]setpts=PTS-STARTPTS[base];[1:v]format=rgba,setpts=PTS-STARTPTS[ov];[base][ov]overlay=0:0:format=auto:eof_action=pass,format=yuv420p[v]" \
  -map "[v]" -map '0:a?' \
  -r "$fps" \
  -c:v libx264 -preset "$preset" -crf "$crf" \
  -c:a aac -b:a 192k -ar 44100 \
  -colorspace bt709 -color_primaries bt709 -color_trc bt709 \
  -movflags +faststart \
  "$output_mp4"
