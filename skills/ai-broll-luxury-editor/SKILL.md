---
name: ai-broll-luxury-editor
description: Premium timing-locked B-roll and Remotion overlay workflow for Chinese subtitled talking-head videos, especially Douyin/X AI education clips. Use when the user provides a raw/subtitle-burned Chinese video or script and asks for Day5/上一期 blue-white glass style, real screenshot proof assets, B-roll plans, key-frame previews, Remotion overlay code, transparent overlay export, no-twitch ffmpeg composition, pacing, or reusable self-media editing workflow.
---

# AI B-roll Luxury Editor

Use this skill to turn a Chinese talking-head source video into a premium tech/glass edit. The default mode is **design-first**: produce a reviewable B-roll design plan and key-frame previews before editing any video.

**Non-negotiable timing gate:** Before any B-roll design, key-frame preview, Remotion component work, overlay placement, replacement scene, or final render, first confirm the source video's speech/subtitle timeline. A B-roll that is visually polished but half a beat late/early fails this skill.

The final edit has two B-roll modes:

1. **Overlay B-roll**: transparent floating HUD / frosted-glass modules placed over the original face video.
2. **Replacement B-roll**: full-screen animated explainers, logo systems, terminal/demo scenes, dashboards, or concept diagrams that temporarily replace the face video.

## Required Workflow

1. **Create or locate a fresh edit folder** for each episode: `assets/`, `analysis/`, `preview/`, `remotion/`, `exports/`, `docs/`.
2. **Run the Timeline Confirmation Gate before all creative/editing work.** Probe the source with `ffprobe`; note duration, resolution, fps, codec, and whether subtitles are burned in. Then create `analysis/timeline-match.json` and a readable `analysis/timeline-match.md` from the best available evidence: user script, burned-in subtitle OCR, ASR/transcription, audio waveform, and representative frame stills. Do not start B-roll design or Remotion editing until this file exists.
3. **Confirm speech/subtitle alignment.** Each timeline beat must include `start`, `end`, `spoken_text`, `subtitle_text` when available, `cue_source`, `alignment_confidence`, `semantic_beat`, `broll_mode`, `scene_recipe`, and `safe_zone_notes`. If the video has burned subtitles, use subtitle changes as the primary timing anchor; if a user script is provided, align the script to actual speech before assigning B-roll.
4. **Audit the timeline for drift before placing B-roll.** Export a small set of timing-check stills/contact sheets around planned B-roll starts and exits. If any cue is late/early, fix the beat-level timings first. Do not use a single global offset unless the audit proves the drift is uniform.
5. **Extract contact sheets and key frames** before visual design. Use `scripts/make_contact_sheet.sh` or equivalent ffmpeg commands.
6. **Choose the visual system before key frames or Remotion code.** If the user says "上一期", "Day5", "昨天的视频", "当前频道风格", "蓝白玻璃", "小组件", or asks for real proof screenshots, read `references/day5-remotion-overlay-system.md` and treat it as the implementation source of truth. Do not improvise a new dashboard style.
7. **Create `broll-design-plan.md` from the confirmed timeline before editing.** Read `references/broll-design-plan-schema.md`. The plan must specify every timeline beat: visual intent, overlay/replacement mode, position, size, entry/exit animation, push/pull/camera movement, implementation method, asset/logo needs, risks, and a detailed Remotion generation prompt. A B-roll plan without prompts is incomplete.
8. **Fetch and document brand/logo/assets before visual design.** If real recognizable products or real workflow artifacts appear, capture actual screenshots first and document their source path. Use real screenshots as proof assets before designing mock UI. Do not silently invent logos, repos, terminals, or app windows.
9. **Create static key-frame previews, not video, for approval.** Generate `preview/keyframes/` PNG/JPG files plus a contact sheet. Use real source frames as backgrounds for overlay beats and real screenshots for proof beats. Do not render a motion preview or final video until the user approves the design plan.
10. **User approval gate.** After the timeline, design plan, and key frames are reviewed, implement the edit. If the user asks for changes, update the timeline/plan first, then edit.
11. **Implement with Remotion for final assembly.** All animations must be driven by `useCurrentFrame()` / `spring()` / `interpolate()`. Reuse the Day5 data-driven overlay architecture when matching the current channel style. Do not use CSS transitions or CSS animations in final render logic.
12. **Use HyperFrames motion language** for choreography: one deterministic timeline idea per scene, clear phase structure, no random motion, no infinite loops.
13. **QC with contact sheets** at intro, overlay, screenshot proof, replacement, terminal/demo, and CTA sections. Check B-roll timing against subtitles/speech, subtitle readability, face safety, density, screenshot readability, and color range.
14. **Export with the no-twitch protocol by default.** For long phone-shot talking-head videos, do not let Remotion decode the source video in the final composition. Render a transparent Remotion B-roll overlay layer, verify alpha, then use ffmpeg to composite it over the original source video while preserving audio. Only render source video inside Remotion for short tests or genuine full-replacement scenes where the user has approved that tradeoff.
15. **Template extraction after each approved video.** Add reusable structures to `docs/reusable-template-notes.md` or the skill references: scene name, use case, layout, animation recipe, assets, timing assumptions, and when not to use it.

