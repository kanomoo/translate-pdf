#!/usr/bin/env bash
# PDF Translator - Auto Setup (Linux / macOS)
# Usage: chmod +x setup.sh && ./setup.sh

set -e

echo ""
echo "============================================"
echo "  PDF Translator - Auto Setup (Linux/macOS)"
echo "============================================"
echo ""

# --- Check Python ---
PYTHON=""
if command -v python3 &>/dev/null; then
    PYTHON="python3"
elif command -v python &>/dev/null; then
    PYTHON="python"
else
    echo "[ERROR] Python not found."
    echo "        Please install Python 3.8+ first:"
    echo "        Ubuntu/Debian : sudo apt install python3 python3-venv python3-pip"
    echo "        Fedora        : sudo dnf install python3 python3-pip"
    echo "        macOS         : brew install python3"
    exit 1
fi

echo "[1/5] Using $($PYTHON --version)"
echo ""

# --- Create virtual environment if not exists ---
if [ ! -d ".venv" ]; then
    echo "[2/5] Creating virtual environment..."
    $PYTHON -m venv .venv
    echo "      Done!"
else
    echo "[2/5] Virtual environment already exists. Skipping..."
fi
echo ""

# --- Activate venv ---
source .venv/bin/activate

# --- Install dependencies ---
echo "[3/5] Installing Python dependencies..."
pip install -r requirements.txt
echo "      Done!"
echo ""

# --- Install Thai fonts (Linux only) ---
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "[4/5] Checking Thai fonts..."
    if fc-list :lang=th | grep -qi "thai\|noto.*thai\|leelawadee"; then
        echo "      Thai fonts found!"
    else
        echo "      Thai fonts not found. Installing..."
        if command -v apt-get &>/dev/null; then
            sudo apt-get install -y fonts-noto-cjk fonts-noto-cjk-extra 2>/dev/null || \
            echo "      [WARNING] Could not install fonts automatically."
            echo "      Please run: sudo apt-get install fonts-noto-cjk fonts-noto-cjk-extra"
        elif command -v dnf &>/dev/null; then
            sudo dnf install -y google-noto-sans-thai-fonts 2>/dev/null || \
            echo "      [WARNING] Could not install fonts automatically."
            echo "      Please run: sudo dnf install google-noto-sans-thai-fonts"
        elif command -v pacman &>/dev/null; then
            sudo pacman -S --noconfirm noto-fonts-extra 2>/dev/null || \
            echo "      [WARNING] Could not install fonts automatically."
            echo "      Please run: sudo pacman -S noto-fonts-extra"
        else
            echo "      [WARNING] Unknown package manager. Please install Thai fonts manually."
        fi
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "[4/5] macOS detected — Thai font (Thonburi) is usually pre-installed."
else
    echo "[4/5] Skipping font check for this OS."
fi
echo ""

# --- Start the application ---
echo "[5/5] Starting PDF Translator..."
echo ""
echo "============================================"
echo "  Open your browser and go to:"
echo "  http://localhost:5000"
echo "============================================"
echo ""
echo "  Press Ctrl+C to stop the server."
echo ""
python app.py
