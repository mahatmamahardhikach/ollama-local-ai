<#
.SYNOPSIS
    Menguji kesiapan service dan API Ollama lokal.
#>

Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "         OLLAMA HEALTH & DIAGNOSTIC CHECK            " -ForegroundColor Yellow
Write-Host "=====================================================" -ForegroundColor Cyan

# 1. Cek CLI
$cmd = Get-Command ollama -ErrorAction SilentlyContinue
if ($cmd) {
    $ver = & ollama --version
    Write-Host "[OK] Ollama CLI terdeteksi: $ver" -ForegroundColor Green
} else {
    Write-Host "[PERINGATAN] Command 'ollama' belum ditemukan di PATH sesi saat ini." -ForegroundColor Yellow
    Write-Host "             Jika baru saja diinstall, silakan restart terminal / PowerShell." -ForegroundColor DarkGray
}

# 2. Cek REST API Port 11434
Write-Host "[...] Menghubungi HTTP endpoint http://127.0.0.1:11434 ..." -ForegroundColor Cyan
try {
    $resp = Invoke-RestMethod -Uri "http://127.0.0.1:11434/" -Method Get -TimeoutSec 3 -ErrorAction Stop
    Write-Host "[OK] Endpoint merespon: '$resp'" -ForegroundColor Green
} catch {
    Write-Host "[PERINGATAN] Service Ollama belum berjalan di background." -ForegroundColor Yellow
    Write-Host "             Silakan jalankan aplikasi Ollama dari Start Menu atau ketik 'ollama serve'." -ForegroundColor DarkGray
}

# 3. Cek Status GPU (NVIDIA GTX 1650)
Write-Host "[...] Memeriksa status GPU NVIDIA..." -ForegroundColor Cyan
$nv = Get-Command nvidia-smi -ErrorAction SilentlyContinue
if ($nv) {
    $gpuInfo = & nvidia-smi --query-gpu=name,memory.total,memory.free --format=csv,noheader
    Write-Host "[OK] GPU Terdeteksi: $gpuInfo" -ForegroundColor Green
} else {
    Write-Host "[INFO] nvidia-smi tidak ditemukan. Pastikan driver NVIDIA terpasang." -ForegroundColor Yellow
}

Write-Host "=====================================================" -ForegroundColor Cyan
