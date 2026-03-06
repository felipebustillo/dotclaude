# Commands Guide

Custom slash commands defined in `.claude/commands/`.

## Frontmatter Fields

| Field | Type | Description |
|-------|------|-------------|
| `description` | string | Shown in autocomplete |
| `argument-hint` | string | Hint (e.g., `[issue-number]`) |
| `allowed-tools` | string | Tools allowed without prompts |
| `model` | string | Model override |

## Example: Fix GitHub Issue

```yaml
---
description: Fix a GitHub issue by number
argument-hint: [issue-number]
allowed-tools: Read, Edit, Write, Bash(gh *), Bash(npm test *)
model: sonnet
---

Fix GitHub issue #$0.

## Context
- Issue details: !`gh issue view $0`
- Current branch: !`git branch --show-current`

## Steps
1. Read the issue description
2. Understand requirements
3. Implement the fix
4. Write tests
5. Create a commit
```

## Example: Deploy Check

```yaml
---
description: Pre-deployment validation
allowed-tools: Read, Bash
---

Run pre-deployment checks:

1. All tests pass: !`cd api && pytest --tb=short -q 2>&1 | tail -5`
2. Lint clean: !`cd api && ruff check . 2>&1 | tail -3`
3. Type check: !`cd api && mypy app 2>&1 | tail -3`
4. Git status: !`git status --short`

Report any issues found.
```

## String Substitutions

| Variable | Description |
|----------|-------------|
| `$ARGUMENTS` | All arguments |
| `$0`, `$1` | Individual arguments |
| `${CLAUDE_SESSION_ID}` | Session ID |
| `` !`command` `` | Shell output injected before Claude sees it |

## Scope

| Location | Priority |
|----------|----------|
| `.claude/commands/` (project) | 1 |
| `~/.claude/commands/` (global) | 2 |
| Plugin commands | 3 |

Subdirectory commands use `/subdir:command-name`.
