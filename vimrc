execute pathogen#infect()

syntax enable                              " enable syntax processing
filetype plugin indent on                  " load filetype-specific indent files
colorscheme Tomorrow-Night                 " using colorscheme from colors folder

set number                                 " enable line numbers
set showcmd                                " show command in bottom bar
set cursorline                             " highlight current line
set wildmenu                               " visual autocomplete for command menu
set lazyredraw                             " redraw only when we need to
set tabstop=4                              " number of visual spaces per TAB
set softtabstop=4                          " number of spaces in tab when editing
"set expandtab                              " tabs are spaces
set showmatch                              " highlight matching [{()}]
set incsearch                              " search as characters are entered
set hlsearch                               " hightlight matches
set foldenable                             " enable folding
set foldlevelstart=10                      " open most fold by default
set foldnestmax=10                         " 10 nested fold max
set foldmethod=indent                      " fold based on indent level

"""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


nmap <f8> :TagbarToggle<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap gV `[v`]                          " highlight last inserted text
nnoremap <leader>u :GundoToggle<CR>

