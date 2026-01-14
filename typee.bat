@echo off
setlocal enabledelayedexpansion

:: ============================================
:: typee - Editor Abstraction Layer
:: ============================================
:: Usage: typee [--option] <file>
::
:: Options:
::   (none)    type (CLI print)
::   --m       more
::   --n       Notepad
::   --vs      VS Code
::   --cursor  Cursor
::   --wind    Windsurf
::   --anti    Antigravity
:: ============================================

:: === Editor Paths (edit these when switching editors) ===
set "EDITOR_VS=code"
set "EDITOR_CURSOR=cursor"
set "EDITOR_WIND=windsurf"
set "EDITOR_ANTI=antigravity"

:: No arguments - show help
if "%~1"=="" (
    echo typee - Editor Abstraction Layer
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
) else if /i "%OPTION%"=="--n" (
    start "" notepad "!FILE!"
) else if /i "%OPTION%"=="--vs" (
    start "" %EDITOR_VS% "!FILE!"
) else if /i "%OPTION%"=="--cursor" (
    start "" %EDITOR_CURSOR% "!FILE!"
) else if /i "%OPTION%"=="--wind" (
    start "" %EDITOR_WIND% "!FILE!"
) else if /i "%OPTION%"=="--anti" (
    start "" %EDITOR_ANTI% "!FILE!"
) else (
    echo Unknown option: %OPTION%
    exit /b 1
)
