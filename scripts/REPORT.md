# Update Monitor Report — 2026-04-13

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
> - [How the agent loop works](https://code.claude.com/docs/en/agent-sdk/agent-loop.md): Understand the message lifecycle, tool execution, context window, and architecture that power your SDK agents.
> - [Use Claude Code features in the SDK](https://code.claude.com/docs/en/agent-sdk/claude-code-features.md): Load project instructions, skills, hooks, and other Claude Code features into your SDK agents.
> - [Track cost and usage](https://code.claude.com/docs/en/agent-sdk/cost-tracking.md): Learn how to track token usage, deduplicate parallel tool calls, and calculate costs with the Claude Agent SDK.
> - [Give Claude custom tools](https://code.claude.com/docs/en/agent-sdk/custom-tools.md): Define custom tools with the Claude Agent SDK's in-process MCP server so Claude can call your functions, hit your APIs, and perform domain-specific operations.
> - [Rewind file changes with checkpointing](https://code.claude.com/docs/en/agent-sdk/file-checkpointing.md): Track file changes during agent sessions and restore files to any previous state
> - [Intercept and control agent behavior with hooks](https://code.claude.com/docs/en/agent-sdk/hooks.md): Intercept and customize agent behavior at key execution points with hooks
> - [Hosting the Agent SDK](https://code.claude.com/docs/en/agent-sdk/hosting.md): Deploy and host Claude Agent SDK in production environments
> - [Connect to external tools with MCP](https://code.claude.com/docs/en/agent-sdk/mcp.md): Configure MCP servers to extend your agent with external tools. Covers transport types, tool search for large tool sets, authentication, and error handling.
> - [Migrate to Claude Agent SDK](https://code.claude.com/docs/en/agent-sdk/migration-guide.md): Guide for migrating the Claude Code TypeScript and Python SDKs to the Claude Agent SDK
> ... (101 more lines)

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
> ### v2.1.104
> 
> 
> 
> ### v2.1.101
> ## What's changed
> 
> - Added `/team-onboarding` command to generate a teammate ramp-up guide from your local Claude Code usage
> - Added OS CA certificate store trust by default, so enterprise TLS proxies work without extra setup (set `CLAUDE_CODE_CERT_STORE=bundled` to use only bundled CAs)
> - `/ultraplan` and other remote-session features now auto-create a default cloud environment instead of requiring web setup first
> - Improved brief mode to retry once when Claude responds with plain text instead 
> 
> ### v2.1.100
> 
> 
> 
> ### v2.1.98
> ## What's changed
> 
> - Added interactive Google Vertex AI setup wizard accessible from the login screen when selecting "3rd-party platform", guiding you through GCP authentication, project and region configuration, credential verification, and model pinning

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/commands.md`
- `guides/settings.md`
- `templates/agent-template.md`
- `templates/command-template.md`

---

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.101
> 
> - Added `/team-onboarding` command to generate a teammate ramp-up guide from your local Claude Code usage
> - Added OS CA certificate store trust by default, so enterprise TLS proxies work without extra setup (set `CLAUDE_CODE_CERT_STORE=bundled` to use only bundled CAs)
> - `/ultraplan` and other remote-session features now auto-create a default cloud environment instead of requiring web setup first
> - Improved brief mode to retry once when Claude responds with plain text instead of a structured message
> - Improved focus mode: Claude now writes more self-contained summaries since it knows you only see its final message
> - Improved tool-not-available errors to explain why and how to proceed when the model calls a tool that exists but isn't available in the current context
> - Improved rate-limit retry messages to show which limit was hit and when it resets instead of an opaque seconds countdown
> - Improved refusal error messages to include the API-provided explanation when available
> - Improved `claude -p --resume <name>` to accept session titles set via `/rename` or `--name`
> - Improved settings resilience: an unrecognized hook event name in `settings.json` no longer causes the entire file to be ignored
> - Improved plugin hooks from plugins force-enabled by managed settings to run when `allowManagedHooksOnly` is set
> - Improved `/plugin` and `claude plugin update` to show a warning when the marketplace could not be refreshed, instead of silently reporting a stale version
> - Improved plan mode to hide the "Refine with Ultraplan" option when the user's org or auth setup can't reach Claude Code on the web

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

## awesome-list (Awesome Claude Code)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/hesreallyhim/awesome-claude-code/main/README.md

**Resumen:**
> <!-- GENERATED FILE: do not edit directly -->
> <h3 align="center">Pick Your Style:</h3>
> <p align="center">
> <a href="./"><img src="assets/badge-style-awesome.svg" alt="Awesome" height="28" style="border: 2px solid #cc3366; border-radius: 4px;"></a>
> <a href="README_ALTERNATIVES/README_EXTRA.md"><img src="assets/badge-style-extra.svg" alt="Extra" height="28"></a>
> <a href="README_ALTERNATIVES/README_CLASSIC.md"><img src="assets/badge-style-classic.svg" alt="Classic" height="28"></a>
> <a href="README_ALTERNATIVES/README_FLAT_ALL_AZ.md"><img src="assets/badge-style-flat.svg" alt="Flat" height="28"></a>
> </p>
> 
> <p align="center">
>   <picture>
>     <img src="assets/ACC-social-banner.png" alt="Awesome Claude Code" width="600">
>   </picture>
> </p>
> 
> ... (396 more lines)

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
