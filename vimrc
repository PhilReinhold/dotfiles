" General Settings

" Vundle Setup {
set nocompatible
syntax on
filetype off

if has("win32")
  set rtp+=~/vimfiles/bundle/Vundle.vim
  let path='~/vimfiles/bundle'
  call vuncle#begin(path)
else
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vividchalk'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'elixir-lang/vim-elixir'
Plugin 'tomasr/molokai'
Plugin 'Shougo/unite.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'endel/vim-github-colorscheme'
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tikhomirov/vim-glsl'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'tommcdo/vim-exchange'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'
Plugin 'digitaltoad/vim-jade'

call vundle#end()
filetype plugin indent on " filetype-specific indenting and plugins
" }

let g:airline_theme='luna'
let g:airline_powerline_fonts=1
let g:bufferline_echo = 0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

set background=dark
let g:molokai_original=1
let g:rehash256=1
set t_Co=256
colorscheme molokai

set cursorline
set cuc cul
set laststatus=2

set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside

if $TMUX == ''          " yank to system register (*) by default
    set clipboard=unnamed
endif
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu
set mouse=a             " mouse everywhere possible
set wildignore=*.o,*.class,*.pyc " ignore these files while expanding wild chars
set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context
set noerrorbells        " disable sound on errors
set foldlevelstart=3
set novisualbell
set t_vb=
set tm=500

" Auto Completion {
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview
set omnifunc=syntaxcomplete#Complete

"let g:ycm_autoclose_preview_window_after_completion = 1
"}

" TAB setting{
set expandtab        "replace <TAB> with spaces
set softtabstop=2
set shiftwidth=2

au FileType Makefile set noexpandtab
au FileType markdown set textwidth=80
"}

" Key Bindings {
nmap ; :
let mapleader=","
let g:mapleader=","

map <leader>v :e ~/.vimrc<CR>
map <leader>nt :NERDTreeToggle<CR>
map <leader>tb :TagbarToggle<CR>
map <leader>sw :StripWhitespace<CR>
"}

" LaTeX-Suite {
let g:tex_flavor='latex'
"}

" UltiSnips {
"let g:UltiSnipsExpandTrigger="<C-s>"
"let g:UltiSnipsJumpForwardTrigger="<C-n>"
"let g:UltiSnipsJumpBackwardTrigger="<C-p>"
"}

autocmd FileType cpp set commentstring=//%s

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{Warn: %fw #%w}]'
let g:tagbar_compact = 1

command! DiffAgainstFileOnDisk call DiffAgainstFileOnDisk()

function! DiffAgainstFileOnDisk()
  :w! /tmp/working_copy
  exec "!diff /tmp/working_copy %"
endfunction


let g:pymode_lint_on_write = 0
let g:pymode_doc = 0
let g:pymode_rope_lookup_project = 0
set completeopt=menu
