# Update Monitor Report — 2026-05-04

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
> - [How the agent loop works](https://code.claude.com/docs/en/agent-sdk/agent-loop.md): Understand the message lifecycle, tool execution, context window, and architecture that power your SDK agents.
> - [Use Claude Code features in the SDK](https://code.claude.com/docs/en/agent-sdk/claude-code-features.md): Load project instructions, skills, hooks, and other Claude Code features into your SDK agents.
> - [Track cost and usage](https://code.claude.com/docs/en/agent-sdk/cost-tracking.md): Learn how to track token usage, estimate costs, and configure prompt caching with the Claude Agent SDK.
> - [Give Claude custom tools](https://code.claude.com/docs/en/agent-sdk/custom-tools.md): Define custom tools with the Claude Agent SDK's in-process MCP server so Claude can call your functions, hit your APIs, and perform domain-specific operations.
> - [Rewind file changes with checkpointing](https://code.claude.com/docs/en/agent-sdk/file-checkpointing.md): Track file changes during agent sessions and restore files to any previous state
> - [Intercept and control agent behavior with hooks](https://code.claude.com/docs/en/agent-sdk/hooks.md): Intercept and customize agent behavior at key execution points with hooks
> - [Hosting the Agent SDK](https://code.claude.com/docs/en/agent-sdk/hosting.md): Deploy and host Claude Agent SDK in production environments
> - [Connect to external tools with MCP](https://code.claude.com/docs/en/agent-sdk/mcp.md): Configure MCP servers to extend your agent with external tools. Covers transport types, tool search for large tool sets, authentication, and error handling.
> ... (115 more lines)

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
> ### v2.1.126
> ## What's changed
> 
> - The `/model` picker now lists models from your gateway's `/v1/models` endpoint when `ANTHROPIC_BASE_URL` points at an Anthropic-compatible gateway
> - - Added `claude project purge [path]` to delete all Claude Code state for a project (transcripts, tasks, file history, config entry) — supports `--dry-run`, `-y/--yes`, `-i/--interactive`, and `--all`
> - `--dangerously-skip-permissions` now bypasses prompts for writes to `.claude/`, `.git/`, `.vscode/`, shell config files, and ot
> 
> ### v2.1.123
> ## What's changed
> 
> - Fixed OAuth authentication failing with a 401 retry loop when `CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS=1` is set
> 
> 
> ### v2.1.122
> ## What's changed
> 
> - Added `ANTHROPIC_BEDROCK_SERVICE_TIER` environment variable to select a Bedrock service tier (`default`, `flex`, or `priority`), sent as the `X-Amzn-Bedrock-Service-Tier` header
> - Pasting a PR URL into the `/resume` search box now finds the session that created that PR (GitHub, GitHub Enterprise, GitLab, and Bitbucket)
> - `/mcp` now shows claude.ai connectors hidden by a manually-added server with the same URL, with a hint to remove the duplicate
> - Clarified the `/mcp` messag

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
> ## 2.1.126
> 
> - The `/model` picker now lists models from your gateway's `/v1/models` endpoint when `ANTHROPIC_BASE_URL` points at an Anthropic-compatible gateway
> - - Added `claude project purge [path]` to delete all Claude Code state for a project (transcripts, tasks, file history, config entry) — supports `--dry-run`, `-y/--yes`, `-i/--interactive`, and `--all`
> - `--dangerously-skip-permissions` now bypasses prompts for writes to `.claude/`, `.git/`, `.vscode/`, shell config files, and other previously-protected paths (catastrophic removal commands still prompt as a safety net)
> - `claude auth login` now accepts the OAuth code pasted into the terminal when the browser callback can't reach localhost (WSL2, SSH, containers)
> - `claude_code.skill_activated` OpenTelemetry event now fires for user-typed slash commands and carries a new `invocation_trigger` attribute (`"user-slash"`, `"claude-proactive"`, or `"nested-skill"`)
> - Auto mode: the spinner now turns red when a permission check stalls, instead of looking like the tool is running
> - Host-managed deployments (`CLAUDE_CODE_PROVIDER_MANAGED_BY_HOST`) no longer auto-disable analytics on Bedrock/Vertex/Foundry
> - Windows: PowerShell 7 installed via the Microsoft Store, MSI without PATH, or `.NET global tool` is now detected
> - Windows: when the PowerShell tool is enabled, Claude now treats PowerShell as the primary shell instead of defaulting to Bash
> - Read tool: removed the per-file malware-assessment reminder that could cause spurious refusals and "this is not malware" commentary on legacy models
> - **Security:** Fixed `allowManagedDomainsOnly` / `allowManagedReadPathsOnly` being ignored when a higher-priority managed-settings source lacked a `sandbox` block
> - Fixed pasting an image larger than 2000px breaking the session — images are now downscaled on paste, and oversized images in history are automatically removed and the request retried
> - Fixed showing the login screen for "OAuth not allowed for organization" errors — now shows guidance to contact your admin

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/commands.md`
- `guides/settings.md`
- `guides/skills.md`
- `templates/agent-template.md`
- `templates/command-template.md`
- `templates/skill-template.md`

---

## awesome-list (Awesome Claude Code)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/hesreallyhim/awesome-claude-code/main/README.md

**Resumen:**
> # Awesome Claude Code
> 
> <em>A delightfully curated collection of the finest of resources for the most excellent of agents, Claude Code, by Anthropic PBC. Contains high quality skills, agents, hooks, status lines, orchestrators, developer tooling, and all the latest features that the Claude Code team continue to ship. Suitable for beginners and veterans, with an emphasis on code quality, security, and originality.</em>
> 
> <br>
> 
> > [!NOTE]
> > The old ways have come and gone. It's time to embrace the next phase.
> > The previous Table of Contents was no longer fit for purpose, so a new organizational system is being prepared. Thanks to everyone who has contributed to and supported this repo, be ye human or machine.
> 
> <picture>
>   <source media="(prefers-color-scheme: dark)" srcset="assets/update-in-progress-dark.svg">
>   <source media="(prefers-color-scheme: light)" srcset="assets/update-in-progress-light-2.svg">
>   <img alt="Update in progress" src="assets/update-in-progress-light-2.svg">
> </picture>
> ... (16 more lines)

**Ficheros potencialmente afectados:**
- `guides/agents.md`
- `guides/hooks.md`
- `guides/skills.md`
- `templates/agent-template.md`
- `templates/skill-template.md`

---

## Como revisar
Abre Claude Code en el repo y ejecuta:
> Revisa scripts/REPORT.md y actualiza las guias y templates que lo necesiten.
