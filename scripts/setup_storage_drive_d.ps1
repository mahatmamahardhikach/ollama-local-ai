<#
.SYNOPSIS
    Memindahkan lokasi penyimpanan model Ollama ke Drive D: agar tidak menghabiskan kapasitas SSD Drive C:.
#>

Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "  OLLAMA STORAGE CONFIGURATION -> DRIVE D:           " -ForegroundColor Yellow
Write-Host "=====================================================" -ForegroundColor Cyan

$targetDir = "D:\ollama_models"

if (-not (Test-Path $targetDir)) {
    Write-Host "[1/3] Membuat folder $targetDir..." -ForegroundColor Green
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
} else {
    Write-Host "[1/3] Folder $targetDir sudah ada." -ForegroundColor Yellow
}

Write-Host "[2/3] Mengatur Environment Variable OLLAMA_MODELS..." -ForegroundColor Green
[System.Environment]::SetEnvironmentVariable("OLLAMA_MODELS", $targetDir, [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable("OLLAMA_MODELS", $targetDir, [System.EnvironmentVariableTarget]::Process)

Write-Host "[3/3] Pengaturan berhasil disimpan!" -ForegroundColor Green
Write-Host ""
Write-Host "Langkah selanjutnya:" -ForegroundColor Cyan
Write-Host "1. Restart Ollama dengan keluar dari System Tray (klik kanan ikon Ollama -> Quit)."
Write-Host "2. Buka kembali Ollama dari Start Menu."
Write-Host "3. Semua model baru yang Anda unduh akan tersimpan di $targetDir!"
Write-Host "=====================================================" -ForegroundColor Cyan
