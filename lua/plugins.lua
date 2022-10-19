vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
  -- opt オプションを付けると遅延読み込みになります。
  -- この場合は opt だけで読み込む契機を指定していないため、
  -- `packadd` コマンドを叩かない限り読み込まれることはありません。
  use{'wbthomason/packer.nvim', opt = true}
  -- packer.nvim 自体を遅延読み込みにする理由はまた後ほど。

  -- 特定のファイルタイプのファイルを開いたら読み込む
  -- use{'fatih/vim-go', opt = true, ft = {'go'}}
  
  use{'neovim/nvim-lspconfig'}
  use{'williamboman/mason.nvim'}
  use{'williamboman/mason-lspconfig.nvim'}

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- color scheme
  use 'navarasu/onedark.nvim'

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
  --[[
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly'
  }
  ]]--
  --use 'sidebar-nvim/sidebar.nvim'

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
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
    }
  }
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
--[[
require("sidebar-nvim").setup({
  opt = true,
  disable_default_keybindings = 0,
  bindings = nil,
  open = false,
  side = "left",
  initial_width = 35,
  hide_statusline = false,
  update_interval = 1000,
  sections = { "datetime", "git", "diagnostics" },
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
})
]]--