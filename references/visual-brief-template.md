# Visual Brief Template

Use this file when generating the prompt for **Google Antigravity (`generate_image` / Imagen 3)**, **GPT-Image-2**, or another available image generation tool.

---

## Mode Selection

Apply the Work Mode Gate in `SKILL.md` before choosing a template:
- Use the **Conversation-only Template** when no current-task code-change evidence is confirmed.
- Use the **Code-change / Mixed Template** when the current task includes confirmed code edits, command tests, or repository changes.

---

## Conversation-only Template

Use this prompt skeleton when the reviewed scope is strictly conversational (planning, research, architectural analysis, Q&A):

```text
Create a clean, professional, widescreen 16:9 conversation-analysis infographic PNG recapping recent AI software engineering discussions.

Language: <Chinese or user's language>
Audience: A software engineer, researcher, or team lead who wants a quick 30-second visual overview of the conclusions and decisions.
Visual Style: Modern product-engineering dashboard aesthetic, clean white or light background, crisp card containers, flat modern icons, high-contrast readable typography.

Title:
<Short, clear discussion / task title>

Sections to show:
1. Task goal: <One clear, concrete sentence>
2. Completed work: <4 to 6 concise analysis points, trade-off evaluations, or benchmark comparisons>
3. Conclusions & Key Decisions: <3 to 5 clear takeaway points or architectural choices>
4. Needs review: <1 to 3 open questions, uncertainties, or risks; or "None identified">
5. Next step: <Optional one-line actionable recommendation>

Visual layout & constraints:
- A clear reasoning / decision timeline in the center.
- Insight and decision cards instead of file/module chips.
- No code files, source modules, git diffs, commits, or code-validation panel.
- Validation status: Mark as "Conceptual Analysis / Planning (No code changes)".
- Use short labels only; no dense paragraphs.
```

---

## Code-change / Mixed Template

Use this prompt skeleton when the task contains confirmed code modifications, test executions, or builds:

```text
Create a clean, professional, widescreen 16:9 technical infographic PNG recapping recent AI software engineering work.

Language: <Chinese or user's language>
Audience: A software engineer, researcher, or team lead who wants a rapid 30-second visual overview of what was accomplished.
Visual Style: Modern product-engineering dashboard aesthetic, clean white or light background, crisp card containers, flat modern icons, high-contrast readable typography.

Title:
<Short, impactful project / task title>

Sections to show:
1. Task goal: <One clear, concrete sentence>
2. Completed work: <4 to 6 concise bullet points with status badges>
3. Key changed areas: <3 to 8 module or component chips grouped logically, e.g. Frontend, API, Database, Tests>
4. Validation status: <Passed / Failed / Not run verification items with green/red indicator badges>
5. Needs review: <1 to 3 concise caveats, architectural risks, or "None identified">
6. Next step: <Optional one-line actionable recommendation>

Layout & Visual Hierarchy:
- Header: Task title and high-level status banner.
- Central Grid:
  - Left column: Completed work timeline / action cards.
  - Middle column: Key changed architecture modules / component badges.
  - Right column: Validation & test results matrix.
- Footer: Needs review callout box and next steps.
- Color Palette:
  - Slate gray / deep navy for text and borders.
  - Vibrant blue / indigo for primary headers.
  - Emerald green for completed milestones and passed tests.
  - Amber / warm orange for review notes.
  - Soft red for test errors or blockers.

Accuracy constraints:
- Do not add tasks, files, tests, percentages, or claims not present in the brief.
- If a detail is uncertain, omit it instead of inventing it.
```

---

## Compression & Clarity Rules

- **Completed work**: Maximum 6 concise items.
- **Key changed areas**: Maximum 8 module chips. Use module names (e.g., `auth/service`, `ui/dashboard`) rather than full file paths.
- **Validation status**: Maximum 5 verification items (e.g., `Unit tests (14 passed)`, `Build (0 errors)`).
- **Needs review**: Maximum 3 items.
- **Typography**: Emphasize bold header labels and clear hierarchy. Never output walls of tiny text.

---

## Recommended Bilingual Status Labels

| Section | Chinese Label (中文) | English Label | Status Badge |
| :--- | :--- | :--- | :--- |
| Goal | **本次目标** | **Task Goal** | 🎯 Goal |
| Actions | **已完成工作** | **Completed Work** | ✅ Done |
| Modules | **重点改动模块** | **Key Changed Areas** | 📦 Modules |
| Verification | **验证状态** | **Validation Status** | 🧪 Verified / Passed |
| Notes | **需要关注 / 风险** | **Needs Review** | ⚠️ Review |
| Next | **下一步计划** | **Next Step** | 🚀 Next |

---

## Fallback

If the active image generation tool cannot create or return a PNG:
1. Provide the final image prompt and a compact Markdown recap instead.
2. In Google Antigravity, generate the companion Markdown artifact as detailed in `references/interactive-artifact-spec.md`.
