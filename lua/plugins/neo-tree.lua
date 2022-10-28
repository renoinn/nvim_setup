-- neo-tree setup
require('neo-tree').setup({
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
    'filesystem',
    'buffers',
    'git_status',
  },
  sourse_selector = {
    winbar = true,
    statusline = true,
  },
})
