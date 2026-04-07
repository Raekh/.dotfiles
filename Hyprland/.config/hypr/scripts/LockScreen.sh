#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##

# For Hyprlock
LOG="$HOME/.cache/hypr-lock-debug.log"

{
  echo "----- $(date '+%F %T') lock start -----"
  hyprctl monitors all
} >> "$LOG" 2>&1

# Avoid stacking lock instances
if pgrep -x hyprlock >/dev/null; then
  echo "$(date '+%F %T') hyprlock already running, skip" >> "$LOG"
  exit 0
fi

hyprlock -q --immediate

{
  echo "----- $(date '+%F %T') lock end -----"
  hyprctl monitors all
} >> "$LOG" 2>&1
