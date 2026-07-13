# Update Monitor Report — 2026-07-13

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
> - [Escalate hard decisions with the advisor tool](https://code.claude.com/docs/en/advisor.md): Pair your main model with a stronger advisor model that Claude consults at key moments during a task.
> - [How the agent loop works](https://code.claude.com/docs/en/agent-sdk/agent-loop.md): Understand the message lifecycle, tool execution, context window, and architecture that power your SDK agents.
> - [Use Claude Code features in the SDK](https://code.claude.com/docs/en/agent-sdk/claude-code-features.md): Load project instructions, skills, hooks, and other Claude Code features into your SDK agents.
> - [Track cost and usage](https://code.claude.com/docs/en/agent-sdk/cost-tracking.md): Learn how to track token usage, estimate costs, and configure prompt caching with the Claude Agent SDK.
> - [Give Claude custom tools](https://code.claude.com/docs/en/agent-sdk/custom-tools.md): Define custom tools with the Claude Agent SDK's in-process MCP server so Claude can call your functions, hit your APIs, and perform domain-specific operations.
> - [Rewind file changes with checkpointing](https://code.claude.com/docs/en/agent-sdk/file-checkpointing.md): Track file changes during agent sessions and restore files to any previous state
> - [Intercept and control agent behavior with hooks](https://code.claude.com/docs/en/agent-sdk/hooks.md): Intercept and customize agent behavior at key execution points with hooks
> - [Hosting the Agent SDK](https://code.claude.com/docs/en/agent-sdk/hosting.md): Deploy the Agent SDK in production: subprocess architecture, session persistence, scaling, observability, and multi-tenant isolation for Docker, Kubernetes, and sandbox providers.
> ... (156 more lines)

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
> ### v2.1.207
> ## What's changed
> 
> - Auto mode is now available without `CLAUDE_CODE_ENABLE_AUTO_MODE` opt-in on Bedrock, Vertex AI, and Foundry; disable via `disableAutoMode` in settings
> - Fixed the terminal freezing and keystrokes lagging while streaming responses containing very long lists, tables, paragraphs, or code blocks
> - Fixed remote managed settings from a non-interactive run (`claude -p`, the SDK) being permanently recorded as consented without ever showing the security consent dialog
> - Fixed spuriou
> 
> ### v2.1.206
> ## What's changed
> 
> - Added directory path suggestions to `/cd`, matching `/add-dir` behavior
> - Added a `/doctor` check that proposes trimming checked-in `CLAUDE.md` files by cutting content Claude could derive from the codebase
> - `/commit-push-pr` now auto-allows `git push` to the repo's configured push remote (`remote.pushDefault`, or the sole remote when only one is configured) in addition to `origin`
> - Gateway: `/login` now supports Anthropic-operated public gateway endpoints
> - `EnterWorktree
> 
> ### v2.1.205
> ## What's changed
> 

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/hooks.md`
- `guides/rules.md`
- `guides/settings.md`
- `templates/agent-template.md`
- `templates/rule-template.md`

---

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.207
> 
> - Auto mode is now available without `CLAUDE_CODE_ENABLE_AUTO_MODE` opt-in on Bedrock, Vertex AI, and Foundry; disable via `disableAutoMode` in settings
> - Fixed the terminal freezing and keystrokes lagging while streaming responses containing very long lists, tables, paragraphs, or code blocks
> - Fixed remote managed settings from a non-interactive run (`claude -p`, the SDK) being permanently recorded as consented without ever showing the security consent dialog
> - Fixed spurious prompt-injection warnings triggered by benign system-generated conversation updates
> - Fixed the auto-updater overwriting a custom launcher script or symlink at `~/.local/bin/claude` on every release; `/doctor` now reports an externally managed launcher
> - Fixed compound commands with `cd` prompting for permission when the only output redirect was to `/dev/null`
> - Fixed the transcript jumping above the start of the answer when a response finishes streaming
> - Fixed `extensions.worktreeConfig` being left in the repo's `.git/config` (breaking go-git tools like `tea`) after the last `worktree.sparsePaths` worktree was removed
> - Fixed malformed bracket patterns in rules globs, skill paths, `.ignore`, and `.worktreeinclude` breaking file reads, file suggestions, and worktree creation
> - Fixed a crash loop in agent teams where a malformed teammate mailbox message caused repeated errors every second until the mailbox file was manually deleted
> - Fixed background sessions auto-named by accepting a plan not showing that name on their agent-view row
> - Fixed background sessions that entered a git worktree resuming blank after a cold reopen from the agent list
> - Fixed Remote Control task status updates being lost when the connection recovered from a network interruption or credential refresh

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
> ... (405 more lines)

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
