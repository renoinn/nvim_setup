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

lua <<EOF
require 'plugins'
require 'theme'
require 'cmp_settings'
require 'keymapping'
EOF

