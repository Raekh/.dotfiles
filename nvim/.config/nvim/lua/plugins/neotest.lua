return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-plenary",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-plenary",
        require "neotest-jest" {
          env = { CI = true },
          cwd = function(path) return vim.fn.getcwd() end,
        },
      },
    }
  end,
}
