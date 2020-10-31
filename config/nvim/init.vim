call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" visual
set background=dark
colorscheme gruvbox
set cursorline				" highlight current line
set nu					" enable line numbers

" filetype
filetype on 				" detect files based on type
filetype plugin on			" when a file is editted its plugin file is loaded
filetype indent on 			" maintain indentation
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 " single tab as 4 spaces


" custom mapping key
let mapleader = ","
let maplocalleader = "\\"

" others
set autowrite				" write the content of the file automatically if we call :make

" KEY MAPPINGS
nnoremap <Leader><CR> :nohlsearch<CR>   " stop highlighting

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

" quickly traverse Vim's lists
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" PLUGINS SETTINGS

" vim-go
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>a :GoAlternate<CR>

let g:go_def_mapping_enabled = 0 	" disabled GoDef and delegate to coc.vim

" coc.vim
set hidden 				" TextEdit might fail if hidden is not set
set nobackup				" Some servers have issues with backup files
set nowritebackup
set cmdheight=2				" give more space for displaying messages
set updatetime=300			" having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
set shortmess+=c			" don't pass messages to |ins-completion-menu|

" use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" goTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" fzf
" always enable preview window on the right with 60% width
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
