# Vibe Coding SKILL 一键安装脚本
# 使用方式：.\quick-install.ps1

Write-Host "🚀 开始安装 Vibe Coding SKILL..." -ForegroundColor Cyan

# 获取脚本所在目录
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$SKILL_DIR = "$SCRIPT_DIR\skill"

# 检查skill目录是否存在
if (-not (Test-Path $SKILL_DIR)) {
    Write-Host "❌ 错误：找不到skill目录" -ForegroundColor Red
    exit 1
}

# 检测已安装的AI工具
$cursorPath = "$env:USERPROFILE\.cursor\skills"
$vscodePath = "$env:USERPROFILE\.vscode\skills"

$installed = $false

# 安装到Cursor
if (Test-Path $cursorPath) {
    Write-Host "📦 检测到Cursor，正在安装..." -ForegroundColor Yellow
    $targetDir = "$cursorPath\vibe-coding"
    if (Test-Path $targetDir) {
        Remove-Item -Recurse -Force $targetDir
    }
    Copy-Item -Recurse -Path $SKILL_DIR -Destination $targetDir
    Write-Host "✅ 已安装到Cursor: $targetDir" -ForegroundColor Green
    $installed = $true
}

# 安装到VSCode
if (Test-Path $vscodePath) {
    Write-Host "📦 检测到VSCode，正在安装..." -ForegroundColor Yellow
    $targetDir = "$vscodePath\vibe-coding"
    if (Test-Path $targetDir) {
        Remove-Item -Recurse -Force $targetDir
    }
    Copy-Item -Recurse -Path $SKILL_DIR -Destination $targetDir
    Write-Host "✅ 已安装到VSCode: $targetDir" -ForegroundColor Green
    $installed = $true
}

if ($installed) {
    Write-Host ""
    Write-Host "🎉 安装完成！" -ForegroundColor Green
    Write-Host ""
    Write-Host "📖 使用方法：" -ForegroundColor Cyan
    Write-Host "1. 打开Cursor或VSCode"
    Write-Host "2. 创建新项目目录"
    Write-Host "3. 输入 /vibe-coding 命令"
    Write-Host "4. 按AI引导完成项目开发"
} else {
    Write-Host "❌ 未检测到Cursor或VSCode" -ForegroundColor Red
    Write-Host "请先安装Cursor或VSCode，然后再运行此脚本"
}