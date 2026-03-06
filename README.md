# dotclaude

A complete reference for configuring [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — agents, skills, rules, hooks, settings, and memory patterns. Reusable across any project.

> **Note**: This repo is named `dotclaude` but currently hosted as `claude-agents` on GitHub. Rename pending.

## Guides

Practical references for each Claude Code feature:

| Guide | What it covers |
|-------|---------------|
| [Agents](guides/agents.md) | Custom subagents with frontmatter, tools, skills, memory |
| [Skills](guides/skills.md) | Reusable knowledge/workflow definitions |
| [Rules](guides/rules.md) | Contextual instructions that load automatically |
| [Commands](guides/commands.md) | Custom slash commands |
| [Hooks](guides/hooks.md) | Lifecycle event handlers (auto-format, notifications) |
| [Settings](guides/settings.md) | Configuration hierarchy, permissions, environment |
| [Memory](guides/memory.md) | CLAUDE.md loading, auto-memory, monorepo patterns |

## Agents

Reusable, technology-agnostic agents in `.claude/agents/`:

| Agent | Model | Domain |
|-------|-------|--------|
| [Senior Developer](.claude/agents/senior-developer.md) | inherit | Architecture, design patterns, refactoring |
| [DevOps Engineer](.claude/agents/devops-engineer.md) | inherit | CI/CD, containers, deployment, observability |
| [Security Auditor](.claude/agents/security-auditor.md) | inherit | Vulnerability analysis, OWASP, security review |
| [QA Engineer](.claude/agents/qa-engineer.md) | inherit | Test strategy, coverage, automation |
| [SysAdmin](.claude/agents/sysadmin.md) | inherit | Server administration, networking, monitoring |
| [Code Reviewer](.claude/agents/code-reviewer.md) | inherit | Code reviews with actionable, prioritized feedback |
| [Technical Writer](.claude/agents/technical-writer.md) | inherit | Documentation, ADRs, runbooks, guides |

### Usage

Copy agents to your project:

```bash
# Copy specific agents
cp dotclaude/.claude/agents/code-reviewer.md your-project/.claude/agents/

# Or copy all
cp -r dotclaude/.claude/agents/ your-project/.claude/agents/
```

Then customize the frontmatter (`model`, `tools`, `skills`) for your project.

## Templates

Starting points for creating your own:

| Template | For |
|----------|-----|
| [Agent Template](templates/agent-template.md) | New agents |
| [Skill Template](templates/skill-template.md) | New skills |
| [Rule Template](templates/rule-template.md) | New rules |
| [Command Template](templates/command-template.md) | New slash commands |

## Examples

| Example | Description |
|---------|-------------|
| [settings.json](examples/settings.json) | Recommended settings with safe permissions |
| [statusline-command.sh](examples/statusline-command.sh) | Catppuccin Mocha status line |

## Status Line

A Catppuccin Mocha-themed status line showing session info:

```
user/project  main │ +156 -23 │ ↓245.8k ↑18.4k │ ████░░░░░░ 42%
```

## Key Best Practices

1. **CLAUDE.md < 200 lines** — extract details to `.claude/rules/`
2. **`CLAUDE_AUTOCOMPACT_PCT_OVERRIDE=80`** — prevent context exhaustion
3. **Granular permissions** — don't `allow` destructive commands
4. **Dynamic context injection** — use `` !`command` `` in agents/skills for live data
5. **Never store secrets** in CLAUDE.md or memory files
6. **One domain per agent** — avoid overlap, keep them focused
7. **Don't duplicate hooks** between `settings.json` and `settings.local.json`

## License

[MIT](LICENSE)
