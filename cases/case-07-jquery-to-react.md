# 案例7：企业级——给公司内部系统换新界面（jQuery → React 迁移）

> **难度**：★★★★★（需要有编程经验，理解企业 CI/CD 流程）
> **工具包**：TK-1（组织级扩展 Ruleset）+ TK-5（CI 门禁脚本）
> **你需要**：Sourcegraph 账号（或自部署实例）、一个 jQuery 老项目代码库、CI/CD 流水线权限
> **你将完成**：一个遗留 jQuery 项目的分析、迁移计划制定和逐步替换

## 前置准备

1. 在 Sourcegraph（sourcegraph.com 或自部署实例）中关联你的代码仓库。
2. 确保 CI/CD 工具可用（GitHub Actions / GitLab CI / Jenkins）。
3. 准备 TK-1 工具包，将其扩展为包含企业安全规范的组织级 Ruleset。

## 第 1 步：建立代码图谱，全面分析（30 分钟）

在 Sourcegraph 中创建代码图谱（Code Graph），让 Cody 索引整个仓库。

使用 Cody 进行全局分析：

> 请分析整个代码库，回答以下问题：
> 1. 项目中有多少个 jQuery 选择器（如 `$()` 调用）？列出出现最多的 20 个。
> 2. 有多少个 AJAX 调用（`$.ajax`、`$.get`、`$.post`）？它们分别调用了哪些后端接口？
> 3. 哪些 JS 文件最大（按行数）？列出前 10 个。
> 4. 是否有全局变量污染？列出所有 `window.xxx` 赋值。
> 5. HTML 文件中有多少内联事件绑定（`onclick=`、`onsubmit=` 等）？

将分析结果导出为 `migration-audit.md`，这是你的迁移基线文档。

## 第 2 步：制定迁移策略（20 分钟）

根据分析结果，制定迁移计划：

> 请制定分阶段迁移计划：
> 1. 将页面分为三类：核心页面（如首页、登录）、常用页面（如列表页、表单页）、低频页面（如设置页、帮助页）
> 2. 建议迁移顺序（从最独立的组件开始）
> 3. 每个阶段的预估工作量和风险等级
> 4. 迁移期间如何保证新老代码共存

产出 `migration-plan.md`，经团队评审后锁定。

## 第 3 步：配置 CI 门禁（20 分钟）

将组织级 Ruleset（TK-1 + 企业规范）转化为 CI 检查脚本。

GitHub Actions 示例 `.github/workflows/migration-check.yml`：

```yaml
name: Migration Quality Gate
on: [pull_request]

jobs:
  quality-gate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: 禁止新增 jQuery 依赖
        run: |
          if grep -r "\$(" src/ --include="*.tsx" --include="*.jsx"; then
            echo "❌ 新代码中不允许使用 jQuery，请使用 React 方式实现"
            exit 1
          fi
      
      - name: 检查异常处理覆盖率
        run: |
          npx jest --coverage --coverageThreshold='{"global":{"branches":80}}'
      
      - name: 检查单个 PR 文件改动数量
        run: |
          CHANGED_FILES=$(git diff --name-only origin/main | wc -l)
          if [ $CHANGED_FILES -gt 5 ]; then
            echo "❌ 单次 PR 改动超过 5 个文件，请拆分为多个小 PR"
            exit 1
          fi
```

## 第 4 步：逐步迁移——以"用户列表页"为例（60 分钟）

选择第一个目标页面（建议选一个相对独立、不涉及核心业务的列表页）。

### 4.1 分析旧代码

> 分析 `user-list.html` 和 `user-list.js` 的完整逻辑：
>
> 1. 这个页面有哪些功能？
> 2. 调用了哪些后端 API？
> 3. 有哪些 DOM 操作？
> 4. 有哪些事件绑定？

### 4.2 创建 React 组件

在项目中创建新的 React 组件：

text

```
src/
├── pages/
│   └── UserList/
│       ├── index.tsx
│       ├── UserTable.tsx
│       ├── UserSearch.tsx
│       └── types.ts
├── api/
│   └── users.ts
```



### 4.3 用 Cody 批量替换 API 调用

使用 Cody 的批量修改功能，将所有 `$.ajax` 调用替换为 `fetch` 或 `axios`：

> 将 `user-list.js` 中所有 AJAX 调用改为 axios，并封装到 `api/users.ts`。返回格式统一为 Promise。

### 4.4 编写 React 版本

> 请根据旧版 `user-list.html` 和 `user-list.js` 的功能，编写 React + TypeScript 版本。要求：
>
> 1. 使用 Ant Design 的 Table 组件
> 2. 搜索、分页、排序功能完整
> 3. 所有网络请求通过 `api/users.ts` 调用
> 4. 实现 loading、empty、error 三种状态
> 5. 添加完整的 TypeScript 类型定义

### 4.5 测试与回归

> 为新的 UserList 页面生成测试用例，覆盖：
>
> 1. 正常数据加载和渲染
> 2. 搜索功能
> 3. 分页功能
> 4. 空数据展示
> 5. API 错误处理
> 6. 与旧版功能对比清单

运行新旧两个版本，逐项对比确认。

## 第 5 步：逐步替换（迭代进行）

第一个页面迁移成功后，按照迁移计划逐个替换其他页面。

每完成一个页面：

1. 提交 PR（改动不超过 5 个文件）
2. CI 自动检查（无 jQuery 残留、测试覆盖率 ≥80%）
3. Code Review
4. 合并

## 第 6 步：最终清理（30 分钟）

所有页面迁移完成后：

> 请检查整个项目：
>
> 1. 是否还有 jQuery 残留？
> 2. 是否可以从 `package.json` 中移除 jQuery 依赖？
> 3. 删除所有旧的 `.html` 和 `.js` 文件（非 React 的）
> 4. 更新 README，标注已完成迁移

最终提交，打 tag，发布新版本。

## 常见问题

**Q: Sourcegraph 索引太慢？**
A: 大型仓库首次索引可能需要数小时，建议在非工作时间触发。

**Q: 迁移过程中发现旧代码逻辑不清楚？**
A: 用 Cody 的"解释代码"功能：选中看不懂的代码段，让它用自然语言解释。

**Q: 新旧两套代码要同时维护吗？**
A: 是的，迁移期间用路由切换或特性开关控制。一旦新版本通过全部回归测试，就可以下线旧代码。