"------------------------------------------------------------------------------
"------VUNDLE------------------------------------------------------------------
"------------------------------------------------------------------------------
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'udalov/kotlin-vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'cocopon/iceberg.vim'
Plugin 'damage220/vim-finder'
Plugin 'rking/ag.vim'
Plugin 'junegunn/fzf'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'preservim/nerdtree'
Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'Yohannfra/Vim-Goto-Header'
"Plugin 'fatih/vim-go'
call vundle#end()            " required
filetype plugin indent on    " required


let g:goto_header_use_find = 1 " By default it's value is 0
noremap <leader>g :GotoHeader<enter>

nmap <F8> :TagbarToggle<CR>
map <silent> <C-n> :NERDTreeToggle<CR>
map <C-z> :FZF<CR>

set tags=./tags;

let g:ycm_cland_binary_path = "/home/intern3/.local/bin/clangd"
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
"colorscheme elflord
colorscheme spacegray
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
set foldmethod=syntax
set foldnestmax=2
"for youcomplete me
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
set textwidth=89
set shiftwidth=4                "How much to shift when using >> <<
set foldlevel=20
highlight ExtraWhitespace ctermbg=green guibg=green
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
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

map <C-m> :MinimapToggle<CR>

nnoremap <leader>i :VerilogFollowInstance<CR>
nnoremap <leader>I :VerilogFollowPort<CR>

"extra shit for tags

"opens tag in another tab
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"opens tab in vertcal split, Alt+]
"map <C-[> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"
"
"Buffer traversal
map <silent> <C-L> :bnext<CR>
map <silent> <C-H> :bprevious<CR>

map <S-h> <C-w>h
map <S-l> <C-w>l
map <S-j> <C-w>j
map <S-k> <C-w>k

map <S-t> :hi Normal guibg=NONE ctermbg=NONE <CR>
map <S-y> :colorscheme spacegray <CR>

map <C-g> :Gblame<CR>
map <C-b> :Gblame toggle<CR>
