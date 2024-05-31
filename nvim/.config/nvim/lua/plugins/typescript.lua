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
  -- {
  --   "dmmulroy/ts-error-translator.nvim",
  --   config = true,
  -- },
  {
    "dmmulroy/tsc.nvim",
    config = true,
  },
}
