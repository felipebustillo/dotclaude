#!/bin/bash
# Claude Code status line, macOS port of statusline-command.sh.
# Segments: dir + git branch | lines changed | tokens | context bar | 5h/7d usage limits.
# Plain ANSI colors so it follows the terminal theme. Bash 3.2 compatible.

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty | floor? // empty')
in_tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // empty')
out_tokens=$(echo "$input" | jq -r '.context_window.total_output_tokens // empty')
lines_added=$(echo "$input" | jq -r '.cost.total_lines_added // empty')
lines_removed=$(echo "$input" | jq -r '.cost.total_lines_removed // empty')

RST='\033[0m'
DIM='\033[2m'
BLUE='\033[34m'
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'

# Git info
git_branch=""
git_dirty=""
if [ -n "$cwd" ] && git -C "$cwd" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    git_branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
    if ! git -C "$cwd" diff --quiet HEAD >/dev/null 2>&1; then
        git_dirty="*"
    fi
fi
short_dir=""
[ -n "$cwd" ] && short_dir=$(basename "$cwd")

# 12345 -> 12k, 1234567 -> 1.2M
fmt_tokens() {
    local n=$1
    if [ -z "$n" ] || [ "$n" = "null" ]; then echo "0"; return; fi
    if [ "$n" -ge 1000000 ]; then
        local whole=$((n / 1000000)) frac=$(( (n % 1000000) / 100000 ))
        if [ "$frac" -gt 0 ]; then printf "%d.%dM" "$whole" "$frac"; else printf "%dM" "$whole"; fi
    elif [ "$n" -ge 1000 ]; then
        printf "%dk" $((n / 1000))
    else
        echo "$n"
    fi
}

level_color() {
    local pct=$1
    if [ "$pct" -ge 80 ]; then echo "$RED"
    elif [ "$pct" -ge 60 ]; then echo "$YELLOW"
    else echo "$GREEN"
    fi
}

ctx_bar() {
    local pct=$1 total=6
    local filled=$(( (pct * total + 50) / 100 ))
    [ "$filled" -gt "$total" ] && filled=$total
    local bar="" i
    for ((i=0; i<filled; i++)); do bar+="█"; done
    for ((i=filled; i<total; i++)); do bar+="░"; done
    printf "%b%s%b %d%%%b" "$(level_color "$pct")" "$bar" "$DIM" "$pct" "$RST"
}

# Usage limits from the Anthropic OAuth usage endpoint, token read from the macOS Keychain.
# Cached 1 min, marked stale after 3 min, hidden after 30 min.
CACHE_DIR="$HOME/.claude/cache"
CACHE_FILE="$CACHE_DIR/statusline-usage.json"
CACHE_MAX_AGE=60
CACHE_STALE_AGE=180
CACHE_EXPIRED_AGE=1800

file_age() {
    local mtime
    mtime=$(stat -f %m "$1" 2>/dev/null || echo 0)
    echo $(( $(date +%s) - mtime ))
}

usage_5h="" usage_7d="" reset_5h="" reset_7d="" usage_stale=0
if [ ! -f "$CACHE_FILE" ] || [ "$(file_age "$CACHE_FILE")" -ge "$CACHE_MAX_AGE" ]; then
    token=$(security find-generic-password -s "Claude Code-credentials" -w 2>/dev/null | jq -r '.claudeAiOauth.accessToken // empty' 2>/dev/null)
    if [ -n "$token" ]; then
        resp=$(curl -s --max-time 3 \
            -H "Authorization: Bearer $token" \
            -H "anthropic-beta: oauth-2025-04-20" \
            -H "User-Agent: Claude Code" \
            "https://api.anthropic.com/api/oauth/usage" 2>/dev/null)
        if echo "$resp" | jq -e '.five_hour' >/dev/null 2>&1; then
            mkdir -p "$CACHE_DIR"
            echo "$resp" > "$CACHE_FILE"
        fi
    fi
    unset token
