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
set rtp+=~/.vim/bundle/Vundle.vim
" intialize Vundle
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" color theme
Plugin 'nanotech/jellybeans.vim'

" add vim snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Add number toggle (relative)
" Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" Add vim test runner
" Plugin 'ToadJamb/vim_test_runner'

" vim test runner keys
map <silent> <leader>t :call tt:TriggerTest()<CR>
map <silent> <leader>r :call tt:TriggerPreviousTest()<CR>

" vim/slim
Plugin 'slim-template/vim-slim.git'

" indentation
Plugin 'nathanaelkane/vim-indent-guides'

" Language support
" livescript
Plugin 'gkz/vim-ls'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-obsession'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'chrisbra/csv.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'

" allow seamless TMUX / VIM integration
Plugin 'christoomey/vim-tmux-navigator'

" allow git changes to be seen in gutter
Plugin 'airblade/vim-gitgutter'

" ag the silver searcher
Plugin 'rking/ag.vim'

" show buffers
Plugin 'jeetsukumaran/vim-buffergator'

" use unimpaired for buffer switching [-b and ]-b
" also used for line bubbling
Plugin 'tpope/vim-unimpaired'

" file files, CTRLP mapped to F
let g:ctrlp_map = 'F'
Plugin 'kien/ctrlp.vim'

" Janus libraries
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/gist-vim'
Plugin 'sjl/gundo.vim'
Plugin 'edsono/vim-matchit'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'chrisbra/NrrwRgn'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-repeat'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-scripts/vimwiki'
Plugin 'thinca/vim-visualstar'
Plugin 'skalnik/vim-vroom'
Plugin 'mattn/webapi-vim'

" Zoom in and out of current pane (C-W, O)
Plugin 'itspriddle/ZoomWin'

" set vim root to the project root
Plugin 'airblade/vim-rooter'

" vim airline (powerline-like theme)
Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1    " add buffer tabs to top

" plugin to create airline theme for tmux
Plugin 'edkolev/tmuxline.vim'
let g:airline_powerline_fonts = 1               " needed for powerline symbols

" visualization of vim markers
Plugin 'kshenoy/vim-signature'

Plugin 'vim-scripts/vim-auto-save'
let g:auto_save_no_updatetime = 600
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

call vundle#end()

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

" indentation
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
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

" NERDTree <leader>n
 map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Dim inactive windows, highlight line 80 for active window.
"augroup BgHighlight
    "autocmd!
    "autocmd WinEnter * let &colorcolumn=join(range(81,999),",")
    "autocmd WinLeave * let &colorcolumn=join(range(1,999),",")
"augroup END

" only show highlighted line in active pane
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
"
" remap jj to escape
inoremap jjwq <esc> :wq<CR>
inoremap jjq <esc> :q<CR>
inoremap jjw <esc> :w<CR>
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

"fatfingers
cnoreabbrev Q q
cnoreabbrev E e
" window resizing

"if bufwinnr(1)
  "map + <C-W>+
  "map _ <C-W>-
  "map > <C-W><
  "map < <C-W>>
"endif


" allows switching between unsaved buffers
" set hidden

" remove ability to use arrow keys (help force vim level up)
"function! ArrowsOff()
"  map <up> <nop>
"  map <down> <nop>
"  map <left> <nop>
"  map <right> <nop>
"  imap <up> <nop>
"  imap <down> <nop>
"  imap <left> <nop>
"  imap <right> <nop>
"endfunc
" Fuck that shit.
" call ArrowsOff()


imap ^[OA <ESC>ki
imap ^[OB <ESC>ji
imap ^[OC <ESC>li
imap ^[OD <ESC>hi


" sytax highlighting for ejs files
au BufNewFile,BufRead *.ejs set filetype=html

"nnoremap <leader>k :call ArrowsOn() <CR>

filetype plugin indent on                        " required for Vundle

nnoremap f :Unite -start-insert file
