```bat
@echo off
setlocal EnableExtensions
title Lz - Otimizacao e Instalacao
color 0A

:: ==================================================
:: ADMINISTRADOR
:: ==================================================

net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: ==================================================
:: WINGET
:: ==================================================

where winget >nul 2>&1
if %errorlevel% neq 0 (
    powershell -NoProfile -Command "Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" >nul 2>&1
    timeout /t 3 /nobreak >nul
)

where winget >nul 2>&1
if %errorlevel% neq 0 exit /b

:: ==================================================
:: EXCLUSAO
:: ==================================================

cls
echo ===== OTIMIZACAO COMPLETA =====

winget uninstall Cortana --accept-source-agreements --disable-interactivity >nul 2>&1
winget uninstall xbox --accept-source-agreements --disable-interactivity >nul 2>&1
winget uninstall "Xbox Game Bar" --accept-source-agreements --disable-interactivity >nul 2>&1
winget uninstall "Hub de Comentários" --accept-source-agreements --disable-interactivity >nul 2>&1
winget uninstall "Microsoft Solitaire Collection" --accept-source-agreements --disable-interactivity >nul 2>&1
winget uninstall 9NZBF4GT040C --accept-source-agreements --disable-interactivity >nul 2>&1
winget uninstall Microsoft.OneDrive --accept-source-agreements --disable-interactivity >nul 2>&1

powershell -NoProfile -Command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *solitaire* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *outlook* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *feedback* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *realtek* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *copilot* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *WindowsCamera* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *9WZDNCRD29V9* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *BingWeather* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *GetHelp* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *Wallet* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *MixedReality.Portal* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *ZuneVideo* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *MSPaint* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *People* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *YourPhone* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *StickyNotes* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *SoundRecorder* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *ZuneMusic* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -NoProfile -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage -ErrorAction SilentlyContinue"

:: ==================================================
:: INSTALACAO
:: ==================================================

winget source update >nul 2>&1

winget install --id AMD.AMDSoftware --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id BandicamCompany.Bandicam --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Bloxstrap.Bloxstrap --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Brave.Brave --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Discord.Discord --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id ElectronicArts.EADesktop --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id LuaTools.LuaTools --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Medal.Medal --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Microsoft.DotNet.SDK.8 --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Microsoft.Edge --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Microsoft.VCRedist.2010.x86 --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Microsoft.DotNet.DesktopRuntime.9 --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id NetEase.MuMuPlayer --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Oracle.VirtualBox --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Proton.ProtonVPN --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Python.Python.3.11 --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id RevoUninstaller.RevoUninstaller --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id skmedix.SKlauncher --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id SoundCloud.SoundCloud --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Spotify.Spotify --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id Valve.Steam --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id BitTorrent.uTorrentWeb --exact --accept-package-agreements --accept-source-agreements --disable-interactivity
winget install --id RARLab.WinRAR --exact --accept-package-agreements --accept-source-agreements --disable-interactivity

exit /b
```

Esse fica **sem `pause`, sem perguntas e sem mensagens de confirmação**. Se algum programa não existir no Winget ou der erro, ele simplesmente segue para o próximo.
