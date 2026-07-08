# B-roll Design Plan Schema

Create this document after `timeline-match.json` and before any video editing.

## Required Files

- `analysis/source-contact-sheet.jpg`: sampled source video overview.
- `analysis/timeline-match.json`: spoken text and semantic beats.
- `assets/logo-sources.tsv`: logo/product asset source list when real brands appear.
- `docs/broll-design-plan.md`: human-readable plan for review.
- `preview/keyframes/*.png` or `.jpg`: static visual key frames.
- `preview/keyframe-contact-sheet.jpg`: all key frames in one image.

## Plan Header

Include:

- Source video path, duration, resolution, fps.
- Reference style used.
- Design principle for this episode.
- Asset status: fetched, placeholder, not needed.
- Approval status: `draft`, `approved`, or `needs revision`.
- Export assumption: whether the final should use transparent Remotion overlay frames plus ffmpeg composition to avoid source-video twitching.

## Beat Table Fields

Each beat must include:

- `timecode`: start-end in `MM:SS-MM:SS`.
- `spoken cue`: subtitle or approximate spoken line.
- `semantic purpose`: what the beat teaches.
- `broll mode`: `none`, `overlay`, `semi-replacement`, or `replacement`.
- `scene module`: recipe name.
- `layout`: coordinates and size in 1080x1920.
- `visual elements`: exact text, cards, icons, screenshots, logo chips.
- `entry animation`: frame duration, direction, opacity/scale/blur.
- `exit animation`: frame duration and transition.
- `camera/movement`: push-in, pull-back, lateral drift, light sweep, or none.
- `implementation`: Remotion components or HTML prototype method.
- `assets needed`: logo/screenshot/image/SVG/font.
- `prompt or capture instruction`: prompt for generated UI cards, or real screenshot capture instruction. If a real artifact exists, include the source path/URL/window and crop target instead of inventing a mock.
- `remotion generation prompt`: detailed prompt for the Remotion scene, including format, spoken cue, visual goal, scene type, layout, exact copy, style, motion choreography, technical constraints, safe-zone constraints, output expectation, and negative constraints.
- `expected remotion skills`: likely prompt-to-motion skills such as typography, messaging, charts, sequencing, transitions, spring-physics, social-media. Avoid 3D unless explicitly requested.
- `risk`: face/subtitle coverage, density, contrast, logo availability.
- `subtitle policy`: explicitly state whether source subtitles are burned in; if yes, confirm no duplicate lower-third or explanatory caption is added.
- `container fit`: note how chips/panels auto-fit text and what happens with long labels.

## Key-frame Preview Rules

- Previews are static approval frames only; do not render video before approval.
- Use original video frame as background for overlay/semi-replacement beats.
- Use real screenshots for proof beats when local/browser artifacts exist. Record the screenshot source path and intended crop/scale. Do not redraw a real file tree, terminal, repo page, or code snippet as fake UI.
- Overlay/semi-replacement key frames must use transparent floating HUD elements by default. Avoid white cards and opaque blocks unless the element is a real document/demo screenshot.
- Use standalone dark stage for replacement beats only when the beat is a complete demo/concept scene, not a simple title/checklist.
- Show real fetched logos where available; otherwise use labeled placeholder chips.
- Preserve the subtitle safety zone when the source subtitles are burned in.
- Do not show any added caption line in the bottom subtitle zone when the source already contains subtitles.
- Text must fit the visible container with balanced wrapping, adequate padding, and no clipped or cramped labels.
- Each key frame must be traceable to the Remotion generation prompt for that beat.
- For the current Day5 channel style, prefer blue/white glass fragments, large mobile-readable text, and inward-safe placement over big opaque dashboards.
- For the current Day5 channel style, read `day5-remotion-overlay-system.md` and prefer `MiniHeader`, `GlassChip`, `RouteLine`, `GlassBox`, and real screenshot proof assets over newly invented components.

## Approval Gate

After producing the plan:

1. Send the plan path and key-frame contact sheet to the user.
2. Ask for approval or requested revisions.
3. Do not start editing until the user approves.

## Post-edit Template Extraction

After an approved final edit, append reusable modules to `docs/reusable-template-notes.md`:

- Template name.
- When to use.
- Layout coordinates.
- Animation recipe.
- Required assets.
- Example timeline beat.
- Known failure modes.
