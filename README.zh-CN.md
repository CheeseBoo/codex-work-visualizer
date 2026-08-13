# Codex Work Visualizer

> **从工作到洞察。**

[English](README.md) | [简体中文](README.zh-CN.md)

`codex-work-visualizer` 是一个轻量级 Codex skill，用来把 Codex 刚刚完成的工作整理成一张便于快速审阅的 PNG 信息图，同时兼顾使用便捷性与后续可扩展性。它帮助使用者在面对大量审阅任务时，以尽可能少的时间完成审阅。

它适合这类提示：

- “可视化一下你刚才做了什么”
- “生成本次工作信息图”
- “把刚才的工作总结成图片”
- “Create a PNG visual recap of the work you just did”

你也可以在 Codex 中通过以下任一种形式直接显式调用这个 skill：

```bash
$codex-work-visualizer
# 或
/codex-work-visualizer
```

这个 skill 优先使用 GPT-Image-2 或当前可用的图像生成能力直接生成图片，而不是构建 HTML dashboard 或用脚本绘图。它会先把本次工作区分为“纯对话分析”“代码改动”或“混合工作”：纯对话分析只依据对话和已确认的输出整理，不检查代码或 git diff；确认有代码改动时，才展示改动范围和验证状态。

## 输出内容

它会生成一张单页视觉审阅卡，通常包含：

- 任务目标
- 已完成工作
- 确认有代码工作时的重要改动文件或模块
- 确认有代码工作时的验证状态
- 复核点与风险
- 可选的下一步

这张图片是快速审阅辅助，不是正式审计报告。代码改动工作需要精确核验时，仍应查看原始对话、命令输出和 `git diff`；纯对话分析则以原始对话和已确认的输出为准。

## 工作类型

- `conversation-only`：本次任务只有解释、调研、规划、比较或决策，没有确认的当前任务文件修改、提交、推送、PR 或代码测试。此模式不检查代码或 git diff。
- `code-change`：本次任务确认包含文件修改、改变仓库的代码执行、提交、推送、PR 或代码测试。
- `mixed`：本次任务同时包含对话分析和确认的代码工作，按代码改动路径处理，并保留对话作为背景。

判断优先使用当前任务中的证据。仓库原本存在的未提交文件或历史提交，不能单独证明本次任务修改了代码。如果无法确认有代码改动，默认按 `conversation-only` 处理。

## 安装

### 让 Agent 自动安装（推荐）

我们更推荐让 Codex、Claude Code 或其他 AI 编程 Agent 自动安装这个 skill。你只需要把 GitHub 仓库地址交给 Agent，让它将 skill 安装到当前工具实际使用的 skills 目录，并运行验证脚本。

可用提示词：

```text
请把 https://github.com/CheeseBoo/codex-work-visualizer 安装为本地 AI skill。
把它克隆到 ~/.codex/skills/codex-work-visualizer，阅读 SKILL.md，并运行验证脚本。
如果当前是远程开发会话，请安装到实际运行 Agent 的远程机器上。
```

### 手动安装

如果你希望自己安装，也可以把仓库克隆到 Codex 的 skills 目录：

```bash
mkdir -p ~/.codex/skills
git clone git@github.com:CheeseBoo/codex-work-visualizer.git ~/.codex/skills/codex-work-visualizer
```

然后重启 Codex，或开启一个新对话，让 skill 列表刷新。

### 远程使用 Codex 项目

如果你使用的是远程 Codex 项目，也需要在远程机器上安装：

```bash
mkdir -p ~/.codex/skills
git clone git@github.com:CheeseBoo/codex-work-visualizer.git ~/.codex/skills/codex-work-visualizer
```

虽然这个仓库按 Codex skill 打包，但核心工作流是清晰的 Markdown 指令。你也可以很方便地把 `SKILL.md` 中的核心说明迁移到 Claude Code、Cursor 或其他类似 AI 工具的项目指令或 Agent 指令机制中。

## 仓库结构

```text
SKILL.md
agents/openai.yaml
references/visual-brief-template.md
scripts/validate_skill.py
```

## 验证

```bash
python3 scripts/validate_skill.py .
```

预期输出：

```text
Skill validation passed.
```

## 说明

- 仓库根目录就是 skill 根目录。
- 这个 skill 刻意不包含 HTML dashboard 或确定性绘图脚本。
- 如果图像生成能力不可用，skill 会退回为输出最终图片提示词和一份紧凑的 Markdown 总结。

## Star History

[![Star History Chart](https://api.star-history.com/image?repos=cheeseboo/codex-work-visualizer&type=Date)](https://www.star-history.com/#CheeseBoo/codex-work-visualizer&Date)

这张图由外部 star-history 服务生成。仓库公开时，它可以展示实时星标数据；私有仓库通常不会向第三方图表服务暴露数据。这里使用 PNG 端点而不是 SVG 端点，因为 SVG 版本会内嵌一个远程 GitHub 头像，在 GitHub README 渲染时可能显示为破损图片。
