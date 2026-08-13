#!/usr/bin/env python3
"""Validate the codex-work-visualizer skill repository."""

from __future__ import annotations

import re
import sys
from pathlib import Path


def fail(message: str) -> None:
    print(f"[ERROR] {message}")
    raise SystemExit(1)


def read(path: Path) -> str:
    try:
        return path.read_text(encoding="utf-8")
    except FileNotFoundError:
        fail(f"missing file: {path}")


def parse_frontmatter(text: str) -> dict[str, str]:
    if not text.startswith("---\n"):
        fail("SKILL.md missing opening frontmatter")
    end = text.find("\n---", 4)
    if end == -1:
        fail("SKILL.md missing closing frontmatter")
    frontmatter = text[4:end]
    result: dict[str, str] = {}
    for key in ("name", "description"):
        match = re.search(rf"^{key}:\s*(.+)$", frontmatter, flags=re.MULTILINE)
        if not match:
            fail(f"SKILL.md missing {key}")
        value = match.group(1).strip().strip('"').strip("'")
        if not value:
            fail(f"SKILL.md has empty {key}")
        result[key] = value
    return result


def main() -> int:
    root = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else Path.cwd().resolve()
    skill = root / "SKILL.md"
    agent = root / "agents" / "openai.yaml"
    template = root / "references" / "visual-brief-template.md"

    fm = parse_frontmatter(read(skill))
    if fm["name"] != "codex-work-visualizer":
        fail("SKILL.md name must be codex-work-visualizer")

    skill_text = read(skill)
    description = fm["description"]
    for trigger in ("可视化一下你刚才做了什么", "生成本次工作信息图", "PNG", "GPT-Image-2"):
        if trigger not in description:
            fail(f"description missing trigger: {trigger}")

    for rule in (
        "Work Mode Gate",
        "conversation-only",
        "code-change",
        "mixed",
        "pre-existing dirty files",
        "default to `conversation-only`",
        "do not run `git status`",
    ):
        if rule not in skill_text:
            fail(f"SKILL.md missing work-mode rule: {rule}")

    agent_text = read(agent)
    if "$codex-work-visualizer" not in agent_text:
        fail("agents/openai.yaml default_prompt must include $codex-work-visualizer")

    template_text = read(template)
    for label in ("Task goal", "Completed work", "Validation status", "Needs review"):
        if label not in template_text:
            fail(f"visual brief template missing section: {label}")

    for label in ("Conversation-only Template", "Code-change / Mixed Template", "No code files"):
        if label not in template_text:
            fail(f"visual brief template missing work-mode section: {label}")

    print("Skill validation passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
