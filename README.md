# Codex Video Skills

Two Codex skills for planning and producing premium B-roll overlays for Chinese talking-head videos.

## Skills

### `ai-broll-luxury-editor`

An end-to-end editing workflow for Chinese subtitled talking-head videos. It covers:

- timing confirmation before any creative work
- Day5-style blue/white glass overlay design
- real screenshot proof assets
- Remotion overlay architecture
- transparent B-roll export
- ffmpeg composition to avoid source-video jitter

### `broll-plan-from-subtitled-video`

A planning-only workflow for turning a raw/subtitled talking-head video into:

- a timing-locked `timeline-match.json`
- a readable B-roll design plan
- screenshot requirements
- key-frame preview requirements
- Remotion prompts for every planned visual beat

Use this skill before final editing when you need the plan approved first.

## Install

Copy the skill folders into your Codex skills directory:

```bash
mkdir -p ~/.codex/skills
cp -R skills/ai-broll-luxury-editor ~/.codex/skills/
cp -R skills/broll-plan-from-subtitled-video ~/.codex/skills/
```

Then restart Codex or reload skills.

## Typical Workflow

1. Use `broll-plan-from-subtitled-video` to inspect the video and SRT, build the timeline, and produce the B-roll plan.
2. Review screenshot requirements and key-frame previews.
3. Use `ai-broll-luxury-editor` to implement the approved edit, render transparent overlays, and composite with ffmpeg.

## Requirements

- Codex with local skills enabled
- `ffmpeg` and `ffprobe`
- Node.js and Remotion for final rendering
- A vertical talking-head source video, ideally with an SRT file

## Notes

These skills were built for Chinese AI-education short videos, especially Douyin/X-style vertical clips. The defaults favor compact blue/white glass annotations over real talking-head footage, with strong safe-zone rules for faces, burned-in subtitles, and platform UI.

## License

MIT
