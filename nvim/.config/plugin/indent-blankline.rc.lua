import('indent_blankline', function(ib)
    vim.opt.list = true
    ib.setup{
        show_current_context = true,
        show_current_context_start = true,
    }
    vim.g.indent_blankline_filetype_exclude = {
        "help",
        "startify",
        "dashboard",
        "alpha",
        "packer",
        "NeogitStatus",
        "NeogitCommitView",
        "NeogitPopup",
        "NeogitLogView",
        "NeogitCommitMessage",
        "man",
        "sagasignature",
        "sagahover",
        "lspsagafinder",
        "LspSagaCodeAction",
        "TelescopePrompt",
        "NvimTree",
        "Trouble",
        "DiffviewFiles",
        "DiffviewFileHistory",
        "Outline",
        "lspinfo",
        "fugitive",
        "norg",
    }
end)
