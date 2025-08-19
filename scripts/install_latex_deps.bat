@echo off
echo ========================================
echo   Installing full LaTeX environment...
echo ========================================

REM --- Step 1: Download MiKTeX installer ---
set "MIX_INSTALLER=%TEMP%\basic-miktex-x64.exe"

if exist "%MIX_INSTALLER%" (
    echo [INFO] Removing old installer...
    del /f /q "%MIX_INSTALLER%"
)

echo [INFO] Downloading latest MiKTeX installer...
powershell -Command "Invoke-WebRequest -Uri https://miktex.org/download/win/basic-miktex-x64.exe -OutFile '%MIX_INSTALLER%'"

REM --- Step 2: Run MiKTeX installer silently ---
echo [INFO] Installing MiKTeX (please wait, this may take a while)...
start /wait "" "%MIX_INSTALLER%" --unattended --shared

REM --- Step 3: Add MiKTeX bin to PATH ---
set "MIKTEX_PATH=%ProgramFiles%\MiKTeX\miktex\bin\x64"
if exist "%MIKTEX_PATH%" (
    echo [INFO] Adding MiKTeX to PATH...
    setx PATH "%PATH%;%MIKTEX_PATH%"
) else (
    echo [WARNING] Could not find MiKTeX bin folder. Please check installation.
)

REM --- Step 4: Refresh PATH in current session ---
set PATH=%PATH%;%MIKTEX_PATH%

REM --- Step 5: Install core dependencies ---
echo [INFO] Installing required LaTeX packages...
mpm --admin --install=xetex
mpm --admin --install=biber
mpm --admin --install=fontspec
mpm --admin --install=polyglossia
mpm --admin --install=biblatex
mpm --admin --install=csquotes
mpm --admin --install=geometry
mpm --admin --install=titlesec
mpm --admin --install=enumitem
mpm --admin --install=hyperref
mpm --admin --install=parskip
mpm --admin --install=tabularx
mpm --admin --install=etoolbox
mpm --admin --install=xstring
mpm --admin --install=pdfx
mpm --admin --install=graphics
mpm --admin --install=tools
mpm --admin --install=l3kernel
mpm --admin --install=l3packages

REM --- Step 6: Test installation ---
echo [INFO] Checking installed commands...
where xelatex
where biber

echo ========================================
echo   Full LaTeX setup complete!
echo   Please restart your terminal/PC.
echo ========================================
pause
