# 📋 PROMPT SETUP UNTUK PC CLIENT (PC SATUNYA)

Copy dan paste seluruh prompt di bawah ini ke AI Assistant (Antigravity / Cursor / Chat AI) di komputer kedua Anda:

---

```text
Halo! Tolong bantu saya menghubungkan komputer ini (PC Client) ke komputer server AI lokal saya (PC Server) menggunakan Tailscale dan SSH Terminal.

Berikut adalah informasi detail PC Server saya:
- Nama Komputer (Host): MMCH
- IP Tailscale Server : 100.115.40.78
- Akun Tailnet        : moszes.site@
- User Akun Windows   : admin
- Service AI          : Ollama (Port 11434)
- Dokumentasi Proyek  : https://github.com/mahatmamahardhikach/ollama-local-ai

Tolong lakukan langkah-langkah berikut secara otomatis di komputer ini:
1. Periksa apakah Tailscale sudah terpasang dan aktif. Jika belum terpasang, tolong bantu install via Winget (winget install --id Tailscale.Tailscale).
2. Pastikan akun Tailscale di PC ini login menggunakan akun yang sama: moszes.site@.
3. Lakukan ping ke IP server: tailscale ping 100.115.40.78.
4. Buatkan konfigurasi SSH alias di file ~/.ssh/config dengan nama host "aiserver" sehingga saya cukup mengetik "ssh aiserver" untuk langsung terhubung ke server:
   Host aiserver
       HostName 100.115.40.78
       User admin
5. Uji koneksi remote terminal dengan perintah: ssh admin@100.115.40.78 (atau ssh aiserver).
6. Uji apakah port Ollama di server bisa diakses dari PC ini via HTTP: curl http://100.115.40.78:11434/.
```

---

## ⚡ Alternatif: Perintah Cepat di PowerShell PC Satunya

Jika Anda ingin langsung menghubungkannya secara manual di PowerShell PC satunya:

```powershell
# 1. Cek koneksi Tailscale ke server
tailscale ping 100.115.40.78

# 2. Remote terminal langsung ke server
ssh admin@100.115.40.78

# 3. Tes akses AI Ollama di server
Invoke-RestMethod -Uri "http://100.115.40.78:11434/" -Method Get
```
