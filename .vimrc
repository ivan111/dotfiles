augroup vimrc
  autocmd!
augroup END

" Plugin
"----------------------------------------------------------------------------

" :so[urce] % to reload .vimrc
" :PlugInstall to install plugins.
" :PlugUpdate to update plugins.
" :PlugClean to remove plugins.

call plug#begin()

Plug 'Yggdroot/indentLine'
Plug 'Shougo/neocomplcache.vim'
Plug 'kovisoft/slimv'

call plug#end()

" [Plugin] neocomplcache

let g:neocomplcache_enable_at_startup = 1

" [Plugin] slimv

let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp"'
let g:lisp_rainbow = 1
let g:slimv_repl_split = 4  " rightbelow vsplit

"----------------------------------------------------------------------------

set noundofile
set nobackup

syntax enable
colorscheme desert

" show invisible characters
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" show invisibles
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

" you can change buffers without saving
set hidden

" line number
set number

set nowrap

" cursor
set nocursorline
autocmd vimrc InsertEnter,InsertLeave * set cursorline!


" status line
"----------------------------------------------------------------------------

set statusline=
set statusline+=%t\     " filename
set statusline+=%h%m%r%w\                    " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&ff}]                      " file format

set statusline+=%=      "left/right separator

set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Always show statusline
set laststatus=2

" search
"----------------------------------------------------------------------------

set incsearch
set ignorecase
set smartcase
set wrapscan
set hlsearch


" key map
"----------------------------------------------------------------------------

let mapleader = "\<Space>"

" edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Buffers
nnoremap <silent> <leader>bl :buffers<CR>:buffer<Space>
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>

" Windows
nnoremap <silent> <leader>wn <C-W>w
nnoremap <silent> <leader>wp <C-W>W

nnoremap <silent> <leader>wh <C-W>H
nnoremap <silent> <leader>wj <C-W>J
nnoremap <silent> <leader>wk <C-W>K
nnoremap <silent> <leader>wl <C-W>L

" quickfix
nnoremap <silent> <leader>co :copen<CR>
nnoremap <silent> <leader>cq :cclose<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprevious<CR>

" no highlight
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" save file
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :wq<CR>

" compile
nnoremap <Leader>m :make<CR>

" clip board
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" tab
"----------------------------------------------------------------------------

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set smartindent


" template
"----------------------------------------------------------------------------

" augroup vimrc
"     autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
"     autocmd BufNewFile *.c 0r ~/.vim/templates/template.c
"     autocmd BufNewFile *.html 0r ~/.vim/templates/template.html
" augroup END
