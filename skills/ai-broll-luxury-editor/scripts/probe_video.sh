#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: probe_video.sh <input-video>" >&2
  exit 2
fi

ffprobe -v error \
  -show_entries format=filename,duration,size \
  -show_entries stream=index,codec_type,codec_name,width,height,pix_fmt,r_frame_rate,color_range,color_space \
  -of json \
  "$1"
