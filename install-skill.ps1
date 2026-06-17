# Vibe Coding SKILL 一键安装脚本
# 使用方式：在任意文件夹执行 .\install-skill.ps1

Write-Host "🚀 开始安装 Vibe Coding SKILL..." -ForegroundColor Cyan

# 检测已安装的AI工具
$cursorPath = "$env:USERPROFILE\.cursor\skills"
$vscodePath = "$env:USERPROFILE\.vscode\skills"

$targetPath = $null

# 优先使用Cursor，其次VSCode
if (Test-Path "$env:USERPROFILE\.cursor") {
    $targetPath = "$cursorPath\vibe-coding"
    Write-Host "📦 检测到Cursor，安装到: $targetPath" -ForegroundColor Yellow
} elseif (Test-Path "$env:USERPROFILE\.vscode") {
    $targetPath = "$vscodePath\vibe-coding"
    Write-Host "📦 检测到VSCode，安装到: $targetPath" -ForegroundColor Yellow
} else {
    Write-Host "❌ 未检测到Cursor或VSCode，请先安装AI工具" -ForegroundColor Red
    exit 1
}

# 创建skills目录（如果不存在）
$skillsDir = Split-Path -Parent $targetPath
if (-not (Test-Path $skillsDir)) {
    New-Item -ItemType Directory -Path $skillsDir -Force | Out-Null
    Write-Host "📁 创建skills目录: $skillsDir" -ForegroundColor Green
}

# 如果已存在，先删除
if (Test-Path $targetPath) {
    Remove-Item -Recurse -Force $targetPath
    Write-Host "🗑️  清理旧版本..." -ForegroundColor Yellow
}

# 克隆仓库
Write-Host "📥 正在下载SKILL..." -ForegroundColor Yellow
git clone --depth 1 https://gitee.com/AILynx/vibe-coding-standard.git "$targetPath-temp"

# 复制skill目录
Copy-Item -Recurse -Path "$targetPath-temp\skill\*" -Destination $targetPath
Remove-Item -Recurse -Force "$targetPath-temp"

Write-Host ""
Write-Host "🎉 安装完成！" -ForegroundColor Green
Write-Host ""
Write-Host "📖 使用方法：" -ForegroundColor Cyan
Write-Host "1. 打开Cursor或VSCode"
Write-Host "2. 创建新项目目录"
Write-Host "3. 输入 /vibe-coding 命令"
Write-Host "4. 按AI引导完成项目开发"