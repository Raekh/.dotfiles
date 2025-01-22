return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },
  "tanvirtin/monokai.nvim",
  "folke/tokyonight.nvim",
  "catppuccin/nvim",
  "folke/trouble.nvim",
  "tpope/vim-endwise",
  { "tpope/vim-abolish", event = "BufRead" },
  {
    "kylechui/nvim-surround",
    lazy = false,
    opts = true,
  },
  { "wellle/targets.vim", event = "BufRead" },
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = "markdown",
  },
  {
    "abecodes/tabout.nvim",
    lazy = false,
  },
  {
    "Asheq/close-buffers.vim",
    lazy = false,
  },
  {
    "VidocqH/lsp-lens.nvim",
    lazy = false,
    config = function()
      local SymbolKind = vim.lsp.protocol.SymbolKind

      require("lsp-lens").setup {
        enable = true,
        include_declaration = false, -- Reference include declaration
        sections = {
          definition = function(count) return "Definitions: " .. count end,
          references = function(count) return "References: " .. count end,
          implements = function(count) return "Implements: " .. count end,
          git_authors = function(latest_author, count)
            return " " .. latest_author .. (count - 1 == 0 and "" or (" + " .. count - 1))
          end,
        },
        ignore_filetype = {
          "prisma",
        },
        -- Target Symbol Kinds to show lens information
        target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
        -- Symbol Kinds that may have target symbol kinds as children
        wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
      }
    end,
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function() require("render-markdown").setup {} end,
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function() require("lsp-file-operations").setup() end,
  },
  {
    "3rd/image.nvim",
    opts = {},
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  {
    "itchyny/vim-qfedit",
  },
  { "andreshazard/vim-freemarker" },
  {
    "cseickel/diagnostic-window.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  "yochem/jq-playground.nvim",
  "KaitoMuraoka/websearcher.nvim",
  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("inlay-hints").setup {
        autocmd = {
          enable = false,
        },
      }
    end,
    keys = {
      { "<leader>lH", "<cmd>InlayHintsToggle<CR>", desc = "Toggle Inlay Hints" },
    },
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {
  --     -- settings = {
  --     --   separate_diagnostic_server = false,
  --     --   code_lens = "off",
  --     -- },
  --   },
  -- },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   opts = {},
  -- },
  -- {
  --   'lvimuser/lsp-inlayhints.nvim',
  --   config = function()
  --     vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
  --     vim.api.nvim_create_autocmd("LspAttach", {
  --       group = "LspAttach_inlayhints",
  --       callback = function(args)
  --         if not (args.data and args.data.client_id) then
  --           return
  --         end
  --
  --         local bufnr = args.buf
  --         local client = vim.lsp.get_client_by_id(args.data.client_id)
  --         require("lsp-inlayhints").on_attach(client, bufnr)
  --       end,
  --     })
  --   end
  -- }
}
