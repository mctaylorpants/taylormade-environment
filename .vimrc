" NOTES
"
" Great presentation on vim
" http://slidedeck.io/inside/vim-presentation

set nocompatible
filetype off

" Vundle begin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Colors
Plugin 'altercation/vim-colors-solarized'
"Plugin 'vim-scripts/SyntaxRange'

" Tools
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
"Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/Rename2'
Plugin 'tpope/vim-dispatch'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'flowtype/vim-flow'

" Tools - Search
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'corntrace/bufexplorer'

" Tools - Git
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'

" Tools - Tab Completion
Plugin 'ervandew/supertab'

" Tools - Formatting
Plugin 'Raimondi/delimitMate'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" Languages
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-markdown'
Plugin 'slim-template/vim-slim'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-rails'
Plugin 'moll/vim-node'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'pangloss/vim-javascript'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'burnettk/vim-angular'
Plugin 'mxw/vim-jsx'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'

" Presentation

call vundle#end()
filetype plugin indent on
" END VUNDLE
"

au BufRead,BufNewFile *.es6 setfiletype javascript

syntax enable
set laststatus=2
set encoding=utf-8
set number
set nowrap

" leader character
let mapleader = "\\"

" whitespace
set smarttab
set expandtab
set list listchars=tab:▸\ ,trail:·
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set softtabstop=2

" backup
set directory=~/.vim/backup//

" show in title bar
set title
set splitbelow
set splitright

set hlsearch
" If colors not properly working, check this for solutions
" http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized


" colorscheme - NOT NEEDED IF RUNNING IN TERMINAL
"set background=light
set background=dark
colorscheme solarized 
let g:solarized_contrast="high"
let g:solarized_visibility="high"
let g:solarized_termcolors=256

" rainbow parentheses

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" ctrlp
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_custom_ignore = '\.git$'

" ack
if executable('ack-grep')
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif
if executable("ag")
  " https://github.com/ggreer/the_silver_searcher
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" NERDtree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\/packages']

" airline (status line)
let g:airline_left_sep=''
let g:airline_right_sep=''

" javascript-libraries-syntax
" let g:used_javascript_libs = 'jquery,underscore,angularjs,angularui,jasmine'

" If 't_vb' is cleared and 'visualbell' is set, "
" no beep and no flash will ever occur "
set visualbell
set t_vb=
set guicursor+=a:blinkon0 " Disable gui cursor blinking "

" Inspired by https://github.com/tpope/vim-unimpaired "
" Sets paste on and set nopaste when leaving insert mode "
" using an autocommand "
nnoremap <silent> yo  :set paste<cr>o
nnoremap <silent> yO  :set paste<cr>O

" Disables paste mode when leaving insert mode
autocmd InsertLeave *
    \ if &paste == 1 |
        \     set nopaste |
            \ endif

" CUSTOM KEY BINDINGS

" remap soft bol and eol
nnoremap <C-h> ^
nnoremap <C-l> $
nnoremap <C-j> }
nnoremap <C-k> {

" start/end of line
map H ^
map L $

" flow
nnoremap <leader>f :FlowMake<cr>

" window resizing
nnoremap <Up> <C-w>-<C-w>-
nnoremap <Down> <C-w>+<C-w>+
nnoremap <Left> <C-w><<C-w><
nnoremap <Right> <C-w>><C-w>>

" force hjkl
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" tabs
nnoremap tn :tabnew<CR>
nnoremap td  :tabclose<CR>
nnoremap t1 1gt
nnoremap t2 2gt
nnoremap t3 3gt
nnoremap t4 4gt
nnoremap t5 5gt
nnoremap t6 6gt
nnoremap t7 7gt
nnoremap t8 8gt
nnoremap t9 9gt

" Allow clipboard access just with y and p. Needs vim 7.4 to work.
" https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/
set clipboard=unnamed
