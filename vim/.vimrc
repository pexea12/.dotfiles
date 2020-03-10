syntax on
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set autoread
set noswapfile
let mapleader=','

" Display status line
set laststatus=2

set exrc
set secure
set encoding=UTF-8

set background=dark

set number
set hlsearch
set incsearch
set hidden
set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300
"set shortmess+=c
"set signcolumn=yes

nmap <Leader>ev :tabedit $MYVIMRC<CR>
nmap <Leader><space> :nohlsearch<CR>

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
"Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-eunuch'
"Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  } }
Plug 'tpope/vim-fugitive'
"Plug 'easymotion/vim-easymotion'
"Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'

" HTML
Plug 'mattn/emmet-vim'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Julia
Plug 'JuliaEditorSupport/julia-vim'

" JavaScript
"Plug 'posva/vim-vue'
"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'

" Scala
"Plug 'derekwyatt/vim-scala'

" UI
Plug 'itchyny/lightline.vim'
" Remember to install Nerd Font for vim-devicons
Plug 'ryanoasis/vim-devicons'

" Coc server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"" Set guifont for devicons
"set guifont=RobotoMono_Nerd_Font:h11
let g:airline_powerline_fonts = 1

"Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

" Enable mouse
set mouse=a

" Paste shortcut
set pastetoggle=<F2>

" Split
set splitbelow
set splitright

" NERDTree
map <C-k> :NERDTreeToggle<CR>
map <C-b> :CtrlPBuffer<CR>

" Mapping copy and paste to clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "*y
noremap <Leader>P "*p

" FZF
" Install the_silver_searcher
nnoremap <C-p> :FZF<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Auto Commands
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

" Emmet config
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue EmmetInstall

"" indentLine config
"let g:indentLine_setConceal = 0

" coc configuration
" change highlight color
highlight CocErrorSign ctermfg=26

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Used to expand decorations in worksheets
"nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

"" Use K to either doHover or show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "else
    "call CocAction('doHover')
  "endif
"endfunction

"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)

"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
  "autocmd!
  "" Setup formatexpr specified filetype(s).
  "autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)

"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')

"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"" Notify coc.nvim that <enter> has been pressed.
"" Currently used for the formatOnType feature.
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" make <cr> select the first completion item and confirm the completion when no item has been selected:
"" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"" make coc.nvim format your code on <cr>, use keymap:
"" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" close the preview window when completion is done.
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"" Used in the tab autocompletion for coc
"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Pretty JSON view
function s:pretty_json()
  if (&ft == 'json')
    %!python -m json.tool
  endif
endfunction

command Json call s:pretty_json()

" JSON comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

"" Scala file extension
"au BufRead,BufNewFile *.sbt set filetype=scala

" Julia disable converting latex to unicode
let g:latex_to_unicode_tab = 0