## Current Channel Default - Day5 Blue/White Glass

Use this style when the user says "参考今天/昨天的视频", "上一期", "Day5", "蓝白玻璃磨砂", "小组件", or asks for the current channel B-roll look. Read `references/day5-remotion-overlay-system.md` before planning key frames or writing Remotion code.

- Treat the source video and SRT as the only timing source. Build `analysis/timeline-match.json` before any visual planning.
- Use compact transparent glass components, not large opaque boards: `MiniHeader`, `GlassChip`, `RouteLine`, small compare cards, small audit tables, short timeline strips, and real screenshot proof cards.
- Treat the Day5 `Root.tsx` architecture as the default implementation: `Scene[]` data, `Day5OverlayOnly`, `TopGrade`, `MiniHeader`, `GlassChip`, `RouteLine`, `GlassBox`, and transparent overlay export.
- Use real screenshots when the spoken cue claims a real artifact exists. Glass components annotate the screenshot; they do not replace it with a fake UI.
- Use blue/white typography and linework. Black is only allowed as translucent glass fill; never use black primary text, solid white cards, or green as the primary accent.
- Make text large enough for mobile viewing: headline 44-72px, chip text 26-34px, micro labels 18-24px. Prefer fewer, larger fragments over many tiny labels.
- Keep the speaker visible in overlay mode. Protect the face, the bottom burned-in subtitle lane, Douyin top UI, right-side buttons, and extreme left edge.
- Pull B-roll inward: for 1080x1920 vertical overlays, keep primary content roughly within `x=90..900`, `top>=150`; normal scenes can shift the whole overlay stage down about 56px, and opening chart scenes can shift down about 94px if the title/chart collide.
- Change the visual state every 3-7 seconds. Avoid a single board sitting for 10+ seconds.
- If the design feels like every idea is inside one big glass box, split it into several floating glass fragments and connect them with short route lines or staggered reveals.
- If a preview starts looking like a dark dashboard, PPT board, or generated UI mock when real files exist, stop and replace that beat with a real screenshot plus minimal Day5-style labels.

## Source Assumptions

