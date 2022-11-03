local conf = require('_set_config').conf

vim.cmd [[packadd packer.nvim]]

require 'packer'.startup(function()
    use { 'wbthomason/packer.nvim' }

    -- lsp
    use { 'neovim/nvim-lspconfig' }
    use {
        'williamboman/mason.nvim',
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        conf = conf 'mason-lspconfig'
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use {
        'kkharji/lspsaga.nvim',
        config = conf 'lspsaga'
    }
    use {
        'folke/trouble.nvim',
        config = conf 'trouble'
    }
    use {
        'j-hui/fidget.nvim',
        config = conf 'fidget'
    }
    use {
        'simrat39/symbols-outline.nvim',
        config = conf 'symbols-outline'
    }

    -- completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- color scheme
    -- use 'navarasu/onedark.nvim'
    use 'rebelot/kanagawa.nvim'

    -- ui plugins
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = conf 'lualine',
    }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        config = conf 'neo-tree',
        requires = {
            "nvim-lua/plenary.nvim",
            { 'kyazdani42/nvim-web-devicons', opt = true },
            "MunifTanjim/nui.nvim",
        }
    }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {
            'nvim-lua/plenary.nvim',
        }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = 'v3.1.0',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = conf 'bufferline',
    }

    -- utility plugins
    use {
        'RRethy/vim-illuminate',
        config = conf 'vim-illuminate'
    }
    use {
        'windwp/nvim-autopairs',
        config = conf 'nvim-autopairs'
    }
end)
