"let g:pathogen_disabled = []
""if !has('gui_running')
""   call add(g:pathogen_disabled, 'powerline')
""endif
"
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()


" General Settings

" Vundle Setup {
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'taglist.vim'
Bundle 'vim-orgmode'

filetype plugin indent on " filetype-specific indenting and plugins
" }

set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost .vimrc PowerlineReloadColorscheme

syntax enable		" syntax highlight
set background=dark
colorscheme solarized

set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu
set mouse=a

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
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

"" status line {
set laststatus=2
let g:Powerline_cache_file=expand('$HOME/.vim/g:Powerline.cache')
""}

"" Orgmode Settings {
let g:org_heading_shade_leading_stars=1
au FileType org hi NonText ctermfg=0
""}

" Key Bindings {
nmap ; :
let mapleader=","
let g:mapleader=","

map <leader>v :new ~/.vimrc<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>t :TlistToggle<CR>
"}
