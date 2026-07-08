---
name: broll-plan-from-subtitled-video
description: Create timing-locked B-roll design plans and key-frame previews from Chinese talking-head source videos with SRT or burned-in subtitles. Use when the user provides a raw/subtitled video and asks for a B-roll plan, timeline match, key-frame preview, blue-white glassmorphism overlays, or approval-ready editing plan before final rendering.
---

# B-roll Plan From Subtitled Video

Use this skill for the planning phase only. The output is a precise timeline, a reviewable B-roll plan, and static key-frame previews. Do not render the final edited video in this skill unless the user explicitly approves the plan and asks to proceed.

## Hard Gates

1. Confirm the timeline first. Do not design B-roll from memory or from the script alone.
2. Treat the SRT as primary when provided. If only burned-in subtitles exist, extract/align subtitle changes before planning.
3. Every B-roll beat must match the spoken cue, not just the general topic.
4. Use today's channel style by default: blue/white transparent glass, compact floating components, large readable text, and no face/subtitle coverage.
5. Produce key-frame images for approval before motion rendering.

## Required Workflow

1. Create or locate the episode folders: `analysis/`, `docs/`, `preview/keyframes/`, `assets/`, and optionally `remotion/`.
2. Probe the video with `ffprobe`; record duration, resolution, fps, codec, audio, rotation, and whether subtitles are burned in.
3. Build `analysis/timeline-match.json` and `analysis/timeline-match.md`. Include `start`, `end`, `spoken_text`, `subtitle_text`, `semantic_beat`, `cue_source`, `alignment_confidence`, `broll_mode`, `scene_module`, and `safe_zone_notes`.
4. Sample source frames/contact sheets around planned B-roll moments so layout decisions use the real face position, subtitle lane, lighting, and blank space.
5. Write `docs/broll-design-plan.md` with a beat table and detailed Remotion prompt for every non-empty B-roll beat.
6. Generate static key-frame previews and a contact sheet. Use source frames as the background for overlay beats; only use full replacement backgrounds for real demos or full concept scenes.
7. Stop for user approval. If the user asks for revisions, update the timeline and plan before changing visuals.

## Plan Requirements

Each beat in `broll-design-plan.md` must include:

- timecode and frame range
- spoken cue copied from the SRT or aligned transcript
- semantic purpose
- visual intent and exact on-screen copy
- B-roll mode: `none`, `overlay`, `semi-replacement`, or `replacement`
- scene module, layout coordinates, size, and safe-zone notes
- entry/exit animation, camera drift, state changes, and duration
- asset requirements, logo/screenshot sources, and fallback if assets are missing
- detailed Remotion generation prompt
- risk notes for face coverage, subtitle coverage, text fit, density, and platform UI

## Day5 Style Defaults

Read `references/day5-bluewhite-glass-plan.md` before producing a plan in the current channel style.

Use these defaults unless the user overrides them:

- 1080x1920 vertical canvas, 30fps.
- Primary content stays roughly inside `x=90..900` and `top>=150`.
- Bottom 380-420px is protected when source subtitles are burned in.
- Use compact floating glass fragments instead of one large glass board.
- Text is blue/white, readable, and large: chips 26-34px, headlines 44-72px.
- B-roll should have a visible state change every 3-7 seconds.
- Never add a second bottom caption if the source already has subtitles.

## Remotion Prompt Template

Every planned Remotion scene prompt must state:

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

## Completion Checklist

- `analysis/timeline-match.json` exists and timing is beat-level.
- `docs/broll-design-plan.md` has prompts for all B-roll beats.
- `preview/keyframes/` and a contact sheet exist.
- All key frames preserve face, subtitle lane, and platform-safe margins.
- The plan is ready for approval and does not start final rendering.
