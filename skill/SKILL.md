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