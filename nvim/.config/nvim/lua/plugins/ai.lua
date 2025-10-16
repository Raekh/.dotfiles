return {
  -- {
  --   "codota/tabnine-nvim",
  --   build = "./dl_binaries.sh",
  --   lazy = false,
  --   config = function()
  --     require("tabnine").setup {
  --       disable_auto_comment = true,
  --       accept_keymap = "<Right>",
  --       dismiss_keymap = "<C-]>",
  --       debounce_ms = 200,
  --       suggestion_color = { gui = "#808080", cterm = 244 },
  --       exclude_filetypes = { "TelescopePrompt", "NvimTree" },
  --       log_file_path = nil, -- absolute path to Tabnine log file
  --     }
  --   end,
  --   keys = {
  --     { "<Leader>T", name = "Tabnine" },
  --     { "<Leader>To", "<CMD>TabnineChat<CR>", desc = "TabnineChat: Open" },
  --     { "<Leader>TC", "<CMD>TabnineChatClose<CR>", desc = "TabnineChat: Close" },
  --     { "<Leader>Tn", "<CMD>TabnineChatNew<CR>", desc = "TabnineChat: New chat" },
  --     { "<Leader>Ta", "<CMD>TabnineAccept<CR>", desc = "TabnineChat: Accept" },
  --     { "<Leader>Tr", "<CMD>TabnineReject<CR>", desc = "TabnineChat: Reject" },
  --   },
  -- },
  -- Main AI Agent plugin

  -- -- Direct Ollama integration for quick queries
  -- {
  --   "David-Kunz/gen.nvim",
  --   opts = {
  --     model = "codellama:7b-instruct",
  --     host = "localhost",
  --     port = "11434",
  --     display_mode = "float",
  --     show_prompt = false,
  --     show_model = false,
  --     no_auto_close = false,
  --     init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
  --     command = function(options)
  --       local body = { model = options.model, stream = true }
  --       return "curl --silent --no-buffer -X POST http://"
  --         .. options.host
  --         .. ":"
  --         .. options.port
  --         .. "/api/generate -d $body"
  --     end,
  --     debug = false,
  --   },
  -- },
  --
  -- -- Completion using built-in LSP + Ollama integration
  -- {
  --   "nomnivore/ollama.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
  --   keys = {
  --     {
  --       "<Leader>oo",
  --       ":<c-u>lua require('ollama').prompt()<cr>",
  --       desc = "ollama prompt",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<Leader>oG",
  --       ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
  --       desc = "ollama Generate Code",
  --       mode = { "n", "v" },
  --     },
  --   },
  --   opts = {
  --     model = "codellama:7b-instruct",
  --     url = "http://127.0.0.1:11434",
  --     serve = {
  --       on_start = false,
  --       command = "ollama",
  --       args = { "serve" },
  --       stop_command = "pkill",
  --       stop_args = { "-SIGTERM", "ollama" },
  --     },
  --   },
  -- },
  {
    "github/copilot.vim",
    config = function() vim.g.copilot_no_tab_map = true end,
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   config = function(_, opts)
  --     vim.g.codecompanion_yolo_mode = true
  --     require("codecompanion").setup(opts)
  --     require("plugins.codecompanion.fidget-spinner"):init()
  --     -- require "plugins.codecompanion.eldritch"
  --   end,
  --   opts = {
  --     adapters = {
  --       -- ollama = function()
  --       --   return require("codecompanion.adapters").extend("ollama", {
  --       --     schema = {
  --       --       model = {
  --       --         default = "qwen3:latest",
  --       --       },
  --       --       num_ctx = {
  --       --         default = 20000,
  --       --       },
  --       --     },
  --       --   })
  --       -- end,
  --       -- copilot = function()
  --       --   return require("codecompanion.adapters").extend("copilot", {
  --       --     schema = {
  --       --       model = {
  --       --         default = "gpt-5", -- Use GPT-5 if available
  --       --       },
  --       --     },
  --       --   })
  --       -- end,
  --     },
  --     extensions = {
  --       history = {
  --         enabled = true,
  --         opts = {
  --           keymap = "gh",
  --           auto_save = true,
  --           expiration_days = 0,
  --           picker = "snacks",
  --           picker_keymaps = {
  --             rename = { n = "r", i = "<M-r>" },
  --             delete = { n = "d", i = "<M-d>" },
  --             duplicate = { n = "<C-y>", i = "<C-y>" },
  --           },
  --           auto_generate_title = true,
  --           delete_on_clearing_chat = true, -- Clear with gx
  --           dir_to_save = vim.fn.stdpath "data" .. "/codecompanion_history",
  --           enable_logging = true,
  --           summary = {
  --             create_summary_keymap = "gcs",
  --             browse_summary_keymap = "gbs",
  --             generation_opts = {
  --               include_references = true,
  --               include_tool_outputs = true,
  --             },
  --           },
  --           memory = {
  --             auto_create_memories_on_summary_generation = true,
  --             vectorcode_exe = "vectorcode",
  --             notify = true,
  --             tool_opts = {
  --               default_num = 10,
  --             },
  --             index_on_startup = false,
  --           },
  --         },
  --       },
  --       mcphub = {
  --         callback = "mcphub.extensions.codecompanion",
  --         opts = {
  --           show_result_in_chat = true,
  --           make_vars = true,
  --           make_slash_commands = true,
  --         },
  --       },
  --       vectorcode = {
  --         opts = {
  --           add_tool = true,
  --         },
  --       },
  --     },
  --     strategies = {
  --       chat = {
  --         adapter = "copilot",
  --         roles = {
  --           user = "Raekh",
  --         },
  --         model = "gpt-5", -- Use GPT-5 if available
  --         tools = {
  --           opts = {
  --             auto_submit_errors = true,
  --             auto_submit_success = true,
  --           },
  --         },
  --       },
  --       inline = {
  --         adapter = "copilot",
  --         roles = {
  --           user = "Raekh",
  --         },
  --         model = "gpt-5", -- Use GPT-5 if available
  --       },
  --     },
  --     opts = {
  --       log_level = "DEBUG",
  --     },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "ravitemer/mcphub.nvim",
  --     "ravitemer/codecompanion-history.nvim",
  --     "j-hui/fidget.nvim",
  --   },
  -- },
  -- {
  --   "sudo-tee/opencode.nvim",
  --   config = function()
  --     -- To add GitHub Copilot as a provider, run `opencode auth login` in the terminal and select GitHub Copilot
  --     require("opencode").setup {
  --       keymap_prefix = "<Leader>'",
  --     }
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     {
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         anti_conceal = { enabled = false },
  --         file_types = { "markdown", "opencode_output" },
  --       },
  --       ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
  --     },
  --     -- Optional, for file mentions and commands completion, pick only one
  --     "saghen/blink.cmp",
  --     -- 'hrsh7th/nvim-cmp',
  --
  --     -- Optional, for file mentions picker, pick only one
  --     "folke/snacks.nvim",
  --     -- 'nvim-telescope/telescope.nvim',
  --     -- 'ibhagwan/fzf-lua',
  --     -- 'nvim_mini/mini.nvim',
  --   },
  -- },
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
