#!/bin/bash
# Vibe Coding Skill 安装脚本

set -e

echo "🚀 安装 Vibe Coding Skill..."

# 检查是否在正确的目录
if [ ! -f "SKILL.md" ]; then
    echo "❌ 请在skill目录中运行此脚本"
    exit 1
fi

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 检测操作系统
OS="$(uname -s)"
case "$OS" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*|MINGW*|MSYS*) MACHINE=Windows;;
    *)          MACHINE="UNKNOWN"
esac

echo "📊 检测到系统: $MACHINE"

# 安装到Cursor
install_to_cursor() {
    CURSOR_SKILLS_DIR="$HOME/.cursor/skills"
    mkdir -p "$CURSOR_SKILLS_DIR"
    
    if [ -d "$CURSOR_SKILLS_DIR/vibe-coding" ]; then
        echo "⚠️  Cursor skill已存在，更新中..."
        rm -rf "$CURSOR_SKILLS_DIR/vibe-coding"
    fi
    
    cp -r "$SCRIPT_DIR" "$CURSOR_SKILLS_DIR/vibe-coding"
    echo "✅ 已安装到Cursor: $CURSOR_SKILLS_DIR/vibe-coding"
}

# 安装到VSCode
install_to_vscode() {
    VSCODE_SKILLS_DIR="$HOME/.vscode/skills"
    mkdir -p "$VSCODE_SKILLS_DIR"
    
    if [ -d "$VSCODE_SKILLS_DIR/vibe-coding" ]; then
        echo "⚠️  VSCode skill已存在，更新中..."
        rm -rf "$VSCODE_SKILLS_DIR/vibe-coding"
    fi
    
    cp -r "$SCRIPT_DIR" "$VSCODE_SKILLS_DIR/vibe-coding"
    echo "✅ 已安装到VSCode: $VSCODE_SKILLS_DIR/vibe-coding"
}

# 创建符号链接（开发模式）
install_symlink() {
    CURSOR_SKILLS_DIR="$HOME/.cursor/skills"
    VSCODE_SKILLS_DIR="$HOME/.vscode/skills"
    
    mkdir -p "$CURSOR_SKILLS_DIR" "$VSCODE_SKILLS_DIR"
    
    # Cursor
    if [ -d "$CURSOR_SKILLS_DIR/vibe-coding" ]; then
        rm -rf "$CURSOR_SKILLS_DIR/vibe-coding"
    fi
    ln -s "$SCRIPT_DIR" "$CURSOR_SKILLS_DIR/vibe-coding"
    echo "✅ 已创建Cursor符号链接"
    
    # VSCode
    if [ -d "$VSCODE_SKILLS_DIR/vibe-coding" ]; then
        rm -rf "$VSCODE_SKILLS_DIR/vibe-coding"
    fi
    ln -s "$SCRIPT_DIR" "$VSCODE_SKILLS_DIR/vibe-coding"
    echo "✅ 已创建VSCode符号链接"
}

# 显示菜单
show_menu() {
    echo ""
    echo "请选择安装方式:"
    echo "1) 安装到Cursor"
    echo "2) 安装到VSCode"
    echo "3) 同时安装到Cursor和VSCode"
    echo "4) 创建符号链接（开发模式）"
    echo "5) 退出"
    echo ""
    read -p "请输入选项 [1-5]: " choice
    
    case $choice in
        1) install_to_cursor;;
        2) install_to_vscode;;
        3) install_to_cursor; install_to_vscode;;
        4) install_symlink;;
        5) echo "👋 退出安装"; exit 0;;
        *) echo "❌ 无效选项"; show_menu;;
    esac
}

# 主程序
echo ""
echo "🎯 Vibe Coding Skill 安装程序"
echo "=============================="
echo ""

# 检查是否已安装
if [ -d "$HOME/.cursor/skills/vibe-coding" ] || [ -d "$HOME/.vscode/skills/vibe-coding" ]; then
    echo "⚠️  检测到已安装的Vibe Coding Skill"
    read -p "是否重新安装? (y/N): " reinstall
    if [[ ! $reinstall =~ ^[Yy]$ ]]; then
        echo "👍 保持现有安装"
        exit 0
    fi
fi

show_menu

echo ""
echo "🎉 安装完成！"
echo ""
echo "📖 使用说明:"
echo "1. Cursor: 新建项目时自动加载，或输入 /vibe-coding"
echo "2. VSCode: 命令面板输入 'Load Skill' 选择 vibe-coding"
echo "3. 桌面客户端: 复制 toolkits/TK-4-desktop-prompt.md 到系统提示词"
echo ""
echo "📚 更多信息请查看 README.md 和 INSTALL.md"