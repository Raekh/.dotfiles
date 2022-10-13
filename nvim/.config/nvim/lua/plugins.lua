local status, packer = pcall(require, 'packer')
if (not status) then
    print('Packer is not installed')
    return
end

vim.cmd [[packadd packer.nvim]]

packer.init({
    max_jobs = 20
})

packer.startup(function(use)
    use 'lewis6991/impatient.nvim'
    -- Packer
    use 'wbthomason/packer.nvim'
    -- Lsp
    use 'glepnir/lspsaga.nvim' -- LSP UIs
    use 'neovim/nvim-lspconfig' -- LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'MunifTanjim/prettier.nvim' -- Prettier plugin for builtin Neovim lsp
    -- use {
    -- 	'prettier/vim-prettier',
    -- 	run = function () vim.fn['yarn install --frozen-lockfile --production']() end
    -- }
    use 'MunifTanjim/eslint.nvim'
    use 'neoclide/vim-jsx-improve'
    -- Completion
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's builtin lsp
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'jose-elias-alvarez/null-ls.nvim' -- Use neovim as language server to inject lsp diagnostics, code actions and more
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    -- Snippets
    use 'L3MON4D3/Luasnip' -- Snippets
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'RRethy/nvim-treesitter-textsubjects'
    -- QOL
    use 'karb94/neoscroll.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'lewis6991/gitsigns.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'vigoux/notifier.nvim'
    use 'Djancyp/better-comments.nvim' -- Okay, but maybe try to change colors automatically. Colorizer/Theme plugin maybe ?
    -- use 'machakann/vim-highlightedyank'
    -- Telescope
    use 'nvim-lua/plenary.nvim' -- common utilities
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    -- Git
    use 'dinhhuy258/git.nvim' -- for git blame & browse
    use 'sindrets/diffview.nvim'
    -- Misc/Icons
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    -- Tabs/Spaces
    use 'lukas-reineke/indent-blankline.nvim'
    -- Themes
    use 'folke/tokyonight.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'akinsho/nvim-bufferline.lua'
    use 'tiagovla/scope.nvim'
    use 'moll/vim-bbye'
    use 'kazhala/close-buffers.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'

    -- tpope
    use 'tpope/vim-commentary'
    use 'tpope/vim-abolish'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-projectionist'
    use 'tpope/vim-dadbod'
    use 'tpope/vim-surround'
    use 'wellle/targets.vim'
    use 'AckslD/nvim-revJ.lua'
    use 'AndrewRadev/dsf.vim'
    --Utils
    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end
    }
    use 'superhawk610/ascii-blocks.nvim'
    use 'kyazdani42/nvim-tree.lua'
    -- on trial
    use 'glepnir/dashboard-nvim'
    use 'jayp0521/mason-null-ls.nvim'
    use 'ldelossa/buffertag'
    use 'sindrets/winshift.nvim'
    use 'phaazon/mind.nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'code-biscuits/nvim-biscuits'
    use 'potamides/pantran.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'NMAC427/guess-indent.nvim'
    use 'ziontee113/color-picker.nvim'
    use 'petertriho/nvim-scrollbar'
    use 'anuvyklack/middleclass'
    use 'anuvyklack/animation.nvim'
    use {
        'anuvyklack/windows.nvim',
        requires = {
            'anuvyklack/middleclass',
            'anuvyklack/animation.nvim'
        }
    }
    use 'nacro90/numb.nvim'
    use { 'bennypowers/nvim-regexplainer',
        requires = {
            'nvim-treesitter/nvim-treesitter',
            'MunifTanjim/nui.nvim',
        }
    }
    use 'danymat/neogen'
    use 'axkirillov/easypick.nvim'
    use {
        'lewis6991/spaceless.nvim',
        config = function()
            require'spaceless'.setup()
        end
    }
    use 'ja-ford/delaytrain.nvim'

    -- use 'alec-gibson/nvim-tetris'
    -- use 'seandewar/nvimesweeper'
    -- Might be useful later
    -- use 'AckslD/nvim-FeMaco.lua' -- ~ cannot save code, only useful for viewing with syntax
    -- use { '0x100101/lab.nvim', -- Good, but needs node 16.10.0+ to run. Not ideal...
    --     run = 'cd js && npm ci'
    -- }
    -- use 'gaoDean/autolist.nvim' -- Seems to be causing issues sometimes
end)
