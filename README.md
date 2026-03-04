# Claude Agents

A collection of specialized agent definitions for [Claude Code](https://docs.anthropic.com/en/docs/claude-code), reusable across any project. Each agent brings deep domain expertise and adapts to your project's stack through context injection.

## Available Agents

| Domain | Agent | Description |
|--------|-------|-------------|
| Engineering | [Senior Developer](engineering/senior-developer.md) | Code architecture, design patterns, refactoring, mentoring |
| Engineering | [DevOps Engineer](engineering/devops-engineer.md) | CI/CD, containers, deployment, pipelines, observability |
| Security | [Security Auditor](security/security-auditor.md) | Vulnerability analysis, OWASP, security review |
| Security | [QA Engineer](security/qa-engineer.md) | Test strategy, coverage, edge cases, test automation |
| Infrastructure | [SysAdmin](infrastructure/sysadmin.md) | Server administration, networking, monitoring, hardening |
| Management | [Code Reviewer](management/code-reviewer.md) | Exhaustive code reviews with actionable, prioritized feedback |
| Management | [Technical Writer](management/technical-writer.md) | Documentation, ADRs, runbooks, READMEs, guides |

## Status Line

A Catppuccin Mocha-themed status line for Claude Code that shows at-a-glance session info:

```
felipebustillo/homelab  main │ +156 -23 │ ↓245.8k ↑18.4k │ ████░░░░░░ 42%
```

| Module | Description |
|--------|-------------|
| Directory + branch | Current project and git branch (`*` if dirty) |
| Lines changed | `+added` / `-removed` in the session |
| Tokens | `↓input` / `↑output` tokens consumed |
| Context bar | Visual context window usage (green → yellow → red) |

### Setup

1. Copy the script:

```bash
cp statusline/statusline-command.sh ~/.claude/statusline-command.sh
chmod +x ~/.claude/statusline-command.sh
```

2. Add to `~/.claude/settings.json`:

```json
{
    "statusLine": {
        "type": "command",
        "command": "bash $HOME/.claude/statusline-command.sh"
    }
}
```

**Requirements**: `jq`, `git`. No `bc` needed — uses pure bash arithmetic.

## How to Use

### 1. Clone the repository

```bash
git clone https://github.com/felipebustillo/claude-agents.git ~/repos/claude-agents
```

### 2. Add to your project's CLAUDE.md

Add this section to the `CLAUDE.md` of any project where you want to use the agents:

```markdown
## Agents

When asked to act as a specific role, read and follow the full agent definition file before responding:

- "Act as Senior Developer" → ~/repos/claude-agents/engineering/senior-developer.md
- "Act as Security Auditor" → ~/repos/claude-agents/security/security-auditor.md
- "Act as Code Reviewer" → ~/repos/claude-agents/management/code-reviewer.md
- "Act as DevOps Engineer" → ~/repos/claude-agents/engineering/devops-engineer.md
- "Act as QA Engineer" → ~/repos/claude-agents/security/qa-engineer.md
- "Act as SysAdmin" → ~/repos/claude-agents/infrastructure/sysadmin.md
- "Act as Technical Writer" → ~/repos/claude-agents/management/technical-writer.md

After reading the agent file, also read any `agent-context.md` in this project root for additional context. Always adapt to this project's stack and conventions as defined in this CLAUDE.md.
```

### 3. Use in conversation

Simply ask Claude to adopt a role:

```
Act as Security Auditor and review this authentication module.
Act as Code Reviewer and review my last 3 commits.
Act as Technical Writer and create an ADR for this database migration.
```

## Context Injection

Agents adapt to your project through three layers of context, from general to specific:

1. **The agent itself** — defines the role, rules, and generic workflow
2. **Your project's CLAUDE.md** — stack, conventions, preferences (already exists in your project)
3. **`agent-context.md` (optional)** — extra context your project wants to provide to agents (e.g., "Database is PostgreSQL 16", "We use Clean Architecture")

No variables or templating needed. The agent simply reads available files and adapts.

## Creating New Agents

Use [`agent-template.md`](agent-template.md) as a starting point. Each agent file follows a standard structure:

- **Identity** — who the agent is
- **Core Rules** — unbreakable constraints
- **Workflow** — step-by-step process for tasks
- **Quality Criteria** — measurable success criteria
- **Context Injection** — how to obtain project context

See the template for details and examples.

## License

[MIT](LICENSE)
