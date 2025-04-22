-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "angular-language-server",
        "eslint-lsp",
        "gitlab-ci-ls",
        "json-lsp",
        "lemminx",

        -- install formatters
        "stylua",
        "prettierd",
        "eslint_d",
        "selene",
        "standardjs",

        -- install debuggers
        "debugpy",
        "chrome-debug-adapter",
        "node-debug2-adapter",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
