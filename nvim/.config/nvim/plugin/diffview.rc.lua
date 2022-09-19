local status,_ = pcall(require, 'diffview')
if (not status) then return end

local actions = require'diffview.actions'

require('diffview').setup({
    diff_binaries = false,
    enhanced_diff_hl = true,
    git_cmd = { "git" },
    use_icons = true,
    icons = {
        folder_closed = "",
        folder_open = "",
    },
    signs = {
        fold_closed = "",
        fold_open = "",
    },
    view = {
        merge_tool = {
            layout = "diff3_mixed",
            disable_diagnostics = true,
        },
    },
    file_panel = {
        listing_style = "tree",
        tree_options = {
            flatten_dirs = true,
            folder_statuses = "only_folded",
        },
        win_config = {
            position = "left",
            width = 35,
        },
    },
    file_history_panel = {
        log_options = {
            single_file = {
                diff_merges = "combined",
            },
            multi_file = {
                diff_merges = "first-parent",
            },
        },
        win_config = {
            position = "bottom",
            height = 16,
        },
    },
    commit_log_panel = {
        win_config = {},
    },
    default_args = {
        DiffviewOpen = {},
        DiffviewFileHistory = {},
    },
    hooks = {
        -----@param view StandardView
        view_opened = function(view)
            local function handle_windows()
                local status, windows = pcall(require, 'windows')
                if (not status) then return end

                -- vim.cmd [[ :WindowsDisableAutowidth ]]
            end

            view.emitter:on("post_layout", handle_windows)
            handle_windows()
        end,
        view_closed = function(view)
            local function handle_windows()
                local status, windows = pcall(require, 'windows')
                if (not status) then return end

                -- vim.cmd [[ :WindowsEnableAutowidth ]]
            end

            view.emitter:on("post_layout", handle_windows)
            handle_windows()
        end
        --diff_buf_read = function(bufnr)
        --    -- Disable some performance heavy stuff in long files.
        --    if vim.api.nvim_buf_line_count(bufnr) >= 2500 then
        --        vim.cmd("IndentBlanklineDisable")
        --    end
        --end,
    },
    keymaps = {
        view = {
            ["gf"] = actions.goto_file_edit,
            ["-"] = actions.toggle_stage_entry,
        },
        file_panel = {
            ["<cr>"] = actions.focus_entry,
            ["s"] = actions.toggle_stage_entry,
            ["gf"] = actions.goto_file_edit,
            ["?"] = "<Cmd>h diffview-maps-file-panel<CR>",
        },
        file_history_panel = {
            ["<cr>"] = actions.focus_entry,
            ["gf"] = actions.goto_file_edit,
            ["?"] = "<Cmd>h diffview-maps-file-history-panel<CR>",
        },
    }
})


vim.keymap.set('n', ';dv', '<Cmd>DiffviewOpen<CR>')
vim.keymap.set('n', ';dc', '<Cmd>DiffviewClose<CR>')
vim.keymap.set('n', ';dt', '<Cmd>DiffviewToggleFiles<CR>')
vim.keymap.set('n', ';dh', '<Cmd>DiffviewFileHistory<CR>')
vim.keymap.set('n', ';df', '<Cmd>DiffviewFileHistory %<CR>')
vim.keymap.set('n', ';dr', '<Cmd>DiffviewRefresh<CR>')
