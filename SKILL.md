---
name: codex-work-visualizer
description: "Create a quick PNG infographic of recent AI agent work using Google Antigravity (generate_image / Imagen 3), GPT-Image-2, or the session's available image tool. Use when the user asks to visualize what the agent just did, 可视化一下你刚才做了什么, 生成本次工作信息图, 把刚才的工作总结成图片, make a visual summary, create a PNG work recap, or wants a fast visual review card for code changes or conversation-only analysis. Classify the work mode first; for conversation-only work, do not inspect code or git diffs. Natively optimized for Google Antigravity & OpenAI Codex."
---

# Work Visualizer (for Google Antigravity & OpenAI Codex)

## Core Rule

Create one lightweight, high-signal PNG work-recap infographic for fast human review (roughly 30 seconds). Prioritize visual clarity and truthful summarization over exhaustive audit detail.

- In **Google Antigravity**: Call `generate_image` natively (prefer `AspectRatio="16:9"` or `"4:3"` for technical dashboards). When the user explicitly requests an interactive review or full breakdown, also provide a companion Markdown artifact.
- In **OpenAI Codex**: Call `GPT-Image-2` / the session's available image generation tool as the default rendering path.
- In generic environments: Generate the image via the active image-generation tool, or fall back to the structured visual brief and Markdown recap.

The visual recap is a quick review aid, not a formal or blocking audit log.

---

## Work Mode Gate

Classify the reviewed scope before running repository checks or analyzing code:

- `conversation-only`: the current task contains explanation, research, planning, comparison, or decisions, with no confirmed file edit, code execution that changes the repository, commit, push, pull request, or code test.
- `code-change`: the current task contains at least one confirmed file edit, repository-changing code execution, commit, push, pull request, or code test. A commit is not required when a current-task edit is confirmed.
- `mixed`: the current task contains both conversation analysis and confirmed code work. Process it through the `code-change` path and use the conversation as context.

Use evidence from the current task first: the user's request, the assistant's actions, changed files, background task logs, and validation results. The presence of a repository, pre-existing dirty files, or old commits alone is not evidence of a current code change. If code-change evidence cannot be confirmed, default to `conversation-only`.

For `conversation-only` work, do not run `git status`, `git diff`, or source inspection; do not infer changed modules or report code validation. Build the recap from the conversation and confirmed non-code outputs only.

---

## Workflow

1. **Identify Reviewed Scope**:
   - The actions taken since the user's last task request or since the last major milestone.
   - For multi-agent tasks (such as Antigravity Teamwork / subagents), summarize the coordinated outcomes across roles.

2. **Apply Work Mode Gate**:
   - Determine whether the scope is `conversation-only`, `code-change`, or `mixed`.

3. **Gather Factual Evidence**:
   - **For `conversation-only`**:
     - Extract task goal, key analysis points, decisions/conclusions, and next steps strictly from the dialogue.
   - **For `code-change` or `mixed`**:
     - Check tool execution results and Antigravity background task logs under `.system_generated/tasks/` if applicable.
     - Inspect git state: `git status --short`, `git diff --stat`, and targeted diffs for critical edits.
     - Isolate current-task edits; do not treat unrelated pre-existing dirty files as completed work.

4. **Extract Compact Visual Brief**:
   - Read `references/visual-brief-template.md` for mode-specific prompt structures:
     - `conversation-only`: Goal, analysis points, decisions, open questions/risks, next step. No code files or code validation.
     - `code-change` / `mixed`: Task goal, completed actions, key changed areas (modules), validation status, needs review notes, next step.

5. **Render the Visual Output**:
   - **In Google Antigravity**:
     Call `generate_image` directly:
     ```python
     generate_image(
         Prompt="<Structured Infographic Prompt based on visual-brief-template.md>",
         ImageName="work_recap_infographic",
         AspectRatio="16:9" # or "4:3"
     )
     ```
   - **In OpenAI Codex / Other**:
     Call `GPT-Image-2` or the available session image generation tool.

6. **Deliver Response**:
   - Return the generated PNG/image first.
   - Follow with a concise factual recap note:
     ```text
     Work mode: <conversation-only | code-change | mixed>
     Scope: <reviewed scope>
     Basis: <git / commands / tasks reviewed>
     Review focus: <key highlights or next actions>
     ```

---

## Image Content Rules

- **Truthful Only**: Use only facts supported by the conversation, git state, or executed commands. Never invent tests, files, metrics, or passes.
- **Mode Discipline**: In `conversation-only` mode, do not add code files, modules, diffs, commits, or code-validation claims.
- **Short Labels**: Avoid dense paragraphs or tiny unreadable code blocks. Shorten long paths to module names (e.g., `src/auth` instead of `/path/to/src/auth/jwt.py`).
- **Clear Status Indicators**: Use unmistakable status badges (Done, Passed, Failed, Not run, Needs review).
- **Clean Color Semantics**:
  - Slate/navy for structure and headers.
  - Emerald green for completed work and passed tests.
  - Amber/orange for warnings or review notes.
  - Crimson red strictly reserved for test failures.
- **Language Alignment**: Prefer Chinese labels when the user converses in Chinese; otherwise use English or user's primary language.

---

## Output Defaults

1. **Default visible output**:
   - The generated PNG infographic.
   - A concise factual note (Work mode, Scope, Basis, Review focus).

2. **Optional companion artifact (Antigravity mode)**:
   - When the user asks for "详细复盘", "打开复盘看板", or when code diffs are complex, generate an artifact (`references/interactive-artifact-spec.md`) detailing the exact commit hashes, file changes, and validation logs.

---

## References

- `references/visual-brief-template.md`: Mode-specific prompt skeletons for Google Imagen 3 and GPT-Image-2.
- `references/interactive-artifact-spec.md`: Companion artifact specification for Antigravity Webview / Markdown reviews.
