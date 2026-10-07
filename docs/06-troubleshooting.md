# 🩺 Troubleshooting & Optimasi Performa

Kumpulan solusi untuk kendala yang mungkin terjadi saat menjalankan Ollama di Windows.

---

## 1. Port 11434 Sudah Terpakai / Konflik

**Gejala:** Ollama gagal start atau error `bind: address already in use`.

**Solusi:**
Cek proses apa yang menggunakan port 11434:
```powershell
Get-NetTCPConnection -LocalPort 11434 -ErrorAction SilentlyContinue | Select-Object OwningProcess
```
Jika itu proses `ollama.exe` lama yang menggantung (*stuck*), matikan dengan:
```powershell
Stop-Process -Name "ollama app", "ollama" -Force
```

---

## 2. Model Berjalan Lambat (GPU Tidak Terdeteksi / CPU Only)

**Gejala:** Kecepatan respon di bawah 3 token/detik pada model 3B atau GPU usage di `nvidia-smi` tetap 0%.

**Solusi:**
1. Pastikan Driver GPU NVIDIA up-to-date (NVIDIA App / GeForce Experience).
2. Periksa log Ollama di:
   ```text
   %LOCALAPPDATA%\Ollama\server.log
   ```
   Cari baris yang menyebutkan `CUDA` atau `NVIDIA library`. Ollama secara otomatis mendeteksi library CUDA di Windows.
3. Jalankan `nvidia-smi` saat model sedang memproses respon untuk memverifikasi VRAM usage.

---

## 3. Out of Memory (OOM) / Komputer Hang

**Gejala:** RAM sistem penuh 100% dan komputer freeze saat mencoba memuat model.

**Penyebab:**
Memuat model yang terlalu besar (misal model 14B, 32B, atau 70B) yang melampaui RAM 16 GB.

**Solusi:**
* Gunakan model dengan parameter **3B hingga 8B**.
* Gunakan varian kuantisasi **Q4_K_M** (default di Ollama).
* Tutup aplikasi berat lain (seperti game atau emulator) saat menjalankan model 8B.

---

## 4. Ingin Mengakses Ollama dari HP atau Laptop Lain di Jaringan WiFi yang Sama

Secara default, Ollama hanya mendengarkan koneksi dari `localhost` (`127.0.0.1`).

Untuk mengizinkan akses dari perangkat lain di LAN/WiFi:
1. Buka PowerShell Administrator:
   ```powershell
   [System.Environment]::SetEnvironmentVariable("OLLAMA_HOST", "0.0.0.0:11434", [System.EnvironmentVariableTarget]::User)
   ```
2. Restart Ollama.
3. Buka port 11434 di Windows Firewall:
   ```powershell
   New-NetFirewallRule -DisplayName "Ollama Local AI Port" -Direction Inbound -LocalPort 11434 -Protocol TCP -Action Allow
   ```
