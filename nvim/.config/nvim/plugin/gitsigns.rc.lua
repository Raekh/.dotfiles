import('gitsigns', function(gitsigns)
    gitsigns.setup {
        -- signs = {
        --     add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        --     change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        --     delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        --     topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        --     changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        -- },
        signs = {
            add = {
                hl = "GitSignsAdd"   , text = "▍", numhl="GitSignsAddNr"   , linehl="GitSignsAddLn"
            },
            change = {
                hl = "GitSignsChange", text = "▍", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn"
            },
            delete = {
                hl = "GitSignsDelete", text = "▍", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn"
            },
            changedelete = {
                hl = "GitSignsChange", text = "▍", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn"
            },
            topdelete = {
                hl = "GitSignsDelete", text = "‾", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn"
            },
        },
        numhl = false,
        linehl = false,
        watch_gitdir = {
            interval = 1000,
            follow_files = true
        },
        diff_opts = {
            algorithm = 'histogram',
            internal = true,
            indent_heuristic = true,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        on_attach = function (bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", "]c", function ()
                if vim.wo.diff then return "]c" end
                vim.schedule(function ()
                    gs.next_hunk()
                    vim.cmd("norm! zz")
                end)
                return "<Ignore>"
            end, { expr = true })

            map("n", "[c", function ()
                if vim.wo.diff then return "[c" end
                vim.schedule(function ()
                    gs.prev_hunk()
                    vim.cmd("norm! zz")
                end)
                return "<Ignore>"
            end, { expr = true })

            -- Actions
            map("n", ";hs", gs.stage_hunk)
            map("n", ";hr", gs.reset_hunk)
            map("v", ";hs", function ()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end)
            map("v", ";hr", function ()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end)
            map("n", ";hS", gs.stage_buffer)
            map("n", ";hu", gs.undo_stage_hunk)
            map("n", ";hR", gs.reset_buffer)
            map("n", ";hp", gs.preview_hunk)
            map("n", ";hb", function() gs.blame_line{full=true} end)
            map("n", ";tb", gs.toggle_current_line_blame)
            map("n", ";td", gs.toggle_deleted)
        end
    }

    ---@param from string|string[] Syntax group name or a list of group names.
    ---@param to? string Syntax group name. (default: `"NONE"`)
    ---@param opt? hl.HiLinkSpec
    local hi_link = function(from, to, opt)
        if to and tostring(to):upper() == "NONE" then
            ---@diagnostic disable-next-line: cast-local-type
            to = -1
        end

        opt = vim.tbl_extend("keep", opt or {}, {
            force = true,
        }) --[[@as hl.HiLinkSpec ]]

        if type(from) ~= "table" then from = { from } end

        for _, f in ipairs(from) do
            if opt.clear then
                vim.api.nvim_set_hl(0, f, {})
            end

            vim.api.nvim_set_hl(0, f, {
                default = opt.default,
                link = to,
            })
        end
    end

    hi_link("GitSignsAdd", "diffAdded", { default = true })
    hi_link("GitSignsChange", "diffChanged", { default = true })
    hi_link("GitSignsDelete", "diffRemoved", { default = true })
end)
