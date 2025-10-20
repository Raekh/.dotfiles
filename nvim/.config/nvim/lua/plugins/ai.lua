return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
    },
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = false, -- handled by completion engine
        },
      },
      nes = {
        enabled = false,
      },
    },
    specs = {
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              -- set the ai_accept function
              ai_accept = function()
                if require("copilot.suggestion").is_visible() then
                  require("copilot.suggestion").accept()
                  return true
                end
              end,
            },
          },
        },
      },
    },
  },
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `toggle()`.
      { "folke/snacks.nvim", opts = { input = {}, picker = {} } },
    },
    config = function()
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`
      }

      -- Required for `vim.g.opencode_opts.auto_reload`
      vim.opt.autoread = true

      -- Recommended/example keymaps
      vim.keymap.set(
        { "n", "x" },
        "<Leader>'a",
        function() require("opencode").ask("@this: ", { submit = true }) end,
        { desc = "Ask about this" }
      )
      vim.keymap.set(
        { "n", "x" },
        "<Leader>'+",
        function() require("opencode").prompt "@this" end,
        { desc = "Add this" }
      )
      vim.keymap.set(
        { "n", "x" },
        "<Leader>'s",
        function() require("opencode").select() end,
        { desc = "Select prompt" }
      )
      vim.keymap.set("n", "<Leader>'t", function() require("opencode").toggle() end, { desc = "Toggle embedded" })
      vim.keymap.set("n", "<Leader>'c", function() require("opencode").command() end, { desc = "Select command" })
      vim.keymap.set(
        "n",
        "<Leader>'n",
        function() require("opencode").command "session_new" end,
        { desc = "New session" }
      )
      vim.keymap.set(
        "n",
        "<Leader>'i",
        function() require("opencode").command "session_interrupt" end,
        { desc = "Interrupt session" }
      )
      vim.keymap.set(
        "n",
        "<Leader>'A",
        function() require("opencode").command "agent_cycle" end,
        { desc = "Cycle selected agent" }
      )
      vim.keymap.set(
        "n",
        "<S-C-u>",
        function() require("opencode").command "messages_half_page_up" end,
        { desc = "Messages half page up" }
      )
      vim.keymap.set(
        "n",
        "<S-C-d>",
        function() require("opencode").command "messages_half_page_down" end,
        { desc = "Messages half page down" }
      )
    end,
  },
  {
    "Davidyz/VectorCode",
    version = "*", -- optional, depending on whether you're on nightly or release
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "VectorCode", -- if you're lazy-loading VectorCode
  },
  {
    "ravitemer/mcphub.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup {
        auto_approve = true,
      }
    end,
  },
}
