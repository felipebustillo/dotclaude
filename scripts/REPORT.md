# Update Monitor Report — 2026-03-16

## official-docs (Claude Code Official Docs Index)
**Estado:** Cambios detectados
**URL:** https://code.claude.com/docs/llms.txt

**Resumen:**
> # Claude Code Docs
> 
> ## Docs
> 
> - [Orchestrate teams of Claude Code sessions](https://code.claude.com/docs/en/agent-teams.md): Coordinate multiple Claude Code instances working together as a team, with shared tasks, inter-agent messaging, and centralized management.
> - [Claude Code on Amazon Bedrock](https://code.claude.com/docs/en/amazon-bedrock.md): Learn about configuring Claude Code through Amazon Bedrock, including setup, IAM configuration, and troubleshooting.
> - [Track team usage with analytics](https://code.claude.com/docs/en/analytics.md): View Claude Code usage metrics, track adoption, and measure engineering velocity in the analytics dashboard.
> - [Authentication](https://code.claude.com/docs/en/authentication.md): Log in to Claude Code and configure authentication for individuals, teams, and organizations.
> - [Best Practices for Claude Code](https://code.claude.com/docs/en/best-practices.md): Tips and patterns for getting the most out of Claude Code, from configuring your environment to scaling across parallel sessions.
> - [Changelog](https://code.claude.com/docs/en/changelog.md): Release notes for Claude Code, including new features, improvements, and bug fixes by version.
> - [Checkpointing](https://code.claude.com/docs/en/checkpointing.md): Track, rewind, and summarize Claude's edits and conversation to manage session state.
> - [Use Claude Code with Chrome (beta)](https://code.claude.com/docs/en/chrome.md): Connect Claude Code to your Chrome browser to test web apps, debug with console logs, automate form filling, and extract data from web pages.
> - [Claude Code on the web](https://code.claude.com/docs/en/claude-code-on-the-web.md): Run Claude Code tasks asynchronously on secure cloud infrastructure
> - [CLI reference](https://code.claude.com/docs/en/cli-reference.md): Complete reference for Claude Code command-line interface, including commands and flags.
> - [Code Review](https://code.claude.com/docs/en/code-review.md): Set up automated PR reviews that catch logic errors, security vulnerabilities, and regressions using multi-agent analysis of your full codebase
> ... (53 more lines)

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
> ### v2.1.76
> ## What's changed
> 
> - Added MCP elicitation support — MCP servers can now request structured input mid-task via an interactive dialog (form fields or browser URL)
> - Added new `Elicitation` and `ElicitationResult` hooks to intercept and override responses before they're sent back
> - Added `-n` / `--name <name>` CLI flag to set a display name for the session at startup
> - Added `worktree.sparsePaths` setting for `claude --worktree` in large monorepos to check out only the directories you need via git
> 
> ### v2.1.75
> 
> 
> 
> ### v2.1.74
> ## What's changed
> 
> - Added actionable suggestions to `/context` command — identifies context-heavy tools, memory bloat, and capacity warnings with specific optimization tips
> - Added `autoMemoryDirectory` setting to configure a custom directory for auto-memory storage
> - Fixed memory leak where streaming API response buffers were not released when the generator was terminated early, causing unbounded RSS growth on the Node.js/npm code path
> - Fixed managed policy `ask` rules being bypassed by user 
> 

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/commands.md`
- `guides/hooks.md`
- `guides/memory.md`
- `guides/rules.md`
- `guides/settings.md`
- `guides/skills.md`
- `templates/command-template.md`
- `templates/rule-template.md`
- `templates/skill-template.md`

---

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.76
> 
> - Added MCP elicitation support — MCP servers can now request structured input mid-task via an interactive dialog (form fields or browser URL)
> - Added new `Elicitation` and `ElicitationResult` hooks to intercept and override responses before they're sent back
> - Added `-n` / `--name <name>` CLI flag to set a display name for the session at startup
> - Added `worktree.sparsePaths` setting for `claude --worktree` in large monorepos to check out only the directories you need via git sparse-checkout
> - Added `PostCompact` hook that fires after compaction completes
> - Added `/effort` slash command to set model effort level
> - Added session quality survey — enterprise admins can configure the sample rate via the `feedbackSurveyRate` setting
> - Fixed deferred tools (loaded via `ToolSearch`) losing their input schemas after conversation compaction, causing array and number parameters to be rejected with type errors
> - Fixed slash commands showing "Unknown skill"
> - Fixed plan mode asking for re-approval after the plan was already accepted
> - Fixed voice mode swallowing keypresses while a permission dialog or plan editor was open
> - Fixed `/voice` not working on Windows when installed via npm
> - Fixed spurious "Context limit reached" when invoking a skill with `model:` frontmatter on a 1M-context session

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
