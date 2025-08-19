# LaTeX Resume Template with Project Memory Banks

This project provides a LaTeX-based resume template with a memory bank system for managing project details. It's designed to work seamlessly with Cursor's AI assistant to maintain and update your resume efficiently.

The project now features an improved directory structure that better organizes source files, build outputs, documentation, and utility scripts for easier maintenance and scalability.

## Features

- **LaTeX Resume Template**: Professional, customizable resume format
- **Project Memory Banks**: Structured storage of project details
- **Cursor AI Integration**: Easily update your resume with AI assistance
- **Version-Controlled**: Track changes to your resume over time
- **Improved Directory Structure**: Better organization of source files, build outputs, documentation, and utility scripts
- **Scalable Architecture**: Easily extendable structure for adding new features and components

## Project Structure

```
Resume-LATEX/
├── .cursor/                     # Cursor IDE specific configurations
├── .github/                     # GitHub specific files
│   └── workflows/               # CI/CD workflows
├── docs/                        # Documentation
│   ├── guides/                  # Detailed guides
│   ├── templates/               # Template files
│   └── CHANGELOG.md             # Project changelog
├── src/                         # Source files
│   ├── cv/                      # CV sections
│   │   ├── sections/            # Individual section files
│   │   │   ├── experience.tex
│   │   │   ├── education.tex
│   │   │   ├── projects.tex
│   │   │   ├── publications.tex
│   │   │   ├── skills.tex
│   │   │   ├── languages.tex
│   │   │   ├── achievements.tex
│   │   │   └── summary.tex
│   │   └── references.bib       # Bibliography file
│   ├── fonts/                   # Custom fonts
│   ├── templates/               # LaTeX templates
│   │   └── russell.cls          # Main class file
│   └── resume.tex               # Main resume file
├── build/                       # Build outputs
│   ├── logs/                    # Compilation logs
│   └── pdf/                     # Generated PDFs
├── scripts/                     # Utility scripts
│   ├── compile.bat              # Compilation script
│   └── install_latex_deps.bat   # Dependency installation script
├── memory-bank/                 # Project memory banks
│   ├── main/                    # Main project memory
│   │   ├── projectbrief.md
│   │   ├── productContext.md
│   │   ├── systemPatterns.md
│   │   ├── techContext.md
│   │   ├── activeContext.md
│   │   └── progress.md
│   └── projects/                # Individual project memories
│       ├── ProjectName-memory-bank/
│       │   ├── projectbrief.md
│       │   ├── productContext.md
│       │   ├── systemPatterns.md
│       │   └── techContext.md
├── .gitignore                   # Git ignore configuration
├── README.md                    # Main documentation
└── LICENSE                      # License information
```

## Getting Started

1. **Clone this repository**
   ```bash
   git clone https://github.com/yourusername/Resume-LATEX.git
   cd Resume-LATEX
   ```

2. **Install LaTeX** (if not already installed)
   - Windows: [MiKTeX](https://miktex.org/download)
   - Mac: [MacTeX](https://www.tug.org/mactex/)
   - Linux: `sudo apt-get install texlive-full`

3. **Install Cursor IDE**
   - Download from [Cursor](https://cursor.sh/)
   - Open this project in Cursor

4. **Compile your resume**
   - Run `compile.bat` (Windows) or use your LaTeX compiler
   - Check the output PDF in the project root

## Using with Cursor AI

The power of this template comes from using Cursor's AI assistant to update your resume. Here are the exact prompts to use:

### 1. Update an Existing Project from Memory Bank

```
please read the @ProjectName-memory-bank and from reading the memories update the 
ProjectName project section in @projects.tex
```

Example:
```
please read the @OllamaNet-memory-bank and from reading the memories update the 
OllamaNet project section in @projects.tex
```

### 2. Add a New Project from Memory Bank

```
now add the @ProjectName-memory-bank project to @projects.tex
```

Example:
```
now add the @YouTubeDownloader-memory-bank project to @projects.tex
```

### 3. Create a New Memory Bank for a Project

1. Create a new directory in `Projects-Memories/` named `ProjectName-memory-bank`
2. Create the following files:
   - `projectbrief.md` - Project overview
   - `techContext.md` - Technical details
   - `systemPatterns.md` - Architecture patterns
   - `productContext.md` - Product features
3. Use the examples in existing memory banks as templates

## Memory Bank Structure

Each project memory bank follows this structure:

### projectbrief.md
Contains project overview, core requirements, goals, and success criteria.

### techContext.md
Contains technology stack, dependencies, development environment, and technical constraints.

### systemPatterns.md
Contains architecture overview, component structure, design patterns, and data flow.

### productContext.md
Contains problem statement, user needs, target users, and features.

## Customization

1. **Edit your personal information**
   - Update `resume.tex` with your details
   - Modify section files in the `cv/` directory

2. **Change styling**
   - Modify `russell.cls` for layout changes
   - Adjust colors, fonts, and spacing to your preference

3. **Add/remove sections**
   - Add new `.tex` files in the `cv/` directory
   - Include them in `resume.tex`

## Tips for Using with Cursor

- Use the `@filename` syntax to reference files when chatting with Cursor AI
- Keep your memory banks detailed and well-structured for better AI assistance
- After updating your resume, compile it to see the changes
- Use version control to track changes to your resume over time
