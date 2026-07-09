# No-Twitch Export And QC Protocol

Use this reference before final render/export. The goal is to preserve the original talking-head footage and avoid subtle person-frame jitter from reprocessing the source video inside Remotion.

## Required Path

1. Probe the source video with `ffprobe`.
2. Set Remotion `durationInFrames` from source `nb_frames`.
3. Confirm the overlay composition has transparent background and no source `<Video>`.
4. Render Remotion as PNG sequence with alpha.
5. Verify sequence count, dimensions, and alpha.
6. Composite sequence over the original video with ffmpeg.
7. Probe final export.
8. Generate a contact sheet and visually inspect it.

## Source Probe Checks

Record:

- video codec, width, height, fps, duration, `nb_frames`
- pixel format and color tags
- audio codec, sample rate, channels, duration

For iPhone/Mac vertical talking-head footage, common values are:

- 1080x1920
- 30fps
- HEVC source video
- AAC audio
- BT.709 color tags

## Remotion Overlay Checks

Before rendering:

- Search the composition for `<Video>`. The overlay-only composition should not contain the source video.
- Confirm `backgroundColor: "transparent"` on the overlay root.
- Confirm the composition duration equals source `nb_frames`.
- Confirm public screenshot paths resolve.

Render command pattern:

```bash
remotion render src/index.ts COMPOSITION_ID overlay-frames \
  --sequence \
  --image-format=png \
  --image-sequence-pattern='overlay-[frame].[ext]' \
  --concurrency=3
```

## Sequence Checks

Expected:

- PNG count equals source `nb_frames`.
- First, middle, and last files have alpha.
- Each checked file is 1080x1920 for vertical source footage.
- File names should match `overlay-0000.png` through the final zero-indexed frame.

## Final ffmpeg Composite

Use this filter shape:

```text
[0:v]setpts=PTS-STARTPTS[base];
[1:v]format=rgba,setpts=PTS-STARTPTS[ov];
[base][ov]overlay=0:0:format=auto:eof_action=pass,format=yuv420p[v]
```

Map video from `[v]` and audio from `0:a?`. Use H.264/AAC MP4 for Douyin upload compatibility.

## Final Export Acceptance

Accept only if:

- final video is H.264, 1080x1920, 30fps, `yuv420p`
- BT.709 tags are present
- audio stream exists
- duration matches source closely
- contact sheet shows no overlay covering face or burned-in subtitles
- real screenshots look real and legible
