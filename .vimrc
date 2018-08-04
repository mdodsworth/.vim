set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'L9'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'LustyJuggler'
Plugin 'SuperTab'
Plugin 'The-NERD-Commenter'
Plugin 'The-NERD-tree'
Plugin 'VimClojure'
Plugin 'YankRing.vim'
Plugin 'ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'derekwyatt/vim-scala'
Plugin 'fugitive.vim'
Plugin 'git@github.com:ekalinin/Dockerfile.vim.git'
Plugin 'git@github.com:motus/pig.vim.git'
Plugin 'gmarik/Vundle.vim'
Plugin 'haskell.vim'
Plugin 'moll/vim-node'
Plugin 'molokai'
Plugin 'rainbow_parentheses.vim'
Plugin 'tabular'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-coffee-script'

call vundle#end()
filetype plugin indent on

set t_Co=256            " use 265 colors in vim
set shell=/bin/bash
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

" Use 'ag' rather than ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

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
nnoremap <Leader>fr :%s/\<<C-r><C-w>\>/
nnoremap <tab> %
vnoremap <tab> %
nnoremap <leader>a :Ack<space>

nnoremap <Leader>t :Tabularize<space>/
vnoremap <Leader>t :Tabularize<space>/

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
inoremap jj <ESC>

nnoremap ; :

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

"mappings for EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
"map <C-j> <Plug>(easymotion-j)
"map <C-k> <Plug>(easymotion-k)
"
"" disable scrolling through the 'wheel'
noremap <ScrollWheelUp>      <nop>
noremap <S-ScrollWheelUp>    <nop>
noremap <C-ScrollWheelUp>    <nop>
noremap <ScrollWheelDown>    <nop>
noremap <S-ScrollWheelDown>  <nop>
noremap <C-ScrollWheelDown>  <nop>
noremap <ScrollWheelLeft>    <nop>
noremap <S-ScrollWheelLeft>  <nop>
noremap <C-ScrollWheelLeft>  <nop>
noremap <ScrollWheelRight>   <nop>
noremap <S-ScrollWheelRight> <nop>
noremap <C-ScrollWheelRight> <nop>
