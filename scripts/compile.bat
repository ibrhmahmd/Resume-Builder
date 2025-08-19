@echo off
rem =========================================
rem   LaTeX Resume Compilation Script (Live Logs)
rem =========================================

rem --- CONFIGURATION ---
set "MIKTEX_PATH=C:\Program Files\MiKTeX\miktex\bin\x64"
set "USER_NAME=Ibrahim.Ahmed.Net"
set "INPUT_FILE=src\resume.tex"
set "SRC_DIR=src"
set "JOB_NAME=resume"
set "OUTPUT_FILE=%USER_NAME%_resume.pdf"
set "LOG_DIR=logs"

echo =========================================
echo Setting up LaTeX compilation environment...
echo =========================================

rem --- Add MiKTeX to PATH ---
set PATH=%PATH%;%MIKTEX_PATH%

rem --- Check tools exist ---
where xelatex >nul 2>&1
if errorlevel 1 (
    echo [ERROR] xelatex not found in PATH. Please check MIKTEX_PATH.
    pause
    exit /b 1
)

where biber >nul 2>&1
if errorlevel 1 (
    echo [ERROR] biber not found in PATH. Please check MIKTEX_PATH.
    pause
    exit /b 1
)

rem --- Create logs directory ---
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"

echo Starting LaTeX compilation process...

echo.
echo [1/4] Running first xelatex pass...
xelatex -interaction=nonstopmode -synctex=1 -include-directory="%SRC_DIR%" -aux-directory="%LOG_DIR%" -output-directory="%LOG_DIR%" "%INPUT_FILE%"

echo.
echo [2/4] Running biber...
pushd "%LOG_DIR%"
biber "%JOB_NAME%"
popd

echo.
echo [3/4] Running second xelatex pass...
xelatex -interaction=nonstopmode -synctex=1 -include-directory="%SRC_DIR%" -aux-directory="%LOG_DIR%" -output-directory="%LOG_DIR%" "%INPUT_FILE%"

echo.
echo [4/4] Running final xelatex pass...
xelatex -interaction=nonstopmode -synctex=1 -include-directory="%SRC_DIR%" -aux-directory="%LOG_DIR%" -output-directory="%LOG_DIR%" "%INPUT_FILE%"

rem --- Move PDF to main directory ---
if exist "%LOG_DIR%\%JOB_NAME%.pdf" (
    move /Y "%LOG_DIR%\%JOB_NAME%.pdf" "%OUTPUT_FILE%"
    echo.
    echo =========================================
    echo   Compilation complete!
    echo   Output file: %OUTPUT_FILE%
    echo =========================================
) else (
    echo [ERROR] PDF not generated. Check console output above.
)

pause
