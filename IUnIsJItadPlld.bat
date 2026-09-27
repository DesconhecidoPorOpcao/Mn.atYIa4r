@echo off
setlocal
title Instalador de Programas - Lz
color 0A

echo ==================================================
echo       INSTALADOR AUTOMATICO DE PROGRAMAS
echo ==================================================
echo.

:: ==================================================
:: VERIFICAR SE ESTA EXECUTANDO COMO ADMINISTRADOR
:: ==================================================

net session >nul 2>&1

if %errorlevel% neq 0 (
    echo [!] Este arquivo precisa de administrador.
    echo [!] Solicitando permissao...
    echo.

    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"

    exit /b
)

echo [OK] Permissao de administrador confirmada.
echo.

:: ==================================================
:: VERIFICAR WINGET
:: ==================================================

where winget >nul 2>&1

if %errorlevel% neq 0 (
    echo [!] Winget nao encontrado.
    echo.
    echo Tentando registrar o App Installer...
    echo.

    powershell -NoProfile -Command "Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" >nul 2>&1

    timeout /t 3 /nobreak >nul

    where winget >nul 2>&1

    if %errorlevel% neq 0 (
        echo.
        echo ==================================================
        echo [ERRO] Winget nao esta instalado.
        echo ==================================================
        echo.
        echo A Microsoft Store sera aberta.
        echo Instale o "App Installer" e execute este BAT novamente.
        echo.

        start "" "ms-windows-store://search/?query=App%20Installer"

        pause
        exit /b
    )
)

echo [OK] Winget encontrado!
echo.

:: ==================================================
:: ATUALIZAR FONTES DO WINGET
:: ==================================================

echo Atualizando fontes do Winget...
winget source update

echo.
echo ==================================================
echo          INICIANDO INSTALACOES
echo ==================================================
echo.

:: ==================================================
:: AMD SOFTWARE
:: ==================================================

echo [1/23] AMD Software
winget install --id AMD.AMDSoftware --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: BANDICAM
:: ==================================================

echo.
echo [2/23] Bandicam
winget install --id BandicamCompany.Bandicam --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: BLOXSTRAP
:: ==================================================

echo.
echo [3/23] Bloxstrap
winget install --id Bloxstrap.Bloxstrap --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: BRAVE
:: ==================================================

echo.
echo [4/23] Brave
winget install --id Brave.Brave --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: DISCORD
:: ==================================================

echo.
echo [5/23] Discord
winget install --id Discord.Discord --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: EA APP
:: ==================================================

echo.
echo [6/23] EA App
winget install --id ElectronicArts.EADesktop --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: LUATOOLS
:: ==================================================

echo.
echo [7/23] LuaTools
winget install --id LuaTools.LuaTools --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: MEDAL
:: ==================================================

echo.
echo [8/23] Medal
winget install --id Medal.Medal --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: .NET SDK 8
:: ==================================================

echo.
echo [9/23] Microsoft .NET SDK 8
winget install --id Microsoft.DotNet.SDK.8 --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: MICROSOFT EDGE
:: ==================================================

echo.
echo [10/23] Microsoft Edge
winget install --id Microsoft.Edge --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: VISUAL C++ 2010
:: ==================================================

echo.
echo [11/23] Microsoft Visual C++ 2010 x86
winget install --id Microsoft.VCRedist.2010.x86 --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: WINDOWS DESKTOP RUNTIME 9
:: ==================================================

echo.
echo [12/23] Microsoft Windows Desktop Runtime 9
winget install --id Microsoft.DotNet.DesktopRuntime.9 --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: MUMUPLAYER
:: ==================================================

echo.
echo [13/23] MuMuPlayer
winget install --id NetEase.MuMuPlayer --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: VIRTUALBOX
:: ==================================================

echo.
echo [14/23] Oracle VirtualBox
winget install --id Oracle.VirtualBox --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: PROTON VPN
:: ==================================================

echo.
echo [15/23] Proton VPN
winget install --id Proton.ProtonVPN --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: PYTHON
:: ==================================================

echo.
echo [16/23] Python 3.11
winget install --id Python.Python.3.11 --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: REVO UNINSTALLER
:: ==================================================

echo.
echo [17/23] Revo Uninstaller
winget install --id RevoUninstaller.RevoUninstaller --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: SKLAUNCHER
:: ==================================================

echo.
echo [18/23] SKlauncher
winget install --id skmedix.SKlauncher --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: SOUNDCLOUD
:: ==================================================

echo.
echo [19/23] SoundCloud
winget install --id SoundCloud.SoundCloud --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: SPOTIFY
:: ==================================================

echo.
echo [20/23] Spotify
winget install --id Spotify.Spotify --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: STEAM
:: ==================================================

echo.
echo [21/23] Steam
winget install --id Valve.Steam --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: UTORRENT WEB
:: ==================================================

echo.
echo [22/23] uTorrent Web
winget install --id BitTorrent.uTorrentWeb --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: WINRAR
:: ==================================================

echo.
echo [23/23] WinRAR
winget install --id RARLab.WinRAR --exact --accept-package-agreements --accept-source-agreements

:: ==================================================
:: FINAL
:: ==================================================

echo.
echo.
echo ==================================================
echo       INSTALACAO FINALIZADA
echo ==================================================
echo.
echo Os programas disponiveis no Winget foram processados.
echo.
echo Alguns programas da sua lista original nao foram
echo incluidos automaticamente porque o pacote/ID deles
echo nao foi confirmado no Winget:
echo.
echo - Real
echo - REDRAGON Gaming Mouse
echo - SteamTools
echo.
echo Esses tres podem ser adicionados depois de confirmar
echo os pacotes corretos.
echo.
pause
