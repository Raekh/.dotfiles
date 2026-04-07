#!/usr/bin/env bash

# Hyprland native monitor profile manager (kanshi-free)
# Applies monitor layouts via hyprctl on startup and on monitor hotplug events.

set -u

LOG_FILE="$HOME/.cache/hypr-monitor-profiles.log"
SOCKET2="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

log() {
  printf '[%s] %s\n' "$(date '+%F %T')" "$*" >> "$LOG_FILE"
}

has_output() {
  local name="$1"
  hyprctl -j monitors all | jq -e --arg n "$name" '.[] | select(.name == $n and .disabled == false)' >/dev/null 2>&1
}

apply_profile_home_office() {
  log "Applying profile: home_office"
  log "home_office modes: DP-4=highres@highrr DP-3=highres@highrr"
  # Hard reset path avoids wlroots fallback state after hyprctl reload
  # hyprctl --batch "keyword monitor eDP-1,disable; keyword monitor DP-3,disable; keyword monitor DP-4,disable"
  # sleep 0.2
  hyprctl --batch "keyword monitor DP-4,5120x1440@60,0x1080,1.333333; keyword monitor DP-3,highres@highrr,1600x0,1; keyword monitor eDP-1,disable"

}

apply_profile_work_office() {
  log "Applying profile: work_office"
  hyprctl --batch "keyword monitor DP-6,3440x1440@100,0x0,1; keyword monitor eDP-1,preferred,3440x0,1"
}

apply_profile_work_office_2() {
  log "Applying profile: work_office_2"
  hyprctl --batch "keyword monitor DP-7,3840x2160@60,0x0,1; keyword monitor eDP-1,preferred,3840x0,1"
}

apply_profile_undocked() {
  log "Applying profile: undocked"
  hyprctl --batch "keyword monitor eDP-1,preferred,0x0,1"
}

detect_and_apply() {
  # Priority order: most specific first
  if has_output "DP-4" && has_output "DP-3"; then
    apply_profile_home_office
  elif has_output "DP-6"; then
    apply_profile_work_office
  elif has_output "DP-7"; then
    apply_profile_work_office_2
  else
    apply_profile_undocked
  fi
}

main() {
  # Single instance (kill older workers, keep current process)
  local pid
  for pid in $(pgrep -f "MonitorProfiles.sh --worker" 2>/dev/null || true); do
    [[ "$pid" != "$$" ]] && kill "$pid" >/dev/null 2>&1 || true
  done

  # Startup apply
  detect_and_apply

  # Event loop via socket2
  if [[ ! -S "$SOCKET2" ]]; then
    log "socket2 not found at $SOCKET2"
    exit 1
  fi

  log "Listening for monitor events on socket2"
  socat -U - UNIX-CONNECT:"$SOCKET2" | while IFS= read -r line; do
    case "$line" in
      monitoradded*|monitorremoved*|monitoraddedv2*|monitorremovedv2*)
        log "Event: $line"
        # tiny debounce to let wlroots settle modes
        sleep 0.3
        detect_and_apply
        ;;
    esac
  done
}

apply_once() {
  detect_and_apply
}

if [[ "${1:-}" == "--worker" ]]; then
  main
elif [[ "${1:-}" == "--apply" ]]; then
  apply_once
else
  exec "$0" --worker
fi
