syntax on
filetype plugin indent on

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } 
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'posva/vim-vue'
Plug 'terryma/vim-multiple-cursors'
Plug 'zyedidia/vim-snake'

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

let python_highlight_all = 1
let g:vim_json_syntax_conceal = 0

" Paste shortcut
set pastetoggle=<F2>

" Auto close brackets
noremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>


" Split
set splitbelow
set splitright

" Mapping
map <C-k> :NERDTreeToggle<CR>
nmap <Leader>ev :tabedit $MYVIMRC<CR>
nmap <Leader><space> :nohlsearch<CR>
map <C-b> :CtrlPBuffer<CR>

" Auto Commands
"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|\.git\|vendor'
let g:ctrlp_show_hidden = 1


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


" PHP import classes or functions
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>


" Emmet config
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue EmmetInstall
