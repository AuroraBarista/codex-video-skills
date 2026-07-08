# Day5 Remotion Overlay System

Use this reference when the user says to match "上一期", "Day5", "昨天的视频", "当前频道风格", or asks for a real screenshot/proof-driven B-roll plan.

Source implementation:

- `examples/day5/remotion/src/Root.tsx` or your own previous episode's Remotion `Root.tsx`
- Final QC sheet:
  `examples/day5/preview/final-qc/day5-v1-contact-sheet.jpg` or your own final QC contact sheet

## What Actually Worked

Day5 did not use a large frosted-glass dashboard. It used a very light overlay package on top of real talking-head frames:

- Real source frames as the visual base.
- One `MiniHeader` per beat.
- A compact series badge in the upper-right.
- 2-5 `GlassChip` elements for supporting structure.
- `RouteLine` for process/timeline explanations.
- `GlassBox` only for compare/table moments, and only when the content needs a framed region.
- `Day5OverlayOnly` renders transparent overlays. Final composition uses ffmpeg so the source video is not decoded by Remotion.

The key visual idea is "proof annotation", not "interface illustration".

## Core Constants

Use these as defaults for 1080x1920 vertical video:

```ts
const fps = 30;
const width = 1080;
const height = 1920;
const blue = "#66BEFF";
const cyan = "#88DEFF";
const white = "#F5FAFF";
const overlayDown = 56;
const growthDown = 94;
```

Use the same type system:

```ts
type SceneKind =
  | "chips"
  | "route"
  | "compare"
  | "list"
  | "table"
  | "timeline"
  | "center"
  | "growth"
  | "screenshot";

type Scene = {
  id: string;
  from: number;
  duration: number;
  bg: string;
  label: string;
  title: React.ReactNode;
  kind: SceneKind;
  chips?: Array<[string, string]>;
  nodes?: Array<[string, string]>;
  rows?: Array<[string, string, string]>;
  screenshot?: string;
};
```

## Motion Helpers

Use frame-driven Remotion motion only:

- `appear(frame, start, end)` with `Easing.bezier(0.16, 1, 0.3, 1)`.
- `spring({ damping: 18, stiffness: 92, mass: 0.82 })` for overlay entrance.
- Entry: opacity plus `translateY(16-26px)` and tiny scale from `0.985` to `1`.
- Exit: fade in the last 16 frames.
- Chips stagger every `8-10` frames.
- Route lines animate with `scaleX`, never layout width.

## Component Specs

### TopGrade

Use only a subtle top grade:

```ts
background:
  "radial-gradient(circle at 30% 12%, rgba(85, 182, 255, 0.18), transparent 32%), linear-gradient(180deg, rgba(4, 9, 18, 0.18), rgba(4, 9, 18, 0.00) 46%, rgba(4, 9, 18, 0.05))";
```

Do not add global light beams, diagonal sweeps, particles, or full-screen blue veils.

### MiniHeader

Default placement:

- `left: 92`
- `top: 104 + overlayDown + y`

Visual:

- Vertical cyan bar: `width: 5`, `height: 54`.
- Micro label: `fontSize: 23`, `fontWeight: 950`, `letterSpacing: "0.2em"`, uppercase, blue.
- Title: `fontSize: 55`, `lineHeight: 1.06`, `fontWeight: 950`, white with one blue emphasis span.

Use one short Chinese title. Do not repeat the spoken subtitle.

### SeriesBadge

Default placement:

- `right: 72`
- `top: 96 + overlayDown`

Style:

- Reuse `GlassChip`.
- `minHeight: 48`
- `padding: "9px 18px"`
- `fontSize: 23`
- `borderRadius: 18`

### GlassChip

Default style:

