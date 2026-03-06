"""Update monitor for dotclaude repo.

Checks external sources for changes and generates a report with
actionable suggestions for updating guides, templates, and examples.
"""

from __future__ import annotations

import hashlib
import json
import os
import sys
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path

import httpx

SCRIPTS_DIR = Path(__file__).parent
STATE_FILE = SCRIPTS_DIR / ".state.json"
REPORT_FILE = SCRIPTS_DIR / "REPORT.md"

GITHUB_API = "https://api.github.com"
GITHUB_TOKEN = os.environ.get("GITHUB_TOKEN", "")
GITHUB_REPOSITORY = os.environ.get("GITHUB_REPOSITORY", "")

SOURCES = {
    "official-docs": {
        "url": "https://code.claude.com/docs/llms.txt",
        "type": "docs",
        "label": "Claude Code Official Docs Index",
    },
    "releases": {
        "url": f"{GITHUB_API}/repos/anthropics/claude-code/releases?per_page=5",
        "type": "releases",
        "label": "Claude Code Releases (latest 5)",
    },
    "changelog": {
        "url": "https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md",
        "type": "changelog",
        "label": "Claude Code Changelog",
    },
    "skills-repo": {
        "url": f"{GITHUB_API}/repos/anthropics/skills/contents/",
        "type": "tree",
        "label": "Anthropic Skills Repository",
    },
    "awesome-list": {
        "url": "https://raw.githubusercontent.com/hesreallyhim/awesome-claude-code/main/README.md",
        "type": "markdown",
        "label": "Awesome Claude Code",
    },
}

KEYWORD_MAP: dict[str, list[str]] = {
    "hook": ["guides/hooks.md"],
    "agent": ["guides/agents.md", "templates/agent-template.md"],
    "skill": ["guides/skills.md", "templates/skill-template.md"],
    "rule": ["guides/rules.md", "templates/rule-template.md"],
    "command": ["guides/commands.md", "templates/command-template.md"],
    "setting": ["guides/settings.md", "examples/settings.json"],
    "permission": ["guides/settings.md", "examples/settings.json"],
    "memory": ["guides/memory.md"],
    "model": ["guides/agents.md", "guides/settings.md"],
}


@dataclass
class Change:
    source_id: str
    label: str
    url: str
    old_hash: str | None
    new_hash: str
    summary: str
    affected_files: list[str]


def github_headers() -> dict[str, str]:
    headers = {"Accept": "application/vnd.github+json"}
    if GITHUB_TOKEN:
        headers["Authorization"] = f"Bearer {GITHUB_TOKEN}"
    return headers


def load_state() -> dict:
    if STATE_FILE.exists():
        return json.loads(STATE_FILE.read_text())
    return {}


def save_state(state: dict) -> None:
    STATE_FILE.write_text(json.dumps(state, indent=2) + "\n")


def fetch_source(source_id: str, source: dict) -> str | None:
    """Fetch content from a source URL. Returns None on failure."""
    url = source["url"]
    try:
        headers = github_headers() if "api.github.com" in url else {}
        with httpx.Client(timeout=10, follow_redirects=True) as client:
            resp = client.get(url, headers=headers)
            resp.raise_for_status()
            return resp.text
    except Exception as e:
        print(f"[WARN] Failed to fetch {source_id}: {e}", file=sys.stderr)
        return None


def extract_section(content: str, source_type: str) -> str:
    """Extract the relevant section from content based on source type."""
    if source_type == "changelog":
        # Extract only the first version section
        lines = content.split("\n")
        section_lines = []
        found_first = False
        for line in lines:
            if line.startswith("## ") and not found_first:
                found_first = True
                section_lines.append(line)
            elif line.startswith("## ") and found_first:
                break
            elif found_first:
                section_lines.append(line)
        return "\n".join(section_lines) if section_lines else content[:2000]

    if source_type == "releases":
        # Parse JSON releases, extract tag + body
        try:
            releases = json.loads(content)
            parts = []
            for release in releases:
                tag = release.get("tag_name", "unknown")
                body = release.get("body", "")[:500]
                parts.append(f"### {tag}\n{body}")
            return "\n\n".join(parts)
        except (json.JSONDecodeError, TypeError):
            return content[:2000]

    if source_type == "tree":
        # Parse GitHub API tree listing
        try:
            items = json.loads(content)
            names = [item.get("name", "") for item in items if isinstance(item, dict)]
            return "\n".join(sorted(names))
        except (json.JSONDecodeError, TypeError):
            return content[:2000]

    # docs, markdown — return full content
    return content


def content_hash(content: str) -> str:
    return hashlib.sha256(content.encode()).hexdigest()


def find_affected_files(content: str) -> list[str]:
    """Match keywords in content to repo files."""
    content_lower = content.lower()
    affected: set[str] = set()
    for keyword, files in KEYWORD_MAP.items():
        if keyword in content_lower:
            affected.update(files)
    return sorted(affected)


