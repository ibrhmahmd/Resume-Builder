# System Patterns: LaTeX Resume

## Architecture Overview
The resume is built using a modular LaTeX structure with the following components:
- Main document (resume.tex)
- Custom class file (russell.cls)
- Section-specific files in cv/ directory
- Bibliography management system

## Key Technical Decisions
1. Template Selection
   - Using Russell template for professional layout
   - Customized styling and formatting
   - Support for modern resume features

2. File Organization
   - Modular structure with separate files for each section
   - Centralized configuration in main file
   - Separate bibliography management

3. Design Patterns
   - Section-based organization
   - Consistent formatting across sections
   - Reusable components
   - Bibliography integration

## Component Relationships
```mermaid
graph TD
    A[resume.tex] --> B[russell.cls]
    A --> C[cv/sections]
    C --> D[summary.tex]
    C --> E[skills.tex]
    C --> F[projects.tex]
    C --> G[experience.tex]
    C --> H[publications.tex]
    C --> I[achievements.tex]
    C --> J[education.tex]
    C --> K[languages.tex]
    A --> L[references.bib]
```

## Styling Patterns
- Consistent margins and spacing
- Professional typography
- Clear section hierarchy
- Balanced layout
- Print-friendly design 