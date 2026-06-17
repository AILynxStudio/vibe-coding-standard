#!/bin/bash
# Vibe Coding SKILL 一键安装脚本
# 使用方式：chmod +x quick-install.sh && ./quick-install.sh

echo "🚀 开始安装 Vibe Coding SKILL..."

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$SCRIPT_DIR/skill"

# 检查skill目录是否存在
if [ ! -d "$SKILL_DIR" ]; then
    echo "❌ 错误：找不到skill目录"
    exit 1
fi

# 检测已安装的AI工具
CLAUDE_PATH="$HOME/.claude/skills"
CURSOR_PATH="$HOME/.cursor/skills"
VSCODE_PATH="$HOME/.vscode/skills"

INSTALLED=false

# 安装到Claude Code（单文件方式）
if [ -d "$HOME/.claude" ]; then
    echo "📦 检测到Claude Code，正在安装..."
    TARGET_DIR="$CLAUDE_PATH/vibe-coding"
    mkdir -p "$TARGET_DIR"
    cp "$SKILL_DIR/SKILL.md" "$TARGET_DIR/SKILL.md"
    echo "✅ 已安装到Claude Code: $TARGET_DIR"
    INSTALLED=true
fi

# 安装到Cursor（完整目录方式）
if [ -d "$CURSOR_PATH" ]; then
    echo "📦 检测到Cursor，正在安装..."
    TARGET_DIR="$CURSOR_PATH/vibe-coding"
    if [ -d "$TARGET_DIR" ]; then
        rm -rf "$TARGET_DIR"
    fi
    cp -r "$SKILL_DIR" "$TARGET_DIR"
    echo "✅ 已安装到Cursor: $TARGET_DIR"
    INSTALLED=true
fi

# 安装到VSCode（完整目录方式）
if [ -d "$VSCODE_PATH" ]; then
    echo "📦 检测到VSCode，正在安装..."
    TARGET_DIR="$VSCODE_PATH/vibe-coding"
    if [ -d "$TARGET_DIR" ]; then
        rm -rf "$TARGET_DIR"
    fi
    cp -r "$SKILL_DIR" "$TARGET_DIR"
    echo "✅ 已安装到VSCode: $TARGET_DIR"
    INSTALLED=true
fi

if [ "$INSTALLED" = true ]; then
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
else
    echo "❌ 未检测到Claude Code、Cursor或VSCode"
    echo "请先安装AI工具，然后再运行此脚本"
fi
