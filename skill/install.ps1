# Vibe Coding Skill 安装脚本 (Windows PowerShell)

Write-Host "🚀 安装 Vibe Coding Skill..." -ForegroundColor Cyan

# 检查是否在正确的目录
if (-not (Test-Path "SKILL.md")) {
    Write-Host "❌ 请在skill目录中运行此脚本" -ForegroundColor Red
    exit 1
}

# 获取脚本所在目录
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "📊 检测到系统: Windows" -ForegroundColor Yellow

# 安装到Cursor
function Install-ToCursor {
    $CURSOR_SKILLS_DIR = "$env:USERPROFILE\.cursor\skills"
    if (-not (Test-Path $CURSOR_SKILLS_DIR)) {
        New-Item -ItemType Directory -Path $CURSOR_SKILLS_DIR -Force | Out-Null
    }
    
    $targetDir = "$CURSOR_SKILLS_DIR\vibe-coding"
    if (Test-Path $targetDir) {
        Write-Host "⚠️  Cursor skill已存在，更新中..." -ForegroundColor Yellow
        Remove-Item -Recurse -Force $targetDir
    }
    
    Copy-Item -Recurse -Path $SCRIPT_DIR -Destination $targetDir
    Write-Host "✅ 已安装到Cursor: $targetDir" -ForegroundColor Green
}

# 安装到VSCode
function Install-ToVSCode {
    $VSCODE_SKILLS_DIR = "$env:USERPROFILE\.vscode\skills"
    if (-not (Test-Path $VSCODE_SKILLS_DIR)) {
        New-Item -ItemType Directory -Path $VSCODE_SKILLS_DIR -Force | Out-Null
    }
    
    $targetDir = "$VSCODE_SKILLS_DIR\vibe-coding"
    if (Test-Path $targetDir) {
        Write-Host "⚠️  VSCode skill已存在，更新中..." -ForegroundColor Yellow
        Remove-Item -Recurse -Force $targetDir
    }
    
    Copy-Item -Recurse -Path $SCRIPT_DIR -Destination $targetDir
    Write-Host "✅ 已安装到VSCode: $targetDir" -ForegroundColor Green
}

# 创建符号链接（开发模式）
function Install-Symlink {
    $CURSOR_SKILLS_DIR = "$env:USERPROFILE\.cursor\skills"
    $VSCODE_SKILLS_DIR = "$env:USERPROFILE\.vscode\skills"
    
    # 创建目录
    if (-not (Test-Path $CURSOR_SKILLS_DIR)) {
        New-Item -ItemType Directory -Path $CURSOR_SKILLS_DIR -Force | Out-Null
    }
    if (-not (Test-Path $VSCODE_SKILLS_DIR)) {
        New-Item -ItemType Directory -Path $VSCODE_SKILLS_DIR -Force | Out-Null
    }
    
    # Cursor符号链接
    $cursorTarget = "$CURSOR_SKILLS_DIR\vibe-coding"
    if (Test-Path $cursorTarget) {
        Remove-Item -Recurse -Force $cursorTarget
    }
    New-Item -ItemType SymbolicLink -Path $cursorTarget -Target $SCRIPT_DIR | Out-Null
    Write-Host "✅ 已创建Cursor符号链接" -ForegroundColor Green
    
    # VSCode符号链接
    $vscodeTarget = "$VSCODE_SKILLS_DIR\vibe-coding"
    if (Test-Path $vscodeTarget) {
        Remove-Item -Recurse -Force $vscodeTarget
    }
    New-Item -ItemType SymbolicLink -Path $vscodeTarget -Target $SCRIPT_DIR | Out-Null
    Write-Host "✅ 已创建VSCode符号链接" -ForegroundColor Green
}

# 显示菜单
function Show-Menu {
    Write-Host ""
    Write-Host "请选择安装方式:" -ForegroundColor Cyan
    Write-Host "1) 安装到Cursor"
    Write-Host "2) 安装到VSCode"
    Write-Host "3) 同时安装到Cursor和VSCode"
    Write-Host "4) 创建符号链接（开发模式）"
    Write-Host "5) 退出"
    Write-Host ""
    
    $choice = Read-Host "请输入选项 [1-5]"
    
    switch ($choice) {
        "1" { Install-ToCursor }
        "2" { Install-ToVSCode }
        "3" { Install-ToCursor; Install-ToVSCode }
        "4" { Install-Symlink }
        "5" { Write-Host "👋 退出安装" -ForegroundColor Green; exit 0 }
        default { Write-Host "❌ 无效选项" -ForegroundColor Red; Show-Menu }
    }
}

# 主程序
Write-Host ""
Write-Host "🎯 Vibe Coding Skill 安装程序" -ForegroundColor Cyan
Write-Host "=============================="
Write-Host ""

# 检查是否已安装
$cursorInstalled = Test-Path "$env:USERPROFILE\.cursor\skills\vibe-coding"
$vscodeInstalled = Test-Path "$env:USERPROFILE\.vscode\skills\vibe-coding"

if ($cursorInstalled -or $vscodeInstalled) {
    Write-Host "⚠️  检测到已安装的Vibe Coding Skill" -ForegroundColor Yellow
    $reinstall = Read-Host "是否重新安装? (y/N)"
    if ($reinstall -notmatch "^[Yy]$") {
        Write-Host "👍 保持现有安装" -ForegroundColor Green
        exit 0
    }
}

Show-Menu

Write-Host ""
Write-Host "🎉 安装完成！" -ForegroundColor Green
Write-Host ""
Write-Host "📖 使用说明:" -ForegroundColor Cyan
Write-Host "1. Cursor: 新建项目时自动加载，或输入 /vibe-coding"
Write-Host "2. VSCode: 命令面板输入 'Load Skill' 选择 vibe-coding"
Write-Host "3. 桌面客户端: 复制 toolkits/TK-4-desktop-prompt.md 到系统提示词"
Write-Host ""
Write-Host "📚 更多信息请查看 README.md 和 INSTALL.md" -ForegroundColor Yellow