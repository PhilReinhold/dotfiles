set nocompatible

set visualbell

" Initialize vim-plug (https://github.com/junegunn/vim-plug)
call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tomasr/molokai'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

set shiftwidth=4
set tabstop=4
set expandtab
colorscheme molokai

let mapleader = ","
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>f :Files<CR>
nnoremap gd :tjump<CR>

let g:gutentags_file_list_command = 'rg --files'

autocmd!bufwritepost .vimrc source %

