return {
  "HiPhish/rainbow-delimiters.nvim",
  keys = {
    {
      "<leader>uB",
      function(bufnr)
        local rainbow_delimiters = require "rainbow-delimiters"

        rainbow_delimiters.toggle(bufnr)
      end,
      desc = "Toggle rainbow delimiters",
    },
  },
}
