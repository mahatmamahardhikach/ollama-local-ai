# 🔌 API & Integrasi Aplikasi (WebUI, VSCode, Python)

Ollama menyediakan REST API lokal yang kompatibel dengan format OpenAI API. Hal ini memungkinkan Ollama dihubungkan dengan berbagai aplikasi populer.

---

## 1. Web UI Interaktif (Mirip ChatGPT)

### Rekomendasi: Open WebUI
Jika Anda ingin tampilan chat persis seperti ChatGPT, gunakan **Open WebUI**:
* Berjalan di browser secara lokal.
* Mendukung upload dokumen (RAG / chat dengan file PDF), speech-to-text, dan pemilihan model yang mudah.

Menjalankan Open WebUI via Docker (jika Docker terpasang):
```bash
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```
Akses di browser: `http://localhost:3000`

---

## 2. Integrasi ke Visual Studio Code / Antigravity IDE

Gunakan ekstensi **Continue** ([continue.dev](https://continue.dev)):
1. Buka Extensions di VS Code (Ctrl+Shift+X).
2. Cari dan install **Continue**.
3. Di pengaturan `config.json` Continue, arahkan provider ke `ollama`:
```json
{
  "models": [
    {
      "title": "Qwen 2.5 Coder 7B",
      "provider": "ollama",
      "model": "qwen2.5-coder:7b"
    },
    {
      "title": "Llama 3.2 3B",
      "provider": "ollama",
      "model": "llama3.2:3b"
    }
  ],
  "tabAutocompleteModel": {
    "title": "Qwen Coder 1.5B (Autocomplete)",
    "provider": "ollama",
    "model": "qwen2.5-coder:1.5b"
  }
}
```

---

## 3. Integrasi Python

Ollama memiliki library Python resmi:

```bash
pip install ollama
```

Contoh script Python:
```python
import ollama

response = ollama.chat(
    model='llama3.2:3b',
    messages=[
        {
            'role': 'user',
            'content': 'Halo, jelaskan apa itu REST API dalam 2 kalimat singkat!',
        },
    ],
)

print(response['message']['content'])
```

---

## 4. REST API Endpoint Langsung (cURL / PowerShell)

Endpoint default: `http://localhost:11434`

### Chat Request (Streaming):
```powershell
$body = @{
    model = "llama3.2:3b"
    messages = @(
        @{ role = "user"; content = "Sebutkan 3 tips coding yang baik!" }
    )
    stream = $false
} | ConvertTo-Json

Invoke-RestMethod -Uri "http://localhost:11434/api/chat" -Method Post -Body $body -ContentType "application/json"
```
