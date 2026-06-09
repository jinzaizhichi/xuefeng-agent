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
python -c "import openai" >/dev/null 2>&1
if errorlevel 1 (
    echo Installing required packages...
    python -m pip install openai pywin32 -q
    echo Done.
)

echo Starting...
python agent.py
if errorlevel 1 (
    echo.
    echo If you see 'python' not found, install Python 3.10+ from python.org
)
echo.
pause
