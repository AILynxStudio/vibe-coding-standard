# 案例4：VSCode + AI 插件——用 AI 帮你分析 Excel 数据

> **难度**：★★★（需要安装 Python 和 VS Code）
> **工具包**：TK-1（仅 CLAUDE.md）+ TK-2（通用流程Skill）+ TK-5（Task模板）
> **你需要**：电脑已安装 Python 3、VS Code、一个 AI 插件（Claude Code 或 Copilot）
> **你将做出**：一个 Python 脚本，能读取 Excel 文件，自动计算统计数据并生成图表

## 前置准备

1. 确认 Python 已安装：终端输入 `python --version`，看到版本号即可。
2. 确认 VS Code 已安装 AI 插件（Claude Code 插件或 GitHub Copilot）。
3. 准备一个测试用的 Excel 文件（例如销售数据表，包含日期、产品、销售额、数量等列）。如果没有，让 AI 帮你生成一个示例文件。

## 环境配置（10 分钟）

### 步骤 1：创建项目文件夹

```bash
mkdir excel-analysis
cd excel-analysis
```

### 步骤 2：部署规则文件

在项目根目录创建 `CLAUDE.md`，内容复制 TK-1 模板。

创建文件夹 `skills/vibe-coding-std/`，在里面创建 `index.md`，内容复制 TK-2 模板。

### 步骤 3：初始化 Git

bash

```
git init
git add .
git commit -m "init: 部署规则文件"
```



------

## 阶段 1：需求收敛（5 分钟）

在 VS Code 中打开 AI 对话（Claude Code 插件按 `Cmd+Shift+P` → `Claude: Open Chat`）。

对话开始时先粘贴 CLAUDE.md 内容（告诉 AI 遵守规则），然后说：

> 阶段1：我要做一个 Excel 数据分析脚本。核心功能：读取 Excel 文件，计算每个产品的总销售额和总销量，生成统计汇总表，输出柱状图。次要功能：按月份筛选、生成环比增长率。扩展功能：导出分析结果为新的 Excel 文件。

------

## 阶段 2：架构设计（5 分钟）

> 阶段2：确定项目结构。
> 目录结构：一个 `analysis.py` 主脚本、一个 `data/` 放输入文件、一个 `output/` 放输出图表。
> 依赖：pandas, openpyxl, matplotlib。

------

## 阶段 4：空项目初始化（5 分钟）

跳过阶段 3（手动确认规则已生效即可）。

在终端中：

bash

```
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install pandas openpyxl matplotlib
```



创建文件夹：

bash

```
mkdir data output
```



把你的 Excel 测试文件放到 `data/` 文件夹里。

确认 Python 环境正常：

bash

```
python -c "import pandas; print('OK')"
```



输出 OK 则环境就绪。

------

## 阶段 5：增量编码（分 4 轮，约 30 分钟）

### 模块 5-1：读取文件

> 阶段5第一个模块：请创建 analysis.py，实现读取 data/ 文件夹中的 Excel 文件，打印前 5 行数据和列名。仅写这个功能。

测试运行：

bash

```
python analysis.py
```



确认正确输出数据。

### 模块 5-2：计算统计

> 第二个模块：在 analysis.py 中增加统计功能。按"产品"分组，计算总销售额和总销量，打印统计结果表。

测试确认数字正确。

### 模块 5-3：生成图表

> 第三个模块：增加生成柱状图功能。用 matplotlib 生成产品销售额对比图，保存到 output/ 文件夹。

测试确认图片生成。

### 模块 5-4：导出结果

> 第四个模块：将统计结果导出为新的 Excel 文件，保存到 output/ 文件夹。

------

## 阶段 6：测试（10 分钟）

> 阶段6：请生成测试清单。测试场景需包括：正常 Excel 文件、空 Excel 文件（只有表头）、缺少列的文件、文件不存在的情况。

逐项测试，Bug 反馈修复。

------

## 阶段 7-8：完善与交付（10 分钟）

> 阶段7：请检查代码，添加异常处理（文件不存在、列名不匹配等），统一注释风格。

> 阶段8：生成 README.md，说明使用方法、依赖安装、输入输出格式。

提交所有代码。

## 常见问题

**Q: pip install 报错？**
A: 确认虚拟环境已激活（终端前面有 `(venv)` 字样）。如果网络慢，加 `-i https://pypi.tuna.tsinghua.edu.cn/simple` 用国内镜像。

**Q: 读取 Excel 报错？**
A: 确认文件路径正确，文件放在 `data/` 文件夹里。把完整报错发给 AI 分析。