return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        tsserver_plugins = {
          "@styled/typescript-styled-plugin",
        },
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
    -- keys = {
    --   ["<Leader>T"] = { desc = "Typescript" },
    --   ["<Leader>Tu"] = { "<CMD>TSToolsRemoveUnusedImports<CR>", desc = "Remove unused imports" },
    --   ["<Leader>TU"] = { "<CMD>TSToolsRemoveUnused<CR>", desc = "Remove unused" },
    --   ["<Leader>Ta"] = { "<CMD>TSToolsFixAll<CR>", desc = "Fix all" },
    --   ["<Leader>Ts"] = { "<CMD>TSToolsSortImports<CR>", desc = "Sort imports" },
    --   ["<Leader>To"] = { "<CMD>TSToolsOrganizeImports<CR>", desc = "Organize imports" },
    --   ["<Leader>Tm"] = { "<CMD>TSToolsAddMissingImports<CR>", desc = "Add missing imports" },
    -- },
  },
  {
    "dmmulroy/tsc.nvim",
    config = true,
  },
}
