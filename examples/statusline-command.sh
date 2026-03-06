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

# Short directory (last 2 components)
short_dir=""
if [ -n "$cwd" ]; then
    short_dir=$(echo "$cwd" | awk -F/ '{if(NF>2) print $(NF-1)"/"$NF; else print $0}')
fi

# Catppuccin Mocha ANSI colors
RST='\033[0m'
DIM='\033[2m'
BLUE='\033[38;2;137;180;250m'    # #89b4fa
GREEN='\033[38;2;166;227;161m'   # #a6e3a1
MAUVE='\033[38;2;203;166;247m'   # #cba6f7
YELLOW='\033[38;2;249;226;175m'  # #f9e2af
RED='\033[38;2;243;139;168m'     # #f38ba8
TEXT='\033[38;2;205;214;244m'    # #cdd6f4
SUBTEXT='\033[38;2;166;173;200m' # #a6adc8

# Format token count (e.g., 12345 → 12.3k) — pure bash, no bc
fmt_tokens() {
    local n=$1
    if [ -z "$n" ] || [ "$n" = "null" ]; then echo "0"; return; fi
    if [ "$n" -ge 1000000 ]; then
        local whole=$((n / 1000000))
        local frac=$(( (n % 1000000) / 100000 ))
        printf "%d.%dM" "$whole" "$frac"
    elif [ "$n" -ge 1000 ]; then
        local whole=$((n / 1000))
        local frac=$(( (n % 1000) / 100 ))
        printf "%d.%dk" "$whole" "$frac"
    else
        echo "$n"
    fi
}

# Context bar (10 chars wide)
ctx_bar() {
    local pct=$1
    if [ -z "$pct" ] || [ "$pct" = "null" ]; then echo ""; return; fi
    local filled=$((pct / 10))
    local empty=$((10 - filled))
    local color="$GREEN"
    if [ "$pct" -ge 80 ]; then color="$RED"
    elif [ "$pct" -ge 60 ]; then color="$YELLOW"
    fi
    local bar=""
    for ((i=0; i<filled; i++)); do bar+="█"; done
    for ((i=0; i<empty; i++)); do bar+="░"; done
    printf "${color}%s${DIM} %d%%${RST}" "$bar" "$pct"
}

# Build status line
parts=()

# 1. Directory + git branch — orientation (always visible, left anchor)
if [ -n "$git_branch" ]; then
    parts+=("${BLUE}${short_dir}${RST} ${MAUVE} ${git_branch}${git_dirty}${RST}")
elif [ -n "$short_dir" ]; then
    parts+=("${BLUE}${short_dir}${RST}")
fi

# 2. Lines changed — productivity at a glance (only when there's activity)
if [ -n "$lines_added" ] && [ "$lines_added" != "null" ] && { [ "$lines_added" -gt 0 ] || [ "${lines_removed:-0}" -gt 0 ]; }; then
    parts+=("${GREEN}+${lines_added}${RST} ${RED}-${lines_removed:-0}${RST}")
fi

# 3. Tokens — consumption reference
if [ -n "$in_tokens" ] && [ "$in_tokens" != "null" ]; then
    parts+=("${BLUE}↓$(fmt_tokens "$in_tokens")${RST} ${GREEN}↑$(fmt_tokens "$out_tokens")${RST}")
fi

# 4. Context bar — health indicator (visual, right side for quick scanning)
if [ -n "$used_pct" ] && [ "$used_pct" != "null" ]; then
    parts+=("$(ctx_bar "$used_pct")")
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
