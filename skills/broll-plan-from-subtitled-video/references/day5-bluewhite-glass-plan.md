# Day5 Blue/White Glass Plan Reference

Use this reference for the user's current "100 天 AI 入门" vertical talking-head videos.

## Visual Language

- Blue/white transparent glassmorphism, not opaque panels.
- Dark translucent fill is acceptable: `rgba(2, 10, 18, 0.22-0.42)`.
- Borders: cyan/ice white at low opacity, with soft inner highlight.
- Shadows: soft blue glow, never heavy black card shadows.
- Typography: strong Chinese sans, high contrast, mobile-readable.
- Avoid green primary accents and black primary text.

## Component Library

- `MiniHeader`: uppercase micro label plus one Chinese title; good for section starts.
- `GlassChip`: icon + short phrase; auto width, 18-28px padding.
- `RouteLine`: small nodes connected by cyan line; good for workflow, timeline, and "步骤".
- `ComparePair`: two or three fragments comparing old/new, prompt/skill, search/task.
- `AuditTable`: max 4 rows; for checklists, scoring, or evaluation.
- `GrowthChart`: only for proof/result moments; keep chart labels large and sparse.
- `CommentCluster`: anonymized comment chips flowing into topic cards.

## Layout Rules

- Keep primary overlay content roughly inside `x=90..900`.
- Top of primary content should usually be `y=150..720`.
- Normal scenes can shift the full overlay group down about 56px.
- Opening chart scenes can shift down about 94px when the chart/title collides.
- Avoid full-width boards unless the scene is a real demo/replacement.
- Keep speaker's eyes/mouth clear. Do not place moving lines through the face.
- Preserve bottom burned-in subtitles; do not add any lower-third explanation.

## Motion Rules

- 0.0-0.45s: header fades in, slides up 12-20px, blur clears.
- 0.45-2.0s: chips/cards stagger every 5-7 frames using spring.
- 2.0s onward: state changes every 3-7s through highlight, route progress, chip swap, row reveal, or number tick.
- Last 0.35s: hold or subtle drift, then clean cut.
- Avoid long static boards, large sweeps, random particles, and infinite loops.

## Beat Density

- One beat should teach one semantic idea.
- If a spoken paragraph has multiple ideas, split into micro-beats.
- Prefer 3-6 second modules for normal explanation.
- A 10+ second scene must have at least two visible state changes.

## Plan Output Pattern

For each beat, specify:

1. exact subtitle cue
2. visual shorthand
3. component type
4. layout coordinates
5. exact copy
6. animation timing
7. Remotion prompt
8. risk and safe-zone notes

## Negative Examples

- A single giant glass rectangle behind all text.
- Text that merely repeats the subtitle without adding structure.
- Tiny labels that are unreadable on a phone.
- B-roll glued to the left/top edge.
- Black text on transparent/dark glass.
- A clean-looking overlay that appears half a beat after the sentence.
