# Vibe Coding SKILL 一键安装脚本
# 使用方式：在仓库目录执行 .\install-skill.ps1

Write-Host "🚀 开始安装 Vibe Coding SKILL..." -ForegroundColor Cyan

# 获取脚本所在目录
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$SKILL_DIR = "$SCRIPT_DIR\skill"

# 检查skill目录是否存在
if (-not (Test-Path $SKILL_DIR)) {
    Write-Host "❌ 错误：找不到skill目录" -ForegroundColor Red
    exit 1
}

$installed = $false

# 安装到Claude Code（单文件方式）
$claudePath = "$env:USERPROFILE\.claude\skills\vibe-coding"
if (Test-Path "$env:USERPROFILE\.claude") {
    Write-Host "📦 检测到Claude Code，正在安装..." -ForegroundColor Yellow
    if (-not (Test-Path $claudePath)) {
        New-Item -ItemType Directory -Path $claudePath -Force | Out-Null
    }
    Copy-Item -Path "$SKILL_DIR\SKILL.md" -Destination "$claudePath\SKILL.md" -Force
    Write-Host "✅ 已安装到Claude Code: $claudePath" -ForegroundColor Green
    $installed = $true
}

# 安装到Cursor（完整目录方式）
$cursorPath = "$env:USERPROFILE\.cursor\skills\vibe-coding"
if (Test-Path "$env:USERPROFILE\.cursor") {
    Write-Host "📦 检测到Cursor，正在安装..." -ForegroundColor Yellow
    if (Test-Path $cursorPath) {
        Remove-Item -Recurse -Force $cursorPath
    }
    Copy-Item -Recurse -Path $SKILL_DIR -Destination $cursorPath
    Write-Host "✅ 已安装到Cursor: $cursorPath" -ForegroundColor Green
    $installed = $true
}

# 安装到VSCode（完整目录方式）
$vscodePath = "$env:USERPROFILE\.vscode\skills\vibe-coding"
if (Test-Path "$env:USERPROFILE\.vscode") {
    Write-Host "📦 检测到VSCode，正在安装..." -ForegroundColor Yellow
    if (Test-Path $vscodePath) {
        Remove-Item -Recurse -Force $vscodePath
    }
    Copy-Item -Recurse -Path $SKILL_DIR -Destination $vscodePath
    Write-Host "✅ 已安装到VSCode: $vscodePath" -ForegroundColor Green
    $installed = $true
}

if ($installed) {
    Write-Host ""
    Write-Host "🎉 安装完成！" -ForegroundColor Green
    Write-Host ""
    Write-Host "📖 使用方法：" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "【Claude Code】" -ForegroundColor Yellow
    Write-Host "  在任意项目目录输入 /vibe-coding 即可加载标准"
    Write-Host ""
    Write-Host "【Cursor / VSCode】" -ForegroundColor Yellow
    Write-Host "  1. 打开Cursor或VSCode"
    Write-Host "  2. 创建新项目目录"
    Write-Host "  3. 输入 /vibe-coding 命令"
    Write-Host "  4. 按AI引导完成项目开发"
} else {
    Write-Host "❌ 未检测到Claude Code、Cursor或VSCode" -ForegroundColor Red
    Write-Host "请先安装AI工具，然后再运行此脚本"
}
