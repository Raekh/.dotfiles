return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-file-browser.nvim", build = "make" },
    },
    keys = {
        {
            ";f",
            function()
                require("telescope.builtin").find_files({
                    -- path = "%:p:h",
                    -- cwd = telescope_buffer_dir(),
                    no_ignore = false,
                    hidden = true,
                    grouped = true,
                })
            end,
            desc = "Find files",
        },
        {
            ";r",
            function()
                require("telescope.builtin").live_grep()
            end,
        },
        {
            "\\\\",
            function()
                require("telescope.builtin").buffers()
            end,
        },
        {
            ";t",
            function()
                require("telescope.builtin").help_tags()
            end,
        },
        {
            ";;",
            function()
                require("telescope.builtin").resume()
            end,
        },
        {
            ";e",
            function()
                require("telescope.builtin").diagnostics()
            end,
        },
        {
            "sf",
            function()
                local function telescope_buffer_dir()
                    return vim.fn.expand("%:p:h")
                end

                require("telescope").extensions.file_browser.file_browser({
                    path = "%:p:h",
                    cwd = telescope_buffer_dir(),
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    -- previewer = false,
                    initial_mode = "normal",
                    layout_config = { height = 39 },
                })
            end,
        },
    },
    --   opts = {
    --   	defaults = {
    --   		mappings = {
    --   			n = {
    --   				['q'] = require('telescope').actions.close
    --   			}
    --   		}
    --   	},
    --   	extensions = {
    --   		file_browser = {
    --   			theme = 'dropdown',
    --   			-- disables netrw and use telescope instead
    --   			hijack_netrw = true,
    --   			mappings = {
    --   				-- custom insert mode mappings
    --   				['i'] = {
    --   					['<C-w>'] = function() vim.cmd('normal vbd') end,
    --   				},
    --   				['n'] = {
    --   					['N'] = require('telescope').extensions.file_browser.action.create,
    --   					['h'] = require('telescope').extensions.file_browser.action.goto_parent_dir,
    --   					['l'] = require('telescope').extensions.file_browser.action.change_cwd,
    --   					['/'] = function()
    --                           vim.cmd('startinsert')
    --   					end,
    --   				},
    --   			}
    --   		}
    --   	}
    --   },
    --   end
}
