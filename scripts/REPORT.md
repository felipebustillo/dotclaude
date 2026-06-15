# Update Monitor Report — 2026-06-15

## official-docs (Claude Code Official Docs Index)
**Estado:** Cambios detectados
**URL:** https://code.claude.com/docs/llms.txt

**Resumen:**
> # Claude Code Docs
> 
> > Official documentation for Claude Code, Anthropic's agentic coding tool available in the terminal, IDE, desktop app, and browser. Covers installation, configuration, skills, subagents, hooks, MCP, the Agent SDK, and reference material.
> 
> ## Docs
> 
> - [Set up Claude Code for your organization](https://code.claude.com/docs/en/admin-setup.md): A decision map for administrators deploying Claude Code, covering API providers, managed settings, policy enforcement, usage monitoring, and data handling.
> - [Escalate hard decisions with the advisor tool](https://code.claude.com/docs/en/advisor.md): Pair your main model with a stronger advisor model that Claude consults at key moments during a task.
> - [How the agent loop works](https://code.claude.com/docs/en/agent-sdk/agent-loop.md): Understand the message lifecycle, tool execution, context window, and architecture that power your SDK agents.
> - [Use Claude Code features in the SDK](https://code.claude.com/docs/en/agent-sdk/claude-code-features.md): Load project instructions, skills, hooks, and other Claude Code features into your SDK agents.
> - [Track cost and usage](https://code.claude.com/docs/en/agent-sdk/cost-tracking.md): Learn how to track token usage, estimate costs, and configure prompt caching with the Claude Agent SDK.
> - [Give Claude custom tools](https://code.claude.com/docs/en/agent-sdk/custom-tools.md): Define custom tools with the Claude Agent SDK's in-process MCP server so Claude can call your functions, hit your APIs, and perform domain-specific operations.
> - [Rewind file changes with checkpointing](https://code.claude.com/docs/en/agent-sdk/file-checkpointing.md): Track file changes during agent sessions and restore files to any previous state
> - [Intercept and control agent behavior with hooks](https://code.claude.com/docs/en/agent-sdk/hooks.md): Intercept and customize agent behavior at key execution points with hooks
> - [Hosting the Agent SDK](https://code.claude.com/docs/en/agent-sdk/hosting.md): Deploy the Agent SDK in production: subprocess architecture, session persistence, scaling, observability, and multi-tenant isolation for Docker, Kubernetes, and sandbox providers.
> ... (137 more lines)

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/commands.md`
- `guides/hooks.md`
- `guides/memory.md`
- `guides/rules.md`
- `guides/settings.md`
- `guides/skills.md`
- `templates/agent-template.md`
- `templates/command-template.md`
- `templates/rule-template.md`
- `templates/skill-template.md`

---

## releases (Claude Code Releases (latest 5))
**Estado:** Cambios detectados
**URL:** https://github.com/repos/anthropics/claude-code/releases?per_page=5

**Resumen:**
> Release content updated:
> ### v2.1.177
> 
> 
> 
> ### v2.1.176
> ## What's changed
> 
> - Session titles are now generated in the language of your conversation (set the `language` setting to pin a specific language)
> - Added `footerLinksRegexes` setting for regex-matched link badges in the footer row, configurable via user or managed settings
> - Improved Bedrock credential caching: credentials from `awsCredentialExport` are now cached until their `Expiration` instead of a fixed 1 hour
> - Fixed `availableModels` enforcement: alias model picks can no longer be redirec
> 
> ### v2.1.175
> ## What's changed
> 
> - Added `enforceAvailableModels` managed setting — when enabled, the `availableModels` allowlist also constrains the Default model (a Default that would resolve to a disallowed model now falls back to the first allowed model), and user or project settings can no longer widen a managed `availableModels` list
> 
> 
> ### v2.1.174
> ## What's changed

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/settings.md`

---

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.176
> 
> - Session titles are now generated in the language of your conversation (set the `language` setting to pin a specific language)
> - Added `footerLinksRegexes` setting for regex-matched link badges in the footer row, configurable via user or managed settings
> - Improved Bedrock credential caching: credentials from `awsCredentialExport` are now cached until their `Expiration` instead of a fixed 1 hour
> - Fixed `availableModels` enforcement: alias model picks can no longer be redirected to a blocked model via `ANTHROPIC_DEFAULT_*_MODEL` environment variables, and `/fast` now refuses to toggle when it would switch to a model outside the allowlist
> - Fixed auto mode failing on Fable 5 for organizations without Opus 4.8 enabled — the classifier now falls back to the best available Opus model
> - Fixed hook `if` conditions for Read/Edit/Write tool paths: documented patterns like `Edit(src/**)`, `Read(~/.ssh/**)`, and `Read(.env)` now match correctly
> - Fixed Linux sandbox failing to start when `.claude/settings.json` is a symlink with an absolute target
> - Fixed `/copy` and mouse-selection copy not reaching the system clipboard inside tmux over SSH, and tmux paste buffer not loading on versions older than 3.2
> - Fixed Remote Control connecting from web/mobile silently switching the session's model
> - Fixed Remote Control disconnect notifications showing a bare numeric code instead of a human-readable reason, and connection failures adding a duplicate line to the conversation transcript
> - Fixed Remote Control sessions not disconnecting when you sign in to a different account
> - Fixed `/cd` and worktree moves leaving the session reporting the previous directory's git branch
> - Fixed `claude agents`: pressing back in one window no longer detaches other windows attached to the same session

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/hooks.md`
- `guides/settings.md`
- `templates/agent-template.md`

---

## Como revisar
Abre Claude Code en el repo y ejecuta:
> Revisa scripts/REPORT.md y actualiza las guias y templates que lo necesiten.
