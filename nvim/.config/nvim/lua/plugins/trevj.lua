return {
  "AckslD/nvim-trevJ.lua",
  lazy = false,
  -- config = function() require("trevj").setup() end,
  keys = {
    {
      "<Leader>lj",
      function() require("trevj").format_at_cursor() end,
      desc = "Toggle inline arguments",
    },
  },
}
