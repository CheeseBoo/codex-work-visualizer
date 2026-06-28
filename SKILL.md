---
name: codex-work-visualizer
description: "Create a quick PNG infographic of recent Codex work using GPT-Image-2 or the available image generation tool. Use when the user asks to visualize what Codex just did, 可视化一下你刚才做了什么, 生成本次工作信息图, 把刚才的工作总结成图片, make a visual summary, create a PNG work recap, or wants a fast visual review card of changed files, completed actions, validation results, risks, and next steps. Prefer direct image generation over HTML, dashboards, or scripted plotting unless the user asks for those."
---

# Codex Work Visualizer

## Core Rule

Create one lightweight PNG work-recap infographic for fast human review. Prioritize visual clarity and truthful summarization over exhaustive audit detail. Do not build an HTML dashboard, SVG pipeline, or Python-rendered chart unless the user explicitly asks or image generation is unavailable.

Use GPT-Image-2 / the session's available image generation tool as the default rendering path. The image is a quick review aid, not a formal audit log.

## Workflow

1. Identify the reviewed scope: usually the work since the user's last task request or since the last final answer.
2. Gather facts from the conversation and, when in a repository, quick local checks:
   - `git status --short`
   - `git diff --stat`
   - targeted `git diff -- <file>` only when needed to understand important edits
3. Extract a compact visual brief:
   - one task goal
   - four to six completed actions
   - three to eight important files/modules
   - validation commands and pass/fail/not-run status
   - one to three risks or review notes
   - one optional next step
4. Read `references/visual-brief-template.md` for the image prompt structure.
5. Call the image generation tool directly with a single infographic prompt. Keep visible text short and concrete. Prefer Chinese labels when the user is speaking Chinese; otherwise use the user's language.
6. Return the generated PNG/image first, then a short note listing the factual basis. If the image tool provides a file path, place or reference it as `work-reports/latest/codex-work-summary.png` when practical.

## Image Content Rules

- Use only facts supported by the conversation, git state, or commands run in the current task.
- Do not invent tests, changed files, progress, failures, or next steps.
- If exact file paths are too long for the image, shorten them to module names and include exact paths in the short note or `image-brief.md` if saved.
- Keep the infographic to one page: title, workflow/timeline, changed areas, validation status, risk notes.
- Use clear status marks: Done, Passed, Failed, Not run, Needs review.
- Avoid dense paragraphs, tiny text, decorative clutter, or excessive file lists.

## Output Defaults

Default visible output:

1. The generated PNG/image.
2. A concise factual note:

```text
Scope:
Basis:
Saved:
Review focus:
```

Optional saved files when the local workspace is available and saving is useful:

```text
work-reports/latest/image-brief.md
work-reports/latest/codex-work-summary.png
```

Do not block the image on perfect audit completeness. If some facts are unavailable, mark them as "not visible" or omit them.

## References

- `references/visual-brief-template.md`: prompt skeleton and compact layout rules for GPT-Image-2.
