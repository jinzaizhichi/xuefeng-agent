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
C:\Users\17625\AppData\Local\Programs\Python\Python312\python.exe -c "import openai" 2>nul
if errorlevel 1 (
    echo Installing required packages...
    C:\Users\17625\AppData\Local\Programs\Python\Python312\python.exe -m pip install openai pywin32 -q
    echo Done.
)

echo Starting...
C:\Users\17625\AppData\Local\Programs\Python\Python312\python.exe agent.py
echo.
pause
