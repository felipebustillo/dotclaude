# Update Monitor Report — 2026-09-14

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
> ... (341 more lines)

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
> ### v2.1.270
> ## What's changed
> 
> - Fixed read-only git commands in Bash unexpectedly asking for permission after a session had been running for a while (regression in 2.1.269)
> 
> 
> ### v2.1.269
> ## What's changed
> 
> - Added `claude plugin eval`: run a plugin's eval suite against Claude Code and get scored, reproducible results (JSON + HTML report); see `claude plugin eval --help`
> - Added `/output-style [name]` to list and switch output styles, including over Remote Control and in cloud and other headless sessions
> - Added a diff of the files a Bash command changed to the Bash tool result when the Bash tool handles file edits (setting `bashEditDiffEnabled`)
> - Added `OTEL_METRICS_INCLUDE_REP
> 
> ### v2.1.268
> ## What's changed
> 
> - Added to the Claude apps gateway: with `pricing:` set in `gateway.yaml`, signed-in Claude Code clients receive the same rates through managed settings, so `/cost` and telemetry match the spend meter
> - Added a startup warning for gateways when `access_control.allow_cidrs` is empty, and a one-time warning the first time a request arrives from a public address
> - Added the `gatewayInternalNetworks` managed setting, letting administrators allow `/login` to a Claude apps gateway o

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/commands.md`
- `guides/settings.md`
- `templates/command-template.md`

---

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.270
> 
> - Fixed read-only git commands in Bash unexpectedly asking for permission after a session had been running for a while (regression in 2.1.269)

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/commands.md`
- `guides/settings.md`
- `templates/command-template.md`

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
> ... (704 more lines)

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
