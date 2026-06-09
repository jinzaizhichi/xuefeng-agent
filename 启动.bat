@echo off
title 雪峰Agent
cd /d "%~dp0"

if not exist ".env" (
    echo .env not found!
    echo Copy .env.example to .env and fill in your API key.
    pause
    exit /b 1
)

echo Checking dependencies...
python -c "import openai" 2>/dev/null
if %errorlevel% neq 0 (
    echo Installing required packages...
    python -m pip install openai pywin32 -q
)

echo Starting...
python agent.py 2>&1
if %errorlevel% neq 0 (
    echo.
    echo If you see 'python' not found, install Python 3.10+ from python.org
    echo Make sure to check "Add Python to PATH" during installation.
)
echo.
pause
