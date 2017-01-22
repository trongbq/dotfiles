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
call plug#end()

" Airline status line
let g:airline_theme='sol'
let g:airline_powerline_fonts = 1

" Editor settings
colorscheme railscasts
filetype plugin indent on            " load filetype-specific ident files
set number                           " enable line number
set cursorline                       " highlight current line

