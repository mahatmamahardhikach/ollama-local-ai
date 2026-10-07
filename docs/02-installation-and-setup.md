# 🛠️ Panduan Instalasi dan Setup Ollama di Windows

Panduan ini mencakup langkah-langkah instalasi Ollama dan verifikasi layanannya.

---

## 1. Metode Instalasi

### Cara A: Menggunakan Windows Package Manager (`winget`) — Direkomendasikan
Buka terminal PowerShell sebagai Administrator atau user biasa, lalu jalankan:

```powershell
winget install --id Ollama.Ollama --accept-source-agreements --accept-package-agreements
```

### Cara B: Menggunakan Installer Resmi (GUI)
1. Kunjungi situs resmi: [https://ollama.com/download/windows](https://ollama.com/download/windows)
2. Unduh `OllamaSetup.exe`.
3. Jalankan file `.exe` dan ikuti petunjuk wizard instalasi.

---

## 2. Memastikan Ollama Berjalan

Setelah instalasi selesai:
1. Ikon Ollama (bergambar llama hitam-putih) akan muncul di System Tray Windows (pojok kanan bawah dekat jam).
2. Service background Ollama akan aktif pada port lokal:
   ```text
   http://127.0.0.1:11434
   ```

### Verifikasi via Browser
Buka browser dan akses `http://127.0.0.1:11434`. Anda akan melihat tulisan:
```text
Ollama is running
```

### Verifikasi via PowerShell
```powershell
ollama --version
```
Jika versi muncul (misal: `ollama version is 0.40.0`), maka instalasi sukses!

---

## 3. Autostart & Service Management

* **Lokasi instalasi default**: `%LOCALAPPDATA%\Programs\Ollama`
* **Menghentikan Ollama**: Klik kanan ikon llama di System Tray -> pilih **Quit Ollama**, atau jalankan di PowerShell:
  ```powershell
  Stop-Process -Name "ollama app", "ollama" -Force -ErrorAction SilentlyContinue
  ```
* **Menjalankan manual**: Buka Start Menu -> ketik `Ollama`, atau via terminal:
  ```powershell
  ollama serve
  ```
