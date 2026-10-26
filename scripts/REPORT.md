# Update Monitor Report — 2026-10-26

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
> ### v2.1.310
> ## What's changed
> 
> - Added the Monitor tool and plugin monitors on Bedrock, Vertex, and Foundry, and when telemetry or nonessential traffic is disabled; long foreground sleeps are now blocked there too
> - Fixed requests failing behind some gateways and compatible servers that reject the `effort-2025-11-24` beta value or mid-conversation system messages; Claude Code now retries without them
> - Fixed background cleanup deleting some recent files, such as pasted images, when `cleanupPeriodDays` is se
> 
> ### v2.1.309
> ## What's changed
> 
> - Fixed sandboxed Bash commands on macOS and Linux running the shell's startup files outside the sandbox before each command
> - Fixed macOS sandbox `denyWrite` glob patterns not applying at a path's real location when the pattern's folder is reached through a symlink
> - Fixed sandboxed commands and auto-accepted edits being able to modify the MCP config file passed with `--mcp-config`
> - Fixed a disabled MCP server being reconnected by a later permission prompt in print and SDK s
> 
> ### v2.1.308
> ## What's changed
> 
> - Bug fixes and reliability improvements
> 

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/commands.md`
- `guides/hooks.md`
- `guides/rules.md`
- `guides/settings.md`
- `templates/command-template.md`
- `templates/rule-template.md`

---

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.310
> 
> - Added the Monitor tool and plugin monitors on Bedrock, Vertex, and Foundry, and when telemetry or nonessential traffic is disabled; long foreground sleeps are now blocked there too
> - Fixed requests failing behind some gateways and compatible servers that reject the `effort-2025-11-24` beta value or mid-conversation system messages; Claude Code now retries without them
> - Fixed background cleanup deleting some recent files, such as pasted images, when `cleanupPeriodDays` is set to a very large value
> - Fixed compaction after a "Prompt is too long" error keeping too much of a conversation with dense text, such as base64 or SVG, so the next request could fail again
> - Fixed file read permission prompts not showing where a symbolic link leads
> - Fixed a question's auto-continue timeout firing the moment the external editor closed after a long edit
> - Windows: Fixed PreToolUse and PermissionRequest hooks letting a tool call through when Git Bash is missing and the hook's command is only quoted strings, such as a quoted path
> - Improved auto mode's prompt before the first read outside the working directories: it now says when blocking those reads makes shell commands ask for permission
> - Improved memory use of non-interactive sessions (`-p`, Agent SDK) during compaction when the transcript file is very large
> - Improved a mod's `Image` to draw inside tmux with `allow-passthrough` and `focus-events` on, in kitty, Ghostty, and iTerm2 3.5+ with fullscreen rendering, where it showed only its `alt` text
> - Linux: Improved `/sandbox` and the sandbox startup warning to name Ubuntu's AppArmor restriction on user namespaces, and how to lift it, when it keeps bubblewrap from starting the sandbox
> - Changed the error for an MCP tool call that times out in a non-interactive session while the server's elicitation is unanswered: it now tells Claude that no answer came and not to repeat the call
> - [VSCode] Fixed pressing Enter on the plan review card's "Send feedback and keep planning" button approving the plan instead of sending your comments back

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/commands.md`
- `guides/hooks.md`
- `guides/memory.md`
- `guides/settings.md`
- `templates/agent-template.md`
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
> ... (866 more lines)

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
