-- vim:fileencoding=utf-8:foldmethod=marker
---@type LazySpec
return {

  -- Themes {{{
  "folke/tokyonight.nvim",
  -- }}}

  -- Misc/QOL {{{
  -- Text/Targets/Motion {{{
  "tpope/vim-endwise", -- Automatic symbol completion (if -> if/else, { => {})
  { "tpope/vim-abolish", event = "BufRead" }, -- adds iabbrev and Substitute commands
  { "kylechui/nvim-surround", lazy = false, config = true }, -- adds yssr commands
  { "wellle/targets.vim", event = "BufRead" }, -- adds more targets for select, substitute, c and d operators
  {
    -- Adds reverse j behavior (separates lines instead of joining them)
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
  },
  {
    -- Text search and replace tool
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<Leader>R", desc = "Spectre" },
      { "<Leader>RR", '<CMD>lua require("spectre").toggle()<CR>', desc = "Spectre: Toggle" },
      {
        "<Leader>Rw",
        '<CMD>lua require("spectre").open_visual({select_word=true})<CR>',
        desc = "Spectre: Search current word",
      },
      {
        "<Leader>Rw",
        '<ESC><CMD>lua require("spectre").open_visual()<CR>',
        mode = "v",
        desc = "Spectre: Search current word",
      },
      {
        "<Leader>Rp",
        '<CMD>lua require("specter").open_file_search({select_word=true})<CR>',
        desc = "Spectre: Search on current file",
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    keys = {
      {
        "<leader>uB",
        ---@diagnostic disable-next-line: redundant-parameter
        function(bufnr)
          local rainbow_delimiters = require "rainbow-delimiters"

          rainbow_delimiters.toggle(bufnr)
        end,
        desc = "Toggle rainbow delimiters",
      },
    },
  },
  {
    "kiran94/edit-markdown-table.nvim",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "EditMarkdownTable",
  },
  -- }}}
  -- System {{{
  {
    -- Adds a prompt to save current file as root
    "lambdalisue/suda.vim",
    lazy = false,
    config = function()
      -- vim.g.suda_prompt = 'Pasuwodo: '
      -- vim.g.suda_smart_edit = 1
      vim.g["suda#prompt"] = "  "
      vim.g["suda_smart_edit"] = 1
    end,
  },
  -- }}}
  -- UI {{{
  {
    -- Adds buffer name in top right hand corner
    "b0o/incline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local helpers = require "incline.helpers"
      local devicons = require "nvim-web-devicons"

      require("incline").setup {
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            -- guibg = '#44406e',
          }
        end,
      }
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
  -- }}}
  -- }}}
}
