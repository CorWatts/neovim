-- Started from here https://github.com/nvim-lua/kickstart.nvim
-- Taken from version fd7f05d872092673ef6a883f72edbf859d268a2e (2022/04/21)
-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  use 'tpope/vim-repeat'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-speeddating'
  use 'tpope/vim-surround'

  -- Grab-bag
  use 'godlygeek/tabular'
  use 'luochen1990/rainbow' -- Rainbow parentheses
  use 'norcalli/nvim-colorizer.lua' -- CSS code highligher
  use 'pedrohdz/vim-yaml-folds'
  -- use 'sonph/onehalf', { 'rtp': 'vim' } -- doesn't work in lua
  use 'Mofiqul/dracula.nvim'

  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
  -- Add indentation guides even on blank lines
  --use 'lukas-reineke/indent-blankline.nvim'

  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'

  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Navigation
  use 'unblevable/quick-scope'
  -- use 'w0rp/ale' " introduces lag and occasional errors to screen
  -- use 'wsdjeg/FlyGrep.vim' " need to learn bindings for this
  use 'wesQ3/vim-windowswap'
  use 'mmahnic/vim-flipwords'
  -- use 'Yggdroot/indentLine'
  use 'janko-m/vim-test'
  -- use 'junegunn/fzf.vim'

  -- Syntax things
  use 'jparise/vim-graphql'
  use 'aklt/plantuml-syntax'
  use 'posva/vim-vue'
  use 'mustache/vim-mustache-handlebars'

  -- Editing and previewing plantuml
  use 'tyru/open-browser.vim'
  use 'weirongxu/plantuml-previewer.vim'
end)

vim.o.ruler = true
--Set highlight on search
vim.o.hlsearch = true
--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = 'v'

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.showmatch = true
vim.o.title = true

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true
--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
--vim.o.updatetime = 250
--vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme dracula]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- indent-blankline config
--vim.opt.termguicolors = true
--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
--vim.opt.list = true
--vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")
--require("indent_blankline").setup {
--    space_char_blankline = " ",
--    char_highlight_list = {
--        "IndentBlanklineIndent1",
--        "IndentBlanklineIndent2",
--        "IndentBlanklineIndent3",
--        "IndentBlanklineIndent4",
--        "IndentBlanklineIndent5",
--        "IndentBlanklineIndent6",
--    },
--}

vim.cmd [[
  "set ruler
  "set number
  "set relativenumber
  "set hlsearch
  "set incsearch
  "set ignorecase
  "set smartcase
  "set showmatch
  "set title
  set binary noeol
  set laststatus=2
  "set mouse=v
  set ff=unix
  set backspace=2
  set splitbelow
  set splitright
  " required by nvim-colorizer
  "set termguicolors

  " make vim automatically re-read the file if it changes outside of vim
  set autoread
  autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | checktime | endif

  set tabstop=2 shiftwidth=2 expandtab

  "set textwidth=80
  "set colorcolumn=+1

  "let mapleader = ","

  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog  = '/usr/local/bin/python3'
  let g:node_host_prog = '/Users/corwatts/.nvm/versions/node/v12.22.1/bin/neovim-node-host'
]]

--Enable Comment.nvim
require('Comment').setup()

--Remap space as leader key
-- vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ','
vim.g.maplocalleader = ','

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Indent blankline
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

--Add leader shortcuts
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').git_files)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>so', function()
  require('telescope.builtin').tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
  vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
-- local servers = { 'javascript', 'typescript', 'vue' }
local servers = { 'volar', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- old config stuff
vim.cmd [[
  " Config for vim-table-mode
  " gives markdown-compatible tables
  let g:table_mode_corner='|'


  " Opposite of J. This splits lines.
  nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

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
  "let g:ale_linters = {
  "\   'javascript': ['standard'],
  "\}
  "let g:ale_fixers = {'javascript': ['standard']}
  " Don't lint on open
  "let g:ale_lint_on_enter = 0
  " Automatically lint and fix on save
  "let g:ale_lint_on_save = 1
  "let g:ale_fix_on_save = 0

  " deal with vim backups
  "command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    "\ | wincmd p | diffthis

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
  "let g:indentLine_enabled = 0
  "let g:indentLine_char_list = ['|', '¦', '┆', '┊']
  "Toggle tab helper on or off
  "noremap <Leader>h :IndentLinesToggle<CR>

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
]]