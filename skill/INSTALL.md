# Vibe Coding Skill 安装指南

## 快速安装（推荐）

### 1. 克隆整个仓库
```bash
git clone https://gitee.com/AILynx/vibe-coding-standard.git
cd vibe-coding-standard
```

### 2. 安装到AI工具

#### Cursor用户
```bash
# 复制skill目录到Cursor skills
cp -r skill/ ~/.cursor/skills/vibe-coding

# 或者创建符号链接（便于更新）
ln -s $(pwd)/skill/ ~/.cursor/skills/vibe-coding
```

#### VSCode用户
```bash
# 复制skill目录到VSCode skills
cp -r skill/ ~/.vscode/skills/vibe-coding

# 或者创建符号链接
ln -s $(pwd)/skill/ ~/.vscode/skills/vibe-coding
```

#### 桌面AI客户端用户
1. 打开 `toolkits/TK-4-desktop-prompt.md`
2. 复制全部内容
3. 粘贴到桌面AI客户端的系统提示词设置中

## 手动安装

如果只需要特定工具包：

### Cursor项目
```bash
# 复制项目硬约束
cp toolkits/TK-1-project-rules.md your-project/.cursorrules
cp toolkits/TK-1-project-rules.md your-project/CLAUDE.md

# 复制通用流程Skill
mkdir -p your-project/.cursor/skills/vibe-coding-std
cp toolkits/TK-2-workflow-skill.md your-project/.cursor/skills/vibe-coding-std/index.md
```

### VSCode项目
```bash
# 复制项目硬约束
cp toolkits/TK-1-project-rules.md your-project/CLAUDE.md

# 复制通用流程Skill
mkdir -p your-project/skills/vibe-coding-std
cp toolkits/TK-2-workflow-skill.md your-project/skills/vibe-coding-std/index.md
```

## 验证安装

### Cursor
1. 打开Cursor
2. 新建项目，查看是否自动加载`.cursorrules`
3. 输入 `/vibe-coding` 查看是否有响应

### VSCode
1. 打开VSCode
2. 命令面板输入 "Load Skill"
3. 选择 "vibe-coding"

### 桌面客户端
1. 新建对话
2. 发送测试消息："请按照Vibe Coding标准帮我创建一个简单项目"
3. 观察AI是否按8阶段流程响应

## 更新Skill

```bash
cd vibe-coding-standard
git pull

# 如果使用符号链接，自动更新
# 如果使用复制，重新执行安装命令
```

## 卸载

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