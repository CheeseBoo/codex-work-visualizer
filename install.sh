#!/usr/bin/env bash
# ==============================================================================
# Work Visualizer (for Google Antigravity & OpenAI Codex) — Quick Installer
# Automatically detects and links the skill to Antigravity and/or Codex directories.
# ==============================================================================

set -euo pipefail

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_NAME="codex-work-visualizer"
TARGET_DIR=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --target)
      TARGET_DIR="$2"
      shift 2
      ;;
    -h|--help)
      echo "Usage: bash install.sh [OPTIONS]"
      echo ""
      echo "Options:"
      echo "  --target <path>      Explicit skills directory to link into"
      echo "  -h, --help           Show this help message"
      exit 0
      ;;
    *)
      echo -e "${RED}Unknown option: $1${NC}"
      exit 1
      ;;
  esac
done

echo -e "${BLUE}==>${NC} Installing ${SKILL_NAME}..."

INSTALLED_ANY=false

# If target directory explicitly specified
if [[ -n "$TARGET_DIR" ]]; then
  mkdir -p "$TARGET_DIR"
  DEST="${TARGET_DIR}/${SKILL_NAME}"
  ln -sfn "$SCRIPT_DIR" "$DEST"
  echo -e "${GREEN}✓ Linked to:${NC} ${DEST}"
  INSTALLED_ANY=true
else
  # Auto-detect Google Antigravity skills directory
  GEMINI_SKILLS="$HOME/.gemini/config/skills"
  if [[ -d "$HOME/.gemini/config" || -d "$GEMINI_SKILLS" ]]; then
    mkdir -p "$GEMINI_SKILLS"
    DEST="${GEMINI_SKILLS}/${SKILL_NAME}"
    ln -sfn "$SCRIPT_DIR" "$DEST"
    echo -e "${GREEN}✓ Installed into Google Antigravity:${NC} ${DEST}"
    INSTALLED_ANY=true
  fi

  # Auto-detect OpenAI Codex skills directory
  CODEX_SKILLS="$HOME/.codex/skills"
  if [[ -d "$HOME/.codex" || -d "$CODEX_SKILLS" ]]; then
    mkdir -p "$CODEX_SKILLS"
    DEST="${CODEX_SKILLS}/${SKILL_NAME}"
    ln -sfn "$SCRIPT_DIR" "$DEST"
    echo -e "${GREEN}✓ Installed into OpenAI Codex:${NC} ${DEST}"
    INSTALLED_ANY=true
  fi

  # Fallback if neither existed
  if [[ "$INSTALLED_ANY" == false ]]; then
    mkdir -p "$GEMINI_SKILLS"
    ln -sfn "$SCRIPT_DIR" "${GEMINI_SKILLS}/${SKILL_NAME}"
    echo -e "${GREEN}✓ Initialized and installed to Antigravity:${NC} ${GEMINI_SKILLS}/${SKILL_NAME}"
    INSTALLED_ANY=true
  fi
fi

# Run validation
echo -e "${BLUE}==>${NC} Running skill validation..."
if python3 "${SCRIPT_DIR}/scripts/validate_skill.py" "${SCRIPT_DIR}"; then
  echo -e "${GREEN}✓ Validation passed!${NC}"
else
  echo -e "${RED}✗ Validation failed.${NC}"
  exit 1
fi

echo ""
echo -e "${GREEN}🎉 ${SKILL_NAME} is ready!${NC}"
echo -e "Try prompting your AI agent with:"
echo -e "  - \"可视化一下你刚才做了什么\""
echo -e "  - \"生成本次工作信息图\""
echo -e "  - \"Create a visual summary of recent changes\""
