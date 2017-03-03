""""""""""""""""""""
" Plugins management
""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" railscast theme
Plug 'jpo/vim-railscasts-theme'
" tagbar
Plug 'majutsushi/tagbar'
" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" fuzzy search 
Plug 'ctrlpvim/ctrlp.vim'
" multicursors
Plug 'terryma/vim-multiple-cursors'
" ack.vim
Plug 'mileszs/ack.vim'
" autopair gentle
Plug 'jiangmiao/auto-pairs'
call plug#end()

" Airline status line
let g:airline_theme='sol'
let g:airline_powerline_fonts = 1

" Editor settings
colorscheme railscasts
filetype plugin indent on            " load filetype-specific ident files
set number                           " enable line number
set cursorline                       " highlight current line
set tabstop=2                        " number of visual spaces per TAB
set softtabstop=2                    " number of spaces in tab when editing
set autoindent	                     " Auto-indent new lines
set shiftwidth=2                   	 " Number of auto-indent spaces
set smartindent                      " Enable smart-indent
set smarttab	                       " Enable smart-tabs
set showmatch                        " highlight matching [{()}]
set incsearch                        " search as characters are entered
set hlsearch                         " hightlight matches
"set clipboard=unnamedplus            " copy to clipboard
set autoread
set autowrite
set colorcolumn=80,100
set expandtab                       " Expand tab to spaces
set autoindent                    	" Auto-indent new lines
set smartindent	                    " Enable smart-indent
set softtabstop=4	                  " Number of spaces per Tab

" Disable backup files
set nobackup
set nowb
set noswapfile

" Custom mapping
nnoremap <leader><CR> :nohlsearch<CR>
nmap <leader>w :w!<CR>          
" nmap <F8> :TagbarToggle<CR>

" Switching between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" deoplete config
let g:deoplete#enable_at_startup = 1

" ctrlp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip            " MacOSX/Linux
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " override grep to use ag command
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" Stop jumping to the first result automatically.
cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>

