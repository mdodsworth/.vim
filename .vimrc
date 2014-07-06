set nocompatible              
filetype off                  

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'LustyJuggler'
Plugin 'SuperTab'
Plugin 'Tagbar'
Plugin 'The-NERD-Commenter'
Plugin 'The-NERD-tree'
Plugin 'YankRing.vim'
Plugin 'ack.vim'
Plugin 'fugitive.vim'
Plugin 'git@github.com:ekalinin/Dockerfile.vim.git'
Plugin 'git@github.com:jnwhiteh/vim-golang.git'
Plugin 'gmarik/Vundle.vim'
Plugin 'go.vim'
Plugin 'molokai'
Plugin 'git@github.com:motus/pig.vim.git'
Plugin 'vim-coffee-script'

call vundle#end()
filetype plugin indent on

set t_Co=256            " use 265 colors in vim
syntax on

:colorscheme molokai

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

noremap <leader>j <Esc>:FufFile **/<CR>
noremap <leader>m <Esc>:FufBuffer<CR>
noremap <leader>cd <Esc>:FufDir<CR>

let g:tagbar_usearrows = 1
nnoremap <leader>f :TagbarToggle<CR>

let g:LustyJugglerDefaultMappings = 1
let g:LustyJugglerSuppressRubyWarning = 1
noremap <leader>l :LustyJuggler<CR>

noremap <leader>v :YRShow<CR>

filetype plugin on
set ofu=syntaxcomplete#Complete
"let g:molokai_original = 1
 
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

"enhanced line transpose functions
function! MoveLineUp()
  call MoveLineOrVisualUp(".", "")
endfunction

function! MoveLineDown()
  call MoveLineOrVisualDown(".", "")
endfunction

function! MoveVisualUp()
  call MoveLineOrVisualUp("'<", "'<,'>")
  normal gv
endfunction

function! MoveVisualDown()
  call MoveLineOrVisualDown("'>", "'<,'>")
  normal gv
endfunction

function! MoveLineOrVisualUp(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num - v:count1 - 1 < 0
    let move_arg = "0"
  else
    let move_arg = a:line_getter." -".(v:count1 + 1)
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualDown(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num + v:count1 > line("$")
    let move_arg = "$"
  else
    let move_arg = a:line_getter." +".v:count1
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualUpOrDown(move_arg)
  let col_num = virtcol(".")
  execute "silent! ".a:move_arg
  execute "normal! ".col_num."|"
endfunction

nnoremap <silent> <C-Up> :<C-u>call MoveLineUp()<CR>
nnoremap <silent> <C-Down> :<C-u>call MoveLineDown()<CR>
inoremap <silent> <C-Up> <C-o>:<C-u>call MoveLineUp()<CR>
inoremap <silent> <C-Down> <C-o>:<C-u>call MoveLineDown()<CR>
vnoremap <silent> <C-Up> :<C-u>call MoveVisualUp()<CR>
vnoremap <silent> <C-Down> :<C-u>call MoveVisualDown()<CR>

"excludes for fuzzy finder
let g:fuf_file_exclude = '\v\~$|\.(un\~|swp)$|node_modules/|\.git/'
let g:fuf_mrufile_maxItem = 300
let g:fuf_mrucmd_maxItem = 400

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>

"remove the toolbar, right & left scrollbars
set guioptions-=T
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=R
