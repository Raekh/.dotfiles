--- @type LazySpec
return {

  "folke/trouble.nvim", -- Beatiful list of diagnostics, references, etc.

  {
    -- Adds split window for errors
    "cseickel/diagnostic-window.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
}
