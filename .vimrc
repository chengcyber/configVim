" type "za" for fold and unfold
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" required
set nocompatible        " be improved required
filetype off            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Editor Settings ---------------------- {{{
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set tabstop=2           " number of spaces a tab counts for
set shiftwidth=2        " spaces of autoindents
set expandtab           " turn a tab into spaces
set smarttab            " smart tabl handling for indenting
set smartindent         " smart auto indent
set ruler               " show the cursor position
set number              " show line number
set cursorline          " highlight current line
set laststatus=2        " always show status line
syntax on
" }}}

" Search Settings ---------------------- {{{
set hlsearch            " highlight matches
set incsearch           " highlight dynamically as pattern is typed
set smartcase           " but become case sensitive if you type uppercase characters
set ignorecase          " searches are case insentitve
" }}}

" Mapping Settings ---------------------- {{{
:let mapleader = ","
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
" Auto quote a word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" Insert Mode Mapping
inoremap jk <esc>
" Operator Pending Mapping
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il} :<c-u>normal! F}vi{<cr>
" }}}
