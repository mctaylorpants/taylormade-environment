" NOTES
"
" Great presentation on vim
" http://slidedeck.io/inside/vim-presentation
autocmd filetype crontab setlocal nobackup nowritebackup
set nocompatible
filetype off

" Vundle begin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 0

" Tools
Plugin 'neomake/neomake'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'janko-m/vim-test'

" Tools - Search
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'

" Tools - Git
Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rhubarb'

" Tools - Tab Completion
Plugin 'ervandew/supertab'

" Tools - Formatting
Plugin 'Raimondi/delimitMate'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'leafgarland/typescript-vim'

" Syntax highlighting (polyglot should do it all)
Plugin 'sheerun/vim-polyglot'

" Plugin 'gabrielelana/vim-markdown'
let g:polyglot_disabled = ['markdown', 'md']
" let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_new_list_item_indent = 0

call vundle#end()
" END VUNDLE
"

" Presentation

filetype plugin indent on

au BufRead,BufNewFile *.es6 setfiletype javascript
au FileType markdown setlocal nospell

syntax enable

" If colors not properly working, check this for solutions
" http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized
set background=light
colorscheme solarized
let g:solarized_contrast="high"
let g:solarized_visibility="high"
let g:solarized_termcolors=16

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

" custom status bar http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l:%c     " Current line and column
set statusline+=/         " Separator
set statusline+=%L        " Total lines

set hlsearch
set visualbell " If 't_vb' is cleared and 'visualbell' is set, no beep and no flash will ever occur
set t_vb=
set guicursor+=a:blinkon0 " Disable gui cursor blinking "
set clipboard+=unnamedplus
set inccommand=split " live preview of substitutions

let mapleader = "'"
let g:ctrlp_max_files = 0
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = 'node_modules\|\.git'
" relies on fd; `brew install fd`
let g:ctrlp_user_command = 'fd --type f --color=never "" %s'

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

map <Leader>b      :Gblame<CR>
map <leader>d      orequire 'pry'; binding.pry<ESC>
map <leader>clg    oconsole.log(`

" vim-test
let test#strategy = "neovim"
nnoremap <Leader>t :TestFile<CR>
nnoremap <Leader>s :TestNearest<CR>
nnoremap <Leader>l :TestLast<CR>

tnoremap <Esc>     <C-\><C-n> " exit :terminal with Esc

" Disables paste mode when leaving insert mode
autocmd InsertLeave *
    \ if &paste == 1 |
        \     set nopaste |
            \ endif


" jsx highlighting
let g:jsx_ext_required = 0

" neomake
call neomake#configure#automake('rw', 1000)

command Readme set linebreak wrap
command Filename !echo % | pbcopy
