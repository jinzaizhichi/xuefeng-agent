@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ==============================
echo   雪峰Agent 启动中...
echo ==============================

:: 关掉旧进程
for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":8765.*LISTENING"') do (
    taskkill /PID %%a /F >nul 2>&1
)

:: 启动服务器
start "雪峰Agent" python server.py

:: 等3秒后打开浏览器
timeout /t 3 /nobreak >nul
start http://127.0.0.1:8765/

echo   浏览器已打开，如果没看到页面请刷新
