# 案例6：多智能体——让 AI 小队做一个博客系统

> **难度**：★★★★（需要有一定的 Python/JavaScript 基础，理解 API 概念）
> **工具包**：TK-7（多智能体指令集）+ TK-5（Task模板）
> **你需要**：安装了 Python 3.10+、Node.js 18+、一个代码编辑器、OpenAI API Key（或兼容的 API）
> **你将做出**：一个完整的个人博客系统（后端 FastAPI + 前端 React），由多个 AI Agent 分工协作完成

## 前置准备

1. 安装 AutoGen：

```bash
pip install pyautogen
```

2. 准备 API Key（OpenAI 或兼容的如 DeepSeek、智谱等）。
3. 3.创建项目文件夹：

bash

```
mkdir multi-agent-blog
cd multi-agent-blog
```



4. 准备 TK-7 工具包内容（第〇章）。

## 第 1 步：配置 AutoGen 环境（15 分钟）

创建一个 `config.py` 文件，配置 LLM 连接：

python

```
import autogen

config_list = [
    {
        "model": "gpt-4",  # 或你的模型名称
        "api_key": "your-api-key-here",
        "base_url": "https://api.openai.com/v1"  # 如用兼容API，改为对应地址
    }
]
```



创建 `team.py` 文件，定义 Agent 团队。将 TK-7 中各角色的系统提示词注入：

python

```
from config import config_list

# 通用规则（所有 Agent 共享）
general_rules = """
[此处粘贴 TK-7 中的"通用规则"部分]
"""

# 创建各角色 Agent
architect = autogen.AssistantAgent(
    name="架构师",
    system_message=general_rules + """
    [此处粘贴 TK-7 中"架构师 Agent"的专属指令]
    """
)

devops = autogen.AssistantAgent(
    name="DevOps",
    system_message=general_rules + """
    [此处粘贴 TK-7 中"DevOps Agent"的专属指令]
    """
)

programmer_a = autogen.AssistantAgent(
    name="程序员A",
    system_message=general_rules + """
    [此处粘贴 TK-7 中"程序员 Agent"的专属指令]
    """
)

programmer_b = autogen.AssistantAgent(
    name="程序员B",
    system_message=general_rules + """
    [此处粘贴 TK-7 中"程序员 Agent"的专属指令]
    """
)

tester = autogen.AssistantAgent(
    name="测试员",
    system_message=general_rules + """
    [此处粘贴 TK-7 中"测试员 Agent"的专属指令]
    """
)

integrator = autogen.AssistantAgent(
    name="集成工程师",
    system_message=general_rules + """
    [此处粘贴 TK-7 中"集成 Agent"的专属指令]
    """
)

# 人类代理（你自己）
human_proxy = autogen.UserProxyAgent(
    name="项目经理",
    human_input_mode="ALWAYS",
    code_execution_config={"work_dir": "project"}
)
```



## 第 2 步：启动阶段 1-2——架构设计（15 分钟）

在 `team.py` 中创建群聊并启动：

python

```
groupchat = autogen.GroupChat(
    agents=[human_proxy, architect, devops],
    messages=[],
    max_round=10
)
manager = autogen.GroupChatManager(groupchat=groupchat)

human_proxy.initiate_chat(
    manager,
    message="""
    项目需求：开发一个个人博客系统。
    后端：FastAPI + SQLite，提供文章的增删改查 API。
    前端：React + TypeScript，展示文章列表、文章详情、后台管理。
    
    请架构师 Agent 完成阶段1（需求收敛）和阶段2（架构设计+接口定义）。
    产出：项目简介、功能分级、Mermaid流程图、目录树、OpenAPI 接口定义。
    """
)
```



运行：

bash

```
python team.py
```



架构师会输出架构方案。作为项目经理，你审核后回复"确认锁定"。

## 第 3 步：阶段 3-4——环境初始化（10 分钟）

DevOps Agent 会给出项目初始化指令。你在本地执行：

bash

```
# 后端
mkdir backend && cd backend
python -m venv venv && source venv/bin/activate
pip install fastapi uvicorn sqlalchemy

# 前端
cd .. && mkdir frontend && cd frontend
npm create vite@latest . -- --template react-ts
npm install
```



确认环境正常后，回复 DevOps Agent："阶段4确认，环境就绪。"

## 第 4 步：阶段 5——并行编码（30 分钟）

将任务分配给两个程序员 Agent：

- 程序员 A：负责后端 API（文章模型、CRUD 接口）
- 程序员 B：负责前端页面（文章列表、文章详情、后台管理界面）

两个 Agent 通过阶段 2 定义的 OpenAPI 接口契约来保证协作。

你会收到每个 Agent 的代码产出。逐个审核，确认后让它们提交。

## 第 5 步：阶段 6——测试（15 分钟）

测试员 Agent 对每个模块生成测试用例并执行。失败的测试返回给对应的程序员修复。

## 第 6 步：阶段 7-8——集成与交付（15 分钟）

集成 Agent 合并代码，运行端到端测试，统一风格。

文档 Agent 生成 README 和部署说明。

## 最终成果

你的 `multi-agent-blog` 文件夹里有完整的前后端代码，可以直接运行：

bash

```
# 启动后端
cd backend && uvicorn main:app --reload

# 启动前端（新终端窗口）
cd frontend && npm run dev
```



## 常见问题

**Q: AutoGen Agent 一直不回复？**
A: 检查 API Key 是否正确，网络是否通畅。或降低 `max_round` 值。

**Q: 两个程序员 Agent 产出冲突？**
A: 让它们严格遵循阶段 2 的 OpenAPI 接口定义。作为项目经理，你拥有最终决定权。

**Q: 成本太高？**
A: 使用 DeepSeek 等低成本模型，或仅在关键阶段（阶段 5-6）使用强模型。