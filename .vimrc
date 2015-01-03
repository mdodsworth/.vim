set nocompatible              
filetype off                  

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'EasyMotion'
Plugin 'L9'
Plugin 'LustyJuggler'
Plugin 'SuperTab'
Plugin 'The-NERD-Commenter'
Plugin 'The-NERD-tree'
Plugin 'VimClojure'
Plugin 'YankRing.vim'
Plugin 'ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'fugitive.vim'
Plugin 'git@github.com:ekalinin/Dockerfile.vim.git'
Plugin 'git@github.com:jnwhiteh/vim-golang.git'
Plugin 'git@github.com:motus/pig.vim.git'
Plugin 'gmarik/Vundle.vim'
Plugin 'go.vim'
Plugin 'molokai'
Plugin 'rainbow_parentheses.vim'
Plugin 'vim-coffee-script'

call vundle#end()
filetype plugin indent on

set t_Co=256            " use 265 colors in vim
syntax on

:colorscheme molokai
set guifont=Inconsolata\ for\ Powerline:h14
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_theme = 'jellybeans'
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set tags=./tags,tags
set nocompatible
set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set number
set undofile
set cursorline
"enable clipboard integration in macvim
set clipboard=unnamed

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

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
nnoremap j gj
nnoremap k gk

noremap <F1> <ESC>

nnoremap ; :
inoremap jj <ESC>

nnoremap <leader>w <C-w>s<C-w>j
nnoremap <leader>e <C-w>v<C-w>l
nnoremap <leader>q :bd<CR>
nnoremap <leader>r <C-w>o
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <leader>j <Plug>GitGutterNextHunk
nmap <leader>k <Plug>GitGutterPrevHunk

let g:tagbar_usearrows = 1
nnoremap <leader>f :NERDTreeToggle<CR>

let g:LustyJugglerDefaultMappings = 1
let g:LustyJugglerSuppressRubyWarning = 1
noremap <leader>m :LustyJuggler<CR>
noremap <leader>v :YRShow<CR>

filetype plugin on
set ofu=syntaxcomplete#Complete
 
"excludes for fuzzy finder
let g:fuf_file_exclude = '\v\~$|\.(un\~|swp)$|node_modules/|\.git/'
let g:fuf_mrufile_maxItem = 300
let g:fuf_mrucmd_maxItem = 400

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>

"remove the toolbar, right & left scrollbars
set guioptions-=T
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=R

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
