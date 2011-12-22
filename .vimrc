call pathogen#infect()

:colorscheme molokai

set tags=./tags,tags
set nocompatible
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
 
set pastetoggle=<F2>
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set ruler
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set cursorline

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <silent><leader><space> :noh<CR>
nnoremap <leader>a :Ack<space>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=121
set formatoptions=qrn1
set colorcolumn=121

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
nnoremap j gj
nnoremap k gk

noremap <F1> <ESC>

nnoremap ; :
inoremap jj <ESC>

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>e <C-w>s<C-w>j
nnoremap <leader>q <C-w>q
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <leader>j <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

let g:tagbar_usearrows = 1
nnoremap <leader>f :TagbarToggle<CR>

let g:LustyJugglerDefaultMappings = 1
let g:LustyJugglerSuppressRubyWarning = 1
noremap <leader>l :LustyJuggler<CR>

noremap <leader>v :YRShow<CR>

filetype plugin on
set ofu=syntaxcomplete#Complete
"let g:molokai_original = 1
"
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"
