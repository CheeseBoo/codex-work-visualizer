# Interactive Artifact Specification (Antigravity Companion Mode)

In Google Antigravity, users have access to rich Markdown artifacts and inline HTML previews. When the user requests a "detailed review", "复盘面板", or when deep diff inspection is needed, generate a companion artifact alongside the visual PNG.

---

## Artifact Structure & Layout

Create the artifact under the Antigravity session directory (e.g. `<appDataDir>/brain/<conversation-id>/work_recap_artifact.md`).

```markdown
# 📊 Task Execution & Work Recap

> **Scope**: [Description of task milestone]  
> **Status**: [Completed / In Review]  
> **Execution Engine**: [Google Antigravity / Teamwork / Subagents]

---

## 🎯 Task Objectives & Deliverables
- [x] Primary Objective 1
- [x] Primary Objective 2

---

## 🛠️ Key Module Changes

| Component / File | Change Type | Summary of Changes |
| :--- | :--- | :--- |
| `src/core/router.py` | Modified | Added dynamic request routing with retry semantics |
| `src/ui/dashboard.tsx` | Modified | Responsive KPI card layout & metrics binding |
| `tests/test_router.py` | Added | 8 comprehensive unit tests covering edge cases |

---

## 🧪 Verification & Validation Results

| Check / Test Command | Exit Code | Status | Notes |
| :--- | :--- | :--- | :--- |
| `pytest tests/` | 0 | PASSED | 14/14 tests passing |
| `npm run build` | 0 | PASSED | TypeScript check clean, zero warnings |

---

## ⚠️ Review Notes & Next Actions
> [!NOTE]
> Review items, performance notes, or optional follow-up suggestions for the developer.
```

---

## Guidelines for Artifact Generation

1. **Precision**: Include exact git commit hashes and test command results where available.
2. **Non-destructive**: Never overwrite user project documentation; always write to the artifact review space.
3. **Synergy with Image**: The PNG provides immediate visual delight and rapid executive summary; the Artifact provides audit-level precision and clickable file references.