- The user's default source is vertical `1080x1920`, Chinese speech, often with burned-in subtitles.
- If subtitles are burned in, treat the bottom 380px as a protected area for overlay scenes.
- Treat Douyin/TikTok UI chrome as part of the delivery environment, not an afterthought. Overlay B-roll must stay inside a platform-safe visual area: avoid the top status/title zone, right-side interaction buttons, bottom caption/subtitle/CTA zone, and extreme left edge.
- For `1080x1920` overlay scenes, do not place primary panels with `left < 90`, `top < 150`, or right edge beyond roughly `900`. Large route maps, checklists, cards, and logo clusters should be pulled inward toward the visual center, preferably by using a shared safe-stage wrapper around `scale(0.86-0.92)` with center-origin scaling.
- Before final render, QC at least one still with a Douyin-style safe overlay or screenshot mental model: top UI, right buttons, bottom caption/buttons. If a panel looks like it is glued to the edge, move/scale it inward before rendering.
- Never add a second explanatory caption line above/below burned-in subtitles. If the source already has Chinese subtitles, bottom text overlays are forbidden in overlay mode.
- During replacement B-roll, the original subtitles disappear or become hidden; add one concise on-screen caption only when needed, and keep it visually distinct from source subtitles.
- Unless the user explicitly asks for full replacement B-roll, keep the speaker visible throughout the edit. Use upper and shoulder-space overlays instead of covering the face.
- For the current channel style, black is allowed only as a translucent glass fill or background veil. Primary text, borders, route lines, icons, and emphasis strokes should be white/cyan/blue, not black.
- For the current channel style, include a compact 3-5s intro unless the user says otherwise. Prefer the 2026-7-1 v2 pattern: transparent/frosted floating chips, one episode label, one title lockup, and quick staggered entrances over the face video.
- Do not use global full-frame diagonal light sweeps, flow-light beams, or large bright veils by default. They make the edit feel noisy and plastic. Use only small local glints on chips/cards, and only when they do not cross the face or subtitles.
- Treat `analysis/timeline-match.json` as the source of truth for every B-roll `from`/`to` frame. Never manually guess B-roll timings from the script after editing has started.
- For proof-driven tutorials, capture actual local windows/files/scripts first: Finder, terminal, browser, VS Code/Cursor, or exported QC sheets. Only use generated mockups when the artifact does not exist or the user asks for abstraction.
- Every planned B-roll beat must include a Remotion prompt that is specific enough to generate the scene: format, spoken cue, visual goal, scene type, layout, exact copy, style, motion choreography, technical constraints, safe-zone constraints, and negative constraints.
- For plan-only requests, prefer the focused `$broll-plan-from-subtitled-video` workflow. For final exports that must avoid source-video jitter, prefer the focused `$remotion-transparent-broll-export` workflow.

## B-roll Mode Rules

### Overlay B-roll

Use for: hooks, simple concept labels, tool lists, timelines, task chains, CTA, lightweight emphasis.

- Keep the face visible and preserve the viewer's connection to the speaker.
- Use the upper/middle visual field but keep modules comfortably away from all screen edges; avoid the bottom subtitle zone.
- Floating panels should feel centered around the speaker, not pinned to the phone edge. If the speaker is centered, favor compact panels in the upper-left/upper-middle or center-left zones, with enough left padding to survive Douyin preview/upload UI.
- Show one main idea per screen: one title plus one supporting card/line/diagram.
- Default to floating transparent HUD elements: no solid white cards, no opaque rectangles, no heavy drop-shadow blocks.
- Use frosted dark glass only as a translucent fill at `rgba(0,0,0,0.18-0.36)`, with blue/white text, borders, icons, route lines, subtle glow, and short motion.
- Avoid large full-screen light-sweep, light-column, or flow-glow effects as a default. They can feel cheap on talking-head clips. Prefer structural motion: intro lockups, node trails, card reveals, route ticks, progress pulses, and small glass highlights.
- Text containers must fit their text: use intrinsic width, `max-width`, padding, `text-wrap: balance/pretty`, and clamp long labels rather than forcing fixed-size boxes.
- Reference typography: uppercase micro labels with wide tracking, strong Chinese sans headlines, high-contrast white/blue lockups, and no cramped line boxes.
- Avoid long static overlays. Most overlay beats should resolve in 3-7 seconds with small staggered element entrances, route/progress movement, number ticks, chip swaps, or short push/pull motion.
- If the user says the B-roll does not match the spoken content, rebuild the timeline as micro-beats: 3-6 seconds per beat, one subtitle cue or spoken idea per visual state, with a visible state change at least every 3-6 seconds.
- If the user provides the exact recording script or says "我是按照这个读的", enter **script-lock mode**: save that script in the episode docs, build `timeline-match` from the script first, and use only direct script wording or clearly equivalent visual shorthand. Do not replace the user's wording with broader inferred labels unless the label is needed for a very small UI chip.
- If the user reports that B-roll is late/early versus subtitles or speech, do not fix it with a single global offset unless the audit proves the drift is uniform. First create a voice-aligned timing file from ASR or subtitle OCR, then remap each beat to the actual spoken cue. If a visual label refers to a later sentence, split the beat instead of showing that label early.
- If the user reports overlap, remove convergence/flying-to-center animations from the affected section. Prefer fixed-position rows, route nodes, and staggered reveals; no two animated chips should share the same destination box or pass through the same text area.
- Do not place dense terminal/code/table UI on top of the face for longer than 2.5 seconds.
- For real screenshot proof beats, scale the screenshot down and keep it readable in the upper/middle safe zone. Add only one header and 1-3 glass chips. If the screenshot is too dense, crop to the relevant window region or 8-16 lines.

