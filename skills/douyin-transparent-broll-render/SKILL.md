---
name: douyin-transparent-broll-render
description: "End-to-end render workflow for Chinese Douyin talking-head videos that need Day5-style blue/white glass B-roll overlays, real screenshot inserts, Remotion transparent overlay rendering, ffmpeg no-twitch compositing over the original video, and final ffprobe/contact-sheet QC. Use when the user asks to turn a subtitled vertical talking-head episode into a finished video, render/export Remotion B-roll, preserve original footage/audio, or package the proven day6 transparent-overlay process into repeatable steps."
---

# Douyin Transparent B-roll Render

## Overview

Use this skill to create a final Douyin/TikTok-style vertical talking-head video with Remotion B-roll, without sending the original person footage through Remotion. The stable path is: lock timing from the source video/SRT, build screenshot-first overlay scenes, render Remotion as transparent PNG frames, composite those frames over the original video with ffmpeg, then verify the export.

Resolve bundled paths such as `scripts/...` and `references/...` relative to this skill folder.

## Core Rules

- Treat the source talking-head video as the visual master. Do not import it into Remotion unless the user explicitly accepts that risk.
- Render Remotion as a transparent overlay layer only. The overlay composition background must be transparent and must not contain `<Video>` for the source footage.
- Match Remotion `durationInFrames` to the source video frame count from `ffprobe`, not to a guessed duration.
- Use the SRT, burned-in subtitles, ASR, or confirmed script to lock beats before designing B-roll. Do not design from a loose script if a timed subtitle file exists.
- Prefer real screenshots for file/folder/code proof. Use generated Remotion graphics for structure, emphasis, routes, chips, tables, and annotations.
- Keep source subtitles and the speaker's face clear. For 1080x1920 talking-head footage, treat the lower 420px as protected and keep heavy overlays in the top half.
- Before final export, show key-frame/contact-sheet previews when the user is judging style.

## Workflow

### 1. Prepare the episode folder

Create or confirm this structure inside the episode folder:

```text
assets/
analysis/
docs/
preview/
remotion/
exports/
```

Put user screenshots under `assets/` first, then copy or symlink the final selected screenshots into `remotion/public/` so Remotion can load them by relative public paths.

### 2. Probe and lock timing

Run `scripts/probe_video_json.sh` on the source video and save the result to `analysis/video-probe.json` when useful. Extract:

- width/height
- fps
- codec and pixel format
- color tags
- duration
- `nb_frames`
- audio stream settings

For Remotion, use `durationInFrames = nb_frames`. For a 30fps 250.233333s source, this should be `7507`, not a rounded `7508`.

### 3. Plan screenshot-first B-roll

Create `docs/broll-design-plan.md` or equivalent. For each beat, include:

- time range and frame range
- spoken cue or SRT cue
- visual goal
- screenshot requirement: `MUST`, `OPTIONAL`, or `NONE`
- layout and safe-zone note
- exact visible copy
- Remotion module name
- entry/exit motion

Read `references/day5-style-and-screenshot-rules.md` before building or revising the Remotion overlay style.

### 4. Build Remotion overlay only

In `remotion/src/Root.tsx`:

- Define a transparent overlay composition, for example `Day6OverlayOnly`.
- Use `backgroundColor: "transparent"` on the overlay root.
- Do not include the original source video as a `<Video>` element.
- Keep scenes data-driven so text, timing, screenshot paths, and modules are easy to inspect.
- Copy user screenshots into `remotion/public/...` and reference them by public path.

Generate key-frame stills or a contact sheet before the final sequence render if the user is still adjusting style.

### 5. Render transparent overlay frames

Use:

```bash
bash scripts/render_overlay_sequence.sh \
  remotion Day6OverlayOnly overlay-frames-v1 --overwrite --concurrency 3
```

Then check the frame count and alpha:

```bash
bash scripts/check_overlay_alpha.sh \
  remotion/overlay-frames-v1 7507
```

### 6. Composite over the original video

Read `references/no-twitch-export-qc.md` before final export. Use:

```bash
bash scripts/composite_overlay_sequence.sh \
  "7月8日/7月8日.mov" \
  "remotion/overlay-frames-v1/overlay-%04d.png" \
  "exports/final-no-twitch.mp4" \
  30 0 18 medium
```

This preserves the original talking-head footage path and maps the source audio into the final MP4.

### 7. Verify and make final QC artifacts

Probe the final video:

```bash
bash scripts/probe_video_json.sh \
  "exports/final-no-twitch.mp4"
```

Make a contact sheet:

```bash
bash scripts/make_contact_sheet.sh \
  "exports/final-no-twitch.mp4" \
  "preview/final-qc/final-contact-sheet.jpg"
```

Final acceptance criteria:

- H.264 MP4, 1080x1920, 30fps, `yuv420p`, BT.709 tags.
- Duration and frame count match the source within one frame.
- AAC audio exists and is close to the source duration.
- Overlay does not cover face, burned-in subtitles, Douyin UI zones, or right-side interaction controls.
- Real screenshots are legible enough to prove the point; if not, request tighter user screenshots instead of generating fake UI.
