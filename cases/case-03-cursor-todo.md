# 案例3：Cursor 从零做待办清单，体验完整 8 阶段

> **难度**：★★★（需要安装 Node.js 和 Cursor）
> **工具包**：TK-1（项目硬约束）+ TK-2（通用流程Skill）+ TK-5（8阶段Task模板）
> **你需要**：电脑上已安装 Node.js、Cursor IDE
> **你将做出**：一个功能完整的待办清单（Todo List）Web 应用，使用 React + TypeScript 开发

## 前置准备

1. 确认 Node.js 已安装：打开终端，输入 `node -v`，看到版本号说明 OK。
2. 打开 Cursor。
3. 确保第〇章的 TK-1、TK-2、TK-5 内容已准备好（本案例会用到）。

## 环境配置（15 分钟）

### 步骤 1：新建项目并部署规则文件

```bash
mkdir todo-app
cd todo-app
```

在项目根目录创建两个文件：

**`.cursorrules` 和 `CLAUDE.md`**：内容完全相同，直接复制 TK-1 的完整模板。

### 步骤 2：部署通用流程 Skill

创建文件夹 `.cursor/skills/vibe-coding-std/`，在里面创建 `index.md`，内容复制 TK-2 的完整模板。

### 步骤 3：初始化 Git

bash

```
git init
git add .
git commit -m "init: 部署 Vibe Coding 标准体系规则文件"
```



### 步骤 4：验证规则生效

在 Cursor 中打开项目。按 `Cmd+I` 打开 Composer，输入：

> 请复述你当前读取到的最高优先级规则。

AI 应能复述 TK-1 中的核心约束。如果不能，检查 `.cursorrules` 文件是否在根目录且格式正确。

------

## 阶段 1：需求收敛 & 功能分级（10 分钟）

在 Composer 中输入：

> 请按照 vibe-coding-std 通用流程 Skill，开始执行阶段1。
> 项目背景：开发一个个人待办清单（Todo List）Web 应用。
> 请帮我完成：
>
> 1. 100 字以内项目简介
> 2. 核心功能、次要功能、扩展功能分级
> 3. 判定项目体量与运行载体

**AI 产出参考**（需人工审核）：

> **项目简介**：帮助个人用户管理日常任务的待办清单应用。用户可以快速添加、完成、删除任务，支持分类筛选，数据本地持久化。目标用户为需要任务管理的个人，核心痛点是操作简单、响应快速。
>
> **功能分级**：
>
> - 核心功能：添加任务、标记完成/未完成、删除任务、任务列表展示
> - 次要功能：任务分类（工作/生活/学习）、按状态筛选、数据本地存储
> - 扩展功能：截止日期提醒、任务排序、导出功能
>
> **项目体量**：Web 端单页应用，React 技术栈，小型项目。

确认后回复：“阶段 1 确认，进入阶段 2”。

------

## 阶段 2：架构设计 + 目录 + 依赖定稿（15 分钟）

> 阶段2：请完成以下产出：
>
> 1. 用 Mermaid 语法绘制待办清单的业务流程图
> 2. 设计组件树和模块划分
> 3. 锁定最终目录结构
> 4. 整理第三方依赖清单

**AI 产出参考**：

**业务流程图**：

```graph TD
    A[打开应用] --> B[显示任务列表]
    B --> C{操作?}
    C -->|添加任务| D[输入任务内容+选择分类]
    D --> E[任务添加到列表]
    E --> B
    C -->|勾选完成| F[任务状态切换]
    F --> B
    C -->|删除任务| G[确认删除]
    G --> H[从列表移除]
    H --> B
    C -->|筛选| I[选择分类/状态]
    I --> B
```



**固定目录结构**：

text

```
src/
├── components/
│   ├── Header.tsx
│   ├── AddTodo.tsx
│   ├── TodoList.tsx
│   ├── TodoItem.tsx
│   ├── FilterBar.tsx
│   └── Empty.tsx
├── hooks/
│   └── useTodos.ts
├── types/
│   └── index.ts
├── App.tsx
├── App.css
└── main.tsx
```



**依赖清单**：react, react-dom, typescript, vite, @types/react, @types/react-dom。无需其他第三方依赖。

确认后回复：“阶段 2 确认并锁定，进入阶段 3”。

------

## 阶段 3：环境对齐校验（5 分钟）

> 阶段3：请确认以下内容：
>
> 1. 是否已读取 .cursorrules 中的全部约束？
> 2. 是否已加载 vibe-coding-std 通用流程 Skill？
> 3. 用一句话描述你理解的增量开发模式。

