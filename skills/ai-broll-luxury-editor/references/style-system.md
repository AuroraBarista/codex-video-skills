# Premium Glass / Tech Style System

## Learned From Reference Videos

The effective Douyin samples combine a stable show package with short, clear visual modules:

- **Soft glass talking-head package**: real space, warm wash, brand bug, orange CTA pill, frosted cards, very little text.
- **Black-gold explainer stage**: dark graphite background, thin gold/cyan borders, hex/grid texture, right-side or circular speaker PIP, large title.
- **Dark kinetic lesson cards**: strong Chinese title, purple/blue ambient light, small labels, step modules.
- **Demo/document scenes**: screen or document is the main visual; speaker becomes small PIP or disappears.
- **AI-blogger dark studio baseline**: keep the speaker visible, darken/grade the room with black/blue side light, then add compact floating HUD layers: transparent metric lockups, glass chips, thin route lines, logo/tool stacks, and checklist modules. Solid white cards are reserved for true product/demo screenshots, not normal overlays.
- **Floating transparent HUD reference**: large blue/white numeric or title lockup, wide-tracked uppercase label, left vertical blue accent, translucent chips with icon + text, almost no opaque background, and no extra bottom caption line.
- **Complex board reference**: use a mix of direct floating text and faint framed regions. Important words can float with no box; structured lists may use a very subtle black glass panel with a thin blue/white line. Do not put a heavy rectangle behind every text block.
- **Local Remotion demo baseline**: when screen recordings look weak, replace them with designed local demo scenes: dark blue/black glass workspace, typewriter prompt, compact nodes, route-line motion, and result preview cards. This should feel like a productized explainer, not a website capture.

## Current Day5 Channel Style

Use this as the default for Patrick's current vertical "100 天 AI 入门" edits:

- Source of truth: read `day5-remotion-overlay-system.md` before implementing this style. The Day5 implementation is a lightweight Remotion overlay system, not a generic "glassmorphism dashboard".
- Blue/white transparent glass components over the real talking-head footage.
- Compact floating fragments instead of one large framed board.
- Use real screenshot proof assets when the episode claims a real artifact exists: repository, Finder folder, `SKILL.md`, terminal command, script file, exported QC sheet, or prior Remotion code.
- Glass elements are annotations over real footage/screenshots. They should not replace real artifacts with fake app UI unless the user explicitly requests a mock.
- Large readable text: chips 26-34px, section titles 44-72px, micro labels 18-24px.
- Glass material: dark translucent fill, cyan/ice border, soft inner highlight, low blue glow.
- Black is allowed only as translucent fill; avoid black primary text.
- Avoid green primary accents, solid white cards, and heavy opaque rectangles.
- Keep B-roll inward and slightly lower when needed: primary overlays roughly `x=90..900`, `top>=150`; normal stage can shift down about 56px, opening charts about 94px.
- Preserve the speaker's face and burned-in subtitles. No bottom explanatory captions.
- Every 3-7 seconds, add a state change: chip reveal, route progress, highlight swap, row reveal, number tick, or subtle drift.

## Palette

### Day5 Overlay Palette

- Day5 blue: `#66BEFF`
- Day5 cyan: `#88DEFF`
- Day5 white: `#F5FAFF`
- Active chip fill: `linear-gradient(135deg, rgba(53, 146, 255, 0.34), rgba(255,255,255,0.10))`
- Inactive chip fill: `linear-gradient(135deg, rgba(8, 21, 42, 0.34), rgba(255,255,255,0.08))`
- Chip/card border: `rgba(168, 225, 255, 0.46)`; active `rgba(151, 222, 255, 0.78)`
- Chip shadow: `0 12px 32px rgba(0,0,0,0.22), inset 0 1px 0 rgba(255,255,255,0.14)`
- Top grade: `radial-gradient(circle at 30% 12%, rgba(85, 182, 255, 0.18), transparent 32%)` plus a subtle vertical dark veil.

### Older Supporting Palette

- Warm paper: `#F4EEE5`
- Burnt orange: `#D97842`
- Espresso text: `#3E2C22`
- Glass white: `rgba(255,255,255,0.18)`
- HUD glass dark: `rgba(2, 8, 5, 0.20)` to `rgba(2, 8, 5, 0.36)`
- Electric blue: `#4FA3FF`
- Ice white: `#F3F8FF`
- Deep graphite: `#080A0F`
- Panel graphite: `#111820`
- Champagne gold: `#E7C56A`
- Electric cyan: `#20B8FF`
- Muted green: `#5AC887`
- Purple haze: `#6757FF`

