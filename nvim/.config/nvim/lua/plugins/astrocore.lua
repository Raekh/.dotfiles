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
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
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
      n = {
        -- Disable disgusting mappings
        ["<C-q>"] = false,
        ["<C-s>"] = false,
        -- navigate buffer tabs with `H` and `L`
        -- NOTE: Removing this but keeping it for the interesting factor
        -- L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        -- H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Buffers
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

        -- Lsp

        ["<Leader>l"] = { name = "LSP" },
        ["<Leader>lt"] = { "<cmd>LspRestart<cr>", desc = "Restart LSP" },

        ["]q"] = { "<cmd>cnext<CR>", desc = "Next quickfix list entry" },
        ["[q"] = { "<cmd>cprev<CR>", desc = "Previous quickfix list entry" },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        -- Registers
        ["<Leader>r"] = { name = "Registers" },
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
        ["<Leader>D"] = { name = "Diffview" },
        ["<Leader>a"] = { name = "Swap with previous..." },
        ["<Leader>s"] = { name = "Swap with next..." },
      },
      v = {
        [">"] = { ">gv" },
        ["<"] = { "<gv" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
