# Work Visualizer (AI Agent 工作信息图与复盘可视化技能)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform Support](https://img.shields.io/badge/Platforms-Google%20Antigravity%20%7C%20OpenAI%20Codex-orange.svg)]()
[![Model Support](https://img.shields.io/badge/Image%20Models-Google%20Imagen%203%20%7C%20GPT--Image--2-purple.svg)]()
[![Agent Native](https://img.shields.io/badge/Agent-Native%20Self--Install-brightgreen.svg)]()

[English](README.md) | [简体中文](README.zh-CN.md) | [📖 Instructions for AI Agents (Agent 自治配置)](AGENTS.md)

`codex-work-visualizer` 是一个轻量级的人机协同成果可视化技能，旨在将 AI 智能体最近完成的软件工程与代码改动，快速转变为高可读性的 **16:9 / 4:3 宽屏技术信息图 (PNG)**，供工程师或研究员在 30 秒内完成高效审阅。

最初为 OpenAI Codex 打造，**全新的 2.0 版本全面深度适配 Google Antigravity 与 Gemini 3.8 模型**，支持 **Google Imagen 3** (`generate_image`) 原生宽屏绘图、**Teamwork 多智能体协同成果汇总**以及**交互式复盘工件**。

---

## ⚡ 极简配置：直接甩给你的 Agent

你无需手动查找路径或创建文件夹。**只需将本仓库的 GitHub 链接（或本地路径）直接发给你的 AI Agent**（无论是 Google Antigravity、OpenAI Codex 还是 Claude Code）：

> *“请检查 https://github.com/CheeseBoo/codex-work-visualizer 并为自己配置上这个技能。”*

Agent 将自动阅读 [`AGENTS.md`](AGENTS.md)，自动识别宿主环境（`~/.gemini/config/skills/` 或 `~/.codex/skills/`），并通过无损安装脚本完成自闭环配置！

---

## 🎯 触发方式与使用场景

在会话中完成一系列任务后，随时输入如下指令即可触发：

- **“可视化一下你刚才做了什么”**
- **“生成本次工作信息图”**
- **“把刚才的工作总结成图片”**
- **“做一张工作复盘卡片”**
- **“Create a PNG visual recap of what you just did”**

---

## 🚀 2.0 版本核心升级亮点

### 1. Google Antigravity 原生深度集成
- **Imagen 3 引擎直调**：在 Antigravity 中自动调用原生 `generate_image` 工具，默认生成适合技术看板展示的 `16:9` 或 `4:3` 宽屏信息图。
- **Teamwork 多智能体感知**：自动识别 Antigravity 后台后台长任务（`tasks`）及 Teamwork 子 Agent 团队（如 Architect、Developer、Verifier）的协同产出，自动梳理分工矩阵。

### 2. 双轨呈现模式 (Dual-Track Modality)
- **轨道 1（视觉信息图 PNG - 默认）**：30 秒极速审阅卡片，包含本次目标、已完成动作、重点改动模块芯片、测试通过徽章与风险提示。
- **轨道 2（交互式复盘工件 - Antigravity 增强）**：当用户需要深度代码级审查时，自动生成 Antigravity 伴随工件（Markdown Artifact），包含真实 Git Commit 树、测试终端日志与可点击文件路径。

### 3. 完整向下兼容
- 在 OpenAI Codex 环境中依然完美运行，自动降级并调用 `GPT-Image-2` 或标准渲染路径。

---

## 📊 视觉卡片呈现内容

一张清晰、高信噪比的技术复盘看板：

```text
┌────────────────────────────────────────────────────────────────────────┐
│                        PROJECT MILESTONE RECAP                         │
├───────────────────────┬────────────────────────┬───────────────────────┤
│ 🎯 本次目标           │ 📦 重点改动模块        │ 🧪 验证状态           │
│ 企业级轻量化 RAG 平台 │ • auth/jwt_service     │ ✅ 单测全部通过 (14)  │
│ 与混合检索流水线搭建  │ • ui/dashboard.tsx     │ ✅ TypeScript 零告警  │
│                       │ • tests/test_rag.py    │ ⚠️ E2E 待回归         │
├───────────────────────┴────────────────────────┴───────────────────────┤
│ ✅ 已完成工作                                                          │
│ • 实现了 BM25 与 Dense 向量混合重排检索流水线                          │
│ • 完成了前端工作台响应式 KPI 指标卡片布局与数据绑定                    │
│ • 编写并执行了 14 个端到端单测用例，验证核心路由与鉴权逻辑             │
├────────────────────────────────────────────────┬───────────────────────┤
│ ⚠️ 需要关注                                    │ 🚀 下一步             │
│ • 高并发场景下的向量缓存淘汰策略需压测验证     │ • 提交预发测试环境    │
└────────────────────────────────────────────────┴───────────────────────┘
```

---

## 📦 手动安装与集成

### 自动化脚本安装（推荐）
```bash
git clone https://github.com/CheeseBoo/codex-work-visualizer.git
cd codex-work-visualizer
bash install.sh
```
安装脚本将自动探测环境并建立软链接至：
- Google Antigravity: `~/.gemini/config/skills/codex-work-visualizer`
- OpenAI Codex: `~/.codex/skills/codex-work-visualizer`

### 手动建立软链接
```bash
# Google Antigravity
mkdir -p ~/.gemini/config/skills
ln -sfn "$(pwd)" ~/.gemini/config/skills/codex-work-visualizer

# OpenAI Codex
mkdir -p ~/.codex/skills
ln -sfn "$(pwd)" ~/.codex/skills/codex-work-visualizer
```

---

## 🧪 技能规范校验

执行自动化测试脚本检验契约完整性：

```bash
python3 scripts/validate_skill.py .
```

预期通过输出：
```text
Skill validation passed.
```

---

## 📂 仓库结构

```text
codex-work-visualizer/
├── AGENTS.md                         # 专供 AI Agent 阅读的自发现与自治安装指南
├── install.sh                        # 跨平台一键安装脚本（支持 Antigravity / Codex）
├── SKILL.md                          # 核心技能定义（支持 Imagen 3 / Teamwork / Codex）
├── README.md                         # 英文文档
├── README.zh-CN.md                   # 中文文档
├── references/
│   ├── visual-brief-template.md      # 针对 Imagen 3 与 16:9 画幅优化的 Prompt 模板
│   └── interactive-artifact-spec.md  # Antigravity 交互式复盘工件生成规范
├── agents/
│   └── openai.yaml                   # 原生 OpenAI Codex 接口清单
└── scripts/
    └── validate_skill.py             # 技能契约自动化校验脚本
```

---

## 🌟 Star History

[![Star History Chart](https://api.star-history.com/image?repos=cheeseboo/codex-work-visualizer&type=Date)](https://www.star-history.com/#CheeseBoo/codex-work-visualizer&Date)

---

## 📄 开源许可证

本项目基于 [MIT License](LICENSE) 开源。由 [CheeseBoo](https://github.com/CheeseBoo) 与社区贡献者共同维护。
