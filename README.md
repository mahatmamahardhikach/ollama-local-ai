# 🦙 Ollama Local AI Setup & Documentation

Dokumentasi lengkap instalasi, konfigurasi, dan panduan penggunaan **Ollama** untuk menjalankan model AI (Large Language Models) secara lokal dan mandiri di PC tanpa koneksi cloud/internet.

---

## 📌 Ringkasan Sistem (Hardware Spesifikasi)

Konfigurasi ini disesuaikan secara optimal untuk komputer:

| Komponen | Spesifikasi Komputer | Analisis Kapabilitas AI |
| :--- | :--- | :--- |
| **Processor (CPU)** | Intel Core i5-10400F (6C / 12T, up to 4.30 GHz) | Cukup cepat untuk komputasi CPU LLM quantization (Q4_K_M) |
| **RAM** | 16 GB DDR4 Dual-Channel (2667 MHz) | Mampu menjalankan model 7B/8B (konsumsi RAM ~5-8 GB) |
| **Kartu Grafis (GPU)** | NVIDIA GeForce GTX 1650 (4 GB VRAM) | Mendukung akselerasi CUDA! Lapisan (layer) model dapat di-offload ke VRAM untuk respon instan |
| **Penyimpanan (Storage)** | • C: SSD NVMe (Free ~93 GB)<br>• D: HDD (Free ~182 GB) | Sangat cukup. Direkomendasikan memindahkan direktori model ke Drive D jika ingin mengoleksi banyak model |
| **Sistem Operasi** | Windows 11 Pro 64-bit | Didukung secara native oleh Ollama for Windows |

---

## 🚀 Daftar Isi

1. [Panduan Instalasi](./docs/02-installation-and-setup.md)
2. [Rekomendasi Model AI untuk Spek Ini](./docs/03-recommended-models.md)
3. [Konfigurasi Penyimpanan (Pindah ke Drive D:)](./docs/04-storage-configuration.md)
4. [Akses API & Integrasi Aplikasi](./docs/05-api-and-integrations.md)
5. [Troubleshooting & Optimasi](./docs/06-troubleshooting.md)
6. [Script Pembantu](./scripts/)

---

## ⚡ Quick Start

### 1. Cek Apakah Ollama Sudah Berjalan
Buka Terminal / PowerShell:
```powershell
ollama --version
```

### 2. Jalankan Model AI Pertama Anda
Coba model yang sangat cepat dan ringan (ukuran ~1.6 GB):
```powershell
ollama run llama3.2:1b
```
Atau model serba bisa 3B (~2.0 GB):
```powershell
ollama run llama3.2:3b
```

### 3. Perintah-perintah Penting Ollama
* `ollama list` : Melihat daftar model yang sudah terunduh.
* `ollama run <nama-model>` : Mengunduh dan langsung membuka chat interaktif.
* `ollama pull <nama-model>` : Hanya mengunduh model tanpa langsung membukanya.
* `ollama rm <nama-model>` : Menghapus model dari storage.
* `ollama ps` : Melihat model apa yang saat ini sedang aktif di RAM/VRAM.

---

## 📂 Struktur Repositori

```text
ollama-local-ai/
├── README.md                      # Ringkasan utama & panduan cepat
├── .gitignore                     # Aturan ignore file sementara & model binary
├── docs/
│   ├── 01-system-overview.md       # Detail kapabilitas hardware & performa
│   ├── 02-installation-and-setup.md# Tahapan instalasi Ollama di Windows
│   ├── 03-recommended-models.md    # Rekomendasi model LLM terbaik untuk RAM 16GB / 4GB VRAM
│   ├── 04-storage-configuration.md # Panduan memindahkan lokasi penyimpanan model ke D:
│   ├── 05-api-and-integrations.md  # Cara menghubungkan ke Open WebUI, VSCode/Continue, Python
│   └── 06-troubleshooting.md       # Solusi masalah umum dan pemecahan error
└── scripts/
    ├── setup_storage_drive_d.ps1   # Script otomatis memindahkan OLLAMA_MODELS ke D:\
    ├── test_ollama.ps1             # Script pengujian koneksi & performa Ollama
    └── download_models.ps1         # Script download model-model pilihan sekaligus
```

---

## 📤 Cara Push ke GitHub Pribadi

Untuk mengunggah dokumentasi ini ke akun GitHub Anda:

```bash
# 1. Masuk ke direktori proyek
cd "C:\Users\admin\.gemini\antigravity-ide\scratch\ollama-local-ai"

# 2. Inisialisasi Git (jika belum)
git init
git add .
git commit -m "feat: initial commit local ollama documentation and scripts"

# 3. Buat repository baru di GitHub (misal: ollama-local-ai)
# Lalu hubungkan remote repository dan push:
git branch -M main
git remote add origin https://github.com/mahatmamahardhikach/ollama-local-ai.git
git push -u origin main
```
