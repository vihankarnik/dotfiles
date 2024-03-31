syntax enable

" saves and runs .py file
autocmd filetype python nnoremap <F9> :w <bar> !python "%"<CR><CR>

" saves and compiles .cpp files using g++
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456 && echo The program has compiled\! && %:r<CR><CR>
" runs compiled file
autocmd filetype cpp nnoremap <F10> :!%:r<CR><CR>

" saves and compiles .c files using gcc
autocmd filetype c nnoremap <F9> :w <bar> !gcc % -o %:r -Wl,--stack,268435456 && echo The program has compiled\! && %:r<CR><CR>

" needed this for gtk4 on windows
" autocmd filetype c nnoremap <F9> :w <bar> !gcc % -o %:r -Wl,--stack,268435456 -IC:/msys64/mingw64/bin/../include/gtk-4.0 -IC:/msys64/mingw64/bin/../include/pango-1.0 -IC:/msys64/mingw64/bin/../include/harfbuzz -IC:/msys64/mingw64/bin/../include/gdk-pixbuf-2.0 -IC:/msys64/mingw64/bin/../include/cairo -IC:/msys64/mingw64/bin/../include/glib-2.0 -IC:/msys64/mingw64/bin/../lib/glib-2.0/include -IC:/msys64/mingw64/bin/../include/freetype2 -IC:/msys64/mingw64/bin/../include/graphene-1.0 -IC:/msys64/mingw64/bin/../lib/graphene-1.0/include -mfpmath=sse -msse -msse2 -IC:/msys64/mingw64/bin/../include -IC:/msys64/mingw64/bin/../include/fribidi -IC:/msys64/mingw64/bin/../include/webp -DLIBDEFLATE_DLL -IC:/msys64/mingw64/bin/../include/libpng16 -IC:/msys64/mingw64/bin/../include/pixman-1 -LC:/msys64/mingw64/bin/../lib -lgtk-4 -lpangowin32-1.0 -lharfbuzz -lpangocairo-1.0 -lpango-1.0 -lgdk_pixbuf-2.0 -lcairo-gobject -lcairo -lgraphene-1.0 -lgio-2.0 -lglib-2.0 -lintl -lgobject-2.0<CR><CR>

" runs compiled file
autocmd filetype c nnoremap <F10> :!%:r<CR><CR>

" chad mapping to become true vim user
inoremap jk <Esc>

" some mappings for moving through buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" shortcut to open file tree split vertically
nnoremap <silent> <C-n> :Vexplore<CR>

" a shortcut to insert the data in DoW-Day-Month-Year format
inoremap <leader>date <C-r>=strftime("%a-%d-%m-%Y")<CR>

set scrolloff=11
set guifont=Ubuntu\ Mono:h14

set tabstop=4
set shiftwidth=4
set autoindent
set smarttab
set expandtab       " tabs are spaces
set smartindent
filetype plugin indent on       " load filetype-specific indent files

set number              " shows line numbers
set relativenumber      " shows numbers relative to current position above and below
set cursorline          " highlights current line
set wrap
set nocompatible
set wildmenu
set wildignore=*.o,*~,*.pyc
set noshowmode      " stops showing mode in vim command line, mode is already displayed in statusline
set showmatch       " highlights matching bracket when one end selected
set guioptions-=T   " removes toolbar from gvim
set guioptions-=m
set termguicolors   " most terminals are capable of using TrueColor
set formatoptions-=o    " stops vim from starting new line with comment when ending with one

set backspace=indent,eol,start
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set encoding=utf-8
set ruler
set novisualbell
set belloff=all
set clipboard=unnamed
"set hidden      " allows to open new buffer without saving

" turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set noswapfile

" prefer vertical orientation when using :diffsplit
set diffopt+=vertical

:command R e $MYVIMRC   " shortcut for opening vimrc

" automatic installation of vim-plug and update
" if its on windows
if has('win32') || has('win64') || has('win16')
    if empty(glob('~/vimfiles/autoload/plug.vim'))
        silent !curl -fLo "C:\Users\Vihan Karnik\vimfiles\autoload\plug.vim"    " i HAD to hardcode the path
        \ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

" otherwise it has linux
else
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

" below is for initializing and installing new plugins
call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tmsvg/pear-tree'
call plug#end()

" Pear-Tree settings
" Pair expansion is dot-repeatable by default:
let g:pear_tree_repeatable_expand = 0
" Smart pairs are disabled by default:
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
" mappings:
imap <BS> <Plug>(PearTreeBackspace)
imap <CR> <Plug>(PearTreeExpand)
imap jk <Plug>(PearTreeFinishExpansion)


" tabline settings
let g:airline#extensions#tabline#enabled = 1            " enables airline tabline
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#fnamemod = ':t'        " disables file paths in the tab
let g:airline#extensions#tabline#show_tab_count = 0     " dont show tab numbers on the right
let g:airline#extensions#tabline#tab_nr_type = 1        " indexes tabs for easy switching
let g:airline#extensions#tabline#tab_min_count = 2      " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#show_buffers = 1       " shows buffer with a single tab
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline

" airline settings
let g:airline_theme='simple'    " setting to turn on the Simple theme in vim-airline
colorscheme molokai
hi LineNr guifg=#E6DB74
hi CursorLine guibg=#282828

" changes symbols to unicode
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" Unicode Symbols
let g:airline_symbols = {'linenr': ' ㏑:', 'modified': '+', 'whitespace': '☲', 'branch': 'ᚠ', 'ellipsis': '...', 'paste': 'PASTE', 'maxlinenr': '☰', 'readonly': 'Read-Only', 'spell': 'SPELL', 'space': ' ', 'dirty': '!', 'colnr': '  Col:', 'keymap': 'Keymap:', 'crypt': '🔒', 'notexists': 'Ɇ'}
