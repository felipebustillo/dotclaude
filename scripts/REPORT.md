# Update Monitor Report — 2026-04-20

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
> - [Track cost and usage](https://code.claude.com/docs/en/agent-sdk/cost-tracking.md): Learn how to track token usage, deduplicate parallel tool calls, and estimate costs with the Claude Agent SDK.
> - [Give Claude custom tools](https://code.claude.com/docs/en/agent-sdk/custom-tools.md): Define custom tools with the Claude Agent SDK's in-process MCP server so Claude can call your functions, hit your APIs, and perform domain-specific operations.
> - [Rewind file changes with checkpointing](https://code.claude.com/docs/en/agent-sdk/file-checkpointing.md): Track file changes during agent sessions and restore files to any previous state
> - [Intercept and control agent behavior with hooks](https://code.claude.com/docs/en/agent-sdk/hooks.md): Intercept and customize agent behavior at key execution points with hooks
> - [Hosting the Agent SDK](https://code.claude.com/docs/en/agent-sdk/hosting.md): Deploy and host Claude Agent SDK in production environments
> - [Connect to external tools with MCP](https://code.claude.com/docs/en/agent-sdk/mcp.md): Configure MCP servers to extend your agent with external tools. Covers transport types, tool search for large tool sets, authentication, and error handling.
> - [Migrate to Claude Agent SDK](https://code.claude.com/docs/en/agent-sdk/migration-guide.md): Guide for migrating the Claude Code TypeScript and Python SDKs to the Claude Agent SDK
> ... (105 more lines)

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
> ### v2.1.114
> ## What's changed
> 
> - Fixed a crash in the permission dialog when an agent teams teammate requested tool permission
> 
> 
> ### v2.1.113
> ## What's changed
> 
> - Changed the CLI to spawn a native Claude Code binary (via a per-platform optional dependency) instead of bundled JavaScript
> - Added `sandbox.network.deniedDomains` setting to block specific domains even when a broader `allowedDomains` wildcard would otherwise permit them
> - Fullscreen mode: Shift+↑/↓ now scrolls the viewport when extending a selection past the visible edge
> - `Ctrl+A` and `Ctrl+E` now move to the start/end of the current logical line in multiline input, matchi
> 
> ### v2.1.112
> ## What's changed
> 
> - Fixed "claude-opus-4-7 is temporarily unavailable" for auto mode
> 
> 

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
> ## 2.1.114
> 
> - Fixed a crash in the permission dialog when an agent teams teammate requested tool permission

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/settings.md`
- `templates/agent-template.md`

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
> ... (401 more lines)

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
