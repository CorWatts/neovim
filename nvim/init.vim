set ruler
set number
set relativenumber
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
" required by nvim-colorizer
set termguicolors

" make vim automatically re-read the file if it changes outside of vim
set autoread
autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | checktime | endif

set tabstop=2 shiftwidth=2 expandtab

"set textwidth=80
"set colorcolumn=+1

let mapleader = ","

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog  = '/usr/local/bin/python3'
let g:node_host_prog = '/Users/corwatts/.nvm/versions/node/v12.22.1/bin/neovim-node-host'

" ========== Vim-Plug ==============
" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes for plugins
Plug 'tpope/vim-repeat'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'luochen1990/rainbow' " Rainbow parentheses
Plug 'norcalli/nvim-colorizer.lua' " CSS code highligher
Plug 'pedrohdz/vim-yaml-folds'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-vinegar'

Plug 'unblevable/quick-scope'
"Plug 'w0rp/ale' " introduces lag and occasional errors to screen
"Plug 'wsdjeg/FlyGrep.vim' " need to learn bindings for this
Plug 'wesQ3/vim-windowswap'
Plug 'mmahnic/vim-flipwords'
Plug 'Yggdroot/indentLine'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf.vim'

" Syntax things
Plug 'jparise/vim-graphql'
Plug 'aklt/plantuml-syntax'
Plug 'posva/vim-vue'
Plug 'mustache/vim-mustache-handlebars'

" vim-gutentags was causing git to pause once the editor was closed:
" 'hint: Waiting for your editor to close the file...'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'majutsushi/tagbar'
" Plug 'mattn/calendar-vim'

Plug 'mklabs/split-term.vim' " Neovim Terminal improvements

"Plug 'scrooloose/nerdcommenter'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" completion manager plugins
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
"Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
"Plug 'phpactor/ncm2-phpactor'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" colorschemes
Plug 'sonph/onehalf', { 'rtp': 'vim' }
"Plug 'ajh17/Spacegray.vim'

" Initialize plugin system
call plug#end()
" =========== End Vim-Plug =============

colorscheme onehalfdark

" For nvim-colorizer. This will create an autocmd for FileType * to highlight every filetype.
lua require'colorizer'.setup()

" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
"set completeopt=noinsert,menuone,noselect

" Use <TAB> to select the popup menu:
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-b>" : "\<S-Tab>"
" something about not throwing in an extra CR at the end of an <enter> insert?
"inoremap <expr> <Plug>(cr_if_no_cmpl) ((!empty(v:completed_item) && !empty(v:completed_item.user_data)) ? "" : "\<cr>")
"imap <expr> <CR> (pumvisible() ? "\<c-y>\<Plug>(cr_if_no_cmpl)" : "\<CR>")
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki

" Config for vim-table-mode
" gives markdown-compatible tables
let g:table_mode_corner='|'


" Opposite of J. This splits lines.
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

" ============================================================================
" FZF {{{
" ============================================================================
set rtp+=/usr/local/opt/fzf

function FuzzyFind()
  " Contains a null-byte that is stripped.
  let gitparent=system('git rev-parse --show-toplevel')[:-2]
  if empty(matchstr(gitparent, '^fatal:.*'))
    silent execute ':Files ' . gitparent
  else
    silent execute ':Files .'
  endif
endfunction

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
" ============================================================================
" }}} FZF
" ============================================================================

" ripped from http://vimcasts.org/episodes/aligning-text-with-tabular-vim/u
if exists(":Tabularize")
  nmap <Leader>A= :tabularize /=<cr>
  vmap <Leader>A= :tabularize /=<cr>
  nmap <Leader>A: :tabularize /:\zs<cr>
  vmap <Leader>A: :tabularize /:\zs<cr>
endif

" Remaps `jk` and `kj` in insert mode to Esc
inoremap jk <Esc>`^
inoremap kj <Esc>`^
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>



" easy window movements
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Resize windows easily
"   nnoremap sets it to only work in Normal mode and not be recursive
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap < <C-w><
nnoremap > <C-w>>

" match HTML tags with %
runtime macros/matchit.vim

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

filetype plugin on
filetype plugin indent on

:let g:PHP_vintage_case_default_indent = 1

set t_Co=256
set background=dark

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType make set noexpandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype sass setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2

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

" Set ctags statusline to be 'Generating...' when ctags is running
"set statusline+=%{gutentags#statusline('[Generating...]')}

" Displays file charset and BOM existence
" from https://vim.fandom.com/wiki/Show_fileencoding_and_bomb_in_the_status_line
if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

" Vim-test stuff
let test#strategy = "basic"
"let test#project_root = "/Users/corwatts/Repos/www.alexa.com"
"let test#php#phpunit#options = '--configuration /Users/corwatts/Repos/www.alexa.com/tests/phpunit/all-tests.xml'
"let g:test#javascript#tap#file_pattern = '\vtests?.*\.js$' " '\vtests?/.*\.js$'
"let g:test#preserve_screen = 1
let g:test#runner_commands = ['Mocha']
" exit insert mode to scroll around
tmap <C-o> <C-\><C-n>
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>


" Ale config -- sets standard as the only javascript linter, so it doesn't conflict with eslint
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}
" Don't lint on open
let g:ale_lint_on_enter = 0
" Automatically lint and fix on save
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

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
autocmd Filetype php iab debug error_reporting(E_ALL);<CR><BS><CR>ini_set('display_errors', 1);
" type dump to insert a var_dump(); exit(); block and place the cursor nicely
autocmd Filetype php iab dump var_dump();<CR>exit();<Esc>k$hi
" type export to insert a print '<pre>'; var_export(); print '</pre>'; exit(); block and place the cursor nicely
autocmd Filetype php iab export print "<pre>";<CR>var_export();<CR>print "</pre>";<CR>exit();<Esc>kk$hi

autocmd Filetype javascript iab exp export
autocmd Filetype javascript iab expd export default
autocmd Filetype javascript iab esnext // eslint-disable-next-line
autocmd Filetype vue iab esnext // eslint-disable-next-line
autocmd FileType vue syntax sync fromstart " fix syntax highlighting in vue files

" trim down which pre-processors are used for .vue files
let g:vue_pre_processors = ['scss']
"Handlebars stuff
let g:mustache_abbreviations = 1

" IndentLines config
"Disable tab helper on startup
let g:indentLine_enabled = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"Toggle tab helper on or off
noremap <Leader>h :IndentLinesToggle<CR>

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

" FlyGrep config
"let g:spacevim_search_tools = ['ag', 'grep']
"nnoremap <leader>s/ :FlyGrep<cr>

" highlight git merge conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


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

" Toggles the nifty tag sidebar
nmap <F8> :TagbarToggle<CR>

" :pretty-format XML
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
nnoremap = :FormatXML<Cr>
