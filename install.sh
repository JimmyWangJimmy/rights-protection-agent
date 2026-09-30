#!/usr/bin/env bash
# install.sh - Unix/macOS one-liner installer for rights-protection-agent

set -e

TARGET_DIR="$HOME/.claude/skills/rights-protection-agent"
echo -e "\033[36mInstalling rights-protection-agent to: $TARGET_DIR\033[0m"

rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR/references"

BASE_URL="https://raw.githubusercontent.com/JimmyWangJimmy/rights-protection-agent/main"

FILES=(
    "SKILL.md"
    "references/cases.md"
    "references/channels.md"
    "references/document-templates.md"
    "references/evidence.md"
    "references/excuses.md"
    "references/laws.md"
    "references/strategies.md"
)

for file in "${FILES[@]}"; do
    echo -e "  \033[90m-> Downloading $file...\033[0m"
    curl -sSL "$BASE_URL/.agents/skills/rights-protection-agent/$file" -o "$TARGET_DIR/$file"
done

echo -e "\n\033[32mSuccessfully installed rights-protection-agent!\033[0m"
echo -e "\033[32mYou can now use it in Claude Code or your agent environment.\033[0m"
