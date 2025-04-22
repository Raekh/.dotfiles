---@type LazySpec
return {
  -- General
  {
    -- Adds number of definitions, references, implements and authors for lsp entity
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
    -- adds outomatic lsp operations based on file operations
    -- i.e. Rename a file ? Rename references via lsp
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function() require("lsp-file-operations").setup() end,
  },

  -- Typescript
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      settings = {
        tsserver_plugins = {
          "@styled/typescript-styled-plugin",
        },
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
  {
    "dmmulroy/tsc.nvim",
    config = true,
  },
}
