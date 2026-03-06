# Settings Guide

Claude Code settings are in `settings.json` files at multiple scopes.

## Settings Hierarchy (highest to lowest priority)

| Priority | Location | Scope | Version Control |
|----------|----------|-------|-----------------|
| 1 | CLI arguments | Session | N/A |
| 2 | `.claude/settings.local.json` | Project (personal) | No (gitignored) |
| 3 | `.claude/settings.json` | Project (shared) | Yes |
| 4 | `~/.claude/settings.local.json` | Global (personal) | N/A |
| 5 | `~/.claude/settings.json` | Global | N/A |

**Key**: `deny` rules have highest safety precedence and cannot be overridden.
Array settings (like `permissions.allow`) are **merged** across scopes.

## Recommended Settings

### Essential

```json
{
  "plansDirectory": "/path/to/plans",
  "env": {
    "CLAUDE_AUTOCOMPACT_PCT_OVERRIDE": "80"
  }
}
```

- `plansDirectory`: Persist plans between sessions
- `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE`: Trigger compaction at 80% context (default ~95%), prevents running out of context in long sessions

### Permissions Strategy

**Allow** read-only and development tools:
```json
"permissions": {
  "allow": [
    "Bash(git *)", "Bash(npm *)", "Bash(pytest *)",
    "Bash(ruff *)", "Bash(mypy *)",
    "Bash(ls *)", "Bash(cat *)", "Bash(grep *)"
  ]
}
```

**Don't auto-allow destructive commands** — let them prompt:
- `docker rm`, `docker stop`, `docker system prune`
- `kill`, `pkill`, `killall`
- `rm` (except specific safe patterns)
- `git push --force`, `git reset --hard`

**Granularize broad permissions**:
```json
// Instead of:  "Bash(docker *)"
// Use:
"Bash(docker ps *)", "Bash(docker logs *)", "Bash(docker compose *)",
"Bash(docker inspect *)", "Bash(docker images *)", "Bash(docker exec *)",
"Bash(docker build *)"
```

### Attribution

```json
{
  "attribution": {
    "pr": ""
  }
}
```

Set `pr` to empty string to hide Claude attribution in PRs.

## Environment Variables

Set via the `env` key (avoids wrapper scripts):

| Variable | Description | Recommended |
|----------|-------------|-------------|
| `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE` | Compaction threshold (1-100) | `"80"` |
| `CLAUDE_CODE_EFFORT_LEVEL` | Thinking depth: `low`, `medium`, `high` | Default varies |
| `MCP_TIMEOUT` | MCP startup timeout (ms) | `"10000"` |
| `MAX_MCP_OUTPUT_TOKENS` | Max MCP output tokens | `"50000"` |

## Useful Commands

| Command | Description |
|---------|-------------|
| `/config` | Interactive settings UI |
| `/permissions` | View/update permissions |
| `/model` | Switch models, adjust effort |
| `/context` | Visualize context usage |
| `/agents` | Manage subagents |
| `/skills` | View available skills |
| `/hooks` | View configured hooks |
| `--doctor` | Diagnose config issues |
