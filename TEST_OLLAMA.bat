@echo off
title Uji Coba Ollama Local
color 0A
echo =====================================================
echo           PENGUJIAN KONEKSI & STATUS OLLAMA
echo =====================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\test_ollama.ps1"
echo.
echo =====================================================
pause
