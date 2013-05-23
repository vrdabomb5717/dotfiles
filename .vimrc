set virtualedit=onemore
set undofile
set ruler
"set shellcmdflag=-ic
set nu
set sh=/usr/local/bin/bash\ --rcfile\ ~/.bash_profile
set hlsearch
set incsearch
set modeline

nnoremap <CR> :noh<CR><CR>

syntax on
filetype indent plugin on
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on

execute pathogen#infect()
