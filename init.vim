syntax on
set number
set title
set showmode
set showmatch 
set ignorecase
set wrapscan
set termguicolors

" tabspace
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

" encoding
set encoding=utf-8
set fileencodings=utf-8
set fileencodings+=iso-2022-jp,euc-jp,cp932
set fileformats=unix

let mapleader = "\<Space>"

inoremap ,df  <C-r>=strftime('%Y-%m-%d %H:%M:%S')<Return>

nnoremap <c-w><c-t> :NeoTreeShow<cr>
nnoremap <c-w><c-g> :NeoTreeFloatToggle git_status<cr>
nnoremap j gj
nnoremap k gk
nnoremap <c-l> <c-w><c-l>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-f> gt<cr>
nnoremap <c-b> gT<cr>
nnoremap <c-e> $
nnoremap <c-a> 0

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>


lua <<EOF
--local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>da', '<cmd>Lspsaga code_action<cr>')
vim.keymap.set('n', '<space>dr', '<cmd>Lspsaga rename<cr>')
vim.keymap.set('n', '<space>ds', '<cmd>Lspsaga show_line_diagnostics<cr>')
vim.keymap.set('n', 'K', '<cmd>Lspsaga show_line_diagnostics<cr>')

local map = vim.api.nvim_buf_set_keymap
--map(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
--map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
--map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
--map(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
--map(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
EOF

lua <<EOF
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
EOF

lua <<EOF
require 'plugins'
require 'theme'
require 'statusline'
require 'cmp_settings'
EOF