```ts
display: "inline-flex";
alignItems: "center";
gap: 12;
minHeight: 60;
padding: "13px 20px";
borderRadius: 19;
fontSize: 28;
fontWeight: 900;
whiteSpace: "nowrap";
border: active
  ? "1.4px solid rgba(151, 222, 255, 0.78)"
  : "1.4px solid rgba(168, 225, 255, 0.46)";
background: active
  ? "linear-gradient(135deg, rgba(53, 146, 255, 0.34), rgba(255,255,255,0.10))"
  : "linear-gradient(135deg, rgba(8, 21, 42, 0.34), rgba(255,255,255,0.08))";
boxShadow: "0 12px 32px rgba(0,0,0,0.22), inset 0 1px 0 rgba(255,255,255,0.14)";
backdropFilter: "blur(20px)";
```

Use short labels only. If a label needs more than 8 Chinese characters or 18 Latin characters, split the beat or use a screenshot/proof card.

### FloatingRow

Default:

- `left: 102`
- `top: 315 + overlayDown`
- `maxWidth: 820`
- `gap: 16`
- Wrap is allowed, but keep rows to a maximum of 2.

### RouteLine

Default:

- `left: 100`
- `top: 334 + overlayDown`
- `width: 860`
- line `left: 48`, `right: 78`, `top: 60`, `height: 3`
- compact chips: `fontSize: 24`, `padding: "12px 16px"`

Use 3-5 nodes. Active node is the last node unless the spoken cue clearly points to another node.

### GlassBox

Use only for compare cards, audit tables, or actual proof screenshots. Avoid making it the default container.

Default style:

- `borderRadius: 24`
- `padding: "26px 30px"`
- border `rgba(168, 225, 255, 0.46)` or active `rgba(151, 222, 255, 0.78)`
- background `linear-gradient(135deg, rgba(8, 21, 42, 0.34), rgba(255,255,255,0.08))`
- active background `linear-gradient(135deg, rgba(53, 146, 255, 0.26), rgba(255,255,255,0.10))`
- `backdropFilter: "blur(20px)"`

## Real Screenshot / Proof Rule

For tutorial episodes about a concrete workflow, prefer real screenshots when the spoken cue claims a real artifact exists:

- "我开源了..." -> real repository/Finder/terminal tree screenshot.
- "`name` 和 `description`" -> real `SKILL.md` metadata screenshot.
- "`references`" -> real folder list or actual reference file screenshot.
- "`scripts`" -> real script folder or shell script screenshot.
- "Remotion 透明层 / ffmpeg 合成" -> real export script or command screenshot.
- "上一期风格" -> real Day5 `Root.tsx` component screenshot or final QC sheet.

Use glass elements as labels/highlights over the real screenshot. Do not redraw the screenshot as a fake app UI unless the user explicitly asks for a designed mock.

Recommended screenshot treatment:

- Horizontal screenshots are acceptable; scale them down inside the 1080x1920 frame.
- Place screenshots in the top or side safe zone, never over burned-in subtitles.
- Add at most one `MiniHeader` and 1-3 `GlassChip` labels.
- If the screenshot is text-heavy, crop to the relevant 8-16 lines before importing.
- Do not put a large translucent board behind a screenshot. The screenshot itself is the visual object.

## Scene Selection Defaults

- Hook/proof: `MiniHeader` + 2-3 `GlassChip` + optional real screenshot flash.
- Concept definition: `MiniHeader` + `FloatingRow`, no big board.
- Process: `RouteLine`.
- Comparison: two `GlassBox` cards.
- Checklist: `FloatingRow` or compact `AuditTable`, max 5 items.
- Actual artifact: `screenshot` mode with real image asset plus minimal glass labels.

## Anti-Patterns

Reject or revise when any of these appear:

- A full-screen dark tech dashboard for a normal overlay beat.
- A giant frosted rectangle containing all text.
- Fake screenshots when real local files are available.
- Generic "AI workflow" cards that do not match the spoken cue.
- Text that repeats the subtitle without adding structure.
- Top-left elements pinned to x < 90 or y < 150.
- Bottom caption or extra explanatory line over burned-in subtitles.
- Glass material with black primary text, green accents, or heavy black shadows.
