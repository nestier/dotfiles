set nocompatible    " be iMproved, required
filetype off        " required

let mapleader=","

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'junegunn/seoul256.vim'
Plug 'klen/python-mode'
Plug 'tomtom/tcomment_vim'          " easy code commenting
Plug 'Glench/Vim-Jinja2-Syntax'         " Jinja2 support
" NerdTree
Plug 'scrooloose/nerdtree', {'on':  ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'jistr/vim-nerdtree-tabs'


" Add plugins to &runtimepath
call plug#end()
map <LEADER>c :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
"Editor:---------------------------------------------------------------{{{
" make backspace work like most other apps
set backspace=2

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Text Preferences
set nowrap
" Break by word at end of line when wrap=true
set showbreak=⇇
set linebreak

set list
" set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:-
set listchars=tab:❯\ ,extends:▸\,precedes:❮,trail:.

" Make vim more useful
" Use by default system wide clipboard
set clipboard=unnamed

set nocompatible
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
"set fileformats=dos,unix,mac

" Disable backups and swap files
set noswapfile
set nobackup
set nowritebackup
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps

" Tell Vim to use an undo file
if exists("&undodir")
  set undofile
  set undodir=~/.vim/undo
endif

" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Don’t show the intro message when starting vim
set shortmess=atI
" Use normal numbers
set number
" and relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif
" Show commands as you type them
set showcmd
" allow unsaved changes to be hidden
set hidden
" Start scrolling three lines before the horizontal window border
set scrolloff=3
"}}}--------------------[ end Editor  ]-----------------------------------
" History:---------------------------------------------------------------{{{
" Trailing whitespaces
" Plug 'csexton/trailertrash.vim'
" map <Leader>tw :Trim<CR>
" hi UnwantedTrailerTrash guibg=NONE ctermbg=NONE ctermfg=green guifg=green

"}}}--------------------[ end History  ]----------------------------------------
" Folding: ------------------------------------------{{{
set foldenable
set foldmethod=marker
set foldlevelstart=0

" Toggle folds
nnoremap <Leader><Space> za
vnoremap <Leader><Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO
" fold tag
nnoremap <leader>ft Vatzf
" }}}
" Search:---------------------------------------------------------------{{{
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Add the g flag to search/replace by default
set gdefault
" Map SPACE to remove search highlighting
noremap <silent> <space> :noh<cr>:call clearmatches()<cr>
" nnoremap <Space> :nohlsearch<CR>
"}}}--------------------[ end Search  ]------------------------------------
" Indentation: -----------------------------------{{{
function! SetMultiLineJump(jump_size)
  execute "vnoremap J ".a:jump_size."j"
  execute "vnoremap K ".a:jump_size."k"
endfunction
command! -nargs=1 SetMultiLineJump call SetMultiLineJump(<f-args>)

set autoindent
set smartindent
let tabsize = 2
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
execute "set softtabstop=".tabsize
set expandtab

" Plug 'tpope/vim-unimpaired'

" Terminal Bubbling:-------------------
" Bubble single lines
" nmap <C-j> ]e
" nmap <C-k> [e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv
vmap <C-h> <gv
vmap <C-l> >gv
" or alternatively
vnoremap < <gv
vnoremap > >gv

" GUI Bubbling: [single line]-----------
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-Left> <<
nmap <C-Right> >>
" [ multi line ]------------------------
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-Left> <gv
vmap <C-Right> >gv

" Paste and Indent
nnoremap <esc>p p'[v']=
nnoremap <esc>P P'[v']=

" Indent entire document
function! s:IndentBuffer()
  silent! execute 'normal! gg=G``'
endfunction
command! -range=% IndentBuffer call <SID>IndentBuffer()
nnoremap <leader>i :normal! gg=G``<CR>

function! SetTabSize(size)
  execute "set tabstop=".a:size
  execute "set shiftwidth=".a:size
  execute "set softtabstop=".a:size
endfunction
command! -nargs=1 SetTabSize call SetTabSize(<f-args>)

" }}}
" enable syntax highligting
syntax on
colorscheme seoul256
