@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ==============================
echo   雪峰Agent 启动中...
echo ==============================

:: Kill any existing server on port 8765
for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":8765.*LISTENING"') do (
    echo   关闭旧进程 PID:%%a
    taskkill /PID %%a /F >nul 2>&1
)
timeout /t 1 >nul

:: Start server
start "雪峰Agent服务器" python server.py

:: Wait for server to be ready
echo   等待服务器就绪...
for /L %%i in (1,1,15) do (
    timeout /t 1 >nul
    curl -s http://127.0.0.1:8765/ping >nul 2>&1
    if not errorlevel 1 (
        echo   服务器已就绪
        start http://127.0.0.1:8765/
        exit /b 0
    )
)

echo   服务器启动超时，请检查是否被杀毒软件拦截
pause
