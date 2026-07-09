---
name: douyin-broll-plan-render
description: "Two-stage workflow for Chinese Douyin/TikTok talking-head videos: create timing-locked B-roll plans and key-frame previews from SRT/burned-in subtitles, collect real screenshot requirements, then after approval render Day5-style blue/white glass Remotion overlays as transparent PNG sequences and composite them over the original video with ffmpeg no-twitch QC. Use when the user asks for a complete plan-to-render video workflow, combines broll-plan-from-subtitled-video with douyin-transparent-broll-render, or wants a reusable open-source skill for subtitle-locked B-roll planning plus final export."
---

# Douyin B-roll Plan Render

Use this skill for the full episode workflow: plan first, preview second, render only after approval. It combines `broll-plan-from-subtitled-video` for timing-locked planning with `douyin-transparent-broll-render` for transparent Remotion rendering and ffmpeg final composition.

Resolve bundled paths such as `scripts/...` and `references/...` relative to this skill folder.

## Non-Negotiable Gates

1. Confirm the source timeline before designing B-roll. Prefer SRT; if only burned-in subtitles exist, extract or align subtitle changes first.
2. Produce `analysis/timeline-match.json`, `docs/broll-design-plan.md`, static key frames, and a contact sheet before motion rendering.
3. Stop for user approval after the planning/preview phase unless the user explicitly asks to continue rendering.
4. Use real screenshots for proof-heavy moments such as GitHub repos, file trees, SKILL.md frontmatter, references folders, scripts folders, and export commands.
5. Render the final Remotion work as a transparent overlay only. Do not put the original talking-head video into Remotion.
6. Composite the transparent overlay over the original source video with ffmpeg and preserve the source audio.
7. Verify final H.264/AAC MP4 with ffprobe and a final contact sheet.

## Folder Contract

Inside each episode folder, create or confirm:

```text
analysis/
assets/
docs/
preview/keyframes/
preview/final-qc/
remotion/
exports/
```

Keep screenshots under `assets/` and copy approved Remotion assets into `remotion/public/`.

## Stage 1: Timeline And Plan

1. Probe the video:

```bash
bash scripts/probe_video_json.sh "path/to/source.mov" > analysis/video-probe.json
```

Record duration, resolution, fps, codec, pixel format, color tags, audio settings, and `nb_frames`.

2. Build `analysis/timeline-match.json` and `analysis/timeline-match.md`. Include:

- `start`
- `end`
- `frame_start`
- `frame_end`
- `spoken_text`
- `subtitle_text`
- `semantic_beat`
- `cue_source`
- `alignment_confidence`
- `broll_mode`
- `scene_module`
- `safe_zone_notes`

3. Sample source frames and source contact sheets around likely B-roll beats. Use the real speaker position, subtitle lane, lighting, and blank space to design layouts.

4. Write `docs/broll-design-plan.md`. Each beat must include:

- timecode and frame range
- exact spoken cue from SRT or aligned transcript
- semantic purpose
- visual intent and exact on-screen copy
- B-roll mode: `none`, `overlay`, `semi-replacement`, or `replacement`
- scene module, layout coordinates, size, and safe-zone notes
- entry/exit animation, camera drift, state changes, and duration
- asset requirements and screenshot requests
- detailed Remotion generation prompt
- risks for face coverage, subtitle coverage, text fit, density, and platform UI

5. Read `references/day5-bluewhite-glass-plan.md` before planning Day5-style visuals.

## Stage 2: Key-Frame Preview

Generate static key-frame images and a contact sheet before motion rendering.

Use source frames as the background for overlay beats. Use full replacement backgrounds only for real demos or scenes where the plan explicitly marks `replacement`.

Read `references/day5-style-and-screenshot-rules.md` before revising screenshot treatments, glass surfaces, typography, or safe zones.

Stop here for user approval unless the user already approved rendering.

## Stage 3: Remotion Overlay

When approved:

1. Create or update the Remotion project under `remotion/`.
2. Define a transparent overlay composition such as `EpisodeOverlayOnly`.
3. Set `durationInFrames` from source `nb_frames`, not rounded duration.
4. Use `backgroundColor: "transparent"` on the overlay root.
5. Search for `<Video>` before final render. The overlay-only composition must not contain the original source video.
6. Keep scenes data-driven: timing, copy, screenshot path, module type, and safe-zone notes should be inspectable.

Every Remotion scene prompt should include:

```text
Create a vertical 1080x1920 Remotion overlay scene, 30fps, [duration] seconds long.
Spoken beat: [exact subtitle/speech cue]
Visual goal: [what this beat teaches]
Scene type: [module name] over talking-head footage.
Layout: [coordinates, size, safe zone]
Visible copy: [exact text]
Style: premium blue/white transparent glassmorphism, dark translucent fills only, cyan/white borders, soft inner highlights, no green primary, no black primary text, no solid white cards.
Motion choreography: header 0-0.45s, staggered chips/cards 0.45-2.0s, visible state change every 3-7s, clean hold/exit.
Technical constraints: use useCurrentFrame, useVideoConfig, spring, interpolate, Sequence/Series; no CSS transitions/keyframes; inline styles.
Safe-zone constraints: do not cover face, source subtitles, Douyin top UI, right buttons, or extreme edges.
Negative constraints: no generic tech wallpaper, no large opaque PPT cards, no clipped text, no cramped fixed boxes.
```

## Stage 4: Transparent Sequence Render

Render the overlay sequence:

```bash
bash scripts/render_overlay_sequence.sh remotion EpisodeOverlayOnly overlay-frames-v1 --overwrite --concurrency 3
```

Check alpha and frame count:

```bash
bash scripts/check_overlay_alpha.sh remotion/overlay-frames-v1 EXPECTED_FRAME_COUNT
```

## Stage 5: Final Composite And QC

Read `references/no-twitch-export-qc.md` before final export.

Composite over the original video:

```bash
bash scripts/composite_overlay_sequence.sh \
  "path/to/source.mov" \
  "remotion/overlay-frames-v1/overlay-%04d.png" \
  "exports/final-no-twitch.mp4" \
  30 0 18 medium
```

Probe the final:

```bash
bash scripts/probe_video_json.sh "exports/final-no-twitch.mp4"
```

Make final QC contact sheet:

```bash
bash scripts/make_contact_sheet.sh \
  "exports/final-no-twitch.mp4" \
  "preview/final-qc/final-contact-sheet.jpg"
```

Final acceptance criteria:

- `analysis/timeline-match.json` exists and timing is beat-level.
- `docs/broll-design-plan.md` has prompts for every B-roll beat.
- key-frame previews and a contact sheet were generated before rendering.
- final video is H.264 MP4, 1080x1920, 30fps, `yuv420p`, BT.709.
- audio exists and duration matches the source closely.
- overlays preserve face, burned-in subtitles, and platform UI zones.
- screenshots look real and legible; if not, ask for tighter real screenshots.
