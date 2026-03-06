#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract values from JSON
cwd=$(echo "$input" | jq -r '.workspace.current_dir // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
in_tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // empty')
out_tokens=$(echo "$input" | jq -r '.context_window.total_output_tokens // empty')
lines_added=$(echo "$input" | jq -r '.cost.total_lines_added // empty')
lines_removed=$(echo "$input" | jq -r '.cost.total_lines_removed // empty')

# Git info (from cwd)
git_branch=""
git_dirty=""
if [ -n "$cwd" ] && git -C "$cwd" rev-parse --is-inside-work-tree &>/dev/null; then
    git_branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
    if ! git -C "$cwd" diff --quiet HEAD &>/dev/null 2>&1; then
        git_dirty="*"
    fi
fi

# Short directory (last component only)
short_dir=""
if [ -n "$cwd" ]; then
    short_dir=$(basename "$cwd")
fi

# Catppuccin Mocha ANSI colors
RST='\033[0m'
DIM='\033[2m'
BLUE='\033[38;2;137;180;250m'    # #89b4fa
GREEN='\033[38;2;166;227;161m'   # #a6e3a1
MAUVE='\033[38;2;203;166;247m'   # #cba6f7
YELLOW='\033[38;2;249;226;175m'  # #f9e2af
RED='\033[38;2;243;139;168m'     # #f38ba8
PEACH='\033[38;2;250;179;135m'   # #fab387

# Format token count compactly (12345 -> 12k, 1234567 -> 1.2M)
fmt_tokens() {
    local n=$1
    if [ -z "$n" ] || [ "$n" = "null" ]; then echo "0"; return; fi
    if [ "$n" -ge 1000000 ]; then
        local whole=$((n / 1000000))
        local frac=$(( (n % 1000000) / 100000 ))
        if [ "$frac" -gt 0 ]; then
            printf "%d.%dM" "$whole" "$frac"
        else
            printf "%dM" "$whole"
        fi
    elif [ "$n" -ge 1000 ]; then
        local whole=$((n / 1000))
        printf "%dk" "$whole"
    else
        echo "$n"
    fi
}

# Context bar (6 chars wide)
ctx_bar() {
    local pct=$1
    if [ -z "$pct" ] || [ "$pct" = "null" ]; then echo ""; return; fi
    local total=6
    local filled=$(( (pct * total + 50) / 100 ))
    [ "$filled" -gt "$total" ] && filled=$total
    local empty=$((total - filled))
    local color="$GREEN"
    if [ "$pct" -ge 80 ]; then color="$RED"
    elif [ "$pct" -ge 60 ]; then color="$YELLOW"
    fi
    local bar=""
    for ((i=0; i<filled; i++)); do bar+="█"; done
    for ((i=0; i<empty; i++)); do bar+="░"; done
    printf "${color}%s${DIM} %d%%${RST}" "$bar" "$pct"
}

# Color for usage percentage
usage_color() {
    local pct=$1
    if [ "$pct" -ge 80 ]; then echo "$RED"
    elif [ "$pct" -ge 60 ]; then echo "$YELLOW"
    elif [ "$pct" -ge 40 ]; then echo "$PEACH"
    else echo "$GREEN"
    fi
}

# Fetch Claude Max usage limits (cached for 2 minutes)
CACHE_FILE="/tmp/.claude-usage-cache"
CACHE_MAX_AGE=120
usage_5h=""
usage_7d=""
reset_5h=""
reset_7d=""

fetch_usage() {
    local now
    now=$(date +%s)
    local cache_age=$CACHE_MAX_AGE

    if [ -f "$CACHE_FILE" ]; then
        local cache_mtime
        cache_mtime=$(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0)
        cache_age=$(( now - cache_mtime ))
    fi

    if [ "$cache_age" -lt "$CACHE_MAX_AGE" ] && [ -f "$CACHE_FILE" ]; then
        : # cache is fresh, use it below
    else
        # Try to fetch fresh data
        local creds_file="$HOME/.claude/.credentials.json"
        if [ -f "$creds_file" ]; then
            local token
            token=$(jq -r '.claudeAiOauth.accessToken // empty' "$creds_file" 2>/dev/null)
            if [ -n "$token" ]; then
                local resp
                resp=$(curl -s --max-time 3 \
                    -H "Authorization: Bearer $token" \
                    -H "anthropic-beta: oauth-2025-04-20" \
                    -H "User-Agent: Claude Code" \
                    "https://api.anthropic.com/api/oauth/usage" 2>/dev/null)
                if echo "$resp" | jq -e '.five_hour' &>/dev/null; then
                    echo "$resp" > "$CACHE_FILE"
                fi
            fi
        fi
    fi

    # Read from cache (fresh or stale fallback)
    if [ -f "$CACHE_FILE" ]; then
        usage_5h=$(jq -r '.five_hour.utilization // empty' "$CACHE_FILE" 2>/dev/null)
        usage_7d=$(jq -r '.seven_day.utilization // empty' "$CACHE_FILE" 2>/dev/null)
        reset_5h=$(jq -r '.five_hour.resets_at // empty' "$CACHE_FILE" 2>/dev/null)
        reset_7d=$(jq -r '.seven_day.resets_at // empty' "$CACHE_FILE" 2>/dev/null)
    fi
}

fetch_usage

# Format reset time as relative (e.g., "2h13m")
fmt_reset() {
    local reset_iso=$1
    if [ -z "$reset_iso" ]; then return; fi
    local reset_epoch
    reset_epoch=$(date -d "$reset_iso" +%s 2>/dev/null)
    if [ -z "$reset_epoch" ]; then return; fi
    local now
    now=$(date +%s)
    local diff=$(( reset_epoch - now ))
    if [ "$diff" -le 0 ]; then echo "now"; return; fi
    local hours=$(( diff / 3600 ))
    local mins=$(( (diff % 3600) / 60 ))
    if [ "$hours" -gt 0 ]; then
        printf "%dh%02dm" "$hours" "$mins"
    else
        printf "%dm" "$mins"
    fi
}

# Format reset time as days (e.g., "4d 3h")
fmt_reset_days() {
    local reset_iso=$1
    if [ -z "$reset_iso" ]; then return; fi
    local reset_epoch
    reset_epoch=$(date -d "$reset_iso" +%s 2>/dev/null)
    if [ -z "$reset_epoch" ]; then return; fi
    local now
    now=$(date +%s)
    local diff=$(( reset_epoch - now ))
    if [ "$diff" -le 0 ]; then echo "now"; return; fi
    local days=$(( diff / 86400 ))
    local hours=$(( (diff % 86400) / 3600 ))
    if [ "$days" -gt 0 ]; then
        printf "%dd%dh" "$days" "$hours"
    else
        local mins=$(( (diff % 3600) / 60 ))
        printf "%dh%02dm" "$hours" "$mins"
    fi
}

# Build status line
parts=()

# 1. Directory + git branch
if [ -n "$git_branch" ]; then
    parts+=("${BLUE}${short_dir}${RST} ${MAUVE}\ue0a0 ${git_branch}${git_dirty}${RST}")
elif [ -n "$short_dir" ]; then
    parts+=("${BLUE}${short_dir}${RST}")
fi

# 2. Lines changed
if [ -n "$lines_added" ] && [ "$lines_added" != "null" ] && { [ "$lines_added" -gt 0 ] || [ "${lines_removed:-0}" -gt 0 ]; }; then
    parts+=("${GREEN}+${lines_added}${RST} ${RED}-${lines_removed:-0}${RST}")
fi

# 3. Tokens
if [ -n "$in_tokens" ] && [ "$in_tokens" != "null" ]; then
    parts+=("${BLUE}↓$(fmt_tokens "$in_tokens")${RST} ${GREEN}↑$(fmt_tokens "$out_tokens")${RST}")
fi

# 4. Context bar
if [ -n "$used_pct" ] && [ "$used_pct" != "null" ]; then
    parts+=("$(ctx_bar "$used_pct")")
fi

# 5. Claude Max usage limits (5h / 7d + reset countdown)
if [ -n "$usage_5h" ] && [ -n "$usage_7d" ]; then
    local_5h_int=${usage_5h%.*}
    local_7d_int=${usage_7d%.*}
    color_5h=$(usage_color "$local_5h_int")
    color_7d=$(usage_color "$local_7d_int")
    reset_5h_str=$(fmt_reset "$reset_5h")
    reset_7d_str=$(fmt_reset_days "$reset_7d")
    limit_part="${DIM}5h${RST} ${color_5h}${local_5h_int}%${RST}"
    if [ -n "$reset_5h_str" ]; then
        limit_part+=" ${DIM}(${reset_5h_str})${RST}"
    fi
    limit_part+=" ${DIM}7d${RST} ${color_7d}${local_7d_int}%${RST}"
    if [ -n "$reset_7d_str" ]; then
        limit_part+=" ${DIM}(${reset_7d_str})${RST}"
    fi
    parts+=("$limit_part")
fi

# Join with separator
result=""
for i in "${!parts[@]}"; do
    if [ "$i" -gt 0 ]; then
        result+=" ${DIM}│${RST} "
    fi
    result+="${parts[$i]}"
done

echo -e "$result"
