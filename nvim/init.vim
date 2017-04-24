""""""""""""""""""""
" Plugins management
""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-syntastic/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/goyo.vim'
call plug#end()

"""""""""""""""""""""""
" Essential settings
"""""""""""""""""""""""
colorscheme gruvbox
set background=dark
set termguicolors

filetype plugin indent on            " load filetype-specific ident files
set cursorcolumn                     " highlight current column
set cursorline                       " highlight current line
set tabstop=2                        " number of visual spaces per TAB
set softtabstop=2                    " number of spaces in tab when editing
set autoindent	                     " auto-indent new lines
set shiftwidth=2                   	 " number of auto-indent spaces
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
set list listchars=tab:»·,trail:·,nbsp:·            " Display extra whitespace

"""""""""""""""""""""""
" custom mapping
"""""""""""""""""""""""
let mapleader = " "
let maplocalleader = "\\"

nnoremap <Leader><CR> :nohlsearch<CR>
nnoremap <Leader>w :w!<CR>
nmap <F8> :TagbarToggle<CR>

nmap <C-[> :pop<CR>

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

" recall commands from history
cnoremap <C-p> <Up>
cnoremap <C-p> <Down>

" quickly traverse Vim's lists
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"""""""""""""""""""""""
" package configuration
"""""""""""""""""""""""
" lightline status line""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
"""""""""""""""""""""""""""""""""""""""""""""

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])

" UltiSnip
let g:UltiSnipsExpandTrigger='<A-j>'
let g:UltiSnipsJumpForwardTrigger='<A-l>'
let g:UltiSnipsJumpBackwardTrigger='<A-h>'

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
nnoremap <Leader>b :CtrlPBuffer<CR>

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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-c>r :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Fix ambigous command with `emmet`
command! E Explore
