-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      require("null-ls").builtins.formatting.prettier.with {
        condition = function(utils)
          return utils.root_has_file {
            ".prettierrc",
            "prettier.config.js",
            ".prettierrc.json",
            ".prettierrc.js",
            ".prettierrc.config.json",
          }
        end,
      },
    })
  end,
}
