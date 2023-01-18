return {
    {
        "nvim-treesitter/playground",
    },
    {
        "chrisgrieser/nvim-various-textobjs",
        opts = {
            useDefaultKeymaps = true
        }
    },
    {
        "RRethy/nvim-treesitter-textsubjects",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            highlight = {
                enable = true,
                disable = {},
            },
            indent = {
                enable = true,
                disable = {},
            },
            ensure_installed = {
                'tsx',
                'lua',
                'json',
                'css',
            },
            autotag = {
                enable = true,
            },
            textsubjects = {
                enable = true,
                prev_selection = ',', -- (Optional) keymap to select the previous selection
                keymaps = {
                    ['.'] = 'textsubjects-smart',
                    [';'] = 'textsubjects-container-outer',
                    ['i;'] = 'textsubjects-container-inner',
                },
            },
            playground = {
                enable = true,
                disable = {},
                updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = 'o',
                    toggle_hl_groups = 'i',
                    toggle_injected_languages = 't',
                    toggle_anonymous_nodes = 'a',
                    toggle_language_display = 'I',
                    focus_language = 'f',
                    unfocus_language = 'F',
                    update = 'R',
                    goto_node = '<cr>',
                    show_help = '?',
                },
            }
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end
    }
}
