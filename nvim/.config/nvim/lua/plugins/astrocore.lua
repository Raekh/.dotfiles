-- vim:fileencoding=utf-8:foldmethod=marker
-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapLeader` and `maplocalLeader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      i = {
        ["<C-J>"] = { "copilot#Accept(<Tab>)", silent = true, expr = true, script = true },
      },
      n = {
        -- Disabled mappings {{{
        ["<C-q>"] = false,
        -- }}}
        -- Buffers {{{
        ["<Leader>b"] = { desc = "Buffers" },
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        ["<Leader>bh"] = { "<cmd>Bdelete hidden<cr>", desc = "Close hidden buffers" },
        ["<Leader>bH"] = { "<cmd>Bwipeout hidden<cr>", desc = "Wipeout hidden buffers" },
        -- }}}
        -- Registers {{{
        ["<Leader>r"] = { desc = "Registers" },
        ["<Leader>rc"] = {
          function()
            for i = 34, 122 do
              local reg_name = string.char(i)
              pcall(vim.fn.setreg, reg_name, "")
            end
            print "All user registers cleared."
          end,
          desc = "Clear registers",
        },
        -- }}}
        -- Git {{{
        -- Gitlab.nvim {{{
        ["glh"] = {
          "<CMD>lua require('gitlab').move_to_discussion_tree_from_diagnostic()<CR>",
          desc = "Move to discussion",
        },
        -- }}}
        -- Diffview {{{
        ["<Leader>D"] = { name = "Diffview" },

        ["<Leader>Do"] = { "<CMD>DiffviewOpen<CR>", desc = "Diffview: Open" },
        ["<Leader>Dc"] = { "<CMD>DiffviewClose<CR>", desc = "Diffview: Close" },
        ["<Leader>Dl"] = { "<CMD>DiffviewLog<CR>", desc = "Diffview: Log" },
        ["<Leader>Dr"] = { "<CMD>DiffviewRefresh<CR>", desc = "Diffview: Refresh" },
        ["<Leader>Df"] = { "<CMD>DiffviewFocusFiles<CR>", desc = "Diffview: Focus files" },
        ["<Leader>Dh"] = { "<CMD>DiffviewFileHistory<CR>", desc = "Diffview: File history" },
        ["<Leader>DH"] = { "<CMD>DiffviewFileHistory %<CR>", desc = "Diffview: Current file history" },
        ["<Leader>Dt"] = { "<CMD>DiffviewToggleFiles<CR>", desc = "Diffview: Toggle files" },
        -- }}}
        -- }}}
        -- LSP {{{
        ["<Leader>lt"] = { "<cmd>LspRestart<cr>", desc = "Restart LSP" },
        -- }}}
        -- Neorg {{{
        ["<Leader>N"] = { name = "Neorg" },
        ["<Leader>Nj"] = { "<cmd>Neorg journal<cr>", desc = "Journal" },
        ["<Leader>Ni"] = { "<cmd>Neorg index<cr>", desc = "Index" },
        ["<Leader>Nr"] = { "<cmd>Neorg return<cr>", desc = "Return" },
        ["<Leader>Nw"] = { "<cmd>Neorg workspace<cr>", desc = "Show workspace" },
        ["<Leader>Nc"] = {
          "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<cr>",
          desc = "Magnify code block",
        },
        ["<Leader>Ng"] = { "<cmd>Neorg generate-workspace-summary<cr>", desc = "Generate workspace summary" },
        ["<Leader>Nm"] = { "<cmd>Neorg inject-metadata<cr>", desc = "Inject metadata" },
        ["<Leader>NC"] = { "<cmd>Neorg toggle-concealer<cr>", desc = "Toggle concealer" },
        ["<Leader>Nn"] = { "<cmd>Neorg keybind norg core.dirman.new.note<CR>", desc = "Create new note" },
        -- }}}
        -- Neotree {{{
        ["<Leader>z"] = { name = "Neotree" },

        -- Neotree filesystem {{{
        ["<Leader>ze"] = { name = "File system" },

        ["<Leader>zeh"] = { "<cmd>Neotree filesystem reveal left<CR>", desc = "Reveal left" },
        ["<Leader>zeH"] = { "<cmd>Neotree filesystem toggle left<CR>", desc = "Toggle left" },
        ["<Leader>zej"] = { "<cmd>Neotree filesystem reveal bottom<CR>", desc = "Reveal bottom" },
        ["<Leader>zeJ"] = { "<cmd>Neotree filesystem toggle bottom<CR>", desc = "Toggle bottom" },
        ["<Leader>zel"] = { "<cmd>Neotree filesystem reveal right<CR>", desc = "Reveal right" },
        ["<Leader>zeL"] = { "<cmd>Neotree filesystem toggle right<CR>", desc = "Toggle right" },
        ["<Leader>zek"] = { "<cmd>Neotree filesystem reveal top<CR>", desc = "Reveal top" },
        ["<Leader>zeK"] = { "<cmd>Neotree filesystem toggle top<CR>", desc = "Toggle top" },
        ["<Leader>zec"] = { "<cmd>Neotree filesystem reveal current<CR>", desc = "Open in current buffer" },

        ["<Leader>zeo"] = { "<cmd>Neotree filesystem focus<CR>", desc = "Focus" },
        ["<Leader>zef"] = { "<cmd>Neotree filesystem float<CR>", desc = "Float" },

        ["<Leader>zE"] = { name = "File system (force cwd)" },

        ["<Leader>zEh"] = { "<cmd>Neotree filesystem reveal_force_cwd left<CR>", desc = "Reveal left (cwd)" },
        ["<Leader>zEj"] = { "<cmd>Neotree filesystem reveal_force_cwd bottom<CR>", desc = "Reveal bottom (cwd)" },
        ["<Leader>zEl"] = { "<cmd>Neotree filesystem reveal_force_cwd right<CR>", desc = "Reveal right (cwd)" },
        ["<Leader>zEk"] = { "<cmd>Neotree filesystem reveal_force_cwd top<CR>", desc = "Reveal top (cwd)" },
        -- }}}

        -- Neotree buffers {{{
        ["<Leader>zb"] = { name = "Buffers" },

        ["<Leader>zbh"] = { "<cmd>Neotree buffers reveal left<CR>", desc = "Reveal left" },
        ["<Leader>zbH"] = { "<cmd>Neotree buffers toggle left<CR>", desc = "Toggle left" },
        ["<Leader>zbj"] = { "<cmd>Neotree buffers reveal bottom<CR>", desc = "Reveal bottom" },
        ["<Leader>zbJ"] = { "<cmd>Neotree buffers toggle bottom<CR>", desc = "Toggle bottom" },
        ["<Leader>zbl"] = { "<cmd>Neotree buffers reveal right<CR>", desc = "Reveal right" },
        ["<Leader>zbL"] = { "<cmd>Neotree buffers toggle right<CR>", desc = "Toggle right" },
        ["<Leader>zbk"] = { "<cmd>Neotree buffers reveal top<CR>", desc = "Reveal top" },
        ["<Leader>zbK"] = { "<cmd>Neotree buffers toggle top<CR>", desc = "Toggle top" },
        ["<Leader>zbc"] = { "<cmd>Neotree buffers reveal current<CR>", desc = "Open in current buffer" },

        ["<Leader>zbo"] = { "<cmd>Neotree buffers focus<CR>", desc = "Focus" },
        ["<Leader>zbf"] = { "<cmd>Neotree buffers float<CR>", desc = "Float" },
        -- }}}

        -- Neotree git status {{{
        ["<Leader>zg"] = { name = "Git status" },

        ["<Leader>zgh"] = { "<cmd>Neotree git_status reveal left<CR>", desc = "Reveal left" },
        ["<Leader>zgH"] = { "<cmd>Neotree git_status toggle left<CR>", desc = "Toggle left" },
        ["<Leader>zgj"] = { "<cmd>Neotree git_status reveal bottom<CR>", desc = "Reveal bottom" },
        ["<Leader>zgJ"] = { "<cmd>Neotree git_status toggle bottom<CR>", desc = "Toggle bottom" },
        ["<Leader>zgl"] = { "<cmd>Neotree git_status reveal right<CR>", desc = "Reveal right" },
        ["<Leader>zgL"] = { "<cmd>Neotree git_status toggle right<CR>", desc = "Toggle right" },
        ["<Leader>zgk"] = { "<cmd>Neotree git_status reveal top<CR>", desc = "Reveal top" },
        ["<Leader>zgK"] = { "<cmd>Neotree git_status toggle top<CR>", desc = "Toggle top" },
        ["<Leader>zgc"] = { "<cmd>Neotree git_status reveal current<CR>", desc = "Open in current buffer" },

        ["<Leader>zgo"] = { "<cmd>Neotree git_status focus<CR>", desc = "Focus" },
        ["<Leader>zgf"] = { "<cmd>Neotree git_status float<CR>", desc = "Float" },
        -- }}}

        -- Neotree git status {{{
        ["<Leader>zd"] = { name = "Diagnostics" },

        ["<Leader>zdh"] = { "<cmd>Neotree diagnostics reveal left<CR>", desc = "Reveal left" },
        ["<Leader>zdH"] = { "<cmd>Neotree diagnostics toggle left<CR>", desc = "Toggle left" },
        ["<Leader>zdj"] = { "<cmd>Neotree diagnostics reveal bottom<CR>", desc = "Reveal bottom" },
        ["<Leader>zdJ"] = { "<cmd>Neotree diagnostics toggle bottom<CR>", desc = "Toggle bottom" },
        ["<Leader>zdl"] = { "<cmd>Neotree diagnostics reveal right<CR>", desc = "Reveal right" },
        ["<Leader>zdL"] = { "<cmd>Neotree diagnostics toggle right<CR>", desc = "Toggle right" },
        ["<Leader>zdk"] = { "<cmd>Neotree diagnostics reveal top<CR>", desc = "Reveal top" },
        ["<Leader>zdK"] = { "<cmd>Neotree diagnostics toggle top<CR>", desc = "Toggle top" },
        ["<Leader>zdc"] = { "<cmd>Neotree diagnostics reveal current<CR>", desc = "Open in current buffer" },

        ["<Leader>zdo"] = { "<cmd>Neotree diagnostics focus<CR>", desc = "Focus" },
        ["<Leader>zdf"] = { "<cmd>Neotree diagnostics float<CR>", desc = "Float" },
        -- }}}

        ["<Leader>ah"] = { "<cmd>MCPHub<CR>", desc = "MCPHub" },
        -- ["<Leader>aa"] = { "<cmd>CodeCompanion<CR>", desc = "Code Companion" },
        -- ["<Leader>ac"] = { "<cmd>CodeCompanionCmd<CR>", desc = "Code Companion Command" },
        -- ["<Leader>aC"] = { "<cmd>CodeCompanionChat<CR>", desc = "Code Companion Chat" },
        -- ["<Leader>aA"] = { "<cmd>CodeCompanionActions<CR>", desc = "Code Companion Actions" },

        ["<Leader>ue"] = { "<cmd>ASToggle<CR>", desc = "Toggle autosave" },
        -- }}}
      },
      v = {
        [">"] = { ">gv" },
        ["<"] = { "<gv" },
        -- ["<Leader>ai"] = { ":Gen<CR>", desc = "AI Generate" },
        -- ["<Leader>ac"] = { ":Gen Chat<CR>", desc = "AI Chat" },
        -- ["<Leader>ae"] = { ":Gen Enhance_Code<CR>", desc = "AI Enhance Code" },
        -- ["<Leader>ar"] = { ":Gen Review_Code<CR>", desc = "AI Review Code" },
      },
    },
  },
}