### Replacement B-roll

Use for: concept explanations, abstract systems, terminal/demo scenes, logo orbit, workflow maps, data/table output, RAG/Agent/multi-agent diagrams.

- Fully cover the face video only for genuine demos, terminal/product walkthroughs, or complete concept diagrams. If it is just a title, checklist, route, or term explanation, use transparent overlay instead.
- Keep the original audio playing underneath unless the user asks for music/SFX.
- Add a short caption if the source subtitles are hidden.
- Prefer dark graphite, champagne gold, cyan accents, thin borders, hex/grid textures, and cinematic depth.
- Do not overuse replacement scenes; they should feel like sharp explanatory cutaways.

## Scene Recipe Selection

Read `references/scene-recipes.md` when choosing a visual module. Read `references/style-system.md` when matching the look. Read `references/day5-remotion-overlay-system.md` when matching the current Day5/上一期 channel style or when using real screenshot proof assets. Read `references/timeline-schema.md` before writing `timeline-match.json`. Read `references/broll-design-plan-schema.md` before writing the approval plan.

Default sequence for the current AI education short:

1. `floating-hud-hook` over face.
2. `real-screenshot-proof-overlay` or `workflow-route-line` when a real artifact exists.
3. `transparent-brief-panel` or `CompareScene` for concept boundaries.
4. `workflow-route-line` / `timeline` for process.
5. `strategy-checklist` or compact `AuditTable` for saveable takeaways.
6. `clean-cta-overlay`.

Use `dark-tech-title` or full replacement only for complete concept resets, not for ordinary labels, file structures, or checklist beats.

## Tool Split

- Use **ffmpeg** for probing, trimming, extraction, audio/video prep, contact sheets, and final compatibility exports.
- Use **Remotion** for the timeline, compositing, source-video sync, and platform output.
- When matching Day5, start from the Day5 `Root.tsx` component system instead of writing a fresh visual framework. Keep scenes data-driven and keep overlay-only rendering separate from source-video composition.
- Use **Remotion prompt engineering** before generation: prompt validation, expected skill mapping, constants-first design, frame-driven animation constraints, and exact visible copy. Read the workspace reference `ai-content-workflow/reference/remotion-prompting/remotion-prompt-engineering.md` when writing B-roll plans.
- Use **HyperFrames style/motion principles** for deterministic, premium motion design; do not rely on random decorative motion.
- Required robust export path for long transparent overlays: render a Remotion overlay-only composition as RGBA PNG frames with `--sequence`, then use ffmpeg to composite those frames over the source video. Keep the frame sequence inside the Remotion project directory instead of using a `../` output path. This avoids slow/fragile alpha WebM or heavy ProRes intermediates while preserving burned-in subtitles and face video exactly.
- When using the PNG-frame path, prefer writing the frame folder inside the Remotion project, then ffmpeg-compose from there. Some Remotion sequence renders are less reliable when the output path points outside the project with `..`.
- For efficient revisions after a full PNG sequence exists, patch only affected Remotion frame ranges with `--frames=start-end`, then rerun ffmpeg composition. Do not rerender the entire episode for small copy/layout fixes.
- Quote optional audio maps in zsh, for example `-map '0:a?'`, otherwise the shell may treat `?` as a glob.

## Quality Bar

Accept only if:

- The Timeline Confirmation Gate was completed before B-roll design/editing, and B-roll entries/exits match the actual speech/subtitle cue.
- Each non-empty B-roll beat in the design plan has an approved Remotion generation prompt before implementation begins.
- The video looks like a packaged program, not a PPT overlay.
- The face is never accidentally covered in overlay mode.
- The bottom Chinese subtitles remain readable in overlay mode.
- No duplicate bottom caption line appears when the source already has subtitles.
- Overlay modules feel like transparent floating layers, not opaque PPT cards.
- Text always fits its chip/card/panel with professional padding and line height.
- Replacement B-roll teaches one idea clearly without becoming a wallpaper.
- Motion is calm, weighted, and intentional: 0.35-0.7s entrances, subtle drift, no bouncy toy UI.
- A contact sheet shows clear visual variety across the episode.
- Long talking-head exports use transparent Remotion overlay frames plus ffmpeg composition, so the original speaker footage is decoded once and does not twitch.
