# 🌐 Panduan Remote Terminal Tanpa Kendala Jaringan (Tailscale + SSH)

Panduan ini menjelaskan cara mengakses terminal PC server ini dari komputer lain dari mana saja (beda WiFi, beda lokasi, kuota tethering HP) tanpa perlu port forwarding atau khawatir firewall.

---

## 📌 Status Tailscale di Komputer Ini

* **IP Tailscale Komputer Ini**: `100.115.40.78`
* **Nama Komputer (Tailscale MagicDNS)**: `mmch`
* **Akun Tailnet**: Terhubung dengan akun `moszes.site@`
* **Status Layanan**: Online & Aktif

---

## 🚀 Langkah Menghubungkan PC Satunya

### 1. Di PC Satunya (Client):
1. Unduh dan pasang aplikasi **Tailscale**:
   * [https://tailscale.com/download/windows](https://tailscale.com/download/windows)
2. Login menggunakan **akun yang sama** (`moszes.site@`).
3. Begitu login, kedua komputer Anda otomatis berada di satu jaringan privat terenkripsi (Tailnet).

### 2. Buka Terminal di PC Satunya:
Buka PowerShell, Command Prompt, atau Terminal di PC satunya, lalu ketik:

```bash
ssh admin@100.115.40.78
```
atau menggunakan nama komputer langsung:
```bash
ssh admin@mmch
```

* Masukkan password akun Windows `admin`.
* Anda akan langsung masuk ke terminal PC ini!

---

## 🦙 Menjalankan & Mengontrol Ollama dari Jarak Jauh

Setelah login via SSH:
1. **Cek status model:**
   ```powershell
   ollama list
   ```
2. **Jalankan chat model:**
   ```powershell
   ollama run llama3.2:3b
   ```
3. **Memonitor penggunaan GPU GTX 1650:**
   ```powershell
   nvidia-smi
   ```

---

## 💡 Keunggulan Metode Ini
* **Zero Config Router:** Tidak perlu mengubah pengaturan router indihome / firstmedia / modem wifi.
* **Tembus NAT:** Tetap bisa tersambung meski komputer server menggunakan tethering HP.
* **Aman & Terenkripsi:** Menggunakan enkripsi WireGuard point-to-point.
