# Update Monitor Report — 2026-10-05

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
> ... (395 more lines)

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
> ### v2.1.289
> ## What's changed
> 
> - Fixed a deny or ask rule on a nested part of a compound shell command not holding over a user-installed mod's approval on managed machines
> - Fixed the terminal freezing on short code blocks with many unclosed `<script>` tags or deeply nested `${` substitutions
> - Fixed `Read` deny rules not applying to files @-mentioned, changed, or selected in the IDE through a symlink
> - [VSCode] Reverted a 2.1.288 change to `claude auth status` that may have made sign-outs more frequent
> - I
> 
> ### v2.1.288
> ## What's changed
> 
> - Added `$.ui.selection()` for mods: returns the text you last selected in fullscreen mode and, when the selection lies within one transcript row, that row
> - Added a built-in `gh api` to cloud sessions whose image has no GitHub CLI, and fixed the built-in sending control characters from file names, jq filters or GitHub errors to the terminal
> - Added recovery for a prompt cleared with Ctrl+C: pressing Up on the empty prompt brings the draft back, including pasted text and image
> 
> ### v2.1.287
> ## What's changed
> 
> - Added Claude Mods: plugins may now modify deeper behavior

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/commands.md`
- `guides/rules.md`
- `guides/settings.md`
- `templates/agent-template.md`
- `templates/command-template.md`
- `templates/rule-template.md`

---

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.289
> 
> - Fixed a deny or ask rule on a nested part of a compound shell command not holding over a user-installed mod's approval on managed machines
> - Fixed the terminal freezing on short code blocks with many unclosed `<script>` tags or deeply nested `${` substitutions
> - Fixed `Read` deny rules not applying to files @-mentioned, changed, or selected in the IDE through a symlink
> - [VSCode] Reverted a 2.1.288 change to `claude auth status` that may have made sign-outs more frequent
> - Improved how quickly large files open in a plugin code pane by laying the highlighted view out once at its final width
> - Fixed `plugin list`, `plugin eval` and `plugin update` showing a stale copy of a plugin installed from a local folder marketplace, and hot reload for a symlinked `--plugin-dir`
> - Fixed installed mods not loading in the first session after an upgrade
> - Fixed a plugin's rows above the prompt showing a stale row while the Background tasks dialog was open in fullscreen
> - Fixed plugin panes drawing nothing when a link used a localhost address, an `@` in its path, an uppercase host or a `file:` path
> - Fixed a user-installed plugin being able to rewrite the descriptions of an organization-managed MCP server's sign-in tools
> - Fixed a freeze or forced quit at launch when a plugin drew a Box with a border style the terminal does not know
> - Fixed supervised and background sessions ending when a plugin's on-screen handler threw asynchronously
> - Fixed sessions ending with an interface error when a plugin region with no height kept growing

**Ficheros potencialmente afectados:**
- `guides/agents.md`
- `guides/commands.md`
- `guides/hooks.md`
- `guides/rules.md`
- `templates/agent-template.md`
- `templates/command-template.md`
- `templates/rule-template.md`

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
> ... (710 more lines)

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
