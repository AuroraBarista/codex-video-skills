#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'EOF'
Usage: render_overlay_sequence.sh <remotion-dir> <composition-id> <output-dir> [--overwrite] [--concurrency N]

Renders a Remotion composition as transparent PNG sequence using overlay-[frame].png naming.
Run from the episode root. <output-dir> is interpreted relative to <remotion-dir> unless absolute.
EOF
}

if [[ $# -lt 3 ]]; then
  usage
  exit 2
fi

remotion_dir="$1"
composition_id="$2"
output_dir="$3"
shift 3

overwrite=0
concurrency="${CONCURRENCY:-3}"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --overwrite)
      overwrite=1
      shift
      ;;
    --concurrency)
      concurrency="${2:?Missing value for --concurrency}"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 2
      ;;
  esac
done

if [[ ! -d "$remotion_dir" ]]; then
  echo "Remotion directory not found: $remotion_dir" >&2
  exit 1
fi

if [[ ! -x "$remotion_dir/node_modules/.bin/remotion" ]]; then
  echo "Remotion binary not found. Run npm install inside: $remotion_dir" >&2
  exit 1
fi

(
  cd "$remotion_dir"
  if [[ -e "$output_dir" ]]; then
    if [[ "$overwrite" -ne 1 ]]; then
      echo "Output already exists: $output_dir (pass --overwrite to replace it)" >&2
      exit 1
    fi
    rm -rf "$output_dir"
  fi

  ./node_modules/.bin/remotion render src/index.ts "$composition_id" "$output_dir" \
    --sequence \
    --image-format=png \
    --image-sequence-pattern='overlay-[frame].[ext]' \
    --concurrency="$concurrency"
)
