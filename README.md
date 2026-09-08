# Work Visualizer (for Google Antigravity & OpenAI Codex)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform Support](https://img.shields.io/badge/Platforms-Google%20Antigravity%20%7C%20OpenAI%20Codex-orange.svg)]()
[![Model Support](https://img.shields.io/badge/Image%20Models-Google%20Imagen%203%20%7C%20GPT--Image--2-purple.svg)]()
[![Agent Native](https://img.shields.io/badge/Agent-Native%20Self--Install-brightgreen.svg)]()

[English](README.md) | [简体中文](README.zh-CN.md) | [📖 Instructions for AI Agents](AGENTS.md)

`codex-work-visualizer` is a lightweight visual review skill that turns recent AI agent engineering work into a clean, widescreen **PNG technical infographic** for fast human review (roughly 30 seconds).

Originally crafted for OpenAI Codex, **Version 2.0 now brings first-class native support for Google Antigravity & Gemini 3.8 models**, powered by **Google Imagen 3** (`generate_image`) with 16:9 widescreen layouts, multi-agent **Teamwork** progress summaries, and optional companion review artifacts.

---

## ⚡ Instant Setup: Drop to Your Agent

You don't need to manually configure folders. **Simply send this repository URL (or local path) to your AI Agent** (in Google Antigravity, OpenAI Codex, or Claude Code) and say:

> *"Please inspect https://github.com/CheeseBoo/codex-work-visualizer and equip yourself with this skill."*

Your Agent will read [`AGENTS.md`](AGENTS.md), auto-detect its host environment (`~/.gemini/config/skills/` or `~/.codex/skills/`), and install itself non-destructively!

---

## 🎯 When to Use

Trigger the skill anytime with natural commands such as:

- *"可视化一下你刚才做了什么"*
- *"生成本次工作信息图"*
- *"把刚才的工作总结成图片"*
- *"Create a PNG visual recap of what you just did"*
- *"Summarize recent work into an infographic"*

---

## 🚀 Key Features in Version 2.0

### 1. Google Antigravity Native Optimization
- **Imagen 3 Integration**: Natively invokes Antigravity's `generate_image` tool with a dedicated 16:9 or 4:3 widescreen technical dashboard prompt.
- **Teamwork & Multi-Agent Awareness**: Aggregates coordinated outcomes across multiple subagents (Architect, Implementer, QA Verifier) and background task outputs (`tasks`).

### 2. Dual-Track Modality (Visual Card + Companion Artifact)
- **Track 1 (Widescreen Infographic PNG - Default)**: Rapid 30-second executive summary covering goals, actions, changed modules, test badges, and review notes.
- **Track 2 (Companion Review Artifact - Antigravity)**: When detailed code-level auditing is needed, generates a Markdown artifact with exact commit diffs, clickable file links, and test logs.

### 3. Full Backward Compatibility
- Seamlessly falls back to `GPT-Image-2` when running inside the OpenAI Codex environment.

---

## 📊 What the Review Card Contains

A clean, high-signal one-page visual card displaying:

```text
┌────────────────────────────────────────────────────────────────────────┐
│                        PROJECT MILESTONE RECAP                         │
├───────────────────────┬────────────────────────┬───────────────────────┤
│ 🎯 TASK GOAL          │ 📦 CHANGED MODULES     │ 🧪 VALIDATION STATUS  │
│ Enterprise RAG Studio │ • auth/jwt_service     │ ✅ Unit tests passed  │
│ with hybrid retrieval │ • ui/dashboard.tsx     │ ✅ TypeScript clean   │
│                       │ • tests/test_rag.py    │ ⚠️ E2E pending review │
├───────────────────────┴────────────────────────┴───────────────────────┤
│ ✅ COMPLETED ACTIONS                                                   │
│ • Implemented BM25 + dense vector hybrid retrieval pipeline            │
│ • Added responsive KPI metric cards to frontend dashboard              │
│ • Validated 14 unit test cases with zero regression errors             │
├────────────────────────────────────────────────┬───────────────────────┤
│ ⚠️ NEEDS REVIEW                                │ 🚀 NEXT STEP          │
│ • Verify API rate limits under high concurrency│ • Staging deployment  │
└────────────────────────────────────────────────┴───────────────────────┘
```

---

## 📦 Manual Installation

### Automated Installer (Recommended)
```bash
git clone https://github.com/CheeseBoo/codex-work-visualizer.git
cd codex-work-visualizer
bash install.sh
```
The script will automatically detect and link to:
- Google Antigravity: `~/.gemini/config/skills/codex-work-visualizer`
- OpenAI Codex: `~/.codex/skills/codex-work-visualizer`

### Manual Symlink
```bash
# For Google Antigravity
mkdir -p ~/.gemini/config/skills
ln -sfn "$(pwd)" ~/.gemini/config/skills/codex-work-visualizer

# For OpenAI Codex
mkdir -p ~/.codex/skills
ln -sfn "$(pwd)" ~/.codex/skills/codex-work-visualizer
```

---

## 🧪 Validation

Run the test suite to verify skill integrity:

```bash
python3 scripts/validate_skill.py .
```

Expected output:
```text
Skill validation passed.
```

---

## 📂 Repository Layout

```text
codex-work-visualizer/
├── AGENTS.md                         # Agent-native self-installation instructions
├── install.sh                        # Automated cross-platform installer
├── SKILL.md                          # Core skill definition (Antigravity & Codex)
├── README.md                         # English documentation
├── README.zh-CN.md                   # Chinese documentation
├── references/
│   ├── visual-brief-template.md      # Prompt skeleton optimized for Imagen 3 / GPT-Image-2
│   └── interactive-artifact-spec.md  # Companion artifact specification for Antigravity
├── agents/
│   └── openai.yaml                   # OpenAI Codex agent integration manifest
└── scripts/
    └── validate_skill.py             # Skill schema & contract validation script
```

---

## 🌟 Star History

[![Star History Chart](https://api.star-history.com/image?repos=cheeseboo/codex-work-visualizer&type=Date)](https://www.star-history.com/#CheeseBoo/codex-work-visualizer&Date)

---

## 📄 License

Distributed under the [MIT License](LICENSE). Maintained by [CheeseBoo](https://github.com/CheeseBoo) and community contributors.
