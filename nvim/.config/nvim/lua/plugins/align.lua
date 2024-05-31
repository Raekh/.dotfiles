return {
  "Vonr/align.nvim",
  branch = "v2",
  lazy = true,
  keys = {
    {
      "<Leader>Aa",
      function() require("align").align_to_char { length = 1 } end,
      mode = "x",
      desc = "Align: character",
    },
    {
      "<Leader>Ad",
      function() require("align").align_to_char { preview = true, length = 2 } end,
      mode = "x",
      desc = "Align: 2 characters with previews",
    },
    {
      "<Leader>Aw",
      function()
        require("align").align_to_string {
          preview = true,
          regex = false,
        }
      end,
      mode = "x",
      desc = "Align: string with previews",
    },
    {
      "<Leader>Ar",
      function()
        require("align").align_to_string {
          preview = true,
          regex = true,
        }
      end,
      mode = "x",
      desc = "Align: regex with previews",
    },
    {
      "<Leader>Agw",
      function()
        local a = require "align"
        a.operator(a.align_to_string, {
          regex = false,
          preview = true,
        })
      end,
      mode = "n",
      desc = "Align: paragraph to a string with previews",
    },
    {
      "<Leader>Aga",
      function()
        local a = require "align"
        a.operator(a.align_to_char)
      end,
      mode = "n",
      desc = "Align: paragraph to 1 character",
    },
  },
}
