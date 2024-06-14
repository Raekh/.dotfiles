---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local treesitter = require "nvim-treesitter.configs"

    -- configure treesitter
    ---@diagnostic disable-next-line: missing-fields
    treesitter.setup {
      -- ensure_installed = "maintained",
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      -- autotag = {
      --   enable = true
      -- },
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "gitignore",
        "graphql",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "prisma",
        "query",
        "tsx",
        -- "typescript",
        "vim",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    }
  end,
}
