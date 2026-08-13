# Codex Work Visualizer

> **From work to insight.**

[English](README.md) | [简体中文](README.zh-CN.md)

[![GitHub stars](https://img.shields.io/github/stars/CheeseBoo/codex-work-visualizer?style=flat)](https://github.com/CheeseBoo/codex-work-visualizer)
[![CI](https://github.com/CheeseBoo/codex-work-visualizer/actions/workflows/validate.yml/badge.svg)](https://github.com/CheeseBoo/codex-work-visualizer/actions/workflows/validate.yml)
[![Release](https://img.shields.io/github/v/release/CheeseBoo/codex-work-visualizer?style=flat)](https://github.com/CheeseBoo/codex-work-visualizer/releases)
[![License](https://img.shields.io/github/license/CheeseBoo/codex-work-visualizer?style=flat)](https://github.com/CheeseBoo/codex-work-visualizer/blob/main/LICENSE)

[![Last commit](https://img.shields.io/github/last-commit/CheeseBoo/codex-work-visualizer?style=flat)](https://github.com/CheeseBoo/codex-work-visualizer/commits/main)
[![Issues](https://img.shields.io/github/issues/CheeseBoo/codex-work-visualizer?style=flat)](https://github.com/CheeseBoo/codex-work-visualizer/issues)

`codex-work-visualizer` is a lightweight Codex skill that turns recent Codex work into a quick PNG infographic for human review, while keeping the workflow easy to use and extensible. It helps users get through large volumes of review work in as little time as possible.

It is designed for prompts like:

- "Visualize what you just did"
- "Generate an infographic for this work"
- "Turn the work you just did into an image summary"
- "Create a PNG visual recap of the work you just did"

You can also invoke the skill directly in Codex with either of these forms:

```bash
$codex-work-visualizer
# or
/codex-work-visualizer
```

The skill favors direct GPT-Image-2 / image-generation output over HTML dashboards or scripted chart rendering. It first classifies the work as conversation-only, code-change, or mixed. Conversation-only work is summarized from the conversation without inspecting code or git diffs; code-change work includes changed areas and validation status.

## What It Produces

A one-page visual review card with:

- task goal
- completed actions
- important changed files or modules when code work is confirmed
- validation status when code work is confirmed
- review notes and risks
- optional next step

The image is a quick review aid, not a formal audit report. For code-change work, use the underlying conversation, command output, and `git diff` for exact verification. For conversation-only work, use the underlying conversation and confirmed outputs.

## Work Modes

- `conversation-only`: explanation, research, planning, comparison, or decisions without a confirmed current-task file edit, commit, push, pull request, or code test. The skill does not inspect code or git diffs.
- `code-change`: the current task includes confirmed file changes, repository-changing code execution, commits, pushes, pull requests, or code tests.
- `mixed`: the current task includes both conversation analysis and confirmed code work; it follows the code-change path while retaining the conversation as context.

Current-task evidence takes priority. A repository's pre-existing dirty files or old commits do not prove that the current task changed code. When code-change evidence is unclear, the skill defaults to `conversation-only`.

## Install

### Agent-Assisted Install (Recommended)

We recommend asking Codex, Claude Code, or another AI coding agent to install the skill automatically. Give the agent this GitHub repository URL and ask it to place the skill in the active skills directory and run the validation script.

Suggested prompt:

```text
Install https://github.com/CheeseBoo/codex-work-visualizer as a local AI skill.
Clone it into ~/.codex/skills/codex-work-visualizer, read SKILL.md, and run the validation script.
If this is a remote development session, install it on the remote machine that runs the agent.
```

### Manual Install

If you prefer to install the skill yourself, clone the repository into your Codex skills directory:

```bash
mkdir -p ~/.codex/skills
git clone git@github.com:CheeseBoo/codex-work-visualizer.git ~/.codex/skills/codex-work-visualizer
```

Restart Codex or start a new conversation so the skill list is refreshed.

### Remote Codex Projects

For remote Codex projects, install it on the remote machine as well:

```bash
mkdir -p ~/.codex/skills
git clone git@github.com:CheeseBoo/codex-work-visualizer.git ~/.codex/skills/codex-work-visualizer
```

Although this repository is packaged as a Codex skill, the workflow is intentionally simple Markdown guidance. It can be adapted easily for Claude Code, Cursor, or other similar AI coding tools by copying the core instructions from `SKILL.md` into that tool's project or agent-instruction mechanism.

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
- If you find this repository useful, please star it to follow future updates.
