# Codex Work Visualizer

`codex-work-visualizer` is a lightweight Codex skill that turns recent Codex work into a quick PNG infographic for human review.

It is designed for prompts like:

- "可视化一下你刚才做了什么"
- "生成本次工作信息图"
- "把刚才的工作总结成图片"
- "Create a PNG visual recap of the work you just did"

The skill favors direct GPT-Image-2 / image-generation output over HTML dashboards or scripted chart rendering. It is meant to help a user understand the main actions, changed areas, validation status, and review notes in roughly 30 seconds.

## What It Produces

A one-page visual review card with:

- task goal
- completed actions
- important changed files or modules
- validation status
- review notes and risks
- optional next step

The image is a quick review aid, not a formal audit report. For exact verification, use the underlying conversation, command output, and `git diff`.

## Install

Clone the repository into your Codex skills directory:

```bash
mkdir -p ~/.codex/skills
git clone git@github.com:CheeseBoo/codex-work-visualizer.git ~/.codex/skills/codex-work-visualizer
```

Restart Codex or start a new conversation so the skill list is refreshed.

For remote Codex projects, install it on the remote machine as well:

```bash
mkdir -p ~/.codex/skills
git clone git@github.com:CheeseBoo/codex-work-visualizer.git ~/.codex/skills/codex-work-visualizer
```

## Repository Layout

```text
SKILL.md
agents/openai.yaml
references/visual-brief-template.md
scripts/validate_skill.py
```

## Validate

```bash
python3 scripts/validate_skill.py .
```

Expected result:

```text
Skill validation passed.
```

## Notes

- The repository root is the skill root.
- The skill intentionally does not include an HTML dashboard or deterministic plotting script.
- If image generation is unavailable, the skill falls back to returning the final image prompt and a compact Markdown recap.
