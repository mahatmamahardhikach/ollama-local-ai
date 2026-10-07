# 💾 Konfigurasi Lokasi Penyimpanan Model (Pindah ke Drive D:)

Secara default, Ollama menyimpan file model AI di:
```text
C:\Users\<Username>\.ollama\models
```
Karena SSD Drive C memiliki ruang ~93 GB dan Drive D memiliki ruang lapang ~182 GB, sangat disarankan untuk mengarahkan penyimpanan model ke **Drive D:** agar Drive C tidak cepat penuh.

---

## Cara Otomatis (Menggunakan Script)

Kami telah menyertakan script otomatis di folder `scripts/`:

1. Buka PowerShell.
2. Jalankan:
   ```powershell
   & "C:\Users\admin\.gemini\antigravity-ide\scratch\ollama-local-ai\scripts\setup_storage_drive_d.ps1"
   ```
3. Restart aplikasi Ollama (tutup dari tray lalu buka kembali).

---

## Cara Manual via PowerShell

Jika ingin mengaturnya secara manual, jalankan perintah berikut di PowerShell (Administrator):

```powershell
# 1. Buat folder baru di Drive D:
New-Item -ItemType Directory -Path "D:\ollama_models" -Force

# 2. Set Environment Variable secara permanen untuk User
[System.Environment]::SetEnvironmentVariable("OLLAMA_MODELS", "D:\ollama_models", [System.EnvironmentVariableTarget]::User)

# 3. Atau set untuk System (semua user)
[System.Environment]::SetEnvironmentVariable("OLLAMA_MODELS", "D:\ollama_models", [System.EnvironmentVariableTarget]::Machine)
```

---

## Cara Manual via Windows GUI

1. Tekan tombol **Windows + R**, ketik `sysdm.cpl` lalu tekan **Enter**.
2. Masuk ke tab **Advanced** -> klik **Environment Variables...** (Variabel Lingkungan).
3. Di bagian **User variables** (atau **System variables**), klik **New...**:
   * **Variable name**: `OLLAMA_MODELS`
   * **Variable value**: `D:\ollama_models`
4. Klik **OK** -> **OK**.
5. Tutup Ollama sepenuhnya dari System Tray (klik kanan -> Exit), lalu buka kembali Ollama dari Start Menu.

---

## Verifikasi Pemindahan

Untuk memverifikasi apakah model tersimpan di lokasi baru:
1. Unduh salah satu model kecil:
   ```powershell
   ollama pull llama3.2:1b
   ```
2. Cek folder `D:\ollama_models\manifests` dan `D:\ollama_models\blobs`.
3. Jika terdapat file-file berukuran besar di folder tersebut, berarti model sudah tersimpan aman di Drive D!
