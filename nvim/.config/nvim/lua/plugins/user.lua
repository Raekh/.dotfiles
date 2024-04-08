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
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
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
