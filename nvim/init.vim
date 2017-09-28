set ruler
set number
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set title
set binary noeol
set laststatus=2
set mouse=v
set ff=unix
set backspace=2
set splitbelow
set splitright
set nocp

set tabstop=2 shiftwidth=2 expandtab

"set textwidth=80
"set colorcolumn=+1

let mapleader = ","

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog  = '/usr/local/bin/python3'

" ========== Vim-Plug ==============
" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ajh17/Spacegray.vim'
Plug 'ap/vim-css-color'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'mklabs/split-term.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'w0rp/ale'
Plug 'wesQ3/vim-windowswap'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
call plug#end()
" =========== End Vim-Plug =============

" Enable deoplete for autocompletion
let g:deoplete#enable_at_startup = 1
" Configure deoplete keybindings
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-b>" : "\<S-Tab>"


" ============================================================================
" FZF {{{
" ============================================================================
set rtp+=/usr/local/opt/fzf

"if has('nvim')
"  let $FZF_DEFAULT_OPTS .= ' --inline-info'
"endif
"
function FuzzyFind()
  " Contains a null-byte that is stripped.
  let gitparent=system('git rev-parse --show-toplevel')[:-2]
  if empty(matchstr(gitparent, '^fatal:.*'))
    silent execute ':Files ' . gitparent
  else
    silent execute ':Files .'
  endif
endfunction
"
"command! FZFMix call fzf#run({
"            \'source':  'bash -c "'.
"            \               'echo -e \"'.join(v:oldfiles, '\n').'\";'.
"            \               'ag -l -g \"\"'.
"            \           '"',
"            \'sink' : 'e ',
"            \'dir' : g:projectroot,
"            \'options' : '-e -m --reverse',
"            \'window' : 'enew',
"            \})
"nnoremap <silent> <Leader><Leader> :call fzf#run({'sink': 'tabedit', 'options': '--multi --reverse'})<CR>
"
"
"nnoremap <silent> <Leader><Leader> :FZF<CR>
nnoremap <silent> <Leader><Leader> :call FuzzyFind()<CR>
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>
"
"inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
"imap <c-x><c-l> <plug>(fzf-complete-line)
"
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)

" }}}

" easy window movements
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" match HTML tags with %
runtime macros/matchit.vim

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

filetype plugin on
filetype plugin indent on

:let g:PHP_vintage_case_default_indent = 1

set t_Co=256
set background=dark
colorscheme spacegray

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType make set noexpandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype sass setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2

" hit control-n to toggle NERDTree on and off
map <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 40

" Change directory to the current buffer when opening files.
set autochdir

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" hit control-p to toggle CtrlP plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" resize windows with +/- keys
"if bufwinnr(1)
  "map + <C-W>+
  "map - <C-W>-
  "map < <C-w><
  "map > <C-w>>
"endif


" Vim-test stuff
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" deal with vim backups
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
  \ | wincmd p | diffthis

" activates rainbow.vim to color parentheses
let g:rainbow_active = 1

let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'html': 0,
    \       'css': 0,
    \       'hbs': 0,
    \   }
    \}

" type debug in insert mode to insert full error reporting block for PHP
iab debug error_reporting(E_ALL);<CR><BS><CR>ini_set('display_errors', 1);
" type dump to insert a var_dump(); exit(); block and place the cursor nicely
iab dump var_dump();<CR>exit();<Esc>k$hi
" type export to insert a print '<pre>'; var_export(); print '</pre>'; exit(); block and place the cursor nicely
iab export print "<pre>";<CR>var_export();<CR>print "</pre>";<CR>exit();<Esc>kk$hi

"Handlebars stuff
let g:mustache_abbreviations = 1

"Disable tab helper on startup
let g:indentLine_enabled = 0

"Toggle tab helper on or off
"noremap <Leader>t :IndentLinesToggle<CR> 

" Quick-Scope: Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Window Swap
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

"js beautify
vnoremap <leader>bj :%!js-beautify -j -s 2 -q -B -f -<CR>
vnoremap <leader>bc :%!css-beautify -j -s 2 -q -B -f -<CR>
vnoremap <leader>bh :%!html-beautify -j -s 2 -q -B -f -<CR>
nnoremap <leader>bj :%!js-beautify -j -s 2 -q -B -f -<CR>
nnoremap <leader>bc :%!css-beautify -j -s 2 -q -B -f -<CR>
nnoremap <leader>bh :%!html-beautify -j -s 2 -q -B -f -<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" press K to search for the word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag <C-R><C-W><CR>