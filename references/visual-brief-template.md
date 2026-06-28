# Visual Brief Template

Use this file only when generating the prompt for GPT-Image-2 or another image generation tool.

## Prompt Skeleton

```text
Create a clean one-page technical infographic PNG for a quick Codex work recap.

Language: <Chinese or user's language>
Audience: a researcher/developer who wants to quickly understand what Codex just did.
Tone: professional, concise, review-oriented.

Title:
<short task title>

Sections to show:
1. Task goal: <one line>
2. Completed work: <4-6 short bullets>
3. Key changed areas: <3-8 short file/module labels>
4. Validation status: <passed/failed/not run items>
5. Needs review: <1-3 risk notes or "none identified">
6. Next step: <optional one line>

Visual layout:
- Horizontal or vertical timeline in the center.
- File/module chips grouped by type: code, docs, config, tests, assets, skills.
- Validation panel with clear passed/failed/not-run status.
- Small risk panel at the bottom.
- Use short labels only; no paragraphs.

Style:
- Clean product-engineering infographic.
- White or very light background.
- Calm blue/green for completed work, amber for review notes, red only for failures.
- Flat icons, simple lines, no decorative gradients, no photorealistic scene.
- High readability, large text, balanced spacing.

Accuracy constraints:
- Do not add tasks, files, tests, percentages, or claims not present in the brief.
- If a detail is uncertain, omit it instead of inventing it.
```

## Compression Rules

- Use at most 6 completed-work bullets.
- Use at most 8 file/module labels.
- Use at most 5 validation items.
- Use at most 3 review notes.
- Prefer module labels over long paths inside the image.
- Keep exact commands concise, for example `check_v04.py passed`.

## Good Chinese Labels

- 本次目标
- 已完成
- 重点改动
- 验证状态
- 需要关注
- 下一步

## Fallback

If the image generation tool cannot create or return a PNG, provide the final image prompt and a compact Markdown recap instead. Do not build an HTML report unless the user asks for one.
