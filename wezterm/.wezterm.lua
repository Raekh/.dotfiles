local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Tokyo Night Moon'
-- config.font = wezterm.font 'JetBrains Mono'
-- config.font = wezterm.font 'JetBrains Mono'

config.freetype_load_target = "HorizontalLcd"
config.line_height = 1.2
config.window_decorations = "NONE"
config.font = wezterm.font_with_fallback {
  -- 'JetBrains Mono',
  { family = 'Jetbrains Mono',         weight = 'Medium' },
  { family = 'Symbols Nerd Font Mono', scale = 0.6 }
}
config.font_size = 10.6
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
return config
