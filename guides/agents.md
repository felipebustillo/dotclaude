# Agents Guide

Custom agents are specialized subagents defined in `.claude/agents/` with YAML frontmatter.

## Frontmatter Fields

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | string | Yes | Unique identifier (lowercase, hyphens) |
| `description` | string | Yes | When to invoke. Use `"PROACTIVELY"` for auto-invocation |
| `tools` | string/list | No | Comma-separated tool allowlist. Inherits all if omitted |
| `model` | string | No | `haiku`, `sonnet`, `opus`, or `inherit` (default) |
| `maxTurns` | integer | No | Maximum agentic turns before stopping |
| `skills` | list | No | Skills preloaded into agent context at startup |
| `memory` | string | No | Persistent memory: `user`, `project`, or `local` |
| `background` | boolean | No | Run as background task (default: `false`) |
| `isolation` | string | No | `"worktree"` to run in a temporary git worktree |
| `color` | string | No | CLI output color (e.g., `green`, `magenta`) |
| `hooks` | object | No | Lifecycle hooks: `PreToolUse`, `PostToolUse`, `Stop` |

## Example: Minimal Agent

```yaml
---
name: code-reviewer
description: Reviews code for quality issues
tools: Read, Grep, Glob
model: haiku
---

Review the code for quality issues and report findings.
```

## Example: Full-Featured Agent

```yaml
---
name: edc-specialist
description: Validates EDC configurations and troubleshoots connectivity.
tools: Read, Grep, Glob, Bash
model: sonnet
skills:
  - edc-connector
maxTurns: 20
---

You are an EDC specialist. Use the edc-connector skill for reference.

## Context
- K3s pods: !`ssh k3s "kubectl get pods -n tractus-x --no-headers" 2>/dev/null | head -10`
```

## Dynamic Context Injection

Use `` !`command` `` syntax to inject live data into agent prompts:

```markdown
## Context
- Git status: !`git status --short`
- Current branch: !`git branch --show-current`
- Recent changes: !`git log --oneline -5`
```

The shell command runs when the agent is invoked, and its output replaces the placeholder.

## Scope and Priority

| Location | Scope | Priority |
|----------|-------|----------|
| `--agents` CLI flag | Session | 1 (highest) |
| `.claude/agents/` | Project | 2 |
| `~/.claude/agents/` | Global | 3 |
| Plugin `agents/` | Plugin scope | 4 (lowest) |

## Memory Scopes

| Scope | Location | Shared | Version Controlled |
|-------|----------|--------|--------------------|
| `user` | `~/.claude/agent-memory/<name>/` | No | No |
| `project` | `.claude/agent-memory/<name>/` | Yes | Yes |
| `local` | `.claude/agent-memory-local/<name>/` | No | No |

## Design Principles

- **One domain per agent** — avoid overlap
- **Technology-agnostic** — agents adapt via context injection and CLAUDE.md
- **Read-only by default** — limit tools to what's needed
- **Measurable quality criteria** — not subjective preferences
- **Concrete workflows** — actionable steps, not vague instructions
