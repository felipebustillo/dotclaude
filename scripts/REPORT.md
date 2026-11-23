# Update Monitor Report — 2026-11-23

## official-docs (Claude Code Official Docs Index)
**Estado:** Cambios detectados
**URL:** https://code.claude.com/docs/llms.txt

**Resumen:**
> # Claude Code Docs
> 
> > Official documentation for Claude Code, Anthropic's agentic coding tool available in the terminal, IDE, desktop app, and browser. Covers installation, configuration, skills, subagents, hooks, MCP, the Agent SDK, and reference material.
> 
> ## Getting started
> 
> ### Overview
> 
> #### Getting started
> 
> - [Overview](https://code.claude.com/docs/en/overview.md): Claude Code is an agentic coding tool that reads your codebase, edits files, runs commands, and integrates with your development tools. Available in your terminal, IDE, desktop app, and browser.
> - [Quickstart](https://code.claude.com/docs/en/quickstart.md): Install Claude Code in your terminal, sign in, and use the CLI to explore your codebase and make your first code change.
> - [Claude Code changelog](https://code.claude.com/docs/en/changelog.md): Release notes for Claude Code, including new features, improvements, and bug fixes by version.
> 
> #### Core concepts
> ... (398 more lines)

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
> ### v2.1.330
> ## What's changed
> 
> - Added sign-in to organizations managed in Anthropic's Enterprise Admin Console: after `claude auth login`, Claude Code applies the organization's settings and uses its cloud provider or gateway
> - Added easel, a built-in mod that draws charts when asked and under MCP metrics results, on Pro, Max and, where available, Team and Enterprise on macOS and Linux; turn automatic charts off in `/config`
> - Added `CLAUDE_CODE_FULL_SIGN_IN_LINK=1` to print the full sign-in link, if the s
> 
> ### v2.1.329
> ## What's changed
> 
> - Added a trust dialog warning that says where a folder's hooks are declared
> - Added a warning in the conversation, in Claude Desktop and other non-interactive hosts, when hooks in managed settings fail to load
> - Added this session's scheduled tasks, `/loop` wakeups, the goal and this conversation's forks to `/tasks`; x stops one after asking
> - Added a "Server message" row to a server's page in `/mcp` that shows the JSON-RPC error message of a remote HTTP MCP server that refus
> 
> ### v2.1.328
> ## What's changed
> 
> - Added auto mode for Claude Opus 4.6 and Sonnet 4.6 on Amazon Bedrock, Google Cloud's Agent Platform, Microsoft Foundry and Claude apps gateway; interactive sessions with no permission mode start in it
> - Added `"onFailure": "block"` for `mcp_tool` hooks, as for command and HTTP hooks: a hook whose call fails blocks the action

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/commands.md`
- `guides/hooks.md`
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
> ## 2.1.330
> 
> - Added sign-in to organizations managed in Anthropic's Enterprise Admin Console: after `claude auth login`, Claude Code applies the organization's settings and uses its cloud provider or gateway
> - Added easel, a built-in mod that draws charts when asked and under MCP metrics results, on Pro, Max and, where available, Team and Enterprise on macOS and Linux; turn automatic charts off in `/config`
> - Added `CLAUDE_CODE_FULL_SIGN_IN_LINK=1` to print the full sign-in link, if the short one shows an error or a script reads values from it
> - Self-hosted runner: Added `--start-dir` / `SELF_HOSTED_RUNNER_START_DIR` to have Claude start its work in a folder of a repository, while settings and hooks load as without it
> - Added a notice in cloud and self-hosted runner sessions when a plugin marketplace can't be fetched because its repository isn't one of the session's
> - Self-hosted runner: Added a notice when Anthropic-managed git refuses a plugin's own repository, naming the plugin and what to do
> - Added `commandPrinted` to `claude plugin install --json` results, true when the plugin's install command wrote to stderr, and `commandFailed` when it exited with an error, was killed or timed out
> - Added `claude_code_self_hosted_runner_order_to_registered_seconds` to the self-hosted runner's `/metrics`: seconds from work order issued to registration accepted, on orchestrator-spawned runners
> - Added `claude_code_self_hosted_runner_order_to_first_session_seconds` to the self-hosted runner's `/metrics`: seconds from work order to first session handed over, on runners started for a session
> - Fixed Claude Code freezing for up to several minutes right after compacting a very long conversation
> - Fixed WebFetch freezing the session for minutes on some pages, and returning an empty result for some others
> - Fixed `ExitWorktree` and the worktree exit dialog deleting a worktree that another running Claude Code session was working in
> - Fixed changes to user settings being lost when several Claude Code processes saved them at the same time

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

## Como revisar
Abre Claude Code en el repo y ejecuta:
> Revisa scripts/REPORT.md y actualiza las guias y templates que lo necesiten.
