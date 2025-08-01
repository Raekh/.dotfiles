-- Customize Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        -- add more arguments for adding more treesitter parsers
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = true,
    },
  },
}
