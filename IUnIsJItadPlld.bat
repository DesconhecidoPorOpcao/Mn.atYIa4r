@echo off
setlocal EnableExtensions EnableDelayedExpansion
title Lz - Otimizacao e Instalacao
color 0A

:: ---- LOG FIXO ----
set "LOG=%~dp0log.txt"
echo ==== INICIO %date% %time% ==== > "%LOG%"

:: ---- VERIFICAR ADMIN ----
net session >nul 2>&1
if %errorlevel% neq 0 (
    cls
    echo.
    echo ==========================================
    echo   ATENCAO - PRECISA SER ADMINISTRADOR
    echo ==========================================
    echo.
    echo Feche esta janela e faca assim:
    echo.
    echo   1. Clique com BOTAO DIREITO no arquivo .bat
    echo   2. Escolha "Executar como administrador"
    echo.
    pause
    exit /b
)
echo [OK] Rodando como admin >> "%LOG%"

:: ---- VERIFICAR WINGET ----
where winget >nul 2>&1
if errorlevel 1 (
    echo [ERRO] Winget NAO encontrado. Abrindo link de download... >> "%LOG%"

    cls
    echo ==========================================
    echo   WINGET NAO INSTALADO
    echo ==========================================
    echo.
    echo O Winget e necessario para este script funcionar.
    echo.
    echo Abrindo a pagina de download no seu navegador...
    echo.
    echo   1. Baixe o "App Installer" na pagina que abriu
    echo   2. Instale o arquivo .msixbundle
    echo   3. Feche e abra este script novamente
    echo.
    echo Abrindo: https://aka.ms/getwinget
    echo.

    :: Abre o link no navegador padrao
    start "" "https://aka.ms/getwinget"

    echo.
    echo Aperte uma tecla para FECHAR...
    pause >nul
    exit /b
)
echo [OK] Winget encontrado >> "%LOG%"

:: ---- TELA DE BOAS-VINDAS ----
cls
echo ==========================================
echo   Lz - Otimizacao e Instalacao
echo ==========================================
echo.
echo [OK] Rodando como administrador
echo [OK] Winget detectado
echo.
echo O script vai:
echo   ETAPA 1 - Desinstalar apps indesejados
echo   ETAPA 2 - Instalar seus programas
echo.
echo Tudo sera registrado em: log.txt
echo.
echo Aperte uma tecla para COMECAR...
pause >nul

:: ==================================================
:: ETAPA 1 - DESINSTALACAO
:: ==================================================
cls
echo ==========================================
echo  ETAPA 1 / 2  -  DESINSTALANDO APLICATIVOS
echo ==========================================
echo.

echo Removendo pacotes Appx (pode demorar)...
echo.

set "APPX_LIST=*Microsoft.Microsoft3DViewer* *Xbox* *solitaire* *outlook* *feedback* *realtek* *copilot* *WindowsCamera* *BingWeather* *Getstarted* *windowscommunicationsapps* *GetHelp* *Wallet* *MixedReality.Portal* *ZuneVideo* *MicrosoftOfficeHub* *OneNote* *MSPaint* *People* *YourPhone* *SkypeApp* *StickyNotes* *SoundRecorder* *WindowsMaps* *ZuneMusic* *WindowsAlarms* *OneDrive* *Cortana*"

for %%A in (%APPX_LIST%) do (
    echo   - Removendo %%A
    echo [LOG] Removendo Appx %%A >> "%LOG%"
    powershell -NoProfile -Command "Get-AppxPackage -AllUsers '%%A' | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue" >> "%LOG%" 2>&1
)

echo.
echo Removendo via Winget...
echo.

echo [LOG] Uninstall Cortana >> "%LOG%"
winget uninstall --id Microsoft.549981C3F5F10 --accept-source-agreements --disable-interactivity >> "%LOG%" 2>&1

echo [LOG] Uninstall Xbox Game Bar >> "%LOG%"
winget uninstall --id Microsoft.XboxGamingOverlay --accept-source-agreements --disable-interactivity >> "%LOG%" 2>&1

echo [LOG] Uninstall Feedback Hub >> "%LOG%"
winget uninstall --id Microsoft.WindowsFeedbackHub --accept-source-agreements --disable-interactivity >> "%LOG%" 2>&1

echo [LOG] Uninstall Solitaire >> "%LOG%"
winget uninstall --id Microsoft.MicrosoftSolitaireCollection --accept-source-agreements --disable-interactivity >> "%LOG%" 2>&1

echo [LOG] Uninstall OneDrive >> "%LOG%"
winget uninstall --id Microsoft.OneDrive --accept-source-agreements --disable-interactivity >> "%LOG%" 2>&1

echo.
echo [OK] Desinstalacao concluida.
echo.
timeout /t 3 /nobreak >nul

:: ==================================================
:: ETAPA 2 - INSTALACAO
:: ==================================================
cls
echo ==========================================
echo  ETAPA 2 / 2  -  INSTALANDO APLICATIVOS
echo ==========================================
echo.
echo Isso pode demorar. Nao feche a janela.
echo.

call :instalar AMD.AMDSoftware
call :instalar BandicamCompany.Bandicam
call :instalar Bloxstrap.Bloxstrap
call :instalar Brave.Brave
call :instalar Discord.Discord
call :instalar ElectronicArts.EADesktop
call :instalar LuaTools.LuaTools
call :instalar Medal.Medal
call :instalar Microsoft.DotNet.SDK.8
call :instalar Microsoft.Edge
call :instalar Microsoft.VCRedist.2010.x86
call :instalar Microsoft.DotNet.DesktopRuntime.9
call :instalar NetEase.MuMuPlayer
call :instalar Oracle.VirtualBox
call :instalar Proton.ProtonVPN
call :instalar Python.Python.3.11
call :instalar RevoUninstaller.RevoUninstaller
call :instalar skmedix.SKlauncher
call :instalar SoundCloud.SoundCloud
call :instalar Spotify.Spotify
call :instalar Valve.Steam
call :instalar BitTorrent.uTorrentWeb
call :instalar RARLab.WinRAR
call :instalar TorProject.TorBrowser
call :instalar Microsoft.VisualStudioCode

:: ---- WALLPAPER ----
echo.
echo Aplicando wallpaper...
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "D:\Luiz hd  COISAS\lz 2\Imagens\imagens para wallperes\muiefamosinhaqueesquecionome.png" /f >> "%LOG%" 2>&1
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: ==================================================
:: FIM
:: ==================================================
cls
echo ==========================================
echo   TUDO CONCLUIDO COM SUCESSO!
echo ==========================================
echo.
echo Log completo em: %LOG%
echo.
echo Aperte uma tecla para FECHAR...
pause >nul
exit /b

:instalar
echo [LOG] Instalando %1 >> "%LOG%"
echo   Instalando %1 ...
winget install --id %1 --exact --accept-package-agreements --accept-source-agreements --disable-interactivity >> "%LOG%" 2>&1
if errorlevel 1 (
    echo     [FALHOU] %1
    echo [FALHOU] %1 >> "%LOG%"
) else (
    echo     [OK] %1
    echo [OK] %1 >> "%LOG%"
)
exit /b
