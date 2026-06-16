# Vibe Coding 智能引导式 SKILL

## 描述

这是一套深度融入Vibe Coding标准体系的智能引导式SKILL，通过AI主动提问、场景自动检测、8阶段流程引导，帮助用户完成项目开发。

## 核心特性

1. **四层解耦架构**：规则优先级清晰，上层约束下层
2. **7条铁律强制执行**：四维拦截机制，不只是检查而是强制
3. **工具包组合逻辑**：根据场景自动选择最佳组合
4. **案例实战智慧**：将最佳实践融入引导流程
5. **质量保障闭环**：每阶段有门禁，全程可追溯
6. **7种场景深度适配**：不同场景有不同的执行策略

## 目录结构

```
skill/
├── SKILL.md                        # 智能引导入口（本文件）
├── core/                           # 核心引擎
│   ├── architecture-engine.md      # 四层架构引擎
│   ├── iron-rules-engine.md        # 铁律执行引擎
│   ├── quality-gate-engine.md      # 质量门禁引擎
│   ├── dialogue-engine.md          # 对话引导引擎
│   └── scenario-engine.md          # 场景适配引擎
├── layers/                         # 四层架构实现
│   ├── layer-1-hard-constraints.md # 第一层：项目硬约束
│   ├── layer-2-process-skill.md    # 第二层：通用流程Skill
│   ├── layer-3-tech-spec.md        # 第三层：技术规范层
│   └── layer-4-scenario-fallback.md # 第四层：场景兜底层
├── iron-rules/                     # 铁律执行模块
│   ├── rule-enforcement.md         # 铁律强制执行逻辑
│   ├── interception-rules.md       # 拦截规则清单
│   └── audit-mechanism.md          # 审计追踪机制
├── stages/                         # 8阶段深度引导
│   ├── stage-1-requirement.md      # 阶段1：需求收敛
│   ├── stage-2-architecture.md     # 阶段2：架构锁档
│   ├── stage-3-alignment.md        # 阶段3：环境对齐
│   ├── stage-4-scaffold.md         # 阶段4：脚手架初始化
│   ├── stage-5-coding.md           # 阶段5：增量编码
│   ├── stage-6-testing.md          # 阶段6：测试验证
│   ├── stage-7-refactor.md         # 阶段7：重构优化
│   └── stage-8-delivery.md         # 阶段8：交付归档
├── scenarios/                      # 7种场景深度适配
│   ├── scenario-1-ide.md           # 智能IDE场景
│   ├── scenario-2-plugin.md        # 插件场景
│   ├── scenario-3-desktop.md       # 桌面客户端场景
│   ├── scenario-4-lowcode.md       # 低代码场景
│   ├── scenario-5-nocode.md        # 无代码场景
│   ├── scenario-6-multiagent.md    # 多智能体场景
│   └── scenario-7-enterprise.md    # 企业级场景
├── toolkits/                       # 工具包组合逻辑
│   ├── toolkit-combinations.md     # 工具包组合推荐
│   └── toolkit-dependencies.md     # 工具包依赖关系
├── wisdom/                         # 实战智慧库
│   ├── best-practices.md           # 最佳实践
│   ├── common-pitfalls.md          # 常见陷阱
│   └── case-insights.md            # 案例洞察
├── templates/                      # 模板文件
│   ├── requirement-template.md     # 需求模板
│   ├── architecture-template.md    # 架构模板
│   └── task-template.md            # 任务模板
├── INSTALL.md                      # 安装说明
├── install.ps1                     # Windows安装脚本
└── install.sh                      # Linux/macOS安装脚本
```

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

### 2. 启动智能引导

安装完成后，启动AI工具，输入 `/vibe-coding` 命令，AI会主动提问并引导你完成项目开发。

### 3. 按8阶段流程开发

AI会引导你按8阶段流程开发：
1. 需求收敛
2. 架构锁档
3. 环境对齐
4. 脚手架初始化
5. 增量编码
6. 测试验证
7. 重构优化
8. 交付归档

## 使用场景

### 需要下载skill的场景

| 工具环境 | 是否需要下载skill | 规则加载方式 | 自动化程度 |
|----------|:-----------------:|-------------|:----------:|
| **Cursor** | ✅ 需要 | 自动加载 | 高 |
| **VSCode + AI插件** | ✅ 需要 | 手动加载 | 中 |
| **Windsurf/Trae** | ✅ 需要 | 自动加载 | 高 |

### 不需要下载skill的场景

| 工具环境 | 是否需要下载skill | 规则加载方式 | 自动化程度 |
|----------|:-----------------:|-------------|:----------:|
| **ChatGPT网页版** | ❌ 不需要 | 手动粘贴TK-3 | 无 |
| **Claude网页版** | ❌ 不需要 | 手动粘贴TK-3 | 无 |
| **ChatGPT桌面版** | ❌ 不需要 | 每轮粘贴TK-4 | 低 |
| **Claude桌面版** | ❌ 不需要 | 每轮粘贴TK-4 | 低 |
| **Dify/Coze** | ❌ 不需要 | 平台固化TK-6 | 全自动 |
| **AutoGen/AgentStack** | ❌ 不需要 | 注入TK-7 | 高 |

## 工具包说明

| 编号 | 名称 | 所属层级 | 主要功能 |
|------|------|:--------:|----------|
| TK-1 | 项目硬约束模板 | L1 | 定义项目最高强制规则 |
| TK-2 | 通用流程Skill | L2 | 定义8阶段开发流水线 |
| TK-3 | 网页大模型提示词 | L4 | 网页版AI咨询 |
| TK-4 | 桌面客户端提示词 | L4 | 桌面版AI开发 |
| TK-5 | 8阶段Task模板 | L2 | 进度跟踪 |
| TK-6 | 低代码Agent固化工作流 | L4 | 平台固化工作流 |
| TK-7 | 多智能体指令集 | L2 | 多角色分工协作 |

## 核心引擎说明

### 四层架构引擎

负责管理和执行四层解耦架构的规则优先级：
- L1：项目硬约束层（最高优先级）
- L2：通用流程Skill层
- L3：技术规范层
- L4：场景兜底层（最低优先级）

### 铁律执行引擎

负责强制执行7条铁律：
- 铁律1：禁止批量生成多模块
- 铁律2：阶段2定稿不得私自修改
- 铁律3：严禁编造不存在的接口
- 铁律4：必须补充完整状态处理
- 铁律5：已验收模块禁止随意修改
- 铁律6：空项目初始化失败禁止编写业务代码
- 铁律7：禁止编写死代码、占位代码

### 质量门禁引擎

负责在每个阶段设置质量门禁：
- 阶段2：架构锁档门禁
- 阶段4：脚手架初始化门禁（硬性门槛）
- 阶段6：测试验证门禁（覆盖率≥80%）
- 阶段7：重构优化门禁（lint通过）

### 对话引导引擎

负责引导用户完成8阶段开发流程：
- AI主动提问
- 用户确认
- 阶段推进
- 异常处理

### 场景适配引擎

负责根据用户的开发工具和项目需求，自动选择合适的场景和工具包组合。

## 注意事项

1. 首次使用请阅读 `README.md` 了解整体体系
2. 根据项目类型选择合适的工具包组合
3. 8阶段流程必须串行执行，禁止跳步
4. 每阶段结束需要人工确认才能进入下一阶段
5. 铁律是强制执行的，违反时会阻断流程

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
- 低代码平台（TK-6工作流）
- 多智能体平台（TK-7指令集）
