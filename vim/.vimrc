syntax on
filetype plugin indent on

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } 
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'

call plug#end()

set tabstop=4
set shiftwidth=4
set expandtab
let mapleader=','

set exrc
set secure
set encoding=utf-8

set background=dark

set number
set hlsearch
set incsearch


" Split
set splitbelow
set splitright

" Mapping
map <C-k> :NERDTreeToggle<CR>
nmap <Leader>ev :tabedit $MYVIMRC<CR>
nmap <Leader><space> :nohlsearch<CR>

" Auto Commands
"

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