## Typography

- Chinese headlines: PingFang SC / system sans, 52-96px in 1080x1920.
- HUD headlines: strong sans, 64-118px in 1080x1920, white/blue lockup, shadow for readability, no artificial condensed boxes that make text cramped.
- Uppercase labels: DIN Alternate / SF Mono / system sans, 22-34px, letter spacing 0.18-0.34em. Use tracking only for short English labels, not long Chinese body copy.
- For tech lesson titles, use a heavy italic treatment: `fontWeight: 950`, `skewX(-7deg)` to `skewX(-10deg)`, tight line height, optional cream/gold split color.
- When imitating premium tech creator typography, make the headline feel like a placed graphic, not a normal text block: large weight, slight skew, two-line lockup, cream first line and gold emphasis word.
- Body labels: 22-32px, heavy enough for mobile viewing.
- Micro labels: 16-22px, uppercase only when decorative.
- Keep letter spacing at 0. Use weight, size, and position for hierarchy.

## Composition

- Overlay mode: top 0-760px and side margins are the main design zone; bottom 420px is protected when subtitles are burned in. Do not add any second caption or explanatory line near the source subtitles.
- Replacement mode: use the full frame, but leave a bottom caption lane around 1420-1640px when needed.
- Avoid centered card stacks over the face. Put modules above head, on sides, or fully replace the video.
- Use fewer elements than feels necessary. Premium style comes from spacing and material, not density.
- Under the AI-blogger baseline, prefer transparent overlay over full replacement: let the original speaker remain visible while floating HUD modules carry the proof.
- For proof/tutorial episodes, horizontal screenshots can be scaled down inside the vertical canvas. Crop to the useful region first; do not shrink an entire dense desktop until text is unreadable.
- Treat screenshot beats as visual evidence. Add a `MiniHeader` plus 1-3 chips; avoid adding a second glass board around the screenshot.
- Avoid bright white cards unless the visual is an actual document/demo/screenshot. For pure explanation, use transparent glass, line, glow, and typography.
- Use auto-sized chips/panels. Fixed boxes must include enough padding and `max-width`; text overflow or visually cramped text fails QC.
- Position complex boards toward the left/top or side where the source frame has negative space. Avoid placing framed panels over eyes, mouth, or center face.
- Use unframed text for simple emphatic ideas. Use faint panels only for lists, timelines, or comparisons.

## Motion

- Entrance: opacity + y/scale + blur clearing; 10-18 frames.
- Glass cards: border/shadow first, then content.
- Lines: draw from left to right or node to node; do not animate layout width in Remotion, animate scaleX.
- Terminal/demo: type/reveal 1-2 lines at a time; keep the cursor subtle.
- Logo systems: orbit or cluster slowly; no infinite spin in final render unless deterministic over scene duration.
- Transitions: prefer light sweep, glass wipe, or depth push. Avoid full white flash.
- Flowing-logo segments should default to 2D glass systems: layered panels, route lines, moving chips, light sweeps, and subtle depth shadows.
- AI-blogger baseline motion: cards fade + slide 20-60px + scale 0.96-to-1 in 0.25-0.45s; tool rows stagger by 0.08-0.14s; workflow lines draw left-to-right; no 3D rotations.
- Floating HUD motion: elements should feel suspended: opacity 0->1, y 16-34px, blur 10px->0, optional slow 1.00->1.012 push. Chips can drift 4-8px over the scene. Avoid big card sweeps.
- Local demo motion: use short 6-8s clips with a clear phase structure: 0.4-0.7s entry, 2-4s active typing/route/card changes, 0.3-0.5s exit. A demo should never sit as a static board for the whole beat.

## Avoid

- Plastic white cards with hard shadows.
- White information cards over talking-head footage, unless representing a real document/demo.
- Fake UI screenshots when real local screenshots or code/files are available.
- Large dark dashboards for ordinary overlay beats.
- Too many chips or logos at once.
- Full-screen white flashes.
- Long dark scenes without contrast or a clear teaching point.
- Covering baked subtitles with decorative elements.
- Adding any extra bottom subtitle/explanation line on a source that already has subtitles.
- Text squeezed inside boxes, labels clipped by fixed widths, or mismatched chip height.