AI 应准确复述规则。确认后回复：“阶段 3 确认，进入阶段 4”。

------

## 阶段 4：空项目初始化（10 分钟）

让 Cursor Agent 执行（或自己在终端执行）：

bash

```
npm create vite@latest todo-app -- --template react-ts
cd todo-app
npm install
```



清理脚手架默认代码：

- 删除 `src/App.css` 中的默认样式
- 删除 `src/assets/` 下的默认文件
- 清空 `src/App.tsx` 内容，改为只返回一个空的 `<div>`

启动验证：

bash

```
npm run dev
```



浏览器打开 `http://localhost:5173`，确认显示空白页面，控制台无报错。

**截图留证**，提交 Git。

> 阶段4完成，空项目已成功启动，进入阶段5。第一个模块：类型定义。

------

## 阶段 5：单模块增量编码（约 40 分钟）

### 模块 5-1：类型定义

> 阶段5第一个模块：请仅创建 src/types/index.ts，定义 Todo 接口（id, content, category, completed, createdAt），不改动其他文件。

验证后提交 Git。

### 模块 5-2：自定义 Hook

> 第二个模块：请创建 src/hooks/useTodos.ts，实现 todos 状态管理（addTodo, toggleTodo, deleteTodo），使用 useState，数据初始化为空数组。仅创建这个文件。

验证后提交。

### 模块 5-3：Header 组件

> 第三个模块：创建 src/components/Header.tsx，显示应用标题"待办清单"和一个简洁的副标题。仅创建这个文件。

验证后提交。

### 模块 5-4：AddTodo 组件

> 第四个模块：创建 src/components/AddTodo.tsx，包含输入框、分类下拉选择（工作/生活/学习）、添加按钮。仅创建这个文件和修改 App.tsx 以引入该组件。

验证后提交。

### 模块 5-5：TodoItem 和 TodoList 组件

> 第五个模块：创建 src/components/TodoItem.tsx 和 TodoList.tsx。TodoItem 显示单条任务，包含勾选框、内容、分类标签、删除按钮。TodoList 接收 todos 数组并渲染列表，无数据时显示 Empty 组件。

验证后提交。

### 模块 5-6：FilterBar 和 Empty 组件

> 第六个模块：创建 src/components/FilterBar.tsx（分类筛选按钮：全部/工作/生活/学习）和 Empty.tsx（空状态提示"暂无任务，添加一个吧"）。

验证后提交。

### 模块 5-7：本地存储

> 第七个模块：修改 src/hooks/useTodos.ts，加入 localStorage 持久化。每次 todos 变化自动保存，初始化时从 localStorage 读取。

验证后提交。

------

## 阶段 6：单模块全场景测试（15 分钟）

> 阶段6：请为待办清单生成全场景测试清单，包括：
>
> 1. 正常添加、完成、删除任务
> 2. 空列表显示
> 3. 添加空内容
> 4. 超长任务内容
> 5. 快速连续添加多条
> 6. 分类筛选是否正常
> 7. 刷新页面数据是否保留
> 8. loading / empty / error 状态是否齐全

逐项测试，Bug 反馈给 AI 修复，每修复一个提交一次。

------

## 阶段 7：全局联调 + 重构 + 优化（15 分钟）

> 阶段7：全链路联调，检查：添加→完成→筛选→删除全流程。统一所有组件样式（颜色、间距、字体）。检查是否有重复代码，合并为公共逻辑。

AI 给出重构建议，逐项确认执行。

------

## 阶段 8：打包交付 + 文档归档（10 分钟）

bash

```
npm run build
```



> 阶段8：请生成标准 README.md，包含项目简介、技术栈、启动方式、目录结构、功能说明。

将 README 保存到项目根目录。

最终提交：

bash

```
git add .
git commit -m "阶段8完成: 待办清单应用交付"
```



------

## 完成

你现在有了一个功能完整的待办清单应用，经历了完整的 8 阶段流程。项目可以部署到 Vercel 或 Netlify 供他人使用。

## 常见问题

**Q: Cursor Agent 一次生成多个文件怎么办？**
A: 立即在对话中说“停止，你违反了单模块增量编码规则。请回滚到上一次提交，只保留 [模块名] 的改动。”

**Q: npm create vite 失败？**
A: 检查 Node.js 版本是否 ≥18。终端输入 `node -v` 确认。如果版本过低，去 [nodejs.org](https://nodejs.org/) 下载 LTS 版本。

**Q: 页面空白但没报错？**
A: 检查 App.tsx 是否引入了组件。把 App.tsx 内容发给 AI 检查。