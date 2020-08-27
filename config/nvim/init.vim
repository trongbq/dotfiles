call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive' "Fugitive is the premier Vim plugin for Git
Plug 'sheerun/vim-polyglot' "A collection of language packs for Vim
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Intellisense engine
Plug 'scrooloose/nerdtree' "A tree explorer plugin for vim
Plug 'itchyny/lightline.vim' "A light and configurable statusline/tabline plugin for Vim
Plug 'easymotion/vim-easymotion'
Plug 'unkiwii/vim-nerdtree-sync' " Vim plugin for synchronizing current open file with NERDtree
Plug 'tpope/vim-surround' " The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair.
Plug 'scrooloose/nerdcommenter' " Comment code
Plug 'mg979/vim-visual-multia' "Multiple cursors plugin
Plug 'eugen0329/vim-esearch' "Perform search in files easily
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "A command-line fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine' "A vim plugin to display the indention levels with thin vertical lines
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'airblade/vim-gitgutter'
call plug#end()

" general settings
filetype plugin indent on            " load filetype-specific ident files
syntax on                            "Turn on syntax highlighting
set tabstop=2                        " number of visual spaces per TAB
set softtabstop=2                    " number of spaces in tab when editing
set autoindent                       " auto-indent new lines
set shiftwidth=2                     " number of auto-indent spaces
set smartindent                      " enable smart-indent
set smarttab                         " enable smart-tabs
set showmatch                        " highlight matching [{()}]
set incsearch                        " search as characters are entered
set hlsearch                         " hightlight matches
set autoread
set autowrite
set expandtab                        " expand tab to spaces
set autoindent                       " auto-indent new lines
set smartindent                      " enable smart-indent
set softtabstop=4                    " number of spaces per Tab
set showcmd                          " show imcomplete command
set re=1                             " setting regex serch
set foldenable                       " enable folding
set encoding=UTF-8
set hidden
set mouse=a "enable mouse for all mode
set ignorecase
set relativenumber

" auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

" disable backup files
set nobackup
set nowritebackup
set noswapfile
" set list listchars=tab:»·,trail:·,nbsp:·            " Display extra whitespace

" visual settings
colorscheme onehalfdark
set cursorline                       " highlight current line

set number
set numberwidth=5

" make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" folding
autocmd FileType go setlocal foldmethod=syntax
autocmd FileType java setlocal foldmethod=syntax
autocmd FileType python setlocal foldmethod=indent shiftwidth=4
autocmd FileType javascript setlocal foldmethod=syntax
autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css setlocal foldmethod=indent shiftwidth=2 tabstop=2
" autocmd FileType html setlocal foldmethod=syntax shiftwidth=2 tabstop=2
autocmd FileType html setlocal foldmethod=manual shiftwidth=2 tabstop=2
set foldlevelstart=20                    "start level 20 should result in folds open by default

" Custom mapping
let mapleader = " "
let maplocalleader = "\\"
inoremap jk <ESC>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

nnoremap <Leader><CR> :nohlsearch<CR>

" open file
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>t :tabe
nnoremap <Leader>n :tabe<CR>
nnoremap <Leader>c :E<CR>
nnoremap <Leader>e :e

" switch between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" copy and paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" recall commands from history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" quickly traverse Vim's lists
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

map <Leader>r :so $MYVIMRC<CR>

"""""""""""""""""""""""
" package configuration
"""""""""""""""""""""""
" FZF
" Always enable preview window on the right with 60% width
" ripgrep is required
let g:fzf_preview_window = 'right:60%'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
nnoremap <silent> <Leader>o :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" NERDTree
map <C-a> :NERDTreeToggle<CR>
let g:nerdtree_sync_cursorline = 1

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" Esearch
let g:esearch = {
  \ 'adapter': 'rg',
  \ 'backend': 'nvim'
  \}

" Lightline
let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }

