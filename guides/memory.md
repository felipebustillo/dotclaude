# Memory Guide

Claude Code uses CLAUDE.md files as persistent memory across sessions.

## Loading Mechanisms

### Ancestor Loading (UP the tree) — immediate

Claude walks upward from your working directory and loads every CLAUDE.md it finds.

### Descendant Loading (DOWN the tree) — lazy

Subdirectory CLAUDE.md files load only when Claude reads files in those directories.

### Sibling Loading — never

Working in `frontend/` won't load `backend/CLAUDE.md`.

## Example: Monorepo

```
/mymonorepo/
├── CLAUDE.md              # Shared conventions (always loaded)
├── frontend/
│   └── CLAUDE.md          # Frontend-specific (lazy)
├── backend/
│   └── CLAUDE.md          # Backend-specific (lazy)
└── api/
    └── CLAUDE.md          # API-specific (lazy)
```

Running from `/mymonorepo/frontend/`:
- `/mymonorepo/CLAUDE.md` — loaded (ancestor)
- `/mymonorepo/frontend/CLAUDE.md` — loaded (current dir)
- `/mymonorepo/backend/CLAUDE.md` — NOT loaded (sibling)

## Auto-Memory (Persistent Notes)

Claude Code maintains auto-memory at `~/.claude/projects/<path>/memory/MEMORY.md`.

### What to Save
- Stable patterns confirmed across multiple sessions
- Key architectural decisions and file paths
- User preferences for workflow and tools
- Solutions to recurring problems

### What NOT to Save
- Session-specific context (current task, in-progress work)
- Unverified conclusions from a single file
- Anything in CLAUDE.md already
- **Secrets, tokens, or credentials** — reference their location instead

## Best Practices

1. **Root CLAUDE.md < 200 lines** — extract details to `.claude/rules/`
2. **CLAUDE.local.md** for personal preferences (gitignored)
3. **Global CLAUDE.md** at `~/.claude/CLAUDE.md` for cross-project preferences
4. **Never store secrets** in any CLAUDE.md or MEMORY.md file
