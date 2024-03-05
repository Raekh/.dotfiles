local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Tokyo Night Moon'
-- config.font = wezterm.font 'JetBrains Mono'
-- config.font = wezterm.font 'JetBrains Mono'


-- config.line_height = 1.1
config.font = wezterm.font_with_fallback {
    'JetBrains Mono',
    { family = 'Symbols Nerd Font Mono', scale = 0.57  }
}
config.font_size = 10.3
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
return config
