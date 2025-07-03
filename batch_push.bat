@echo off
setlocal enabledelayedexpansion

REM ===== 配置区域 =====
set BATCH_SIZE=20            REM 每批推送的文件数量（推荐20-50）
set BRANCH=main              REM 推送的分支名称
REM ====================

chcp 65001 > nul
set /a batch_count=0

:push_batch
set /a batch_count+=1

echo.
echo === 正在准备第 !batch_count! 批推送 ===

REM 获取当前暂存的文件列表
set file_count=0
for /f "delims=" %%f in ('git diff --cached --name-only') do (
    set /a file_count+=1
    if !file_count! leq %BATCH_SIZE% (
        echo 保留: %%f
        set "keep_files=!keep_files! "%%f""
    ) else (
        echo 移除: %%f
        git reset "%%f"
    )
)

if !file_count! leq %BATCH_SIZE% (
    echo 最后一批文件 (!file_count! 个)
) else (
    echo 本批推送 %BATCH_SIZE% 个文件
)

REM 创建提交
git commit -m "分批推送 第!batch_count!批" > nul
echo 已创建提交: 分批推送 第!batch_count!批

REM 推送到远程
echo 正在推送第 !batch_count! 批...
git push origin %BRANCH%

if errorlevel 1 (
    echo 推送失败！请检查网络或权限
    pause
    exit /b
)

echo 成功推送第 !batch_count! 批

REM 检查是否还有剩余文件
git diff --cached --quiet
if errorlevel 1 (
    goto push_batch
) else (
    echo.
    echo ===== 所有文件已成功推送 =====
    echo 共推送 !batch_count! 个批次
)

pause