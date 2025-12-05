-- vim:fileencoding=utf-8:foldmethod=marker
--
---@type LazySpec
return {
  -- Themes {{{
  "folke/tokyonight.nvim",
  {
    "Saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      if not opts.keymap then opts.keymap = {} end
      opts.keymap["<Tab>"] = {
        "snippet_forward",
        "select_next",
        "fallback",
      }
      opts.keymap["<C-J>"] = {
        function()
          if vim.g.ai_accept then return vim.g.ai_accept() end
        end,
        "fallback",
      }
      opts.keymap["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" }
    end,
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end,
  },
  "nyoom-engineering/oxocarbon.nvim",
  -- }}}

  -- Misc/QOL {{{
  -- Text/Targets/Motion {{{
  "tpope/vim-endwise", -- Automatic symbol completion (if -> if/else, { => {})
  { "tpope/vim-abolish", event = "BufRead" }, -- adds iabbrev and Substitute commands
  { "kylechui/nvim-surround", lazy = false, config = true }, -- adds yssr commands
  { "wellle/targets.vim", event = "BufRead" }, -- adds more targets for select, substitute, c and d operators
  {
    "echasnovski/mini.align",
    config = true,
  },
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
  -- {
  --   "saghen/blink.cmp",
  --   dependencies = "rafamadriz/friendly-snippets",
  --   version = "v0.*",
  --   opts = {
  --     keymap = { preset = "default" },
  --     appearance = {
  --       use_nvim_cmp_as_default = true,
  --       nerd_font_variant = "mono",
  --     },
  --     signature = { enabled = true },
  --   },
  -- },
  -- {
  --   "fiqryq/wakastat.nvim",
  --   event = "VeryLazy",
  --   cmd = { "WakastatRefresh", "WakastatStatus" },
  --   opts = {
  --     args = { "--today" }, -- or "--week", "--month"
  --     format = "Today Coding Time: %s", -- %s replaced with time
  --     update_interval = 300, -- seconds between updates
  --     enable_timer = true,
  --   },
  --   config = function(_, opts) require("wakastat").setup(opts) end,
  --
  --   specs = {
  --     {
  --       "rebelot/heirline.nvim",
  --       optional = true,
  --       opts = function(_, opts)
  --         opts.statusline = opts.statusline or {}
  --         table.insert(opts.statusline, 5, { -- insert at position 5
  --           provider = function() return " " .. require("wakastat").status() .. " " end,
  --           hl = "Wakastat",
  --           update = { "User", pattern = "WakastatUpdated" },
  --         })
  --       end,
  --     },
  --   },
  -- },
  -- {
  --   "wakatime/vim-wakatime",
  --   lazy = true,
  -- },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"

      -- Create WakaTime component
      -- local wakatime_component = {
      --   provider = function() return " " .. require("wakastat").wakatime() .. " " end,
      --   hl = { fg = "cyan", bg = "bg" },
      -- }

      -- Add to existing statusline
      -- table.insert(opts.statusline, #opts.statusline, wakatime_component)

      return opts
    end,
  },
  {
    "aspeddro/slides.nvim",
    config = function() require("slides").setup {} end,
  },
  -- {
  --   "okuuva/auto-save.nvim",
  --   opts = {
  --     enabled = false,
  --   },
  -- },
  {
    "ethersync/ethersync-nvim",
    keys = { { "<Leader>j", "<cmd>EthersyncJumpToCursor<cr>" } },
    lazy = false,
  },
  {
    "Owen-Dechow/videre.nvim",
    cmd = "Videre",
    dependencies = {
      "Owen-Dechow/graph_view_yaml_parser", -- Optional: add YAML support
      "Owen-Dechow/graph_view_toml_parser", -- Optional: add TOML support
      "a-usr/xml2lua.nvim", -- Optional | Experimental: add XML support
    },
    opts = {
      round_units = false,
      simple_statusline = true, -- If you are just starting out with Videre,
      --   setting this to `false` will give you
      --   descriptions of available keymaps.
      --,
      --,
      keymaps = {
        -- Expanding collapsed areas
        expand = "E",
        -- Collapse expanded areas
        collapse = "E",
        -- Jump to linked unit
        link_forward = "L",
        -- Jump back to unit parent
        link_backward = "H",
        -- Jump down a unit
        link_down = "J",
        -- Jump up a unit
        link_up = "K",
        -- Set current unit as root
        set_as_root = "R",
        -- Aliased to first priority available keymap
        quick_action = "<CR>",
        -- Close the window
        close_window = "q",
        -- Open the help menu
        help = "g?",
      },
    },
  },
  {
    "R-Camacho/sandbox.nvim",
    opts = {},
  },
  {
    "bennypowers/nvim-regexplainer",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
      "edluffy/hologram.nvim",
    },
    opts = {
      mode = "graphical",
      display = "popup",

      graphical = {
        generation_width = 1200,
        generation_height = 800,
      },

      deps = {
        auto_install = true,
      },
    },
  },
  {
    "Equilibris/nx.nvim",
    dependencies = {
      -- telescope
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      -- See below for config options
      nx_cmd_root = "npx nx",
    },
  },
  {
    "gisketch/triforce.nvim",
    dependencies = {
      "nvzone/volt",
    },
    config = function()
      require("triforce").setup {
        -- Optional: Add your configuration here
        keymap = {
          show_profile = "<Leader>Tp", -- Open profile with <leader>tp
        },
      }
    end,
  },
  {
    dir = vim.fn.expand "~/Documents/Code/echo.nvim",
    name = "echo.nvim",
    config = function(_, opts) require("echo").setup(opts) end,
    opts = {
      demo = true,
    },
  },
  -- }}}
  -- }}}
}
