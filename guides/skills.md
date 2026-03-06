# Skills Guide

Skills are reusable knowledge/workflow definitions in `.claude/skills/`.

## Frontmatter Fields

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | string | Recommended | Display name and `/slash-command` identifier |
| `description` | string | Recommended | What it does (shown in autocomplete) |
| `argument-hint` | string | No | Hint during autocomplete (e.g., `[file-path]`) |
| `user-invocable` | boolean | No | `false` to hide from `/` menu (background knowledge only) |
| `allowed-tools` | string | No | Tools allowed without permission prompts |
| `model` | string | No | Model override (`haiku`, `sonnet`, `opus`) |
| `context` | string | No | `fork` to run in isolated subagent context |

## Two Skill Patterns

| Pattern | Loading | Use Case |
|---------|---------|----------|
| **User Skill** | On-demand via `/skill-name` | Standalone reusable workflows |
| **Agent Skill** | Preloaded via agent's `skills:` field | Domain knowledge baked into agents |

## Example: User-Invocable Skill

```yaml
---
name: validate-edc
description: Validate EDC connector configuration and connectivity
argument-hint: [connector-url]
allowed-tools: Read, Grep, Bash
---

Validate the EDC connector at $0.

## Checklist
- [ ] Health endpoint responds
- [ ] DID resolution works
- [ ] Catalog request returns datasets
```

## Example: Agent-Only Skill (Background Knowledge)

```yaml
---
name: testing-patterns
description: Project testing conventions and patterns
user-invocable: false
---

# Testing Patterns

## Python: pytest + pytest-asyncio
- Use MockCollection/MockCursor for Motor
- Arrange-Act-Assert pattern
...
```

## Dynamic Context Injection

Same `` !`command` `` syntax as agents:

```markdown
## Current API Structure
Existing routers: !`find api/app/api/v1 -name "*.py" -path "*/endpoints/*" 2>/dev/null | head -15`
```

## String Substitutions

| Variable | Description |
|----------|-------------|
| `$ARGUMENTS` | All arguments passed when invoking |
| `$0`, `$1`, ... | Individual arguments by index |
| `${CLAUDE_SESSION_ID}` | Current session ID |

## Scope and Priority

| Location | Priority |
|----------|----------|
| `.claude/skills/` (project) | 1 (highest) |
| `~/.claude/skills/` (global) | 2 |
| Plugin skills | 3 (lowest) |
