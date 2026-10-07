# 🤖 Rekomendasi Model AI untuk Spek i5-10400F + GTX 1650 4GB

Dengan RAM 16 GB dan VRAM 4 GB, berikut adalah model-model terbaik yang diuji memberikan keseimbangan optimal antara kepintaran dan kecepatan:

---

## 🏆 Kategori 1: Ringan & Super Cepat (Muat 100% di GPU VRAM)

Cocok untuk: percakapan instan, asisten penulisan cepat, summarization teks pendek, dan hardware resource yang sangat hemat.

### 1. `llama3.2:1b` (1.3 GB)
* **Kelebihan**: Model terbaru dari Meta. Super ringan, muat 100% di VRAM 4 GB. Respon mendekati real-time (>50 token/detik).
* **Perintah**:
  ```powershell
  ollama run llama3.2:1b
  ```

### 2. `llama3.2:3b` (2.0 GB) — **SANGAT DIREKOMENDASIKAN**
* **Kelebihan**: Menjadi standar emas untuk model ukuran 3B. Kecerdasan mendekati model 7B generasi lama, namun ukuran hanya 2 GB sehingga 100% diproses oleh GTX 1650 tanpa menyentuh CPU.
* **Perintah**:
  ```powershell
  ollama run llama3.2:3b
  ```

### 3. `qwen2.5:1.5b` (1.0 GB)
* **Kelebihan**: Model buatan Alibaba yang sangat unggul dalam pemahaman bahasa multi-lingual (termasuk Bahasa Indonesia yang sangat natural) dan matematika dasar.
* **Perintah**:
  ```powershell
  ollama run qwen2.5:1.5b
  ```

---

## 💻 Kategori 2: Coding & Development

Cocok untuk: programmer, auto-complete kode, refactor kode, dan pembuatan fungsi di VSCode/Antigravity.

### 1. `qwen2.5-coder:1.5b` (1.0 GB)
* **Kelebihan**: Sangat cepat untuk autocomplete di editor kode. Ringan dan akurat.
* **Perintah**:
  ```powershell
  ollama run qwen2.5-coder:1.5b
  ```

### 2. `qwen2.5-coder:7b` (4.7 GB) — **TERBAIK UNTUK PROGRAMMING**
* **Kelebihan**: Mengalahkan banyak model coding 33B generasi sebelumnya. Sangat mahir di Python, JS/TS, HTML/CSS, C#, SQL, PowerShell.
* **Catatan Performa**: Sebagian masuk ke VRAM 4GB, sebagian ke RAM sistem. Berjalan lancar di 12–18 token/detik.
* **Perintah**:
  ```powershell
  ollama run qwen2.5-coder:7b
  ```

### 3. `deepseek-coder:6.7b` (3.8 GB)
* **Kelebihan**: Model legendaris untuk software engineering dan debugging logika kode.
* **Perintah**:
  ```powershell
  ollama run deepseek-coder:6.7b
  ```

---

## 🧠 Kategori 3: General Intelligence & Reasoning (Model 7B - 8B)

Cocok untuk: analisis dokumen panjang, penulisan artikel mendalam, brainstorming kompleks, dan penalaran logis.

### 1. `llama3.1:8b` (4.7 GB)
* **Kelebihan**: Model flagship open-source dari Meta. Context window hingga 128k token, sangat pandai mengikuti instruksi rumit.
* **Perintah**:
  ```powershell
  ollama run llama3.1:8b
  ```

### 2. `mistral:7b` (4.1 GB)
* **Kelebihan**: Stabil, ringkas, dan penalaran cepat.
* **Perintah**:
  ```powershell
  ollama run mistral:7b
  ```

---

## 📋 Tabel Perbandingan Singkat

| Model | Ukuran Download | Rekomendasi Penggunaan | Estimasi t/s di GTX 1650 |
| :--- | :--- | :--- | :--- |
| `llama3.2:1b` | 1.3 GB | Chat cepat, ringkasan instan | ~50 - 70 t/s |
| `llama3.2:3b` | 2.0 GB | Chat harian, asisten umum | ~30 - 45 t/s |
| `qwen2.5-coder:1.5b` | 1.0 GB | Inline autocomplete di IDE | ~50 - 65 t/s |
| `qwen2.5-coder:7b` | 4.7 GB | Coding, debug, arsitektur software | ~12 - 18 t/s |
| `llama3.1:8b` | 4.7 GB | Analisis rumit, penulisan mendalam | ~10 - 16 t/s |
