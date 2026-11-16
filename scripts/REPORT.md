# Update Monitor Report — 2026-11-16

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
> ... (542 more lines)

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
> ### v2.1.325
> ## What's changed
> 
> - Fixed a security issue in how zstd-compressed responses are decoded
> - Added a spinner tip in VS Code and similar integrated terminals about re-running a notebook cell, shown once Claude has read or edited a Jupyter notebook
> - Added a line under the error shown when your organization's policy blocks a request, saying how to continue: run `/rewind` and change the message, or run `/clear`
> - Added a note for Claude when a sandboxed `git checkout`, `git stash` or autostash pull c
> 
> ### v2.1.323
> ## What's changed
> 
> - Added Code Mode, an experimental opt-in in which Claude writes JavaScript to call its tools; see https://code.claude.com/docs/en/code-mode to turn it on, or to turn it off for an organization
> - Added `engines["claude-code"]` to `plugin.json`: plugins outside their stated Claude Code version range are not installed, updated or loaded, and install and update pick the newest version that fits
> - Added type checking of a plugin's TypeScript hooks module to `claude plugin validate
> 
> ### v2.1.322
> ## What's changed
> 
> - Added fast mode on Vertex in the global, us and eu regions, falling back to standard speed if Vertex refuses it
> 

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/hooks.md`
- `guides/settings.md`

---

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.325
> 
> - Fixed a security issue in how zstd-compressed responses are decoded
> - Added a spinner tip in VS Code and similar integrated terminals about re-running a notebook cell, shown once Claude has read or edited a Jupyter notebook
> - Added a line under the error shown when your organization's policy blocks a request, saying how to continue: run `/rewind` and change the message, or run `/clear`
> - Added a note for Claude when a sandboxed `git checkout`, `git stash` or autostash pull cannot update protected files such as those in `.claude`
> - Fixed `/security-review` and skills' inline git commands stopping with an error in worktrees of bare repositories, `--separate-git-dir` checkouts and Android `repo` checkouts
> - Fixed subagents with their own model being moved to the plan-mode model when the model setting is `opusplan` or `haiku`
> - Fixed subagents on a different model sizing file reads and MCP results with the main session's model
> - Fixed sessions on many third-party gateways and Foundry stopping with a context length error on every turn instead of compacting
> - Fixed recent turns sometimes going missing from a resumed session after Claude Code stopped without a clean exit
> - Fixed shell commands running in the launch directory after the working directory was deleted; the command now fails with a message and can be re-issued
> - Fixed an approved plan edit being lost when the `plansDirectory` folder can't take it: the plan is now saved in the default plans folder, and a warning says where and why
> - Fixed a saved `sonnet[1m]` model setting being rewritten on a new install to a model id the API rejects
> - Fixed focus view hiding the reply to your prompt when a scheduled task replied after it

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

## Como revisar
Abre Claude Code en el repo y ejecuta:
> Revisa scripts/REPORT.md y actualiza las guias y templates que lo necesiten.
