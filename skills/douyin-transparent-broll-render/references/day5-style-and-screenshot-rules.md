# Day5-Style Screenshot And Glass Rules

Use this reference when designing or revising Remotion visuals for Chinese talking-head episodes.

## Visual Direction

- Match the Day5 look: compact blue/white glass UI, small floating components, subtle shadows, and lightweight proof overlays.
- Use transparent or dark translucent glass surfaces, not solid white cards.
- Use cyan/blue accents sparingly for key terms, chips, and rule labels.
- Keep text short. Prefer chips, route nodes, tables, and small labels over paragraphs.
- Use real screenshots as evidence. Annotate them with glass labels instead of redrawing fake Finder, fake GitHub, fake SKILL.md, or fake terminal UI.

## Screenshot Rules

- Ask for a real screenshot when the visual claim depends on proof: GitHub repo, actual folder tree, SKILL.md frontmatter, references folder, scripts folder, export command, or code diff.
- Use generated Remotion graphics when the visual is conceptual: prompt vs skill comparison, route line, checklist, mistakes-to-rules table, progress chips, or CTA cluster.
- For code/text screenshots, crop tighter instead of scaling a full desktop down until unreadable.
- Put selected screenshots into `remotion/public/...` and reference them from Remotion with public-relative paths.
- If the user says a screenshot looks fake, stop generating replacements and ask for or use real screenshots.

## Safe Zones

For 1080x1920 talking-head footage with burned-in subtitles:

- Keep the lower 420px clear.
- Keep heavy overlays mostly above the face, usually y=110..620.
- Avoid covering eyes, mouth, glasses, and the main center face area.
- Avoid extreme edges and Douyin UI zones; keep important content inside x=80..1000.

## Motion

- Use `useCurrentFrame`, `useVideoConfig`, `spring`, and `interpolate`.
- Avoid CSS transitions and keyframes inside Remotion components.
- Use opacity + translateY + tiny scale for entry.
- Add a visible state change every 3-7 seconds: highlighted chip, route step, table row, screenshot crop shift, or emphasis pulse.
- Keep motion subtle: no large sweeps, no heavy 3D, no generic tech wallpaper.

## Typography

- Use the same font family/style as the previous episodes when available.
- Keep top labels compact and readable on mobile.
- Do not use black primary text on bright white boxes.
- Highlight only the key term in blue; do not make every word blue.
