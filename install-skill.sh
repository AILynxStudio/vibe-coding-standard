#!/bin/bash
# Vibe Coding SKILL 一键安装脚本
# 使用方式：在任意文件夹执行 bash install-skill.sh

echo "🚀 开始安装 Vibe Coding SKILL..."

# 检测已安装的AI工具
CURSOR_PATH="$HOME/.cursor/skills"
VSCODE_PATH="$HOME/.vscode/skills"
CLAUDE_PATH="$HOME/.claude/skills"

INSTALLED=0

# 安装到Claude Code
if [ -d "$HOME/.claude" ]; then
    TARGET_PATH="$CLAUDE_PATH/vibe-coding"
    echo "📦 检测到Claude Code，安装到: $TARGET_PATH"
    mkdir -p "$TARGET_PATH"
    cp "$(dirname "$0")/skill/SKILL.md" "$TARGET_PATH/SKILL.md"
    echo "✅ Claude Code 安装完成"
    INSTALLED=1
fi

# 安装到Cursor
if [ -d "$HOME/.cursor" ]; then
    TARGET_PATH="$CURSOR_PATH/vibe-coding"
    echo "📦 检测到Cursor，安装到: $TARGET_PATH"
    mkdir -p "$TARGET_PATH"
    cp -r "$(dirname "$0")/skill/"* "$TARGET_PATH/"
    echo "✅ Cursor 安装完成"
    INSTALLED=1
fi

# 安装到VSCode
if [ -d "$HOME/.vscode" ]; then
    TARGET_PATH="$VSCODE_PATH/vibe-coding"
    echo "📦 检测到VSCode，安装到: $TARGET_PATH"
    mkdir -p "$TARGET_PATH"
    cp -r "$(dirname "$0")/skill/"* "$TARGET_PATH/"
    echo "✅ VSCode 安装完成"
    INSTALLED=1
fi

if [ "$INSTALLED" -eq 0 ]; then
    echo "❌ 未检测到Claude Code、Cursor或VSCode，请先安装AI工具"
    exit 1
fi

echo ""
echo "🎉 安装完成！"
echo ""
echo "📖 使用方法："
echo ""
echo "【Claude Code】"
echo "  在任意项目目录输入 /vibe-coding 即可加载标准"
echo ""
echo "【Cursor / VSCode】"
echo "  1. 打开Cursor或VSCode"
echo "  2. 创建新项目目录"
echo "  3. 输入 /vibe-coding 命令"
echo "  4. 按AI引导完成项目开发"
