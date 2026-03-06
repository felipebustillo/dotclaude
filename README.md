# dotclaude

A complete reference for configuring [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — agents, skills, rules, hooks, settings, and memory patterns. Reusable across any project.

## Quick Start

```bash
# Clone the repo
git clone https://github.com/felipebustillo/dotclaude.git

# Copy agents to your project
cp dotclaude/.claude/agents/*.md your-project/.claude/agents/

# Or pick what you need
cp dotclaude/.claude/agents/code-reviewer.md your-project/.claude/agents/
cp dotclaude/examples/settings.json your-project/.claude/settings.json
```

Then customize the frontmatter (`model`, `tools`, `skills`) for your stack.

## What's Inside

### Guides

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

### Agents

Reusable, technology-agnostic agents in `.claude/agents/`. They adapt to any project via context injection — no hardcoded frameworks or languages.

| Agent | Domain |
|-------|--------|
| [Senior Developer](.claude/agents/senior-developer.md) | Architecture, design patterns, refactoring |
| [DevOps Engineer](.claude/agents/devops-engineer.md) | CI/CD, containers, deployment, observability |
| [Security Auditor](.claude/agents/security-auditor.md) | Vulnerability analysis, OWASP, security review |
| [QA Engineer](.claude/agents/qa-engineer.md) | Test strategy, coverage, automation |
| [SysAdmin](.claude/agents/sysadmin.md) | Server administration, networking, monitoring |
| [Code Reviewer](.claude/agents/code-reviewer.md) | Code reviews with actionable, prioritized feedback |
| [Technical Writer](.claude/agents/technical-writer.md) | Documentation, ADRs, runbooks, guides |

### Templates

Starting points for creating your own:

| Template | For |
|----------|-----|
| [Agent Template](templates/agent-template.md) | New agents |
| [Skill Template](templates/skill-template.md) | New skills |
| [Rule Template](templates/rule-template.md) | New rules |
| [Command Template](templates/command-template.md) | New slash commands |

### Examples

| Example | Description |
|---------|-------------|
| [settings.json](examples/settings.json) | Recommended settings with safe permissions |
| [statusline-command.sh](examples/statusline-command.sh) | Catppuccin Mocha status line for the terminal |

## Status Line

A Catppuccin Mocha-themed status line showing session info:

```
app  main | +1400 -2230 | ↓64k ↑68k | ██░░░░ 25% | 5h 43% (2m) 7d 22% (4d0h)
```

Segments:
1. **Directory + git branch** — last path component + branch name with dirty indicator
2. **Lines changed** — green/red additions and deletions
3. **Token usage** — input and output tokens
4. **Context bar** — 6-char visual bar (green < 60%, yellow 60-80%, red > 80%)
5. **Claude Max limits** — 5-hour and 7-day usage % with reset countdown

Requires Claude Max subscription. Usage data is cached with stale indicators.

## Staying Up to Date

This repo includes an automated **update monitor** that runs weekly via GitHub Actions. It tracks 5 external sources for changes:

| Source | What it watches |
|--------|----------------|
| [Official docs](https://code.claude.com/docs/llms.txt) | New or updated documentation pages |
| [Releases](https://github.com/anthropics/claude-code/releases) | New Claude Code versions |
| [Changelog](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md) | Detailed changes per version |
| [Skills repo](https://github.com/anthropics/skills) | Official skill definitions |
| [Awesome Claude Code](https://github.com/hesreallyhim/awesome-claude-code) | Community tools and patterns |

When changes are detected, the monitor:
1. Generates a report in [`scripts/REPORT.md`](scripts/REPORT.md) with a summary and which guides may need updates
2. Opens a GitHub issue with the `update-monitor` label

To act on it, open Claude Code in this repo and say:
> Revisa scripts/REPORT.md y actualiza las guias y templates que lo necesiten.

No API keys needed — runs entirely on GitHub Actions with `GITHUB_TOKEN`.

## Best Practices

1. **CLAUDE.md < 200 lines** — extract details to `.claude/rules/`
2. **`CLAUDE_AUTOCOMPACT_PCT_OVERRIDE=80`** — prevent context exhaustion
3. **Granular permissions** — don't `allow` destructive commands
4. **Dynamic context injection** — use `` !`command` `` in agents/skills for live data
5. **Never store secrets** in CLAUDE.md or memory files
6. **One domain per agent** — avoid overlap, keep them focused
7. **Don't duplicate hooks** between `settings.json` and `settings.local.json`

## Contributing

Found something outdated or have a better pattern? Open an issue or PR. The goal is to keep this repo a reliable, up-to-date reference for the Claude Code community.

## License

[MIT](LICENSE)
