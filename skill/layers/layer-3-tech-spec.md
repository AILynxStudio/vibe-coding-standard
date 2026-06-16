# 第三层：技术规范层

## 概述

技术规范层是四层架构中的第三层，负责承载编码语法、框架规范。

## 载体

- 官网/GitHub原版Skill
- skills目录下的技术栈Skill

## 核心职责

1. 编码语法遵循技术栈Skill
2. 技术实现细节由L3指导
3. 不得突破L1/L2的约束边界

## 常见技术栈Skill

### 前端框架

| 技术栈 | Skill来源 | 主要内容 |
|--------|-----------|----------|
| React | React官方文档 | JSX语法、Hooks、组件规范 |
| Vue | Vue官方文档 | 模板语法、Composition API、组件规范 |
| Angular | Angular官方文档 | TypeScript、装饰器、模块规范 |
| Svelte | Svelte官方文档 | 编译时框架、响应式语法 |

### 后端框架

| 技术栈 | Skill来源 | 主要内容 |
|--------|-----------|----------|
| Node.js/Express | Express官方文档 | 路由、中间件、错误处理 |
| Python/FastAPI | FastAPI官方文档 | 异步、依赖注入、数据验证 |
| Java/Spring Boot | Spring官方文档 | 注解、依赖注入、AOP |
| Go/Gin | Gin官方文档 | 路由、中间件、JSON处理 |

### 数据库

| 技术栈 | Skill来源 | 主要内容 |
|--------|-----------|----------|
| MySQL | MySQL官方文档 | SQL语法、索引、事务 |
| PostgreSQL | PostgreSQL官方文档 | 高级特性、JSON支持 |
| MongoDB | MongoDB官方文档 | 文档模型、聚合管道 |
| Redis | Redis官方文档 | 数据结构、缓存策略 |

## 与L1/L2的关系

### L1约束L3

```
L1（项目硬约束）：禁止使用jQuery
L3（技术规范）：jQuery官方文档

裁决：L1优先，AI不得引入jQuery
```

### L2约束L3

```
L2（流程规则）：禁止批量生成多模块
L3（技术规范）：create-react-app一次性生成项目

裁决：阶段4允许批量生成，阶段5必须回归增量模式
```

## 技术栈选择建议

### 项目类型与技术栈匹配

| 项目类型 | 推荐前端 | 推荐后端 | 推荐数据库 |
|----------|----------|----------|------------|
| 简单Web应用 | React/Vue | Node.js/Express | SQLite/JSON |
| 中型Web应用 | React/Vue | Node.js/Python | MySQL/PostgreSQL |
| 大型Web应用 | React/Angular | Java/Go | PostgreSQL/MySQL |
| 移动应用 | React Native/Flutter | Node.js/Python | MongoDB/PostgreSQL |
| 桌面应用 | Electron/Tauri | Node.js | SQLite/LevelDB |
| CLI工具 | - | Node.js/Python/Go | 文件系统 |

### 技术栈选择原则

1. **熟悉优先**：选择团队最熟悉的技术栈
2. **生态成熟**：选择社区活跃、文档完善的技术栈
3. **项目匹配**：选择与项目规模匹配的技术栈
4. **长期维护**：选择有长期支持的技术栈

## 技术规范执行

### 执行时机

- 阶段2：架构设计时选择技术栈
- 阶段5：编码时遵循技术栈规范
- 阶段7：重构时统一代码风格

### 执行方式

1. AI生成代码前，检查是否符合技术栈规范
2. 不符合时，提供修正建议
3. 不得突破L1/L2的约束边界

## 与L4的关系

### L4作为L3的兜底

当L3不可用时（如无本地文件系统的工具），L4提供简化方案：

```
L3（技术规范）：React官方Skill
L4（场景兜底）：TK-3（网页大模型提示词）

使用场景：
- 有本地文件系统 → 使用L3
- 无本地文件系统 → 使用L4
```
