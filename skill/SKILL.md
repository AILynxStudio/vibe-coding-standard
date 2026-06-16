# Vibe Coding 工业级开发标准 Skill

## 描述
这套Skill为AI辅助编码提供工业级开发标准，确保项目可维护、可交付、可长期迭代。

## 功能
- 自动应用8阶段开发流程
- 强制执行7条铁律，防止AI乱写代码
- 根据开发场景选择合适工具包
- 提供实战案例参考

## 使用方式
1. **新项目启动**：自动加载TK-1（项目硬约束）和TK-2（通用流程）
2. **代码审查**：检查是否符合7条铁律
3. **流程指导**：按8阶段推进项目，每阶段人工确认
4. **问题诊断**：参考案例解决常见AI编码问题

## 快速开始
### 1. 安装Skill
```bash
# 克隆仓库
git clone https://gitee.com/AILynx/vibe-coding-standard.git
cd vibe-coding-standard/skill

# Windows
.\install.ps1

# Linux/macOS
chmod +x install.sh
./install.sh
```

### 2. 创建新项目
1. 打开AI工具（Cursor/VSCode）
2. 创建新项目目录
3. 输入 `/vibe-coding` 命令
4. 按8阶段流程开发

### 3. 现有项目集成
1. 将 `resources/TK-1-project-rules.md` 复制到项目根目录
2. 重命名为 `.cursorrules`（Cursor）或 `CLAUDE.md`（VSCode）
3. 将 `resources/TK-2-workflow-skill.md` 复制到技能目录
4. 开始按8阶段流程开发

## 工具包说明
- **TK-1**：项目硬约束模板（Cursor/VSCode）
- **TK-2**：通用流程Skill（所有场景）
- **TK-3**：网页大模型提示词（浏览器版AI）
- **TK-4**：桌面客户端提示词（桌面版AI）
- **TK-5**：8阶段Task模板（进度跟踪）
- **TK-6**：低代码Agent工作流（Dify/Coze等）
- **TK-7**：多智能体指令集（AutoGen/AgentStack）

## 触发条件
- 用户调用 `/vibe-coding` 命令
- 新建项目时自动检测
- 代码审查时自动应用铁律检查

## 安装方法
### 自动安装（推荐）
```bash
# 克隆仓库
git clone https://gitee.com/AILynx/vibe-coding-standard.git
cd vibe-coding-standard/skill

# Linux/macOS
chmod +x install.sh
./install.sh

# Windows PowerShell
.\install.ps1
```

### 手动安装
#### Cursor
```bash
# 复制skill目录到Cursor skills
cp -r skill/ ~/.cursor/skills/vibe-coding
```

#### VSCode
```bash
# 复制skill目录到VSCode skills
cp -r skill/ ~/.vscode/skills/vibe-coding
```

#### 桌面客户端
复制 `resources/TK-4-desktop-prompt.md` 内容到系统提示词

## 资源目录
- `resources/` - 可复用工具包（TK-1到TK-7）
- `standards/` - 核心标准文档参考
- `cases/` - 实战案例参考
- `charts/` - 图表生成提示词

## 注意事项
1. 首次使用请阅读 `README.md` 了解整体体系
2. 根据项目类型选择合适的工具包组合
3. 8阶段流程必须串行执行，禁止跳步
4. 每阶段结束需要人工确认才能进入下一阶段

## 常见问题
### Q: 安装后AI工具没有自动加载Skill怎么办？
A: 检查Skill目录是否放在正确位置：
- Cursor: `~/.cursor/skills/vibe-coding`
- VSCode: `~/.vscode/skills/vibe-coding`

### Q: 如何更新Skill？
A: 重新运行安装脚本，或手动复制最新文件到Skill目录。

### Q: 8阶段流程太复杂，可以简化吗？
A: 可以。对于小型项目，可以合并阶段1-2（需求+设计）和阶段7-8（测试+交付），但必须保持阶段3-6（开发）的串行执行。

### Q: 如何在不同项目中使用不同的工具包？
A: 根据项目类型选择：
- 正式项目：TK-1 + TK-2 + TK-5
- 原型项目：TK-3 或 TK-4
- 团队项目：TK-1 + TK-2 + TK-5 + TK-7

### Q: Skill支持哪些AI工具？
A: 目前支持：
- Cursor（完整支持）
- VSCode + AI插件（完整支持）
- 桌面AI客户端（部分支持）
- 网页版AI（仅TK-3提示词）