# timeline-match.json Schema

Create this file before designing or inserting any B-roll. This is the first creative gate of the edit: no B-roll plan, preview, Remotion timeline, or render should start until the source speech/subtitle timeline is confirmed.

```json
[
  {
    "start": 0.0,
    "end": 4.2,
    "start_frame": 0,
    "end_frame": 126,
    "spoken_text": "但现在的 AI 已经不只是回答问题",
    "subtitle_text": "但现在的 AI 已经不只是回答问题",
    "cue_source": "burned_subtitle_ocr+asr",
    "alignment_confidence": "high",
    "timing_status": "confirmed",
    "evidence": {
      "frame_still": "analysis/subtitle-frames/0000.0s.png",
      "subtitle_change": "00:00.0-00:04.2",
      "notes": "Subtitle and speech begin together; no offset needed."
    },
    "semantic_beat": "reframe_ai_from_chat_to_task_system",
    "broll_mode": "overlay",
    "scene_recipe": "soft-glass-hook",
    "visual_copy": ["学习 AI", "先问一个问题"],
    "safe_zone_notes": "top-left only; preserve burned subtitles",
    "risk": "do not cover face or bottom subtitles"
  }
]
```

## Fields

- `start`, `end`: seconds in source video.
- `start_frame`, `end_frame`: frame numbers at the project fps, usually 30fps.
- `spoken_text`: actual or approximate subtitle/speech.
- `subtitle_text`: burned-in subtitle or caption text when available.
- `cue_source`: where timing came from: `burned_subtitle_ocr`, `asr`, `user_script_aligned`, `manual_frame_audit`, or a combined value such as `burned_subtitle_ocr+asr`.
- `alignment_confidence`: `high`, `medium`, or `low`. Low-confidence beats must be checked before editing.
- `timing_status`: `draft`, `needs_review`, or `confirmed`.
- `evidence`: screenshot, subtitle timestamp, waveform note, or ASR cue that proves the timing.
- `semantic_beat`: concise English or snake_case summary.
- `broll_mode`: `overlay`, `replacement`, or `none`.
- `scene_recipe`: one recipe from `scene-recipes.md`.
- `visual_copy`: exact on-screen text to render.
- `safe_zone_notes`: face/subtitle constraints.
- `risk`: what can make this beat look cheap or unreadable.

## Heuristics

- Confirm timing before deciding visuals. A beautiful B-roll scene with the wrong cue is a failed scene.
- Anchor beats to actual speech/subtitle changes, not only to the written script.
- If a script is supplied, align it to the recording before assigning B-roll. Do not assume the speaker read every sentence at the planned time.
- Prefer beat-level timing corrections over one global offset. Use a global offset only when multiple audit points prove the drift is uniform.
- Use `overlay` for short emphasis and continuity.
- Use `replacement` only when a concept would be clearer than the face.
- Use `none` for emotional, reflective, or transition sentences.
- Avoid consecutive replacement scenes longer than 8 seconds unless the whole section is a demo.
