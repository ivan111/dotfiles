" Plugin
"----------------------------------------------------------------------------

" :so[urce] % to reload .vimrc and :PlugInstall to install plugins.
" :so[urce] % to reload .vimrc and :PlugClean to remove plugins.
" :PlugUpdate to update plugins.

call plug#begin()

Plug 'Yggdroot/indentLine'
Plug 'Shougo/neocomplcache.vim'

call plug#end()

let g:neocomplcache_enable_at_startup = 1

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

" Switch Buffers
nnoremap <silent> bn :bnext<cr>
nnoremap <silent> bp :bprevious<cr>

" Switch Windows
nnoremap <silent> wn <C-W>w
nnoremap <silent> wp <C-W>W

" Switch Tabs
nnoremap <silent> te :tabedit<CR>
nnoremap <silent> tc :tabclose<CR>
nnoremap <silent> tn :tabnext<CR>
nnoremap <silent> tp :tabprevious<CR>

" no highlight
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" save file
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :wq<CR>

" compile
nnoremap <Leader>m :make<CR>

" clip board
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader>y "+y
nmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P


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

autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
autocmd BufNewFile *.c 0r ~/.vim/templates/template.c
autocmd BufNewFile *.html 0r ~/.vim/templates/template.html
