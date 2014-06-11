set nocompatible

set backupdir=~/.vim/bkup               " Directories for bkup files
set directory=~/.vim/bkup               " Directories for swp files

set encoding=utf-8                      " The encoding displayed.
set fileencoding=utf-8                  " The encoding written to file.

filetype off                            " required for Vundle

" prevent going into Ex mode
map Q <Nop>

" Disable CAPS LOCK
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
" for c in range(char2nr('A'), char2nr('Z'))
"  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
"  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
" endfor

" Kill the capslock when leaving insert mode.
" autocmd InsertLeave * set iminsert=0

" set runtime path for Vundle
set rtp+=~/.vim/bundle/vundle/
" intialize Vundle
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" color theme
Bundle "nanotech/jellybeans.vim"

" add vim snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" Add number toggle (relative)
"Bundle "jeffkreeftmeijer/vim-numbertoggle"

"" Add vim test runner
"Bundle "ToadJamb/vim_test_runner"

"" vim test runner keys
"map <silent> <leader>t :call tt:TriggerTest()<CR>
"map <silent> <leader>r :call tt:TriggerPreviousTest()<CR>

" Language support
" livescript
Bundle "gkz/vim-ls"
Bundle "tpope/vim-rails"
Bundle "vim-ruby/vim-ruby"
Bundle "pangloss/vim-javascript"
Bundle "sunaku/vim-ruby-minitest"
Bundle "tpope/vim-markdown"
Bundle "cakebaker/scss-syntax.vim"
Bundle "kchmck/vim-coffee-script"
Bundle "chrisbra/csv.vim"
Bundle "tpope/vim-git"

" allow seamless TMUX / VIM integration
Bundle 'christoomey/vim-tmux-navigator'

" allow git changes to be seen in gutter
Bundle 'airblade/vim-gitgutter'

" ag the silver searcher
Bundle 'rking/ag.vim'

" show buffers
Bundle "jeetsukumaran/vim-buffergator"

" use unimpaired for buffer switching [-b and ]-b
" also used for line bubbling
Bundle "tpope/vim-unimpaired"

" file files, CTRLP mapped to F
let g:ctrlp_map = 'F'
Bundle "kien/ctrlp.vim"

" Janus libraries
Bundle "ap/vim-css-color"
Bundle "tpope/vim-dispatch"
Bundle "tpope/vim-endwise"
Bundle "Lokaltog/vim-easymotion"
Bundle "tpope/vim-eunuch"
Bundle "tpope/vim-fugitive"
Bundle "mattn/gist-vim"
Bundle "sjl/gundo.vim"
Bundle "edsono/vim-matchit"
Bundle "terryma/vim-multiple-cursors"
Bundle "chrisbra/NrrwRgn"
Bundle "scrooloose/nerdcommenter"
Bundle "scrooloose/nerdtree"
Bundle "tpope/vim-repeat"
Bundle "ervandew/supertab"
Bundle "tpope/vim-surround"
Bundle "scrooloose/syntastic"
Bundle "majutsushi/tagbar"
Bundle "bronson/vim-trailing-whitespace"
Bundle "vim-scripts/vimwiki"
Bundle "thinca/vim-visualstar"
Bundle "skalnik/vim-vroom"
Bundle "mattn/webapi-vim"

" Zoom in and out of current pane (C-W, O)
Bundle "itspriddle/ZoomWin"

" set vim root to the project root
Bundle "airblade/vim-rooter"

" vim airline (powerline-like theme)
Bundle 'bling/vim-airline'
"let g:airline#extensions#tabline#enabled = 1    " add buffer tabs to top

" plugin to create airline theme for tmux
Bundle "edkolev/tmuxline.vim"
let g:airline_powerline_fonts = 1               " needed for powerline symbols

" visualization of vim markers
Bundle "kshenoy/vim-signature"

Bundle "slim-template/vim-slim.git"
syntax enable
filetype plugin indent on

set term=screen-256color
syntax on
set number
set ruler
set background=dark
set t_Co=256                        " force vim to use 256 colors
colorscheme jellybeans              " user jellybeans scheme

" make the colors pretty
highlight Normal ctermbg=none
highlight CursorLineNr ctermbg=233
highlight LineNr ctermbg=232
" Gitgutter
highlight SignColumn ctermbg=none

" Spacing
set wm=0
set tw=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab ts=2 sw=2 ai
set autoindent
set smartindent

" set the cursor to a vertical line in insert mode and a solid block
" in command mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" causes errors when not running in TMUX
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"
" upon hitting escape to change modes,
" send successive move-left and move-right
" commands to immediately redraw the cursor
inoremap <special> <Esc> <Esc>hl

" don't blink the cursor
set guicursor+=i:blinkwait0

" Show trailing whitespace
set list listchars=tab:\ \ ,trail:.

" Bubble lines
nmap <C-k> [e
nmap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv


" Searching
set hlsearch
set incsearch
set ignorecase

set nowrap

" always show the status bar (want this for airline)
set laststatus=2

" highlight the active line
set cursorline
hi CursorLine cterm=underline ctermbg=NONE

" make make grey after line 80
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=232 guibg=#202020

" Dim inactive windows, highlight line 80 for active window.
"augroup BgHighlight
    "autocmd!
    "autocmd WinEnter * let &colorcolumn=join(range(81,999),",")
    "autocmd WinLeave * let &colorcolumn=join(range(1,999),",")
"augroup ND

" only show highlighted line in active pane
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
""
" remap jj to escape
inoremap jj <esc>
"
" easier split navigation
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" use system keyboard
set clipboard=unnamed

" toggle search highlighting
"nnoremap <silent> <SPACE> :let @/ = ""
nnoremap <silent> <SPACE> :set hlsearch!<CR>

" quicker ag access
nnoremap <leader>a :Ag

" shortcuts for splitting the screen
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>l

" window resizing
"if bufwinnr(1)
  "map + <C-W>+
  "map _ <C-W>-
  "map > <C-W><
  "map < <C-W>>
"endif


" allows switching between unsaved buffers
" set hidden

" remap h to insert and use ijkl for inverse T cursor movement
map h <insert>
map i <Up>
map j <Left>
map k <Down>

"save delete inner word
ounmap i
ounmap h

" remove ability to use arrow keys (help force vim level up)
"function! ArrowsOn()
  "imap <up> <nop>
  "imap <down> <nop>
  "imap <left> <nop>
  "imap <right> <nop>
"endfunc
 "call ArrowsOn()


imap ^[OA <ESC>ki
imap ^[OB <ESC>ji
imap ^[OC <ESC>li
imap ^[OD <ESC>hi


" sytax highlighting for ejs files
au BufNewFile,BufRead *.ejs set filetype=html

"nnoremap <leader>k :call ArrowsOn() <CR>

filetype plugin indent on                        " required for Vundle

nnoremap f :Unite -start-insert file
