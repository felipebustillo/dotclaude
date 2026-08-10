# Update Monitor Report — 2026-08-10

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
> - [Use Claude Code with a screen reader](https://code.claude.com/docs/en/accessibility.md): Set up Claude Code for screen readers such as VoiceOver and NVDA, plus settings for screen magnifiers, reduced motion, and colorblind-friendly themes.
> - [Set up Claude Code for your organization](https://code.claude.com/docs/en/admin-setup.md): A decision map for administrators deploying Claude Code, covering API providers, managed settings, policy enforcement, usage monitoring, and data handling.
> - [Escalate hard decisions with the advisor tool](https://code.claude.com/docs/en/advisor.md): Pair your main model with a stronger advisor model that Claude consults at key moments during a task.
> - [How the agent loop works](https://code.claude.com/docs/en/agent-sdk/agent-loop.md): Understand the message lifecycle, tool execution, context window, and architecture that power your SDK agents.
> - [Use Claude Code features in the SDK](https://code.claude.com/docs/en/agent-sdk/claude-code-features.md): Load project instructions, skills, hooks, and other Claude Code features into your SDK agents.
> - [Track cost and usage](https://code.claude.com/docs/en/agent-sdk/cost-tracking.md): Learn how to track token usage, estimate costs, and configure prompt caching with the Claude Agent SDK.
> - [Give Claude custom tools](https://code.claude.com/docs/en/agent-sdk/custom-tools.md): Define custom tools with the Claude Agent SDK's in-process MCP server so Claude can call your functions, hit your APIs, and perform domain-specific operations.
> - [Examples](https://code.claude.com/docs/en/agent-sdk/examples.md): Find a complete, runnable Agent SDK project or a guided recipe in the Claude Cookbook that matches what you want to build.
> - [Rewind file changes with checkpointing](https://code.claude.com/docs/en/agent-sdk/file-checkpointing.md): Track file changes during agent sessions and restore files to any previous state
> ... (176 more lines)

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
> ### v2.1.226
> ## What's changed
> 
> - Bug fixes and reliability improvements
> 
> 
> ### v2.1.225
> ## What's changed
> 
> - Added gateway spend-limit support to Claude Code's usage warning; the limit-reached message now names the cap, its reset time, and the operator's message (requires the gateway on 2.1.225)
> - Added a workspace trust prompt to `claude agents` for untrusted directories, matching the behavior of `claude`
> - Fixed a transient 401 replacing a long-lived `CLAUDE_CODE_OAUTH_TOKEN` with a stored login's short-lived token, breaking headless sessions until restart
> - Fixed MCP OAuth serve
> 
> ### v2.1.224
> ## What's changed
> 
> - Added self-hosted environments: `claude self-hosted-runner` turns your own machines or containers into a place Claude Code web, mobile, and desktop sessions can run, on Team and Enterprise plans
> - Added `archive` plugin source: install plugins from a zip over HTTPS without git or npm, with optional SHA-256 pinning
> - Added a cancel-and-confirm step when removing an unavailable paste changes a command's text

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/commands.md`
- `guides/hooks.md`
- `guides/settings.md`
- `guides/skills.md`
- `templates/agent-template.md`
- `templates/command-template.md`
- `templates/skill-template.md`

---

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.226
> 
> - Bug fixes and reliability improvements

---

## awesome-list (Awesome Claude Code)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/hesreallyhim/awesome-claude-code/main/README.md

**Resumen:**
> ![Awesome Claude Code](assets/awesome-claude-code-banner.png)
> 
> <!-- Awesome Claude Code -->
> 
> [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
> 
> _A hand-picked collection of the finest of resources for the most awesome of agents, [Claude Code](https://code.claude.com/docs/), the undisputed champion of coding companions, from the unstoppable team at [Anthropic PBC](https://github.com/anthropics/claude-code). A delectable showcase of top tier skills, ambidextrous agents, scintillating status lines, top notch developer tooling, and also we have plugins. Suitable for beginners and veterans, with an emphasis on code quality, security, and originality._
> 
> <br>
> 
> The current iteration of the list, such as you see it today, was launched with the express intent to highlight resources that were _not_ on the last iteration, and in particular to make selections from the list of recommendations. However, this is only temporary - resources will continue to be added over the coming weeks, and "legacy" resources will be migrated to the new format. So, if you had been featured on the list before, and you don't see your project now, that's the reason why - "legacy" resources that are still maintained and awesome will be added back in soon - _and_, in the meantime, they are also preserved (but will not be updated) in the [README_ALTERNATIVES](README_ALTERNATIVES/) directory.
> 
> <br>
> 
> 
> ... (521 more lines)

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
