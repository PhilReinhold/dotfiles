" General Settings

" Vundle Setup {
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-distinguished'
"Bundle 'Lokaltog/vim-powerline'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'taglist.vim'
Bundle 'mattn/emmet-vim'
Plugin 'endel/vim-github-colorscheme'
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'


call vundle#end()
filetype plugin indent on " filetype-specific indenting and plugins
" }


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax enable		" syntax highlight
set background=dark
colorscheme github

set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside

set clipboard=unnamed	" yank to the system register (*) by default
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
set novisualbell
set t_vb=
set tm=500

" TAB setting{
set expandtab        "replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4

au FileType Makefile set noexpandtab
au FileType markdown set textwidth=80
"}      							

" Key Bindings {
nmap ; :
let mapleader=","
let g:mapleader=","

map <leader>v :new ~/.vimrc<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>t :TlistToggle<CR>
"}

" LaTeX-Suite {
let g:tex_flavor='latex'
" }

" Powerline {
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" }
