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

inoremap ,df  <C-r>=strftime('%Y-%m-%d %H:%M:%S')<Return>

nnoremap <c-w><c-t> :NeoTreeShow<cr>
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

