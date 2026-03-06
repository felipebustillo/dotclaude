# dotclaude Repository

This repository contains reusable Claude Code configuration: agents, guides, templates, and examples.

## Structure

- `.claude/agents/` — reusable agent definitions
- `guides/` — best practice documentation for each feature
- `templates/` — starting points for new agents, skills, rules, commands
- `examples/` — example settings and statusline

## Writing Content

- All content in English
- Keep agents technology-agnostic — they adapt via context injection
- Every agent: Identity, Core Rules, Workflow, Quality Criteria
- Guides should be practical references, not tutorials
- Templates should be minimal and ready to customize
- No project-specific details — that comes from the user's CLAUDE.md

## Conventions

- File names: kebab-case (`senior-developer.md`)
- One agent per file, one guide per feature
- Agents don't reference other agents (independent)