fi
if [ -f "$CACHE_FILE" ]; then
    age=$(file_age "$CACHE_FILE")
    if [ "$age" -lt "$CACHE_EXPIRED_AGE" ]; then
        usage_5h=$(jq -r '.five_hour.utilization // empty' "$CACHE_FILE" 2>/dev/null)
        usage_7d=$(jq -r '.seven_day.utilization // empty' "$CACHE_FILE" 2>/dev/null)
        reset_5h=$(jq -r '.five_hour.resets_at // empty' "$CACHE_FILE" 2>/dev/null)
        reset_7d=$(jq -r '.seven_day.resets_at // empty' "$CACHE_FILE" 2>/dev/null)
        [ "$age" -ge "$CACHE_STALE_AGE" ] && usage_stale=1
    fi
fi

# ISO 8601 (UTC) -> seconds until then; BSD date
secs_until() {
    local iso=$1 epoch
    [ -z "$iso" ] && return
    epoch=$(TZ=UTC date -j -f "%Y-%m-%dT%H:%M:%S" "${iso:0:19}" +%s 2>/dev/null) || return
    echo $(( epoch - $(date +%s) ))
}

fmt_reset() {
    local diff
    diff=$(secs_until "$1"); [ -z "$diff" ] && return
    if [ "$diff" -le 0 ]; then echo "now"; return; fi
    local d=$((diff / 86400)) h=$(( (diff % 86400) / 3600 )) m=$(( (diff % 3600) / 60 ))
    if [ "$d" -gt 0 ]; then printf "%dd%dh" "$d" "$h"
    elif [ "$h" -gt 0 ]; then printf "%dh%02dm" "$h" "$m"
    else printf "%dm" "$m"
    fi
}

parts=()

# 1. Directory + git branch
if [ -n "$git_branch" ]; then
    parts+=("${BLUE}${short_dir}${RST} ${CYAN}${git_branch}${git_dirty}${RST}")
elif [ -n "$short_dir" ]; then
    parts+=("${BLUE}${short_dir}${RST}")
fi

# 2. Lines changed
if [ -n "$lines_added" ] && [ "$lines_added" != "null" ] && { [ "$lines_added" -gt 0 ] || [ "${lines_removed:-0}" -gt 0 ]; }; then
    parts+=("${GREEN}+${lines_added}${RST} ${RED}-${lines_removed:-0}${RST}")
fi

# 3. Tokens
if [ -n "$in_tokens" ] && [ "$in_tokens" != "null" ]; then
    parts+=("${DIM}↓${RST}$(fmt_tokens "$in_tokens") ${DIM}↑${RST}$(fmt_tokens "$out_tokens")")
fi

# 4. Context bar
if [ -n "$used_pct" ] && [ "$used_pct" != "null" ]; then
    parts+=("$(ctx_bar "$used_pct")")
fi

# 5. Usage limits
if [ -n "$usage_5h" ] && [ -n "$usage_7d" ]; then
    p5=${usage_5h%.*} p7=${usage_7d%.*}
    stale=""; [ "$usage_stale" -eq 1 ] && stale="${DIM}~${RST}"
    seg="${DIM}5h${RST} ${stale}$(level_color "$p5")${p5}%${RST}"
    r=$(fmt_reset "$reset_5h"); [ -n "$r" ] && seg+=" ${DIM}(${r})${RST}"
    seg+=" ${DIM}7d${RST} ${stale}$(level_color "$p7")${p7}%${RST}"
    r=$(fmt_reset "$reset_7d"); [ -n "$r" ] && seg+=" ${DIM}(${r})${RST}"
    parts+=("$seg")
fi

result=""
for i in "${!parts[@]}"; do
    [ "$i" -gt 0 ] && result+=" ${DIM}│${RST} "
    result+="${parts[$i]}"
done
printf "%b\n" "$result"
