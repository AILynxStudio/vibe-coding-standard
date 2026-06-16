# Repository Purpose

This is a documentation repository for "Vibe Coding 工业级开发标准体系" (Industrial-grade Vibe Coding Development Standards). It contains no runnable code - only markdown documentation, templates, and case studies.

## Key Facts

- **Language**: All content is in Chinese (Simplified)
- **Structure**: Documentation follows the Vibe Coding industrial development standards framework
- **Target audience**: Developers using AI coding tools (Cursor, VSCode plugins, desktop AI clients, etc.)
- **License**: MIT

## Repository Structure

```
├── standard/          # Core standards (12 files) - 8-stage workflow, 7 iron rules, scenario adaptations
├── toolkits/          # Reusable templates/prompts (7 files) - TK-1 to TK-7
├── cases/             # Case studies (9 files) - from beginner to enterprise level
├── charts/            # Visual diagrams (11 files) - AI prompts for generating diagrams
├── README.md          # Main documentation
├── LICENSE            # MIT License
├── .gitignore         # Git ignore rules
├── CONTRIBUTING.md    # Contribution guidelines
└── AGENTS.md          # This file
```

## Working with This Repo

- **No build/test/lint commands**: This is pure documentation
- **File format**: All content is markdown (.md)
- **Naming convention**: Files follow numbered prefixes (01-, 02-, TK-1, case-00, etc.)
- **Contributing**: Follow CONTRIBUTING.md guidelines for PRs

## Important Notes

1. All directories and files have been created and contain complete content
2. Standards are organized into 12 files in `standard/` directory (not a single monolithic document)
3. Charts directory contains AI prompts for generating visual diagrams, not actual images
4. No CI/CD, no package managers, no dependencies
5. All case studies (0-7) contain detailed step-by-step instructions