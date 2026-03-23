# Update Monitor Report — 2026-03-23

## official-docs (Claude Code Official Docs Index)
**Estado:** Cambios detectados
**URL:** https://code.claude.com/docs/llms.txt

**Resumen:**
> # Claude Code Docs
> 
> ## Docs
> 
> - [Orchestrate teams of Claude Code sessions](https://code.claude.com/docs/en/agent-teams.md): Coordinate multiple Claude Code instances working together as a team, with shared tasks, inter-agent messaging, and centralized management.
> - [Claude Code on Amazon Bedrock](https://code.claude.com/docs/en/amazon-bedrock.md): Learn about configuring Claude Code through Amazon Bedrock, including setup, IAM configuration, and troubleshooting.
> - [Track team usage with analytics](https://code.claude.com/docs/en/analytics.md): View Claude Code usage metrics, track adoption, and measure engineering velocity in the analytics dashboard.
> - [Authentication](https://code.claude.com/docs/en/authentication.md): Log in to Claude Code and configure authentication for individuals, teams, and organizations.
> - [Best Practices for Claude Code](https://code.claude.com/docs/en/best-practices.md): Tips and patterns for getting the most out of Claude Code, from configuring your environment to scaling across parallel sessions.
> - [Changelog](https://code.claude.com/docs/en/changelog.md): Release notes for Claude Code, including new features, improvements, and bug fixes by version.
> - [Push events into a running session with channels](https://code.claude.com/docs/en/channels.md): Use channels to push messages, alerts, and webhooks into your Claude Code session from an MCP server. Forward CI results, chat messages, and monitoring events so Claude can react while you're away.
> - [Channels reference](https://code.claude.com/docs/en/channels-reference.md): Build an MCP server that pushes webhooks, alerts, and chat messages into a Claude Code session. Reference for the channel contract: capability declaration, notification events, reply tools, sender gating, and permission relay.
> - [Checkpointing](https://code.claude.com/docs/en/checkpointing.md): Track, rewind, and summarize Claude's edits and conversation to manage session state.
> - [Use Claude Code with Chrome (beta)](https://code.claude.com/docs/en/chrome.md): Connect Claude Code to your Chrome browser to test web apps, debug with console logs, automate form filling, and extract data from web pages.
> - [Claude Code on the web](https://code.claude.com/docs/en/claude-code-on-the-web.md): Run Claude Code tasks asynchronously on secure cloud infrastructure
> ... (56 more lines)

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
> ### v2.1.81
> ## What's changed
> 
> - Added `--bare` flag for scripted `-p` calls — skips hooks, LSP, plugin sync, and skill directory walks; requires `ANTHROPIC_API_KEY` or an `apiKeyHelper` via `--settings` (OAuth and keychain auth disabled); auto-memory fully disabled
> - Added `--channels` permission relay — channel servers that declare the permission capability can forward tool approval prompts to your phone
> - Fixed multiple concurrent Claude Code sessions requiring repeated re-authentication when one session
> 
> ### v2.1.80
> ## What's changed
> 
> - Added `rate_limits` field to statusline scripts for displaying Claude.ai rate limit usage (5-hour and 7-day windows with `used_percentage` and `resets_at`)
> - Added `source: 'settings'` plugin marketplace source — declare plugin entries inline in settings.json
> - Added CLI tool usage detection to plugin tips, in addition to file pattern matching
> - Added `effort` frontmatter support for skills and slash commands to override the model effort level when invoked
> - Added `--channel
> 
> ### v2.1.79
> ## What's changed
> 
> - Added `--console` flag to `claude auth login` for Anthropic Console (API billing) authentication

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

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.81
> 
> - Added `--bare` flag for scripted `-p` calls — skips hooks, LSP, plugin sync, and skill directory walks; requires `ANTHROPIC_API_KEY` or an `apiKeyHelper` via `--settings` (OAuth and keychain auth disabled); auto-memory fully disabled
> - Added `--channels` permission relay — channel servers that declare the permission capability can forward tool approval prompts to your phone
> - Fixed multiple concurrent Claude Code sessions requiring repeated re-authentication when one session refreshes its OAuth token
> - Fixed voice mode silently swallowing retry failures and showing a misleading "check your network" message instead of the actual error
> - Fixed voice mode audio not recovering when the server silently drops the WebSocket connection
> - Fixed `CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS` not suppressing the structured-outputs beta header, causing 400 errors on proxy gateways forwarding to Vertex/Bedrock
> - Fixed `--channels` bypass for Team/Enterprise orgs with no other managed settings configured
> - Fixed a crash on Node.js 18
> - Fixed unnecessary permission prompts for Bash commands containing dashes in strings
> - Fixed plugin hooks blocking prompt submission when the plugin directory is deleted mid-session
> - Fixed a race condition where background agent task output could hang indefinitely when the task completed between polling intervals
> - Resuming a session that was in a worktree now switches back to that worktree
> - Fixed `/btw` not including pasted text when used during an active response

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/commands.md`
- `guides/hooks.md`
- `guides/memory.md`
- `guides/settings.md`
- `guides/skills.md`
- `templates/agent-template.md`
- `templates/command-template.md`
- `templates/skill-template.md`

---

## Como revisar
Abre Claude Code en el repo y ejecuta:
> Revisa scripts/REPORT.md y actualiza las guias y templates que lo necesiten.
