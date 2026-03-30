# Update Monitor Report — 2026-03-30

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
> - [Push events into a running session with channels](https://code.claude.com/docs/en/channels.md): Use channels to push messages, alerts, and webhooks into your Claude Code session from an MCP server. Forward CI results, chat messages, and monitoring events so Claude can react while you're away.
> - [Channels reference](https://code.claude.com/docs/en/channels-reference.md): Build an MCP server that pushes webhooks, alerts, and chat messages into a Claude Code session. Reference for the channel contract: capability declaration, notification events, reply tools, sender gating, and permission relay.
> - [Checkpointing](https://code.claude.com/docs/en/checkpointing.md): Track, rewind, and summarize Claude's edits and conversation to manage session state.
> - [Use Claude Code with Chrome (beta)](https://code.claude.com/docs/en/chrome.md): Connect Claude Code to your Chrome browser to test web apps, debug with console logs, automate form filling, and extract data from web pages.
> - [Claude Code on the web](https://code.claude.com/docs/en/claude-code-on-the-web.md): Run Claude Code tasks asynchronously on secure cloud infrastructure
> ... (61 more lines)

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
> ### v2.1.87
> ## What's changed
> 
> - Fixed messages in Cowork Dispatch not getting delivered
> 
> 
> ### v2.1.86
> ## What's changed
> 
> - Added `X-Claude-Code-Session-Id` header to API requests so proxies can aggregate requests by session without parsing the body
> - Added `.jj` and `.sl` to VCS directory exclusion lists so Grep and file autocomplete don't descend into Jujutsu or Sapling metadata
> - Fixed `--resume` failing with "tool_use ids were found without tool_result blocks" on sessions created before v2.1.85
> - Fixed Write/Edit/Read failing on files outside the project root (e.g., `~/.claude/CLAUDE.md`) whe
> 
> ### v2.1.85
> ## What's changed
> 
> - Added `CLAUDE_CODE_MCP_SERVER_NAME` and `CLAUDE_CODE_MCP_SERVER_URL` environment variables to MCP `headersHelper` scripts, allowing one helper to serve multiple servers
> - Added conditional `if` field for hooks using permission rule syntax (e.g., `Bash(git *)`) to filter when they run, reducing process spawning overhead
> - Added timestamp markers in transcripts when scheduled tasks (`/loop`, `CronCreate`) fire

**Ficheros potencialmente afectados:**
- `examples/settings.json`
- `guides/agents.md`
- `guides/hooks.md`
- `guides/rules.md`
- `guides/settings.md`
- `templates/rule-template.md`

---

## changelog (Claude Code Changelog)
**Estado:** Cambios detectados
**URL:** https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md

**Resumen:**
> Changelog updated:
> ## 2.1.87
> 
> - Fixed messages in Cowork Dispatch not getting delivered

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
>     <img src="assets/awesome-claude-code-social-clawd-leo.png" alt="Awesome Claude Code" width="600">
>   </picture>
> </p>
> 
> ... (390 more lines)

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
