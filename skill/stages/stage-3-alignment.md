# 阶段3：环境对齐

## 概述

阶段3负责检查开发环境是否就绪，确保规则文件已加载、增量开发模式已理解。

## 核心任务

1. 验证CLAUDE.md/.cursorrules是否加载
2. 验证通用流程Skill和技术栈Skill就位
3. 确认增量开发模式已被理解

## AI引导话术

```
现在检查开发环境是否就绪：

1. 检查您的AI工具是否已配置规则文件
2. 验证TK-1（项目硬约束）是否已加载
3. 确认TK-2（通用流程Skill）是否就位
4. 确认您理解增量开发模式

请告诉我您使用的AI工具，我会帮您配置。
```

## 检查清单

- [ ] CLAUDE.md / .cursorrules 已创建
- [ ] TK-1 内容已写入规则文件
- [ ] TK-2 已部署到正确位置
- [ ] 增量开发模式已理解

## 铁律检查

- 铁律2：确认不修改阶段2锁档内容
- 铁律3：确认不编造不存在的接口

## 环境配置指南

### Cursor配置

```bash
# 1. 创建 .cursorrules 文件
cp TK-1-project-rules.md .cursorrules

# 2. 创建 CLAUDE.md 文件
cp TK-1-project-rules.md CLAUDE.md

# 3. 部署通用流程Skill
mkdir -p .cursor/skills/vibe-coding-std
cp TK-2-workflow-skill.md .cursor/skills/vibe-coding-std/index.md

# 4. 验证配置
ls -la .cursorrules CLAUDE.md .cursor/skills/vibe-coding-std/index.md
```

### VSCode配置

```bash
# 1. 创建 CLAUDE.md 文件
cp TK-1-project-rules.md CLAUDE.md

# 2. 部署通用流程Skill
mkdir -p skills/vibe-coding-std
cp TK-2-workflow-skill.md skills/vibe-coding-std/index.md

# 3. 验证配置
ls -la CLAUDE.md skills/vibe-coding-std/index.md
```

## 增量开发模式说明

### 什么是增量开发？

```
增量开发 = 单模块开发 + 逐步验证 + 持续集成

核心原则：
1. 每次只开发一个最小功能模块
2. 开发完成后立即验证
3. 验证通过后立即提交Git
4. 重复以上步骤直到完成所有模块
```

### 为什么需要增量开发？

```
AI的"幻觉"问题：
- 生成的代码越多，出错概率越高
- 批量生成的代码难以定位错误
- 增量开发使得错误定位成本最低

质量保障：
- 每个模块独立验证
- 问题早发现早修复
- 避免后期大规模返工
```

### 增量开发流程

```
1. 选择下一个模块
2. AI生成模块代码
3. 本地运行验证
4. 验证通过？├── 是 → 提交Git → 回到步骤1
            └── 否 → 修复问题 → 回到步骤3
```

## 阶段总结

```
AI: 阶段3完成。

检查结果：
- [x] CLAUDE.md / .cursorrules 已创建
- [x] TK-1 内容已写入规则文件
- [x] TK-2 已部署到正确位置
- [x] 增量开发模式已理解

环境已就绪，请确认，确认后进入阶段4：脚手架初始化。
```
