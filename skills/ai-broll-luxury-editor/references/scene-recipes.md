# Scene Recipes

## soft-glass-hook

Mode: overlay.

Use for the first 3-7 seconds or a new section reset.

- Background: original face video with warm wash.
- Elements: brand bug, small series label, one large Chinese headline, one orange pill/button.
- Motion: headline rises in; pill springs in; thin line draws across safe top area.
- Copy shape: `学习 AI / 先问一个问题`, `告诉 Codex`, `今天只讲一件事`.

## task-chain-overlay

Mode: overlay.

Use when explaining what AI/Agent does with a real task.

- Placement: top 180-560px in vertical video.
- Elements: one frosted panel with 3 mini stages: input, process, output.
- Motion: panel slides down 18-30px; stages reveal left-to-right; progress line advances.
- Safe use: 2-4 seconds max, then return to cleaner talking head.

## dark-tech-title

Mode: replacement.

Use when switching from casual talk to concept explanation.

- Background: dark graphite, faint hex/grid, subtle gold/cyan glow.
- Elements: small category label, large Chinese title, one supporting subtitle, optional small PIP.
- Motion: background texture fades in; title snaps/settles; border line sweeps.
- Copy shape: `不是搜索框，是任务系统`, `Agent 工具链`, `RAG 是给 AI 一套资料室`.

## terminal-demo-replace

Mode: replacement.

Use when demonstrating Codex/Agent execution without actual screen recording.

- Background: dark UI stage with terminal window and side output cards.
- Elements: terminal prompt, 2-4 typed commands/output lines, generated file cards.
- Motion: terminal line reveal; cards appear after command; status indicators pulse once.
- Caption: include one bottom line if original subtitles are hidden.

## real-screenshot-proof-overlay

Mode: overlay or semi-replacement.

Use when the spoken cue claims a concrete artifact exists: open-source repo, local skill folder, `SKILL.md`, `references/`, `scripts/`, terminal command, browser page, GitHub page, prior Remotion code, or exported QC sheet.

- Visual source: capture a real local/browser/app screenshot first. Do not recreate it as fake UI if the real artifact is available.
- Placement: top/middle safe zone. Horizontal screenshots may be scaled down inside the 1080x1920 frame; crop to the relevant window or 8-16 text lines before scaling.
- Elements: the screenshot is the main object; add at most one `MiniHeader`, one small series badge, and 1-3 `GlassChip` labels or route nodes.
- Motion: screenshot enters with opacity + y 16-24px + scale 0.985-to-1; chips stagger after 8-16 frames; optional crop/highlight mask can brighten one region.
- Safe use: do not cover the speaker's eyes/mouth in overlay mode and never cover burned-in subtitles. If the screenshot needs to be large, use semi-replacement for 2-5 seconds.
- Copy shape: `真实 Skill 文件夹`, `AI 先看 name/description`, `长规则放 references`, `稳定动作写 scripts`, `上一期组件代码`.
- Negative: no fake terminal, no fake Finder, no generated code screenshot when the real file exists, no giant glass board behind the screenshot.

## local-remotion-demo-replace

Mode: replacement or short insert.

Use when a real browser recording is visually weak or unnecessary, especially for abstract AI concepts such as prompt, context, reverse prompt engineering, workflow, memory, or task brief.

- Background: dark blue/black stage with subtle grid/noise, no full-screen light sweep.
- Elements: glass app/workspace shell, typed prompt area, floating nodes, route lines, result card, and 2-4 compact chips.
- Motion: frame-driven typewriter reveal, route-line draw, card/node stagger, subtle push/pull, and one visible state change every 3-6 seconds.
- Style: blue/white text and borders, translucent black only as glass fill, no green primary color, no black text.
- Safe use: keep clips short, usually 6-8 seconds, and make the content match one exact script beat.

## reverse-prompt-glass-pack

Mode: replacement or overlay.

Use for teaching "reverse prompt engineering" or "prompt is a task brief".

- Visual grammar: start from the desired output, then work backward into `目标`, `材料`, `流程`, `格式`.
- Elements: target/result card, four glass chips or node cards, route lines moving backward into a prompt composer.
- Motion: result card appears first; chips resolve in sequence; route line draws; final prompt/result preview locks in.
- Copy rule: do not broaden the user's script into generic AI slogans. Use direct script wording or compact equivalent labels.
- Best examples: learning plan, shopping decision, meeting notes, email rewrite, report summary.

