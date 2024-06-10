return {

  {
    "jose-elias-alvarez/typescript.nvim",
    config = true,
    keys = {
      { "<Leader>lu", "<CMD>TypescriptRemoveUnused<CR>", desc = "Typescript: Remove unused" },
      { "<Leader>lm", "<CMD>TypescriptAddMissingImports<CR>", desc = "Typescript: Add missing imports" },
      { "<Leader>lo", "<CMD>TypescriptOrganizeImports<CR>", desc = "Typescript: Organize imports" },
    },
  },
  -- -- {
  -- --   "dmmulroy/ts-error-translator.nvim",
  -- --   config = true,
  -- -- },
  -- {
  --   "dmmulroy/tsc.nvim",
  --   config = true,
  -- },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {
  --     settings = {
  --       code_lens = "off",
  --       disable_member_code_lens = true,
  --     },
  --   },
  -- }
}
