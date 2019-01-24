if has('vim_starting')
    if has('nvim')
        let s:my_vim_dir = stdpath('config')
    else
        let s:my_vim_dir = expand('~.vim')
    endif
endif

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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kovisoft/slimv'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/neocomplcache.vim'
endif

call plug#end()


if has('nvim')
    " [Plugin] deoplete

    let g:deoplete#enable_at_startup = 1
else
    " [Plugin] neocomplcache

    let g:neocomplcache_enable_at_startup = 1
endif


" [Plugin] slimv

let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ' . s:my_vim_dir . '/plugged/slimv/slime/start-swank.lisp"'
let g:lisp_rainbow = 1
let g:slimv_repl_split = 4  " rightbelow vsplit
let g:paredit_mode = 0


" [Plugin] commentary

" Usage: gc{motion}
" for example, gcap to comment out a paragraph

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
nnoremap <leader>ev :tabedit $MYVIMRC<CR>

" terminal
tnoremap <Esc> <C-\><C-n>

" fzf
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>ff :Files<CR>

" Buffers
nnoremap <silent> <leader>bl :buffers<CR>:buffer<Space>
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader>bd :bdelete<CR>

" Windows
nnoremap <silent> <leader>wn <C-W>w
nnoremap <silent> <leader>wp <C-W>W

nnoremap <silent> <leader>wT <C-W>T

nnoremap <silent> <leader>wc <C-W>c
nnoremap <silent> <leader>wo <C-W>o

nnoremap <silent> <leader>ws <C-W>s
nnoremap <silent> <leader>wv <C-W>v

nnoremap <silent> <leader>wh <C-W>h
nnoremap <silent> <leader>wj <C-W>j
nnoremap <silent> <leader>wk <C-W>k
nnoremap <silent> <leader>wl <C-W>l

nnoremap <silent> <leader>wH <C-W>H
nnoremap <silent> <leader>wJ <C-W>J
nnoremap <silent> <leader>wK <C-W>K
nnoremap <silent> <leader>wL <C-W>L

" Tabs
nnoremap <silent> <leader>te :tabedit<Space>

nnoremap <silent> <leader>tn :tabnext<CR>
nnoremap <silent> <leader>tp :tabprevious<CR>

nnoremap <silent> <leader>tc :tabclose<CR>
nnoremap <silent> <leader>to :tabonly<CR>

" Args
nnoremap <silent> <leader>an :next<CR>
nnoremap <silent> <leader>ap :previous<CR>

" quickfix
nnoremap <silent> <leader>co :copen<CR>
nnoremap <silent> <leader>cq :cclose<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprevious<CR>

" no highlight
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" save file
nnoremap <Leader>wr :w<CR>
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


" get current buffer's directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

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
"     autocmd BufNewFile *.py   execute '0read' . s:my_vim_dir . '/templates/a.py'
"     autocmd BufNewFile *.c    execute '0read' . s:my_vim_dir . '/templates/a.c'
"     autocmd BufNewFile *.html execute '0read' . s:my_vim_dir . '/templates/a.html'
" augroup END
