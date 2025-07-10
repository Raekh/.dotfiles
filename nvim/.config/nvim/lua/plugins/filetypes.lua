--- @type LazySpec
return {
  -- markdown
  -- {
  --   "MeanderingProgrammer/markdown.nvim",
  --   name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   ft = { "markdown", "codecompanion" },
  --   config = function() require("render-markdown").setup {} end,
  -- },

  -- Render markdown in the chat buffer
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "MeanderingProgrammer/markdown.nvim",
    },
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },

  -- ftl
  { "andreshazard/vim-freemarker" },
}
