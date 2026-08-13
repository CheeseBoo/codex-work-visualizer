---
name: codex-work-visualizer
description: "Create a quick PNG infographic of recent Codex work using GPT-Image-2 or the available image generation tool. Use when the user asks to visualize what Codex just did, 可视化一下你刚才做了什么, 生成本次工作信息图, 把刚才的工作总结成图片, make a visual summary, create a PNG work recap, or wants a fast visual review card for code changes or conversation-only analysis. Classify the work mode first; for conversation-only work, do not inspect code or git diffs. Prefer direct image generation over HTML, dashboards, or scripted plotting unless the user asks for those."
---

# Codex Work Visualizer

## Core Rule

Create one lightweight PNG work-recap infographic for fast human review. Prioritize visual clarity and truthful summarization over exhaustive audit detail. Do not build an HTML dashboard, SVG pipeline, or Python-rendered chart unless the user explicitly asks or image generation is unavailable.

Use GPT-Image-2 / the session's available image generation tool as the default rendering path. The image is a quick review aid, not a formal audit log.

## Work Mode Gate

Classify the reviewed scope before running repository checks or analyzing code:

- `conversation-only`: the current task contains explanation, research, planning, comparison, or decisions, with no confirmed file edit, code execution that changes the repository, commit, push, pull request, or code test.
- `code-change`: the current task contains at least one confirmed file edit, repository-changing code execution, commit, push, pull request, or code test. A commit is not required when a current-task edit is confirmed.
- `mixed`: the current task contains both conversation analysis and confirmed code work. Process it through the `code-change` path and use the conversation as context.

Use evidence from the current task first: the user's request, the assistant's actions, changed files, and validation results. The presence of a repository, pre-existing dirty files, or old commits alone is not evidence of a current code change. If code-change evidence cannot be confirmed, default to `conversation-only`.

For `conversation-only` work, do not run `git status`, `git diff`, or source inspection; do not infer changed modules or report code validation. Build the recap from the conversation and confirmed non-code outputs only.

## Workflow

1. Identify the reviewed scope: usually the work since the user's last task request or since the last final answer.
2. Apply the Work Mode Gate.
3. For `conversation-only`, gather facts only from the conversation and confirmed outputs:
   - one task goal
   - key analysis points and conclusions
   - decisions or open questions
   - one to three risks, uncertainties, or next steps
4. For `code-change` or `mixed`, gather facts from the conversation and, when relevant, quick local checks:
   - `git status --short`
   - `git diff --stat`
   - targeted `git diff -- <file>` only when needed to understand important edits
   Use only current-task changes when possible; do not treat unrelated pre-existing worktree state as completed work.
5. Extract a compact mode-specific visual brief:
   - `conversation-only`: task goal, four to six analysis or decision points, conclusions, open questions, risks, and an optional next step. Omit changed files, code modules, and code validation.
   - `code-change` or `mixed`: task goal, four to six completed actions, three to eight important files/modules, validation status, risks, and an optional next step.
6. Read `references/visual-brief-template.md` for the image prompt structure.
7. Call the image generation tool directly with a single infographic prompt. Keep visible text short and concrete. Prefer Chinese labels when the user is speaking Chinese; otherwise use the user's language.
8. Return the generated PNG/image first, then a short note listing the factual basis. If the image tool provides a file path, place or reference it as `work-reports/latest/codex-work-summary.png` when practical.

## Image Content Rules

- Use only facts supported by the conversation, git state, or commands run in the current task.
- Do not invent tests, changed files, progress, failures, or next steps.
- In `conversation-only` mode, do not add code files, modules, diffs, commits, or code-validation claims.
- If exact file paths are too long for the image, shorten them to module names and include exact paths in the short note or `image-brief.md` if saved.
- Keep the infographic to one page: title, workflow/timeline, mode-appropriate evidence, risk notes.
- Use clear status marks: Done, Passed, Failed, Not run, Needs review.
- Avoid dense paragraphs, tiny text, decorative clutter, or excessive file lists.

## Output Defaults

Default visible output:

1. The generated PNG/image.
2. A concise factual note:

```text
Work mode:
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
