""""""""""""""""""""
" Plugins management
""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')
" fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" railscast theme
Plug 'jpo/vim-railscasts-theme'
Plug 'majutsushi/tagbar'
" auto-pairs
Plug 'jiangmiao/auto-pairs'
" react jsx
Plug 'mxw/vim-jsx'
" vim-javascript
Plug 'pangloss/vim-javascript'
" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" vim multicursors
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" Airline status line
let g:airline_theme='sol'
let g:airline_powerline_fonts = 1

" Editor settings
colorscheme railscasts
filetype plugin indent on            " load filetype-specific ident files
set number                           " enable line number
set cursorline                       " highlight current line
set tabstop=4                        " number of visual spaces per TAB
set softtabstop=4                    " number of spaces in tab when editing
set showmatch                        " highlight matching [{()}]
set incsearch                        " search as characters are entered
set hlsearch                         " hightlight matches
set clipboard=unnamedplus            " copy to clipboard
set autoread
set autowrite

" Custom mapping
nnoremap <leader><CR> :nohlsearch<CR>
nmap <F8> :TagbarToggle<CR>

let g:jsx_ext_required = 0          " enable JSX highlighting and identing for js files
" Use deoplete.
let g:deoplete#enable_at_startup = 1 " Use deoplete.

