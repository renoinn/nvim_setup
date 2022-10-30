local colorscheme = require 'lualine.themes.kanagawa'
require('lualine').setup {
    options = { theme = colorscheme },
    extensions = { 'neo-tree' }
}
