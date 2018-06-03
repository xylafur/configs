"------------------------------------------------------------------------------
"------GENERAL-----------------------------------------------------------------
"------------------------------------------------------------------------------
set nocompatible                "be iMproved, required
filetype on                     "required
syntax enable
"set encoding utf-8
set backspace=indent,eol,start  "add ability to backspace
"set backup
"set backupdir=~/.vim/tmp/backup
"set directory=~/.vim/timp/swap  "where to put swap files
"set undodir=~/.vim/tmp/undo
set undofile                    "makes undo possible after you close the file
set t_BE= "this is supposed to fix the issue where when I exit vim copy / paste don't work
set background=dark
set clipboard+=unnamed,unnamedplus,autoselect      "share clipbopard
"------------------------------------------------------------------------------
"------UI----------------------------------------------------------------------
"------------------------------------------------------------------------------
colorscheme elflord
set number
set relativenumber
set ruler                       "Show cursor at all times
set showcmd
set cursorline
set mouse=a
set incsearch                   "incremental search, aka as you type
set hlsearch
set ignorecase
set smartcase                   "Case sensitive when startin with uppercase
set list
set listchars=tab:>-
set wildmenu
set laststatus=2                "displays filename at bottom
set foldmethod=indent
set foldnestmax=2
"needed by you complete me
set encoding=utf-8
"------------------------------------------------------------------------------
"------SPACING-----------------------------------------------------------------
"------------------------------------------------------------------------------
set tabstop=4
set softtabstop=4              "Number spaces to insert for tab
set expandtab
set autoindent
set showmatch
set colorcolumn=80
set textwidth=79
set shiftwidth=4                "How much to shift when using >> <<
set foldlevel=20
highlight ExtraWhitespace ctermbg=green guibg=green
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
"------------------------------------------------------------------------------
"------KEYBINDINGS-----------------------------------------------------------------
"------------------------------------------------------------------------------
inoremap jk <esc>
map <silent> <C-j> <PageDown>
map <silent> <C-k> <PageUp>

let mapleader=","
noremap <leader><space> :nohlsearch<CR>
noremap <leader>q :q<enter>
noremap <leader>w :w<enter>
noremap <leader>x :wq<enter> 
map <C-i> :set foldmethod=indent<CR>
"allows you to quickly go to terminal and back
map <C-d> :sh<CR>

"extra shit for tags

"opens tag in another tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"opens tab in vertcal split, Alt+]
"map <C-[> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"
"
"Buffer traversal
map <silent> <C-L> :bnext<CR>
map <silent> <C-H> :bprevious<CR>




"------------------------------------------------------------------------------
"------VUNDLE------------------------------------------------------------------
"------------------------------------------------------------------------------
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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'majutsushi/tagbar'

nmap <F8> :TagbarToggle<CR>

Plugin 'cocopon/iceberg.vim'

Plugin 'damage220/vim-finder'

Plugin 'rking/ag.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

map <silent> <C-n> :NERDTreeToggle<CR>

set tags=./tags;