def detect_changes(state: dict) -> list[Change]:
    """Fetch all sources, compare hashes, return list of changes."""
    sources_state = state.get("sources", {})
    changes: list[Change] = []

    for source_id, source in SOURCES.items():
        raw = fetch_source(source_id, source)
        if raw is None:
            continue

        extracted = extract_section(raw, source["type"])
        new_hash = content_hash(extracted)
        old_hash = sources_state.get(source_id, {}).get("hash")

        if old_hash == new_hash:
            print(f"[OK] {source_id}: no changes")
            continue

        print(f"[CHANGED] {source_id}: hash changed")

        # Build summary
        if old_hash is None:
            summary = "First check — all content is new."
        else:
            summary = build_diff_summary(extracted, source["type"])

        affected = find_affected_files(extracted)

        changes.append(Change(
            source_id=source_id,
            label=source["label"],
            url=source["url"].replace(GITHUB_API, "https://github.com"),
            old_hash=old_hash,
            new_hash=new_hash,
            summary=summary,
            affected_files=affected,
        ))

        # Update state for this source
        sources_state[source_id] = {
            "hash": new_hash,
            "last_checked": datetime.now(timezone.utc).isoformat(),
        }

    state["sources"] = sources_state
    state["last_run"] = datetime.now(timezone.utc).isoformat()
    return changes


def build_diff_summary(content: str, source_type: str) -> str:
    """Build a human-readable summary of the content."""
    lines = content.strip().split("\n")
    if source_type == "releases":
        # Show first release tag and first few lines
        preview = "\n".join(lines[:20])
        return f"Release content updated:\n{preview}"
    if source_type == "changelog":
        preview = "\n".join(lines[:15])
        return f"Changelog updated:\n{preview}"
    if source_type == "tree":
        return f"Repository contents: {', '.join(lines[:20])}"

    # Generic: show first 15 lines
    preview = "\n".join(lines[:15])
    if len(lines) > 15:
        preview += f"\n... ({len(lines) - 15} more lines)"
    return preview


def generate_report(changes: list[Change]) -> str:
    """Generate markdown report from detected changes."""
    now = datetime.now(timezone.utc).strftime("%Y-%m-%d")
    lines = [f"# Update Monitor Report — {now}", ""]

    for change in changes:
        lines.append(f"## {change.source_id} ({change.label})")
        lines.append(f"**Estado:** Cambios detectados")
        lines.append(f"**URL:** {change.url}")
        lines.append("")
        lines.append("**Resumen:**")
        # Indent summary as blockquote
        for sline in change.summary.split("\n"):
            lines.append(f"> {sline}")
        lines.append("")

        if change.affected_files:
            lines.append("**Ficheros potencialmente afectados:**")
            for f in change.affected_files:
                lines.append(f"- `{f}`")
            lines.append("")

        lines.append("---")
        lines.append("")

    lines.append("## Como revisar")
    lines.append("Abre Claude Code en el repo y ejecuta:")
    lines.append("> Revisa scripts/REPORT.md y actualiza las guias y templates que lo necesiten.")
    lines.append("")

    return "\n".join(lines)


def create_github_issue(report_summary: str, date_str: str) -> None:
    """Create a GitHub issue if none with update-monitor label is open."""
    if not GITHUB_TOKEN or not GITHUB_REPOSITORY:
        print("[WARN] GITHUB_TOKEN or GITHUB_REPOSITORY not set, skipping issue creation",
              file=sys.stderr)
        return

    headers = github_headers()
    base = f"{GITHUB_API}/repos/{GITHUB_REPOSITORY}"

    try:
        with httpx.Client(timeout=10) as client:
            # Check for existing open issues with label
            resp = client.get(
                f"{base}/issues",
                headers=headers,
                params={"labels": "update-monitor", "state": "open"},
            )
            resp.raise_for_status()
            if resp.json():
                print("[INFO] Open update-monitor issue already exists, skipping")
                return

            # Create new issue
            title = f"[update-monitor] Cambios detectados ({date_str})"
            body = (
                f"El monitor semanal ha detectado cambios en las fuentes externas.\n\n"
                f"Revisa el informe completo en [`scripts/REPORT.md`](scripts/REPORT.md).\n\n"
                f"### Resumen\n\n{report_summary}\n\n"
                f"---\n"
                f"Para revisar, abre Claude Code y ejecuta:\n"
                f"> Revisa scripts/REPORT.md y actualiza las guias y templates que lo necesiten."
            )

            resp = client.post(
                f"{base}/issues",
                headers=headers,
                json={
                    "title": title,
                    "body": body,
                    "labels": ["update-monitor"],
                },
            )
            resp.raise_for_status()
            issue_url = resp.json().get("html_url", "")
            print(f"[OK] Issue created: {issue_url}")

    except Exception as e:
        print(f"[WARN] Failed to create issue: {e}", file=sys.stderr)
        print("[INFO] Report is still available in scripts/REPORT.md")


def main() -> None:
    print("=== Update Monitor ===")
    state = load_state()

    changes = detect_changes(state)

    if not changes:
        print("No changes detected. Nothing to do.")
        save_state(state)
        return

    print(f"\n{len(changes)} source(s) changed.")

    # Generate report
    report = generate_report(changes)
    REPORT_FILE.write_text(report)
    print(f"Report written to {REPORT_FILE}")

    # Create issue
    date_str = datetime.now(timezone.utc).strftime("%Y-%m-%d")
    source_list = ", ".join(c.source_id for c in changes)
    create_github_issue(f"Fuentes con cambios: {source_list}", date_str)

    # Save updated state
    save_state(state)
    print("State saved. Done.")


if __name__ == "__main__":
    main()
