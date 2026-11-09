# Update Monitor Report — 2026-11-09

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
> ... (570 more lines)

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
> ### v2.1.319
> ## What's changed
> 
> - Changed auto mode with telemetry or feature flags off, including behind LLM gateways: calls the server can't check are asked about or denied, with no fallback to the built-in classifier; set `CLAUDE_CODE_AUTO_MODE_SERVER=0` to keep using it (Bedrock, Vertex and Foundry are unchanged)
> - Changed auto mode behind an LLM gateway: `CLAUDE_CODE_AUTO_MODE_SERVER=1` turns on the server-side check even with `CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS` set; if managed settings set the lat
> 
> ### v2.1.318
> ## What's changed
> 
> - Added a record of your answer when Claude Code asks to turn on the mods it writes in a session
> - Added `assume_role` on `mantle` upstreams of the Claude apps gateway, for a role in another AWS account and for per-developer AWS cost attribution
> - Added an `effort` option to a mod's `$.model.fork`, so a quick side job can run at `low` whatever effort the session uses; the result reports the effort sent
> - Added the date a stored claude.ai sign-in ends to `claude auth status` (`
> 
> ### v2.1.317
> ## What's changed
> 
> - Added a warning to `/schedule` when a new cloud scheduled task gets connectors you did not ask for, with how to remove them
> - Added a check that asks before a web or shell tool call sends your account email address to the network
> - Added `onFailure: "block"` for Agent SDK hook callbacks, so a callback that fails blocks the action instead of letting it run

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/hooks.md`
- `guides/settings.md`
- `templates/agent-template.md`

---

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.319
> 
> - Changed auto mode with telemetry or feature flags off, including behind LLM gateways: calls the server can't check are asked about or denied, with no fallback to the built-in classifier; set `CLAUDE_CODE_AUTO_MODE_SERVER=0` to keep using it (Bedrock, Vertex and Foundry are unchanged)
> - Changed auto mode behind an LLM gateway: `CLAUDE_CODE_AUTO_MODE_SERVER=1` turns on the server-side check even with `CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS` set; if managed settings set the latter, they must set the `1` too
> - Added support for MCP tasks in the terminal: when an MCP server runs a tool call as a task, Claude Code moves it to the background right away and tells Claude the result when it finishes
> - Added the `CLAUDE_CODE_DISABLE_MCP_TASK_BACKGROUND` environment variable to make Claude Code wait for an MCP task inside its tool call instead of moving it to the background right away
> - Added `permissions.denyInsteadOfPrompting` setting: a tool call that would wait on a permission prompt is denied and the turn continues, in terminal sessions, subagents and teammates
> - Added `/claude-api latency-optimize` to find where your Claude API code makes people wait and try faster settings against your eval
> - Added the `CLAUDE_CODE_DISABLE_FEATURE_FLAGS` environment variable, which stops feature-flag fetching without turning off telemetry; every flag then uses its built-in default
> - Added spend for today, this week and this month to `/usage` for developers behind a Claude apps gateway who have no spend limit, when the gateway runs this version or later
> - Added `admin.pooled_conflict_rule` and `admin.pooled_priority_order` to the Claude apps gateway, to set which pooled group budget pays first for a developer in several groups
> - Added an optional `login_notice` setting to the Claude apps gateway that shows an operator-defined message on the gateway's browser verification page and on Claude Code's sign-in screen
> - Added `CLAUDE_GATEWAY_LOG_FORMAT=json` to the Claude apps gateway: operational log lines become JSON with `severity`, `time` and `message`, for log collectors that read the level from a field
> - Added a Claude apps gateway boot warning for a case where another policy's `availableModels` also allows a custom model id that one policy lists by name
> - Added start-up warnings to the Claude apps gateway for policies with no `desktopHome` that rely on `coworkTabEnabled: false` or `chatSessionRetentionDays`, ahead of Claude Desktop's November 10 change

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
