syntax on
set number
set title
"set autoindent
set showmode
set showmatch 
set ignorecase
set wrapscan
set encoding=utf-8
set fileencodings=utf-8
set fileencodings+=iso-2022-jp,euc-jp,cp932
set fileformats=unix
"set wildmode=list:longest
"set ambiwidth=double
set termguicolors

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ,df  <C-r>=strftime('%Y-%m-%d %H:%M:%S')<Return>

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
require 'plugins'
require 'theme'
require 'statusline'
require 'cmp_settings'
EOF

