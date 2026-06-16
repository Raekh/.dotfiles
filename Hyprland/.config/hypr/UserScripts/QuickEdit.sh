#!/bin/bash
# Rofi menu for Quick Edit / View of Settings (SUPER E)

configs="$HOME/.config/hypr/configs"
UserConfigs="$HOME/.config/hypr/UserConfigs"

menu(){
  printf "1. view Env-variables\n"
  printf "2. view Window-Rules\n"
  printf "3. view Startup_Apps\n"
  printf "4. view User-Keybinds\n"
  printf "5. view Monitors\n"
  printf "6. view Laptop-Keybinds\n"
  printf "7. view User-Settings\n"
  printf "8. view Workspace-Rules\n"
  printf "9. view Default-Settings\n"
  printf "10. view Default-Keybinds\n"
  printf "11. view Kanshi config\n"
  printf "12. view Bluetooth devices\n"
  printf "13. view Audio devices\n"
  printf "14. view Neovim plugins\n"
  printf "15. reload kanshi\n"
}

main() {
    choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/config-compact.rasi | cut -d. -f1)
    case $choice in
        1)
            ghostty -e nvim "$UserConfigs/ENVariables.conf"
            ;;
        2)
            ghostty -e nvim "$UserConfigs/WindowRules.conf"
            ;;
        3)
            ghostty -e nvim "$UserConfigs/Startup_Apps.conf"
            ;;
        4)
            ghostty -e nvim "$UserConfigs/UserKeybinds.conf"
            ;;
        5)
            ghostty -e nvim "$UserConfigs/Monitors.conf"
            ;;
        6)
            ghostty -e nvim "$UserConfigs/Laptops.conf"
            ;;
        7)
            ghostty -e nvim "$UserConfigs/UserSettings.conf"
            ;;
        8)
            ghostty -e nvim "$UserConfigs/WorkspaceRules.conf"
            ;;
		9)
            ghostty -e nvim "$configs/Settings.conf"
            ;;
        10)
            ghostty -e nvim "$configs/Keybinds.conf"
            ;;
        11)
            ghostty -e nvim "$HOME/.config/kanshi/config"
            ;;
        12)
            ghostty -e bluetui
            ;;
        13)
            ghostty -e pulsemixer
            ;;
        14)
            ghostty -e nvim "$HOME/.config/nvim/lua/plugins/"
            ;;
        15)
            ghostty -e sh -lc '$HOME/.config/hypr/scripts/MonitorProfiles.sh --apply; hyprctl monitors all'
            ;;
        *)
            ;;
    esac
}

main
