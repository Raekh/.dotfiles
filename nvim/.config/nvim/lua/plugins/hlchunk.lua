if true then return {} end
return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("hlchunk").setup {
      chunk = {
        enable = true,
        notify = true,
        use_treesitter = true,
        -- details about support_filetypes and exclude_filetypes in https://github.com/shellRaining/hlchunk.nvim/blob/main/lua/hlchunk/utils/filetype.lua
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = ">",
        },
        style = {
          { fg = "#806d9c" },
          { fg = "#d80950" }, -- this fg is used to highlight wrong chunk
        },
        textobject = "",
        max_file_size = 1024 * 1024,
        error_sign = true,
      },

      indent = {
        enable = false,
        use_treesitter = false,
        chars = {
          "│",
        },
        style = {
          { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui") },
        },
      },

      line_num = {
        enable = true,
        use_treesitter = false,
        style = "#806d9c",
      },

      ---@diagnostic disable-next-line: missing-fields
      blank = {
        enable = false,
        -- chars = {
        --   -- "․",
        --   " ",
        -- },
        -- style = {
        --   vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui"),
        -- },
      },
    }
  end,
}
