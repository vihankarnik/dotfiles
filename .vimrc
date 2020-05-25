syntax enable
inoremap jk <ESC>
set so=7
set tabstop=4
set shiftwidth=4
set autoindent
set smarttab
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set smartindent
set number              " show line numbers
set wrap
set nocompatible
" set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
filetype plugin on
set wildmenu
set wildignore=*.o,*~,*.pyc
set showmatch
set incsearch           " search as characters are entered
"set hlsearch            " highlight matches
set encoding=utf-8
set ruler
set novisualbell
set relativenumber
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
" Some mappings for moving thorugh buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" A shortcut to insert the data in DoW-Day-Month-Year format
inoremap <leader>date <C-r>=strftime("%a-%d-%m-%Y")<CR>

"Below is for automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"Below is for initializing and installing new plugins

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Vim HardTime
Plug 'takac/vim-hardtime'
" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Vim Bufferline for displaying the opened files in the command line
Plug 'bling/vim-bufferline'
" AutoComplete Plugin
" Plug 'Valloric/YouCompleteMe'
" The file explorer plugin
Plug 'preservim/nerdtree'
" Markdown viewer
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" VimWiki for taking notes
Plug 'vimwiki/vimwiki'
" Initialize plugin system
call plug#end()

" Setting to turn on the Simple theme in vim-airline
let g:airline_theme='simple'

" Setting to turn on the Hard Mode plugin
"let g:hardtime_default_on=1
" The is the keybinding for toggling NERDTree plugin
map <C-n> :NERDTreeToggle<CR>

" This is for changing the vimwiki syntax to markdown
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
"let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
"Some settings for the markdown viewer. Uncomment to override defaults
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
map <leader>md :InstantMarkdownPreview<CR>
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
