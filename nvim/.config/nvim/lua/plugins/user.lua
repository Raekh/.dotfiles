-- vim:fileencoding=utf-8:foldmethod=marker
--
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
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    opts = {
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },
    },
  },
  {
    "fiqryq/wakastat.nvim",
    config = function()
      require("wakastat").setup {
        args = { "--today" },
        format = "Coding Time: %s",
        update_interval = 300,
      }
    end,
    dependencies = { "rebelot/heirline.nvim" },
  },
  {
    "wakatime/vim-wakatime",
    lazy = true,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"

      -- Create WakaTime component
      local wakatime_component = {
        provider = function() return " " .. require("wakastat").wakatime() .. " " end,
        hl = { fg = "cyan", bg = "bg" },
      }

      -- Add to existing statusline
      table.insert(opts.statusline, #opts.statusline, wakatime_component)

      return opts
    end,
  },
  {
    "aspeddro/slides.nvim",
    config = function() require("slides").setup {} end,
  },
  {
    "okuuva/auto-save.nvim",
    opts = {
      enabled = false,
    },
  },
  {
    "ethersync/ethersync-nvim",
    keys = { { "<leader>j", "<cmd>EthersyncJumpToCursor<cr>" } },
    lazy = false,
  },
  {
    dir = "~/Documents/Code/Comrade",
    name = "comrade.nvim",
    config = function() require("comrade").setup() end,
  },
  -- {
  --   "jackplus-xyz/monaspace.nvim",
  --   lazy = false,
  --   opts = {
  --     style_map = {
  --       -- Xenon - Slab Serif: documentation and annotations
  --       bold = {
  --         -- Todo comments only (Xenon)
  --         ["@comment.todo"] = true,
  --         Todo = true,
  --       },
  --       -- Radon - Handwritten font: tentative thoughts and comments
  --       italic = {
  --         -- Regular comments (Radon)
  --         Comment = true,
  --         SpecialComment = true,
  --         ["@comment"] = true,
  --         ["@comment.error"] = true,
  --         ["@comment.warning"] = true,
  --         ["@comment.hint"] = true,
  --         ["@comment.info"] = true,
  --         ["@lsp.type.comment"] = true,
  --         ["@lsp.type.comment.c"] = true,
  --         ["@lsp.type.comment.cpp"] = true,
  --         markdownUrl = true,
  --         htmlLink = true,
  --         ["@markup.italic"] = true,
  --         ["@markup.quote"] = true,
  --         ["@string.special.url"] = true,
  --         ["@string.special.path"] = true,
  --         ["@markup.link"] = true,
  --         ["@markup.link.url"] = true,
  --         ["@markup.link.markdown_inline"] = true,
  --         ["@markup.link.label.markdown_inline"] = true,
  --         mkdInlineURL = true,
  --         mkdLink = true,
  --         mkdURL = true,
  --         mkdLinkDef = true,
  --         markdownLinkText = true,
  --         ["@markup.math"] = true,
  --         ["@markup.environment"] = true,
  --         ["@markup.environment.name"] = true,
  --       },
  --       -- Krypton - Mechanical sans: UI elements, diagnostics, and system messages
  --       bold_italic = {
  --         -- Docstring comments (Krypton)
  --         ["@comment.documentation"] = true,
  --         ["@comment.note"] = true,
  --         ["@string.documentation"] = true,
  --         DiagnosticError = true,
  --         DiagnosticHint = true,
  --         DiagnosticInfo = true,
  --         DiagnosticOk = true,
  --         DiagnosticWarn = true,
  --         DiagnosticDefaultError = true,
  --         DiagnosticDefaultHint = true,
  --         DiagnosticDefaultInfo = true,
  --         DiagnosticDefaultOk = true,
  --         DiagnosticDefaultWarn = true,
  --         DiagnosticFloatingError = true,
  --         DiagnosticFloatingHint = true,
  --         DiagnosticFloatingInfo = true,
  --         DiagnosticFloatingOk = true,
  --         DiagnosticFloatingWarn = true,
  --         DiagnosticSignError = true,
  --         DiagnosticSignHint = true,
  --         DiagnosticSignInfo = true,
  --         DiagnosticSignOk = true,
  --         DiagnosticSignWarn = true,
  --         DiagnosticUnderlineError = true,
  --         DiagnosticUnderlineHint = true,
  --         DiagnosticUnderlineInfo = true,
  --         DiagnosticUnderlineOk = true,
  --         DiagnosticUnderlineWarn = true,
  --         DiagnosticVirtualTextError = true,
  --         DiagnosticVirtualTextHint = true,
  --         DiagnosticVirtualTextInfo = true,
  --         DiagnosticVirtualTextOk = true,
  --         DiagnosticVirtualTextWarn = true,
  --         ErrorMsg = true,
  --         WarningMsg = true,
  --         ModeMsg = true,
  --         MoreMsg = true,
  --         Question = true,
  --         RedrawDebugNormal = true,
  --         RedrawDebugClear = true,
  --         RedrawDebugComposed = true,
  --         RedrawDebugRecompose = true,
  --         healthError = true,
  --         healthSuccess = true,
  --         healthWarning = true,
  --         NvimInternalError = true,
  --         FloatTitle = true,
  --         WinBar = true,
  --         WinBarNC = true,
  --         StatusLine = true,
  --         StatusLineNC = true,
  --         StatusLineTerm = true,
  --         StatusLineTermNC = true,
  --         -- Copilot suggestions/completions
  --         CopilotSuggestion = true,
  --         CopilotGhostText = true,
  --         CmpItemKindCopilot = true,
  --       },
  --     },
  --   },
  -- },
  -- }}}
  -- }}}
}
