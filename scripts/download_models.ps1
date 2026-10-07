<#
.SYNOPSIS
    Script untuk mengunduh model AI pilihan secara teratur.
#>

Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "         OLLAMA RECOMMENDED MODEL DOWNLOADER         " -ForegroundColor Yellow
Write-Host "=====================================================" -ForegroundColor Cyan

$models = @(
    @{ Name = "llama3.2:1b"; Desc = "Super Cepat, Ringan (~1.3 GB)" },
    @{ Name = "llama3.2:3b"; Desc = "Rekomendasi Utama, Cerdas & Cepat (~2.0 GB)" },
    @{ Name = "qwen2.5-coder:1.5b"; Desc = "Autocomplete Kode Kilat (~1.0 GB)" },
    @{ Name = "qwen2.5-coder:7b"; Desc = "Model Pemrograman Lengkap (~4.7 GB)" }
)

Write-Host "Daftar model yang direkomendasikan:" -ForegroundColor White
for ($i = 0; $i -lt $models.Count; $i++) {
    Write-Host "[$($i + 1)] $($models[$i].Name) - $($models[$i].Desc)" -ForegroundColor Yellow
}
Write-Host ""
Write-Host "Untuk mengunduh satu persatu secara manual, gunakan:" -ForegroundColor Cyan
Write-Host "   ollama pull llama3.2:3b" -ForegroundColor White
Write-Host "=====================================================" -ForegroundColor Cyan