## logo-orbit-replace

Mode: replacement.

Use for tool ecosystem explanations.

- Background: dark or soft gradient stage.
- Elements: central task node, orbiting tool/logo chips, connecting lines.
- Motion: deterministic slow orbit or cluster convergence; stop on final arrangement.
- Keep logo count to 5-7.

## logo-flow-2d-replace

Mode: replacement.

Use for premium toolchain / agent-system segments.

- Background: full-screen dark graphite with blue/purple ambient depth.
- 2D: central glass motherboard/task hub, deterministic moving tool chips, route lines, and light sweeps.
- Typography: heavy skewed Chinese title on the left, small metadata line above.
- Motion: depth push in, light sweep transition in/out, tool chips flow into a final system arrangement.
- Keep the hub meaningful: it should suggest an execution system or motherboard, not random decorative motion.

## knowledge-map-replace

Mode: replacement.

Use for Wiki, Loop, RAG, memory, or knowledge base concepts.

- Background: dark glass stage.
- Elements: document cards flowing into a central knowledge node, then answer/output card.
- Motion: cards drift in, shrink into node, output card expands.

## route-overlay

Mode: overlay.

Use for learning roadmap and content calendar.

- Placement: left or top side, never bottom subtitles.
- Elements: transparent floating vertical route with 3-5 nodes; no opaque poster card unless the scene is a full replacement demo.
- Motion: nodes light one by one; no large panels.

## clean-cta-overlay

Mode: overlay.

Use for the final 4-8 seconds.

- Background: mostly clean face video.
- Elements: small brand bug and one transparent frosted comment card.
- Copy shape: `评论区告诉我：你想拆哪个 AI 场景？`

## floating-hud-hook

Mode: overlay.

Use for the opening hook under the AI-blogger floating HUD baseline style.

- Background: original talking-head frame with a dark blue/black grade and subtle vignette.
- Elements: top-left uppercase metadata label with a vertical blue bar, one large blue/white title or metric lockup, and 1-3 transparent chips.
- Motion: header is static or fades in; title slides up 18-28px with blur clearing; chips stagger in with a 4-8px floating drift.
- Keep the speaker visible. This is a floating HUD layer, not an opaque card overlay or full replacement.

## transparent-brief-panel

Mode: overlay.

Use for plain-language definitions like Prompt, Context, RAG, or Agent.

- Placement: top-left or side safe zone; do not add bottom explanatory captions.
- Elements: large white/blue definition title plus 3-5 auto-fit transparent rows.
- Motion: title appears first; panel border draws; rows reveal sequentially.
- Avoid solid white cards. Rows must expand to fit Chinese text with professional padding.

## tool-stack-left

Mode: overlay.

Use when naming concrete AI tools, models, IDEs, or agents.

- Placement: left/top safe zone.
- Elements: 3-5 dark rounded tool cards, each with logo/icon, tool name, and one short subtitle.
- Motion: cards reveal top-to-bottom with 3-5 frame stagger; active card border brightens.
- Use official logos when available; otherwise use text chips and document the placeholder.

## workflow-route-line

Mode: overlay or semi-replacement.

Use for process explanations such as input -> context -> agent -> output.

- Placement: upper-middle or left-middle; do not cover subtitles.
- Elements: small icon nodes connected by a cyan line.
- Motion: route line draws with scaleX; nodes brighten left-to-right.
- Works better than a large flowchart for short AI education videos.

## strategy-checklist

Mode: overlay.

Use for advice, steps, risks, or "how to start" sections.

- Placement: top-left, 3-5 rows max.
- Elements: small colored icon square, short Chinese label, optional micro subtitle.
- Motion: title appears first; rows reveal sequentially; current row highlights while previous rows dim.

## metric-proof-dashboard

Mode: overlay or semi-replacement.

Use for social proof, trend proof, benchmarks, stars, rankings, or quantified results.

- Elements: compact evidence card plus one large number or status.
- Motion: card slides in first, number counts or fades in second.
- Avoid full-screen stats unless the number is the point of the sentence.
