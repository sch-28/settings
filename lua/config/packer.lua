-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]



return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        "tversteeg/registers.nvim",
        config = function()
            require("registers").setup()
        end,
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope-live-grep-args.nvim' } }
    }

    -- use({
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- })
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate', commit = "f861bc6148e7bc715f6a09bd34bb1f577b62a248" })
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use('folke/neodev.nvim')
    -- use('prettier/vim-prettier', { run = 'npm i --frozen-lockfile --production' })

    use('tpope/vim-surround')
    -- use('tpope/vim-commentary')
    use('nvim-tree/nvim-web-devicons')
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end
    }
    use('github/copilot.vim')
    use('EdenEast/nightfox.nvim')
    use('f-person/git-blame.nvim')

    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')
    use('nvim-treesitter/nvim-treesitter-context')
    use('rbong/vim-flog')
    use('JoosepAlviste/nvim-ts-context-commentstring')
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            })
        end
    }
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use('justinmk/vim-sneak')
    use { 'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons", config = function() require("trouble").setup {} end }
    use('mattn/emmet-vim')
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use {
        "pmizio/typescript-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    }
    use('David-Kunz/gen.nvim')
    use('neomake/neomake')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        "dustinblackman/oatmeal.nvim",
        config = function()
            require("oatmeal").setup({
                backend = "ollama",
                model = "codellama:latest",
            })
        end
    }
    use('nvim-pack/nvim-spectre')
    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })
    use('mrjones2014/smart-splits.nvim')
    -- use('OmniSharp/omnisharp-vim')
    use('folke/which-key.nvim')
end)
