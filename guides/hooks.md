# Hooks Guide

Hooks run shell commands in response to Claude Code lifecycle events.

## Hook Events

| Event | When | Use Case |
|-------|------|----------|
| `PreToolUse` | Before a tool runs | Validation, security checks |
| `PostToolUse` | After a tool succeeds | Auto-formatting, notifications |
| `PostToolUseFailure` | After a tool fails | Error logging |
| `UserPromptSubmit` | User sends a message | Input validation |
| `Stop` | Agent finishes | Summary, cleanup |
| `SessionStart` | Session begins | Setup, context loading |
| `SessionEnd` | Session ends | Cleanup, logging |
| `PreCompact` | Before context compaction | Save important state |
| `SubagentStart` / `SubagentStop` | Subagent lifecycle | Tracking, notifications |
| `Notification` | Claude sends a notification | Sound alerts, desktop notifications |

## Configuration

Hooks go in `settings.json` (global or project):

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "your-command-here",
            "timeout": 5000
          }
        ]
      }
    ]
  }
}
```

## Practical Examples

### Auto-Format Python on Save

```json
{
  "matcher": "Write|Edit",
  "hooks": [{
    "type": "command",
    "command": "FILE=$(cat | jq -r '.tool_input.file_path // empty'); [ -z \"$FILE\" ] && exit 0; case \"$FILE\" in *.py) ;; *) exit 0;; esac; cd /path/to/project && ruff check --fix \"$FILE\" && ruff format \"$FILE\""
  }]
}
```

### Auto-Format TypeScript on Save

```json
{
  "matcher": "Write|Edit",
  "hooks": [{
    "type": "command",
    "command": "FILE=$(cat | jq -r '.tool_input.file_path // empty'); [ -z \"$FILE\" ] && exit 0; case \"$FILE\" in *.ts|*.tsx) ;; *) exit 0;; esac; cd /path/to/project && npx eslint --fix \"$FILE\" && npx prettier --write \"$FILE\""
  }]
}
```

### Security Reminder on File Edits

```json
{
  "matcher": "Edit|Write",
  "hooks": [{
    "type": "command",
    "command": "python3 /path/to/security_reminder_hook.py"
  }]
}
```

## Tips

- Use `matcher` to scope hooks to specific tools
- Hooks receive JSON on stdin with tool input/output
- Exit code 0 = success, non-zero = warning shown to Claude
- Set `"async": true` for non-blocking hooks (logging, notifications)
- Set `"once": true` for hooks that should only run once per session
- **Don't duplicate hooks** between `settings.json` and `settings.local.json`
