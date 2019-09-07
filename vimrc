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

Plug 'sickill/vim-monokai'
Plug 'vim-syntastic/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'valloric/youcompleteme'
Plug 'luochen1990/rainbow'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'fatih/vim-go'

call plug#end()


" [Plugin] Ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif


" [Plugin] commentary
" Usage: gc{motion}
" for example, gcap to comment out a paragraph


" [Plugin] syntastic
let g:syntastic_mode_map = {
            \ "mode": "passive",
            \ "active_filetypes": [],
            \ "passive_filetypes": [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" [Plugin] rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
      \  'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \  'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \  'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \  'separately': {
      \      '*': 0,
      \      'clojure': {},
      \  }
      \}


"----------------------------------------------------------------------------

set noundofile
set nobackup

syntax enable
colorscheme monokai

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

" auto open Quickfix
autocmd vimrc QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif

" diff
if has('patch-8.1.360')
    set diffopt=internal,filler,vertical,algorithm:histogram,indent-heuristic
else
    set diffopt=filler,vertical
endif

set backspace=indent,eol,start

runtime ftplugin/man.vim

function! ToUTF8()
    edit ++enc=cp932
    setlocal fileencoding=utf8
    setlocal fileformat=unix
endfunction

command! ToUTF8 call ToUTF8()

" status line
"----------------------------------------------------------------------------

set statusline=
set statusline+=%t\     " filename
set statusline+=%h%m%r%w\                    " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&ff}]\ \                   " file format

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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

" vertical help
nnoremap <leader>h :vert help<Space>

" terminal
tnoremap <Esc> <C-\><C-n>

" fzf
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>ff :Files<CR>

" syntastic
nnoremap <silent> <leader>se :Errors<CR>
nnoremap <silent> <leader>ss :SyntasticCheck<CR>
nnoremap <silent> <leader>si :SyntasticInfo<CR>

" Buffers
nnoremap <silent> <leader>bs :buffers<CR>:buffer<Space>
nnoremap <silent> <leader>bc :bdelete<CR>

nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader>bf :bfirst<CR>
nnoremap <silent> <leader>bl :blast<CR>

" Windows
nnoremap <silent> <leader>wo <C-W>v
nnoremap <silent> <leader>wc <C-W>c

nnoremap <silent> <leader>wn <C-W>w
nnoremap <silent> <leader>wp <C-W>W

nnoremap <silent> <leader>wh <C-W>h
nnoremap <silent> <leader>wj <C-W>j
nnoremap <silent> <leader>wk <C-W>k
nnoremap <silent> <leader>wl <C-W>l

nnoremap <silent> <leader>wH <C-W>H
nnoremap <silent> <leader>wJ <C-W>J
nnoremap <silent> <leader>wK <C-W>K
nnoremap <silent> <leader>wL <C-W>L

nnoremap <silent> <leader>w< <C-W><
nnoremap <silent> <leader>w> <C-W>>
nnoremap <silent> <leader>w+ <C-W>+
nnoremap <silent> <leader>w- <C-W>-
nnoremap <silent> <leader>w= <C-W>=

" Tabs
nnoremap <silent> <leader>to :tabedit<CR>
nnoremap <silent> <leader>tc :tabclose<CR>

nnoremap <silent> <leader>tn :tabnext<CR>
nnoremap <silent> <leader>tp :tabprevious<CR>
nnoremap <silent> <leader>tf :tabfirst<CR>
nnoremap <silent> <leader>tl :tablast<CR>

" Args
nnoremap <silent> <leader>an :next<CR>
nnoremap <silent> <leader>ap :previous<CR>
nnoremap <silent> <leader>af :first<CR>
nnoremap <silent> <leader>al :last<CR>

" Locations
nnoremap <silent> <leader>lc :lclose<CR>

nnoremap <silent> <leader>ln :lnext<CR>
nnoremap <silent> <leader>lp :lprevious<CR>
nnoremap <silent> <leader>lf :lfirst<CR>
nnoremap <silent> <leader>ll :llast<CR>

" quickfix
nnoremap <silent> <leader>co :copen<CR>
nnoremap <silent> <leader>cc :cclose<CR>

nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprevious<CR>
nnoremap <silent> <leader>cf :cfirst<CR>
nnoremap <silent> <leader>cl :clast<CR>

" no highlight
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" save file
nnoremap <Leader>wr :w<CR>
nnoremap <Leader>q :wq<CR>

" compile
nnoremap <Leader>m :make<CR>

" command mode
cnoremap <C-a> <Home>
cnoremap <C-b> <C-Left>


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
