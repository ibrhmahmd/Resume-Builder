@echo off
rem Configure these variables to match your setup
rem MiKTeX installation path
set MIKTEX_PATH=C:\Users\MaStEr\AppData\Local\Programs\MiKTeX\miktex\bin\x64
rem Your name (will be used in the output PDF filename)
set USER_NAME=MASTER

rem Configure input and output filenames
set INPUT_FILE=resume.tex
set OUTPUT_FILE=%USER_NAME%_resume.pdf

echo Setting up MiKTeX environment...
set PATH=%PATH%;%MIKTEX_PATH%

echo Creating logs directory if it doesn't exist...
if not exist "logs" mkdir logs

echo Starting LaTeX compilation process...

echo Running first pdflatex pass...
pdflatex -quiet -aux-directory=logs -output-directory=logs %INPUT_FILE%

echo Running second pdflatex pass...
pdflatex -quiet -aux-directory=logs -output-directory=logs %INPUT_FILE%

echo Moving PDF to main directory...
move /Y "logs\resume.pdf" "%OUTPUT_FILE%"

echo Compilation complete! Check %OUTPUT_FILE% for the output.
pause