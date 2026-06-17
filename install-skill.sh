#!/bin/bash
# Vibe Coding SKILL 一键安装脚本
# 使用方式：在任意文件夹执行 bash install-skill.sh

echo "🚀 开始安装 Vibe Coding SKILL..."

# 检测已安装的AI工具
CURSOR_PATH="$HOME/.cursor/skills"
VSCODE_PATH="$HOME/.vscode/skills"

TARGET_PATH=""

# 优先使用Cursor，其次VSCode
if [ -d "$HOME/.cursor" ]; then
    TARGET_PATH="$CURSOR_PATH/vibe-coding"
    echo "📦 检测到Cursor，安装到: $TARGET_PATH"
elif [ -d "$HOME/.vscode" ]; then
    TARGET_PATH="$VSCODE_PATH/vibe-coding"
    echo "📦 检测到VSCode，安装到: $TARGET_PATH"
else
    echo "❌ 未检测到Cursor或VSCode，请先安装AI工具"
    exit 1
fi

# 创建skills目录（如果不存在）
SKILLS_DIR=$(dirname "$TARGET_PATH")
if [ ! -d "$SKILLS_DIR" ]; then
    mkdir -p "$SKILLS_DIR"
    echo "📁 创建skills目录: $SKILLS_DIR"
fi

# 如果已存在，先删除
if [ -d "$TARGET_PATH" ]; then
    rm -rf "$TARGET_PATH"
    echo "🗑️  清理旧版本..."
fi

# 克隆仓库
echo "📥 正在下载SKILL..."
git clone --depth 1 https://gitee.com/AILynx/vibe-coding-standard.git "$TARGET_PATH-temp"

# 复制skill目录
cp -r "$TARGET_PATH-temp/skill/"* "$TARGET_PATH"
rm -rf "$TARGET_PATH-temp"

echo ""
echo "🎉 安装完成！"
echo ""
echo "📖 使用方法："
echo "1. 打开Cursor或VSCode"
echo "2. 创建新项目目录"
echo "3. 输入 /vibe-coding 命令"
echo "4. 按AI引导完成项目开发"