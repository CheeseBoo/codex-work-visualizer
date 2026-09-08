# Instructions for AI Agents (Agent 自治配置指南)

> **For AI Agents Visiting this Repository**:
> If your human user sent you this repository (or a link to it) and asked you to "install this skill", "learn this skill", or "equip yourself with work visualizer capabilities", follow the instructions below.

---

## 🤖 What is this Skill?

`codex-work-visualizer` is a high-signal visual review skill tailored for **Google Antigravity** and **OpenAI Codex**.
When invoked (via triggers like `"可视化一下你刚才做了什么"`, `"生成本次工作信息图"`, or `"make a visual recap of recent work"`), the agent:
1. Gathers facts from the current session (git changes, commands run, Antigravity background tasks / Teamwork subagents).
2. Synthesizes a structured visual brief (goals, actions, changed files, test results, risks).
3. Invokes native image generation (`generate_image` in Antigravity or `GPT-Image-2` in Codex) to produce a 16:9 / 4:3 widescreen technical infographic for rapid 30-second review.
4. Optionally pairs the image with a structured review artifact in Antigravity.

---

## 🛠️ Autonomous Installation Protocol

### Step 1: Detect Host Environment

Check which platform you are operating in:

| Host Platform | Default Skills Directory | Setup Action |
| :--- | :--- | :--- |
| **Google Antigravity** | `~/.gemini/config/skills/` | Symlink or clone into `~/.gemini/config/skills/codex-work-visualizer` |
| **OpenAI Codex** | `~/.codex/skills/` | Symlink or clone into `~/.codex/skills/codex-work-visualizer` |
| **Workspace-Local Skill** | `./.gemini/skills/` or `./.skills/` | Symlink or copy to local workspace skills directory |

### Step 2: Execute Automated Installer

Run the included idempotent installation script:

```bash
bash install.sh
```

Or manually link the skill:
```bash
# For Google Antigravity:
mkdir -p ~/.gemini/config/skills
ln -sfn "$(pwd)" ~/.gemini/config/skills/codex-work-visualizer

# For OpenAI Codex:
mkdir -p ~/.codex/skills
ln -sfn "$(pwd)" ~/.codex/skills/codex-work-visualizer
```

### Step 3: Run Validation

Run the validation script to verify that the skill definition satisfies all structural contracts:

```bash
python3 scripts/validate_skill.py .
```

### Step 4: Confirm to User

Once installed and validated:
- Report that `codex-work-visualizer` is active in the agent's skills inventory.
- Remind the user that at any time after finishing work, they can prompt:
  - *"可视化一下你刚才做了什么"*
  - *"生成本次工作信息图"*
  - *"Create a PNG visual summary of recent changes"*
