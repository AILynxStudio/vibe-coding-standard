# Vibe Coding Skill 安装指南

## 快速安装（推荐）

### 1. 克隆仓库
```bash
git clone https://gitee.com/AILynx/vibe-coding-standard.git
cd vibe-coding-standard
```

### 2. 运行安装脚本

#### Linux/macOS
```bash
chmod +x quick-install.sh
./quick-install.sh
```

#### Windows PowerShell
```powershell
.\quick-install.ps1
```

脚本会自动检测已安装的 AI 工具并安装到对应位置。

### 3. 使用

#### Claude Code
在任意项目目录输入 `/vibe-coding` 即可加载标准。

#### Cursor / VSCode
1. 打开 Cursor 或 VSCode
2. 创建新项目目录
3. 输入 `/vibe-coding` 命令
4. 按 AI 引导完成项目开发

## 手动安装

### Claude Code（单文件方式）
```bash
# 复制 SKILL.md 到 Claude Code skills 目录
mkdir -p ~/.claude/skills/vibe-coding
cp skill/SKILL.md ~/.claude/skills/vibe-coding/SKILL.md
```

### Cursor（完整目录方式）
```bash
# 复制skill目录到Cursor skills
cp -r skill/ ~/.cursor/skills/vibe-coding

# 或者创建符号链接（便于更新）
ln -s $(pwd)/skill/ ~/.cursor/skills/vibe-coding
```

### VSCode（完整目录方式）
```bash
# 复制skill目录到VSCode skills
cp -r skill/ ~/.vscode/skills/vibe-coding

# 或者创建符号链接
ln -s $(pwd)/skill/ ~/.vscode/skills/vibe-coding
```

### 桌面AI客户端
1. 打开 `toolkits/TK-4-desktop-prompt.md`
2. 复制全部内容
3. 粘贴到桌面AI客户端的系统提示词设置中

## 项目级配置（Claude Code）

将 `CLAUDE.md.template` 复制到项目根目录并重命名为 `CLAUDE.md`：

```bash
cp CLAUDE.md.template your-project/CLAUDE.md
```

这样在项目级别也能启用 Vibe Coding 硬约束。

## 验证安装

### Claude Code
1. 打开 Claude Code
2. 输入 `/vibe-coding`
3. 确认 Skill 内容已加载

### Cursor
1. 打开 Cursor
2. 新建项目，查看是否自动加载 `.cursorrules`
3. 输入 `/vibe-coding` 查看是否有响应

### VSCode
1. 打开 VSCode
2. 命令面板输入 "Load Skill"
3. 选择 "vibe-coding"

## 更新 Skill

```bash
cd vibe-coding-standard
git pull

# 如果使用符号链接，自动更新
# 如果使用复制，重新执行安装命令
```

## 卸载

### Claude Code
```bash
rm -rf ~/.claude/skills/vibe-coding
```

### Cursor
```bash
rm -rf ~/.cursor/skills/vibe-coding
```

### VSCode
```bash
rm -rf ~/.vscode/skills/vibe-coding
```

### 桌面客户端
清空系统提示词设置中的内容
