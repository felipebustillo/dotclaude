# Update Monitor Report — 2026-09-28

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
> ### Getting started
> 
> - [Overview](https://code.claude.com/docs/en/overview.md): Claude Code is an agentic coding tool that reads your codebase, edits files, runs commands, and integrates with your development tools. Available in your terminal, IDE, desktop app, and browser.
> - [Quickstart](https://code.claude.com/docs/en/quickstart.md): Welcome to Claude Code!
> - [Claude Code changelog](https://code.claude.com/docs/en/changelog.md): Release notes for Claude Code, including new features, improvements, and bug fixes by version.
> 
> ### Core concepts
> 
> - [How Claude Code works](https://code.claude.com/docs/en/how-claude-code-works.md): Understand the agentic loop, built-in tools, and how Claude Code interacts with your project.
> ... (376 more lines)

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
> ### v2.1.283
> ## What's changed
> 
> - Added `x-claude-code-prompt-id` to the gateway hint headers so LLM gateways can group the requests that serve one user prompt; opt in with `CLAUDE_CODE_GATEWAY_HINT_HEADERS=1`
> - Added `availableModelsMatch` managed setting: with `"exact"`, an `availableModels` entry allows only the model version it names, so new releases stay blocked until listed
> - Added `deniedModels` managed setting to block specific models, even when `availableModels` allows them
> - Added MCP tool, WebFetc
> 
> ### v2.1.282
> ## What's changed
> 
> - Added a `maxProseWidth` setting that caps the width of Claude's prose in wide terminals while tables and code blocks keep the full width
> - Added a startup notice, and `/status` and `claude doctor` entries, listing telemetry variables in a project's settings files that were ignored or that turned telemetry off
> - Added the `allowClaudeInChromeWithManagedMcp` managed setting to let `claude --chrome` run alongside an exclusive `managed-mcp.json`; the error shown when Chrome is b
> 
> ### v2.1.281
> ## What's changed
> 
> - Added Claude apps gateway support for newer Claude Desktop keys in `desktop` policy blocks, including `blockReadsOutsideWorkingDirectories` and `disableBypassPermissionsMode`
> - Added `assume_role` on Claude apps gateway Bedrock upstreams: the gateway calls Bedrock as an IAM role it assumes through STS, in another AWS account if needed, optionally one session per developer

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/hooks.md`
- `guides/settings.md`
- `guides/skills.md`
- `templates/skill-template.md`

---

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.283
> 
> - Added `x-claude-code-prompt-id` to the gateway hint headers so LLM gateways can group the requests that serve one user prompt; opt in with `CLAUDE_CODE_GATEWAY_HINT_HEADERS=1`
> - Added `availableModelsMatch` managed setting: with `"exact"`, an `availableModels` entry allows only the model version it names, so new releases stay blocked until listed
> - Added `deniedModels` managed setting to block specific models, even when `availableModels` allows them
> - Added MCP tool, WebFetch and WebSearch outputs to the `tool.output` OpenTelemetry span event when `OTEL_LOG_TOOL_CONTENT=1`
> - Added `/doctor prompt-audit` (also `/checkup prompt-audit`) to audit your CLAUDE.md files, skills, agents and commands for prompting patterns written for older models
> - Added click-to-expand for truncated messages from your other sessions in fullscreen mode
> - Added `path` to `--plugin-dir` load-failure entries in the stream-json `system/init` `plugin_errors`, naming the directory that did not load
> - Added an opt-in `load_test_mode` block to the Claude apps gateway config: requests are built and signed but not sent upstream, and clients get a canned reply, so a deployment can be load tested
> - Added a `mantle` upstream provider to the Claude apps gateway for Amazon Bedrock's Mantle endpoint
> - Fixed SDK sessions losing a deferred tool call or finished tool result when a turn ended early, a held approval prompt after a worker restart, and a non-streaming fallback's `result.usage`
> - Fixed MCP progress notifications being discarded once a long-running tool call moved to the background; the background task now shows the latest progress
> - Fixed stdio MCP servers being left running when the session ended while they were still starting
> - Fixed a brief HTTP 404 from a stateless remote MCP server (for example a proxy mid-redeploy) leaving that server unusable for the rest of the session while still shown as connected

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
