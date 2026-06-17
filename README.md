# 🚀 Vibe Coding 工业级开发标准体系

> **这不是一个让你“写得更快”的 Skill，而是一个让你“写完不用返工”的 Skill。**

如果你正在用 AI 开发一个需要**稳定交付、长期维护**的项目，它就是你的项目宪法。
如果你只是想 5 分钟做个 Demo，它反而是你的枷锁。

---

## 🎯 这是什么？

一套专门为 **Vibe Coding**（用自然语言指挥 AI 写代码）设计的**工业级开发规范**。

它包含：
- ✅ **8 阶段开发流程**：从需求收敛到交付归档，全程人工确认，禁止跳步
- ✅ **7 条开发铁律**：精准对抗 AI 幻觉、惰性、短视三大顽疾
- ✅ **四层解耦架构**：规则分层管理，技术栈切换不影响项目行为
- ✅ **7 个可复用工具包（TK-1 ~ TK-7）**：直接复制到项目就能用，无需理解原理
- ✅ **7 大工程场景适配**：从 Cursor 到企业级，全覆盖
- ✅ **7 个实战案例**：从"5分钟入门"到"企业级系统迁移"，含大量可直接粘贴的指令

---

## 🧠 核心理念

**Vibe Coding ≠ 胡乱指挥 AI**

AI 像是一个极其聪明但极度粗心的实习生。
如果你不给它定规矩，它会：
- 一口气写 20 个文件，你根本不知道哪个错了
- 编造不存在的接口和函数
- 你刚改好的地方，它又给你悄悄改坏了

所以我们建立了一套“规则体系”，让你从“AI 的傀儡”变成“AI 的指挥家”。

---

## 📅 适合 vs 不适合

| ✅ 适合 | ❌ 不适合 |
|--------|----------|
| 正式上线产品 | Hackathon / 快速原型 |
| 长期迭代的全栈应用 | 一次性脚本 / 临时工具 |
| 遗留系统重构 / 迁移 | 需求极不确定的探索项目 |
| 团队协作的商业项目 | 单人学习 / 练手项目 |
| 需要合规审计的项目 | 纯静态内容页面 |
| **你受够了 AI 乱写代码** | 你只想 5 分钟做个 Demo |

---

## 🚀 快速开始

### 1️⃣ 我是完全零基础的新手

请直接阅读 [`cases/case-00-guess-number.md`](cases/case-00-guess-number.md)
不需要安装任何软件，5 分钟做出你的第一个 AI 生成网页游戏。

### 2️⃣ 我有一点基础，想快速体验

1. 打开 [`toolkits/`](toolkits/) 目录
2. 根据你的工具选择对应的 TK：
   - 用 **Cursor** → 复制 `TK-1` 和 `TK-2` 到项目根目录
   - 用 **桌面 AI 客户端** → 对话时粘贴 `TK-4`
   - 用 **网页版 AI** → 设 `TK-3` 为系统提示词
3. 跟着 [`cases/`](cases/) 里对应的案例操作

### 3️⃣ 我想深入理解这套体系

按顺序阅读 [`standard/`](standard/) 目录下的文件：
1. `01-system-overview.md`
2. `02-8-stage-workflow.md`
3. `03-7-iron-rules.md`
4. `05-scenarios-overview.md`
5. 再去看你需要的具体场景章节

---

## 🧩 安装使用

### Claude Code（推荐）

在你的项目目录下执行一条命令：

```bash
cd /你的项目目录
git clone https://gitee.com/AILynx/vibe-coding-standard.git .claude/skills/vibe-coding
```

Claude Code 会自动识别这个 skill。当你开始新项目或提到"Vibe Coding"时，AI 会自动按 8 阶段流程工作。

同时建议复制 `CLAUDE.md` 到项目根目录（双保险）：
```bash
cp .claude/skills/vibe-coding/CLAUDE.md ./CLAUDE.md
```

### Cursor
```bash
# 复制 skill 目录
cp -r vibe-coding-standard/skill/ ~/.cursor/skills/vibe-coding

# 复制项目硬约束
cp vibe-coding-standard/toolkits/TK-1-project-rules.md /你的项目目录/.cursorrules
```

### 桌面客户端
复制 `toolkits/TK-4-desktop-prompt.md` 内容到系统提示词。

### 自动安装脚本（可选）
```bash
git clone https://gitee.com/AILynx/vibe-coding-standard.git
cd vibe-coding-standard

# Linux/macOS
chmod +x quick-install.sh && ./quick-install.sh

# Windows PowerShell
.\quick-install.ps1
```

---

## 📂 仓库结构

| 目录 | 内容 |
|------|------|
| `standard/` | [标准体系正文] 8 阶段流程、7 条铁律、七场景适配 |
| `toolkits/` | [可复用工具包] 拿来即用的 Skill、提示词、Task 模板 |
| `cases/` | [实战案例] 从 5 分钟入门到企业级迁移的 8 个案例 |
| `charts/` | [可视化图表] 10 张辅助理解体系结构的示意图 |

---

## 🛠️ 工具包速查

| 编号 | 名称 | 适用场景 | 给小白的一句话 |
|:---:|------|----------|--------------|
| TK-1 | 项目硬约束模板 | Claude Code / Cursor / VSCode | 给 AI 立规矩的文件 |
| TK-2 | 通用流程 Skill | Claude Code / Cursor / VSCode / 桌面客户端 | 告诉 AI 先做什么后做什么 |
| TK-3 | 网页大模型提示词 | 浏览器版 AI 咨询 | 让 AI 只当顾问不写代码 |
| TK-4 | 桌面客户端提示词 | 桌面版 AI 开发 | AI 的详细工作手册 |
| TK-5 | 8 阶段 Task 模板 | 所有工程场景 | 你的项目进度表 |
| TK-6 | 低代码 Agent 工作流 | Dify / Coze 等 | 给自动生成平台的流水线 |
| TK-7 | 多智能体指令集 | AutoGen / AgentStack | 给多个 AI 的分工任务卡 |

---

## 🔄 场景升级路径

| 升级路径 | 工具变更 |
|----------|----------|
| 原型 → 正式产品 | 停用 TK-3，启用 TK-1 + TK-2 + TK-5 |
| VSCode → Cursor | TK-1 增加 `.cursorrules`，Skill 路径调整 |
| 个人 → 团队 → 企业 | TK-1 叠加企业级 Ruleset，门禁 CI 化 |

---

## 🤝 贡献

欢迎提 Issue 和 PR！
如果你有实战经验想分享，或者发现了标准中的漏洞，请阅读 [`CONTRIBUTING.md`](CONTRIBUTING.md)。

---

## 📄 许可证

MIT License © 2026

你可以自由使用、修改、分发这套标准，包括用于商业项目。
如果你在工作中用到了它，我们只希望你能在项目 README 或团队文档中保留一个指向本仓库的链接。

---

## ⭐ 如果你觉得有用

请在 GitHub 上给这个仓库一个 Star ⭐
你的支持就是我们不断完善这套标准的最大动力。