-- Samaritan colorscheme — local plugin spec
-- Loads from the project directory as a local dev plugin so lazy.nvim
-- picks up the colors/samaritan.lua file on the runtimepath.
---@type LazySpec
return {
  "samaritan",
  name = "samaritan",
  dir = "/home/raekh/Documents/Code/opencode-samaritan/nvim",
  lazy = false,
  priority = 1000, -- load before other plugins that might set highlights
}
