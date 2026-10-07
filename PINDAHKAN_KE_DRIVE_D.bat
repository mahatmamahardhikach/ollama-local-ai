@echo off
title Konfigurasi Storage Ollama ke Drive D
color 0B
echo =====================================================
echo    MEMINDAHKAN PENYIMPANAN MODEL OLLAMA KE DRIVE D
echo =====================================================
echo.
echo Sedang membuat folder D:\ollama_models dan mengatur Environment Variable...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\setup_storage_drive_d.ps1"
echo.
echo Selesai! Silakan restart Ollama jika sedang terbuka.
pause
