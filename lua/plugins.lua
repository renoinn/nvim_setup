vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
  use{'wbthomason/packer.nvim', opt = true}

  -- use{'fatih/vim-go', opt = true, ft = {'go'}}

  -- lsp plugins
  use{'neovim/nvim-lspconfig'}
  use{'williamboman/mason.nvim'}
  use{'williamboman/mason-lspconfig.nvim'}

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- color scheme
  use 'navarasu/onedark.nvim'
  use 'rebelot/kanagawa.nvim'

  -- ui plugins
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }
  use 'RRethy/vim-illuminate'
  use {
	"windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {
        disable_filetype = { "TelescopePrompt", },
      }
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  --[[
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly'
  }
  ]]--
  use 'sidebar-nvim/sidebar.nvim'

end)

-- mason settings
require('mason').setup()
require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers {
  function (server_name) -- default handler (optional)
    require('lspconfig')[server_name].setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = on_attach
    }
  end,
}

-- neo-tree setup
require("neo-tree").setup({
  enable_git_status = true,
  enable_diagnostics = true,
  sort_case_insensitive = false,
  window = {
    width = 30
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
    }
  },
  sources = {
    "filesystem",
    "buffers",
    "git_status",
  },
  sourse_selector = {
    winbar = true,
    statusline = true,
  },
})

-- vim-illuminate 
require('illuminate').configure({
  providers = {
    'lsp',
    'treesitter',
    'regex',
  },
})

-- nvim-tree setup using defaults
--[[
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
]]--

-- sidebar-nvim setup
require("sidebar-nvim").setup({
  opt = true,
  disable_default_keybindings = 0,
  bindings = nil,
  open = false,
  side = "right",
  initial_width = 35,
  hide_statusline = false,
  update_interval = 1000,
  sections = { "datetime", "git", "diagnostics", "symbols" },
  section_separator = {"", "-----", ""},
  section_title_separator = {""},
  containers = {
      attach_shell = "/bin/sh", show_all = true, interval = 5000,
  },
  datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
  todos = { ignored_paths = { "~" } },
  files = {
    icon = "",
    show_hidden = true,
    ignored_paths = {"%.git$"}
  },
  symbols = {
    icon = "ƒ",
  }
})
