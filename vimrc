autocmd filetype crontab setlocal nobackup nowritebackup
set nocompatible
filetype off

let g:polyglot_disabled = ['markdown', 'md']
call plug#begin()
" Colors

Plug 'olimorris/onedarkpro.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Tools
Plug 'neomake/neomake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'janko-m/vim-test'

" Tools - Search
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Tools - Git
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'

" Tools - Tab Completion
Plug 'ervandew/supertab'

" Tools - Formatting
Plug 'Raimondi/delimitMate'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'

" Syntax highlighting (polyglot should do it all)
Plug 'sheerun/vim-polyglot'

" coc.vim only works in Node 12+
if system("node --version") =~ '^v[1-9][2-9]'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'neoclide/coc-eslint'
  Plug 'neoclide/coc-tslint-plugin'
  Plug 'neoclide/coc-prettier'
endif

Plug 'ojroques/vim-oscyank'

call plug#end()

autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-tslint-plugin'
  \ ]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Presentation

filetype plugin indent on

au FileType markdown setlocal nospell

syntax enable

colorscheme onedarkpro

lua <<EOF
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      "ruby",
      "javascript",
      "typescript",
    }
  }

  require("onedarkpro").setup {
    caching = true,
    theme = "onelight",
    highlights = {
      MatchParen = { bg = "${gray}" },
      TabLine = { style = "underline", fg = "${purple}" },
      TabLineFill = { style = "underline", fg = "${purple}" }
    },
    options = {
      terminal_colors = true,
      cursorline = true
    },
  }

  -- make the inactive status bar a bit darker so it's
  -- easier to differentiate horizontal splits
  local custom_onelight = require('lualine.themes.onelight')
  custom_onelight.inactive = { c = { bg = "#d0d0d0" } }

  require('lualine').setup {
    options = {
      theme = custom_onelight,
      ignore_focus = { 'nerdtree' },
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'diff'},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {'"🍵"', 'searchcount'},
      lualine_z = {'location'}
    },
  }
EOF

let g:SuperTabContextTextFileTypeExclusions = [".log"]

" in combination with Mouse Reporting enabled in iTerm, allows
" the mouse to be used in normal and visual mode
set mouse=nv
set laststatus=2
set encoding=utf-8
set number
set nowrap
set smarttab
set expandtab
set list listchars=tab:▸\ ,trail:·
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set softtabstop=2
set directory=~/.vim/backup//
set title
set splitbelow
set splitright


" always keep 20 lines of margin between the cursor and the top/bottom edges
set so=20

set hlsearch
set visualbell " If 't_vb' is cleared and 'visualbell' is set, no beep and no flash will ever occur
set t_vb=
set guicursor+=a:blinkon0 " Disable gui cursor blinking "
set clipboard+=unnamedplus
set inccommand=split " live preview of substitutions

let mapleader = "'"

" https://github.com/ggreer/the_silver_searcher
if executable("ag")
  " alias so that I can still use :Ag
  command! -bang -nargs=* -complete=file Ag call ack#Ack('grep<bang>', <q-args>)
  let g:ackprg = 'ag --nogroup --nocolor --column --ignore log/'
endif

" NERDtree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\/packages']
let NERDTreeShowLineNumbers=1

nnoremap ;         :
vnoremap ;         :

nnoremap <C-h>     ^
nnoremap <C-l>     $
nnoremap <C-j>     }
nnoremap <C-k>     {

nnoremap tn        :tabnew<CR>
nnoremap tq        :tabclose<CR>
nnoremap th        :tabprev<CR>
nnoremap tl        :tabnext<CR>

" window resizing
nnoremap <Up>     <C-w>-<C-w>-
nnoremap <Down>   <C-w>+<C-w>+
nnoremap <Left>   <C-w><<C-w><
nnoremap <Right>  <C-w>><C-w>>

map <Leader>b      :Git blame<CR>
map <Leader>v      :b#<CR>
map <leader>d      orequire 'pry'; binding.pry<ESC>
map <leader>clg    oconsole.log(`

" vim-test
let test#strategy = "neovim"
nnoremap <Leader>t :TestFile<CR>
nnoremap <Leader>s :TestNearest<CR>
nnoremap <Leader>l :TestLast<CR>

tnoremap <Leader><Esc>     <C-\><C-n> " exit :terminal

" Disables paste mode when leaving insert mode
autocmd InsertLeave *
    \ if &paste == 1 |
        \     set nopaste |
            \ endif

" fzf
map <C-p>   :GFiles<CR>
map <C-b>   :History<CR>
let g:fzf_buffers_jump = 1

" jsx highlighting
let g:jsx_ext_required = 0

" neomake
call neomake#configure#automake('rw', 1000)

command Readme set linebreak wrap
command Filename !echo % | pbcopy
command! Gblame Git blame

let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby EmmetInstall
