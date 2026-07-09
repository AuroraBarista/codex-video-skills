#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <video-file>" >&2
  exit 2
fi

video_file="$1"

ffprobe -v error -show_streams -show_format -of json "$video_file"
