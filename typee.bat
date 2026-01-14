@echo off
setlocal enabledelayedexpansion

:: ============================================
:: typee - Editor Abstraction Layer v2
:: Auto-detect editors using Everything (es.exe)
:: ============================================

:: No arguments - show help
if "%~1"=="" (
    echo typee - Editor Abstraction Layer v2
    echo.
    echo Usage: typee [option] ^<file^>
    echo.
    echo Options:
    echo   ^(none^)    type ^(CLI print^)
    echo   --m       more
    echo   --n       Notepad
    echo   --vs      VS Code
    echo   --cursor  Cursor
    echo   --wind    Windsurf
    echo   --anti    Antigravity
    echo.
    echo Editors are auto-detected via Everything ^(es.exe^)
    exit /b 0
)

:: Parse arguments
set "OPTION=%~1"
set "FILE=%~2"

:: If no option flag, first arg is the file
if not "!OPTION:~0,2!"=="--" (
    set "FILE=%~1"
    type "!FILE!"
    exit /b
)

:: Need a file for options
if "%FILE%"=="" (
    echo Error: No file specified
    exit /b 1
)

:: Handle options
if /i "%OPTION%"=="--m" (
    more "!FILE!"
    exit /b
)

if /i "%OPTION%"=="--n" (
    start "" notepad "!FILE!"
    exit /b
)

:: Editor mappings: option -> exe name
if /i "%OPTION%"=="--vs" set "EXE_NAME=Code.exe"
if /i "%OPTION%"=="--cursor" set "EXE_NAME=Cursor.exe"
if /i "%OPTION%"=="--wind" set "EXE_NAME=Windsurf.exe"
if /i "%OPTION%"=="--anti" set "EXE_NAME=Antigravity.exe"

if not defined EXE_NAME (
    echo Unknown option: %OPTION%
    exit /b 1
)

:: Use es.exe to find the editor
for /f "delims=" %%i in ('es -n 1 "%EXE_NAME%" 2^>nul') do (
    set "EDITOR_PATH=%%i"
)

:: Found it - launch
if defined EDITOR_PATH (
    start "" "!EDITOR_PATH!" "!FILE!"
    exit /b
)

:: Fallback to notepad
echo [typee] %EXE_NAME% not found, falling back to Notepad
start "" notepad "!FILE!"
