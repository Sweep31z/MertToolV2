@echo off
chcp 65001 >nul 2>&1
title Mert Tool - Derleyici
color 0A

echo.
echo ========================================
echo.
echo       ⚡ MERT TOOL DERLEYICI ⚡
echo.
echo ========================================
echo.

REM .NET SDK kontrol
where dotnet >nul 2>&1
if errorlevel 1 (
    echo [HATA] .NET SDK bilgisayarda bulunamadi!
    echo.
    echo .NET SDK kurulmasi gerekiyor:
    echo https://dotnet.microsoft.com/download
    echo.
    echo Kurulum sonrasi bilgisayari yeniden baslatiniz.
    echo.
    pause
    exit /b 1
)

echo [1/4] .NET SDK kontrol edildi. ✓
echo.

REM NuGet paketlerini indir
echo [2/4] Paketler indirilmesi...
dotnet restore

if errorlevel 1 (
    echo.
    echo ========================================
    echo [HATA] Paket indirilmesi basarisiz!
    echo ========================================
    echo.
    pause
    exit /b 1
)

echo [2/4] Paketler indirildi. ✓
echo.

REM Projeyi derle
echo [3/4] Proje derleniyor...
dotnet build -c Release

if errorlevel 1 (
    echo.
    echo ========================================
    echo [HATA] DERLEME BASARISIZ!
    echo ========================================
    echo Lutfen yukaridaki hata mesajlarini okuyunuz.
    echo.
    pause
    exit /b 1
)

echo [3/4] Derleme tamamlandi. ✓
echo.

REM Publish et (Release klasorune)
echo [4/4] Son islemler yapiliyor...
if exist "bin\Release" (
    echo Basarili!
) else (
    echo Hata!
    pause
    exit /b 1
)

echo [4/4] Tamamlandi. ✓
echo.
echo ========================================
echo        BASARIYLA DERLENDI ✓
echo ========================================
echo.
echo Hazirlanan dosya:
echo.
echo 📁 bin\Release\MertTool.exe
echo.
echo Simdi programi calistirmak icin:
echo 1. bin\Release\MertTool.exe'ye cift tiklayiniz
echo 2. Veya cmd'de: bin\Release\MertTool.exe komutunu calistiriniz
echo.
pause
