# LaTeX Resume Setup and Compilation Guide

## 1. Initial Setup

### Installing MiKTeX
1. Downloaded and installed MiKTeX from https://miktex.org/download
2. During installation:
   - Chose "Install missing packages on the fly = Yes"
   - This ensures automatic package installation when needed
3. After installation:
   - Note your MiKTeX installation path
   - Common paths are:
     - `C:\Users\[username]\AppData\Local\Programs\MiKTeX\miktex\bin\x64`
     - `C:\Program Files\MiKTeX\miktex\bin\x64`

### Required Packages
The resume uses several LaTeX packages:
- biblatex (for bibliography)
- hyperref (for links)
- url (for formatting URLs)
- geometry (for page layout)
- fontspec (for font management)
- Other packages are installed automatically as needed

## 2. Project Structure
```
Resume-LATEX/
├── cv/
│   ├── summary.tex
│   ├── skills.tex
│   ├── projects.tex
│   ├── experience.tex
│   ├── publications.tex
│   ├── achievements.tex
│   ├── education.tex
│   ├── languages.tex
│   └── references.bib
├── font/
├── logs/          # Directory for all LaTeX auxiliary and log files
├── russell.cls
├── resume.tex
└── compile.bat
```

## 3. Compilation Process

### Initial Compilation Attempt
- First tried using pdflatex, but encountered issues because the resume uses `fontspec` package
- Error message indicated we needed XeLaTeX or LuaTeX instead of pdflatex

### Solution: Using XeLaTeX
Created a batch file (`compile.bat`) to automate the compilation process:
```batch
@echo off
rem Configure these variables to match your setup
rem MiKTeX installation path
set MIKTEX_PATH=C:\Users\ibrahim\AppData\Local\Programs\MiKTeX\miktex\bin\x64
rem Your name (will be used in the output PDF filename)
set USER_NAME=Ibrahim

rem Configure input and output filenames
set INPUT_FILE=resume.tex
set OUTPUT_FILE=%USER_NAME%_resume.pdf

echo Setting up MiKTeX environment...
set PATH=%PATH%;%MIKTEX_PATH%

echo Creating logs directory if it doesn't exist...
if not exist "logs" mkdir logs

echo Starting LaTeX compilation process...

echo Running first xelatex pass...
xelatex -quiet -aux-directory=logs -output-directory=logs %INPUT_FILE%

echo Running biber...
cd logs
biber resume
cd ..

echo Running second xelatex pass...
xelatex -quiet -aux-directory=logs -output-directory=logs %INPUT_FILE%

echo Running final xelatex pass...
xelatex -quiet -aux-directory=logs -output-directory=logs %INPUT_FILE%

echo Moving PDF to main directory...
move /Y "logs\resume.pdf" "%OUTPUT_FILE%"

echo Compilation complete! Check %OUTPUT_FILE% for the output.
pause
```

### Configuring the Batch File
Before running the batch file for the first time:
1. Open `compile.bat` in a text editor
2. Configure the MiKTeX path:
   - Locate the line: `set MIKTEX_PATH=...`
   - Change the path to match your MiKTeX installation
   - Common paths are:
     - `C:\Users\[username]\AppData\Local\Programs\MiKTeX\miktex\bin\x64`
     - `C:\Program Files\MiKTeX\miktex\bin\x64`
3. Set your name for the output file:
   - Locate the line: `set USER_NAME=Ibrahim`
   - Change "Ibrahim" to your name
   - The output file will be named "[YourName]_resume.pdf"
4. Save the file

## 4. Problems Encountered and Solutions

### Problem 1: PATH Issues
- Initially, LaTeX commands weren't recognized
- First solution: Used full paths in the batch file
- Improved solution: Added MiKTeX to PATH temporarily using configurable variables
- Users can easily update the MiKTeX path and output filename in one place

### Problem 2: fontspec Error
- Error: "Fatal Package fontspec Error: The fontspec package requires either XeTeX or LuaTeX"
- Solution: Switched from pdflatex to xelatex in the compilation process

### Problem 3: Long Compilation Time
- First compilation was slow due to package downloads
- Solution: Added `-quiet` flag to xelatex commands to reduce output and make progress clearer
- Subsequent compilations are much faster

### Problem 4: File Organization
- Issue: Many auxiliary files cluttering the main directory
- Solution: Created a logs directory and used XeLaTeX's output directory options
- All auxiliary files (.aux, .log, .bbl, etc.) are now stored in the logs directory
- Only the final PDF is kept in the main directory

## 5. How to Compile the Resume

### Method 1: Using Command Prompt
1. Open Command Prompt in the resume directory
2. Run: `.\compile.bat`

### Method 2: Using Windows Explorer
1. Navigate to the resume directory
2. Double-click `compile.bat`

The compilation process will:
1. Create logs directory if it doesn't exist
2. Run first XeLaTeX pass (process LaTeX)
3. Run Biber (process bibliography)
4. Run second XeLaTeX pass (incorporate bibliography)
5. Run final XeLaTeX pass (resolve all references)
6. Move the final PDF to the main directory

## 6. Making Changes
1. Edit any of the source files (resume.tex or files in cv/ directory)
2. Run `compile.bat` to regenerate the PDF
3. Check resume.pdf for the updated output

## 7. Tips
- Keep the `compile.bat` file in the same directory as resume.tex
- Always wait for the compilation to complete before checking the PDF
- If you see errors, check the log files in the logs directory
- First compilation might be slow due to package downloads
- Subsequent compilations will be much faster
- The batch file is portable and will work on other computers with MiKTeX installed
- Update the MIKTEX_PATH and USER_NAME variables in compile.bat to match your setup
- All auxiliary files are kept in the logs directory for cleaner organization
- The final PDF will be named "[YourName]_resume.pdf" in the main directory 