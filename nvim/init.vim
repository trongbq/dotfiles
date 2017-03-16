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
" deoplete for auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" fuzzy files searching 
Plug 'ctrlpvim/ctrlp.vim'
" multicursors
Plug 'terryma/vim-multiple-cursors'
" ack.vim
Plug 'mileszs/ack.vim'
" autopair gentle
Plug 'jiangmiao/auto-pairs'
call plug#end()

"""""""""""""""""""""""
" Essential settings
"""""""""""""""""""""""
colorscheme railscasts
filetype plugin indent on            " load filetype-specific ident files
set cursorline                       " highlight current line
set tabstop=2                        " number of visual spaces per TAB
set softtabstop=2                    " number of spaces in tab when editing
set autoindent	                     " auto-indent new lines
set shiftwidth=2                   	 " number of auto-indent spaces
set smartindent                      " enable smart-indent
set smarttab	                       " enable smart-tabs
set showmatch                        " highlight matching [{()}]
set incsearch                        " search as characters are entered
set hlsearch                         " hightlight matches
set autoread
set autowrite
set expandtab                       " expand tab to spaces
set autoindent                    	" auto-indent new lines
set smartindent	                    " enable smart-indent
set softtabstop=4	                  " number of spaces per Tab
set showcmd                         " show imcomplete command

set tags=tags;/                     " check tags file and go to uppper level if needed

" numbers
set number
set numberwidth=5

" make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" disable backup files
set nobackup
set nowritebackup 
set noswapfile


"""""""""""""""""""""""
" custom mapping
"""""""""""""""""""""""
let mapleader = " "

nnoremap <Leader><CR> :nohlsearch<CR>               " turn off hightlight keywords
nnoremap <Leader>w :w!<CR>                          " fast saving 
nmap <F8> :TagbarToggle<CR>                         " toggle tagbar window

" switching between windows
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

"""""""""""""""""""""""
" package configuration
"""""""""""""""""""""""
" airline status line
let g:airline_theme='sol'
let g:airline_powerline_fonts = 1

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" use a custom file listing command
let g:ctrlp_user_command = 'find %s -type f'       
" ignore files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip            
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
nnoremap <Leader>o :CtrlP<CR> 
nnoremap <Leader>. :CtrlPTag<CR>

" ack.vim
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor              " use The Silver Searcher(ag) over grep
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_use_caching = 0                       " ag is fast enough that CtrlP doesn't need to cache
  let g:ackprg = 'ag --nogroup --nocolor --column'  " override grep to use ag command
endif
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>       " bind K to search word under cursor 
cnoreabbrev Ack Ack!
nnoremap <Leader>s :Ack!<Space>

