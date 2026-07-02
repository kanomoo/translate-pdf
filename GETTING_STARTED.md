# Getting Started with PDF Translator

## วิธีที่ง่ายที่สุด — One-Click Setup

### Windows
1. ดับเบิลคลิกไฟล์ **`setup.bat`** หรือเปิด Terminal แล้วพิมพ์:
   ```
   setup.bat
   ```
2. รอจนกว่าจะขึ้นข้อความ `Open your browser and go to: http://localhost:5000`
3. เปิดเบราว์เซอร์ไปที่ **http://localhost:5000**

### Linux / macOS
1. เปิด Terminal แล้วพิมพ์:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```
2. รอจนกว่าจะขึ้นข้อความ `Open your browser and go to: http://localhost:5000`
3. เปิดเบราว์เซอร์ไปที่ **http://localhost:5000**

> **หมายเหตุ:** Script จะสร้าง virtual environment, ติดตั้ง dependencies ทั้งหมด, และติดตั้ง Thai fonts (บน Linux) ให้อัตโนมัติ

---

## วิธีติดตั้งเอง (Manual Setup)

### Prerequisites

- Python 3.8 or later
- Git

### Installation Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/kanomoo/translate-pdf.git
   cd translate-pdf
   ```

2. **Create virtual environment:**
   ```bash
   # Windows:
   python -m venv .venv
   .venv\Scripts\activate

   # Linux/macOS:
   python3 -m venv .venv
   source .venv/bin/activate
   ```

3. **Install dependencies (สำคัญมาก!):**
   ```bash
   pip install -r requirements.txt
   ```
   > ⚠️ ห้ามข้ามขั้นตอนนี้! หากไม่รันจะพบ error: `ModuleNotFoundError: No module named 'pythainlp'`

4. **Install Thai fonts (Linux only):**
   ```bash
   # Ubuntu/Debian
   sudo apt-get install fonts-noto-cjk fonts-noto-cjk-extra

   # Fedora
   sudo dnf install google-noto-sans-thai-fonts

   # Arch Linux
   sudo pacman -S noto-fonts-extra
   ```
   > Windows และ macOS มี Thai fonts มาพร้อมกับระบบแล้ว ไม่ต้องติดตั้งเพิ่ม

5. **Run the application:**
   ```bash
   python app.py
   ```

6. **Open in browser:**
   - Visit: http://localhost:5000

---

## การรันครั้งถัดไป (ครั้งที่ 2 เป็นต้นไป)

ไม่ต้องติดตั้งใหม่ แค่ activate venv แล้วรันโปรแกรม:

### Windows:
```powershell
.\.venv\Scripts\activate
python app.py
```
หรือดับเบิลคลิก `setup.bat` ได้เลย (จะข้ามขั้นตอนที่ทำไปแล้ว)

### Linux/macOS:
```bash
source .venv/bin/activate
python app.py
```
หรือรัน `./setup.sh` ได้เลย

---

## Basic Usage

1. Click the upload area to select a PDF file
2. The app will automatically translate and process it
3. Watch the real-time progress updates
4. Click "Download" when complete

## Troubleshooting

### `ModuleNotFoundError: No module named 'pythainlp'`
ยังไม่ได้ติดตั้ง dependencies — ให้รัน `pip install -r requirements.txt` ภายใน venv

### Port already in use
```bash
# Windows:
netstat -ano | findstr :5000

# Linux/macOS:
lsof -i :5000
kill -9 <PID>
```

### Thai fonts not found
ดูขั้นตอนที่ 4 ในส่วน Manual Setup ด้านบน

### Translation not working
1. ตรวจสอบ internet connection (ใช้ Google Translate API)
2. ลองไฟล์ PDF ขนาดเล็กก่อน
3. ดู browser console (F12) เพื่อตรวจสอบ error

## Next Steps

- Read the [README.md](README.md) for full documentation
- Check out [CONTRIBUTING.md](CONTRIBUTING.md) if you want to contribute
- Visit the [GitHub Issues](https://github.com/kanomoo/translate-pdf/issues) page for known issues

