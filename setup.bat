@echo off
chcp 65001 >nul 2>&1
title PDF Translator - Setup

echo.
echo ============================================
echo   PDF Translator - Auto Setup (Windows)
echo ============================================
echo.

REM --- Check Python ---
where python >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Python not found. Please install Python 3.8+ from https://www.python.org/downloads/
    echo         Make sure to check "Add Python to PATH" during installation.
    pause
    exit /b 1
)

REM --- Show Python version ---
echo [1/4] Checking Python version...
python --version
echo.

REM --- Create virtual environment if not exists ---
if not exist ".venv" (
    echo [2/4] Creating virtual environment...
    python -m venv .venv
    if %ERRORLEVEL% neq 0 (
        echo [ERROR] Failed to create virtual environment.
        pause
        exit /b 1
    )
    echo       Done!
) else (
    echo [2/4] Virtual environment already exists. Skipping...
)
echo.

REM --- Activate venv and install dependencies ---
echo [3/4] Installing dependencies...
call .venv\Scripts\activate.bat
pip install -r requirements.txt
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Failed to install dependencies.
    pause
    exit /b 1
)
echo       Done!
echo.

REM --- Start the application ---
echo [4/4] Starting PDF Translator...
echo.
echo ============================================
echo   Open your browser and go to:
echo   http://localhost:5000
echo ============================================
echo.
echo   Press Ctrl+C to stop the server.
echo.
python app.py
pause
