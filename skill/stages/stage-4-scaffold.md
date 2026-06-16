# 阶段4：脚手架初始化

## 概述

阶段4是硬性门槛阶段，负责初始化项目脚手架，确保空项目能成功启动。

## 核心任务

1. 根据依赖清单初始化项目
2. 安装所有必要依赖
3. 清理冗余示例代码
4. 验证空项目能否成功启动

## AI引导话术

```
现在初始化项目脚手架：

1. 根据依赖清单初始化项目
2. 安装所有必要依赖
3. 清理冗余示例代码
4. 验证空项目能否成功启动

请运行以下命令：
[初始化命令]

然后告诉我运行结果。
```

## 硬性门槛

```
AI: ⚠️ 硬性门槛：空项目必须成功启动且无报错，否则禁止进入编码阶段。

请确认：
- [ ] 项目初始化成功
- [ ] 依赖安装完成
- [ ] 冗余代码已清理
- [ ] 空项目启动无报错

请确认项目已成功启动？
```

## 铁律检查

- 铁律6：空项目初始化失败，绝对不允许编写业务代码

## Git审计

```
确认后，执行：
git add .
git commit -m "[Stage-4] 脚手架：空项目启动成功"
```

## 常见初始化命令

### React + Vite

```bash
# 初始化项目
npm create vite@latest my-app -- --template react-ts

# 进入项目目录
cd my-app

# 安装依赖
npm install

# 清理冗余代码
rm -f src/App.css src/index.css src/assets/react.svg

# 启动项目
npm run dev
```

### Vue + Vite

```bash
# 初始化项目
npm create vite@latest my-app -- --template vue-ts

# 进入项目目录
cd my-app

# 安装依赖
npm install

# 清理冗余代码
rm -f src/style.css src/assets/vue.svg

# 启动项目
npm run dev
```

### Node.js + Express

```bash
# 初始化项目
mkdir my-api && cd my-api
npm init -y

# 安装依赖
npm install express

# 创建入口文件
echo "const express = require('express'); const app = express(); app.listen(3000);" > index.js

# 启动项目
node index.js
```

## 空项目验证清单

### 前端项目

```
验证清单：
- [ ] 项目能成功启动（npm run dev）
- [ ] 浏览器能访问（http://localhost:5173）
- [ ] 页面显示正常（无白屏、无报错）
- [ ] 控制台无错误信息
- [ ] 热更新正常工作
```

### 后端项目

```
验证清单：
- [ ] 项目能成功启动（node index.js）
- [ ] 服务能正常监听端口
- [ ] 健康检查接口能访问（curl http://localhost:3000）
- [ ] 控制台无错误信息
- [ ] 进程能正常退出（Ctrl+C）
```

## 常见问题

### Q: npm create vite失败怎么办？
A: 检查Node.js版本是否≥18：
```bash
node -v
# 如果版本过低，下载LTS版本：https://nodejs.org/
```

### Q: 依赖安装失败怎么办？
A: 尝试以下方案：
```bash
# 清除缓存
npm cache clean --force

# 使用淘宝镜像
npm config set registry https://registry.npmmirror.com

# 重新安装
npm install
```

### Q: 空项目启动报错怎么办？
A: 分析错误日志：
```bash
# 查看详细错误信息
npm run dev 2>&1 | tee error.log

# 常见错误：
# 1. 端口被占用 → 修改端口或关闭占用进程
# 2. 依赖缺失 → 重新安装依赖
# 3. 配置错误 → 检查配置文件
```

## 阶段总结

```
AI: 阶段4完成。

验证结果：
- [x] 项目初始化成功
- [x] 依赖安装完成
- [x] 冗余代码已清理
- [x] 空项目启动无报错

空项目已成功启动，请确认，确认后进入阶段5：增量编码。
```
