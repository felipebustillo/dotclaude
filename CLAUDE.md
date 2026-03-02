# Claude Agents Repository

This repository contains specialized agent definitions for Claude Code.

## Structure

- `engineering/` — software development agents
- `security/` — security and quality assurance agents
- `infrastructure/` — system administration agents
- `management/` — review and documentation agents
- `agent-template.md` — standard template for new agents

## Writing Agents

All agent files follow the structure defined in `agent-template.md`. When creating or modifying agents:

- Write all agent content in English
- Keep agents technology-agnostic — they adapt to the project's stack via context injection
- Every agent must have: Identity, Core Rules, Workflow, Quality Criteria, Context Injection
- Core Rules must always include "read the project's CLAUDE.md first"
- Workflows should be concrete and actionable, not vague
- Quality Criteria must be measurable, not subjective
- Avoid overlap between agents — each has a distinct domain

## Conventions

- File names use kebab-case: `senior-developer.md`
- One agent per file
- Agents don't reference other agents (they're independent)
- No project-specific details in agent files — that comes from context injection
