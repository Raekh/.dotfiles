local status, packer = pcall(require, 'packer')
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
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
    -- 	run = function () vim.fn["yarn install --frozen-lockfile --production"]() end
    -- }
    use 'MunifTanjim/eslint.nvim'
    use 'neoclide/vim-jsx-improve'
    -- Completion
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's builtin lsp
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'jose-elias-alvarez/null-ls.nvim' -- Use neovim as language server to inject lsp diagnostics, code actions and more
    -- Snippets
    use 'L3MON4D3/Luasnip' -- Snippets
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- QOL
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'lewis6991/gitsigns.nvim'
    use 'norcalli/nvim-colorizer.lua'
    -- use 'machakann/vim-highlightedyank'
    -- Telescope
    use 'nvim-lua/plenary.nvim' -- common utilities
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    -- Git
    use 'dinhhuy258/git.nvim' -- for git blame & browse
    -- Misc/Icons
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    -- Tabs/Spaces
    use 'lukas-reineke/indent-blankline.nvim'
    -- Themes
    use 'ellisonleao/gruvbox.nvim'
    use 'akinsho/nvim-bufferline.lua'
    use 'tiagovla/scope.nvim'
    use 'moll/vim-bbye'
    -- use 'romgrk/barbar.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
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
    --Utils
    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn["mkdp#util#install"]() end
    }
    use 'superhawk610/ascii-blocks.nvim'

    -- on trial
    use 'folke/tokyonight.nvim'
    use 'sindrets/diffview.nvim'
    use 'karb94/neoscroll.nvim'
    -- [[
    --	use {
    --		'svrana/neosolarized.nvim',
    --		requires = { 'tjdevries/colorbuddy.nvim' }
    --	}
    --
end)
