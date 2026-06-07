@echo off
title Xuefeng Agent
cd /d "%~dp0"

:: Find Python
set PYTHON=
for %%p in (python python3 py) do (
    where %%p >nul 2>nul
    if %errorlevel%==0 set PYTHON=%%p
)
if "%PYTHON%"=="" (
    echo Python not found!
    echo Please install Python 3.10+ from https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation.
    pause
    exit /b 1
)

:: Check .env
if not exist ".env" (
    echo .env file not found!
    echo Please copy .env.example to .env and fill in your API Key.
    pause
    exit /b 1
)

:: Run agent
%PYTHON% agent.py
echo.
echo Program exited. If you see errors, please screenshot.
pause
