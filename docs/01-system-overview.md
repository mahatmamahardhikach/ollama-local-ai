# 📊 Analisis Kompatibilitas Hardware untuk Local LLM (Ollama)

Dokumen ini menjabarkan kemampuan teknis PC Anda dalam mengeksekusi model AI secara lokal.

---

## 1. Spesifikasi Perangkat

* **Processor (CPU)**: Intel Core i5-10400F (6 Cores, 12 Threads, Base 2.90 GHz, Max Turbo 4.30 GHz)
* **RAM Utama**: 16 GB DDR4 (2 x 8 GB Dual Channel @ 2667 MHz)
* **GPU**: NVIDIA GeForce GTX 1650 (4 GB GDDR5/GDDR6 VRAM, Turing Architecture, TU117)
* **Driver NVIDIA**: Versi 617.42 (Mendukung CUDA 12.x / 13.x)
* **Penyimpanan**:
  * Drive C (SSD NVMe): ~93 GB Free
  * Drive D (HDD): ~182 GB Free

---

## 2. Cara Kerja Ollama di Hardware Anda

Ollama menggunakan engine **llama.cpp** di latar belakang. Mekanisme kerja di PC Anda adalah model **Hybrid (GPU Offloading + CPU/System RAM)**:

1. **Akselerasi GPU (GTX 1650 - 4 GB VRAM)**:
   * Ollama akan mendeteksi CUDA secara otomatis.
   * Model AI dipecah menjadi beberapa *layer* (lapisan komputasi). Sebanyak mungkin layer yang muat di dalam 4 GB VRAM akan dimasukkan ke GPU.
   * GPU memproses token dengan kecepatan tinggi (latency rendah).

2. **Offload ke CPU & RAM Sistem**:
   * Jika model berukuran lebih besar dari 4 GB (misalnya model 8B yang berukuran ~4.7 GB ditambah konteks prompt), layer sisanya akan dialokasikan ke RAM sistem (16 GB) dan diproses oleh Core i5-10400F (12 thread).
   * Walaupun layer di CPU sedikit lebih lambat dari GPU murni, kecepatan generasi teks tetap berada di kisaran ~8–20 token per detik (sangat nyaman dibaca manusia secara real-time).

---

## 3. Matriks Estimasi Performa Berdasarkan Ukuran Model

| Ukuran Parameter Model | Estimasi Ukuran File (Q4_K_M) | Alokasi VRAM & RAM | Kecepatan Respon (Tokens/sec) | Kesimpulan |
| :--- | :--- | :--- | :--- | :--- |
| **1B – 1.5B** *(Llama 3.2 1B, Qwen2.5 1.5B)* | ~1.3 – 1.6 GB | 100% di GPU VRAM (4 GB) | 🚀 **Sangat Cepat** (45–70 t/s) | Sempurna untuk respons kilat & auto-complete |
| **3B** *(Llama 3.2 3B, Phi-3.5 mini)* | ~2.0 – 2.2 GB | 100% di GPU VRAM (4 GB) | ⚡ **Kencang** (30–45 t/s) | **Sweet Spot** terbaik antara kecerdasan & kecepatan |
| **7B – 8B** *(Llama 3.1 8B, Qwen2.5 7B, Mistral 7B)* | ~4.7 – 5.2 GB | ~60% GPU VRAM + 40% RAM Sistem | 👍 **Nyaman** (12–20 t/s) | Kualitas penalaran terbaik untuk coding & analisis mendalam |
| **14B** *(Qwen2.5 14B)* | ~9 GB | ~20% GPU VRAM + 80% RAM Sistem | 🐢 **Lambat** (3–6 t/s) | Masih bisa berjalan, tetapi respon lambat |
| **32B – 70B** | > 20 GB | Melebihi total RAM (16 GB) | ❌ **Tidak Disarankan** (OOM / Crash) | Membutuhkan RAM minimal 32 GB – 64 GB |
