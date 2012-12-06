" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on

" Cursor settings
set esckeys
set cursorline
set ruler
set whichwrap=b,s,h,l,<,>,[,]
set nostartofline

" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=0
set smarttab
set expandtab

" Search settings 
set hlsearch
set ignorecase
set smartcase
set incsearch

" UI settings
colorscheme desert 
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3

"""""""""""""""""""""
"  Language-Specifc 
"""""""""""""""""""""
filetype plugin indent on

autocmd FileType c,cpp,java,perl set ts=8 formatoptions=cro cindent smarttab tw=0 nowrap sidescroll=20 listchars=extends:$ expandtab
autocmd FileType php,perl set ts=8 formatoptions=cro smartindent smarttab tw=0 nowrap sidescroll=20 listchars=extends:$
autocmd FileType ruby nnor J /\s*def .*<CR>j^:f<CR>
autocmd FileType ruby nnor K ?\s*def .*<CR>nj^:f<CR>
autocmd FileType xml,xslt,xsl set shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript set shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufRead *.spt set filetype=html
autocmd BufRead *.mako set filetype=html
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

" do not expand tabs in makefiles
autocmd FileType make set noexpandtab

" better python highlighting - see syntax/python.vim for more details
let python_highlight_all = 1
let python_highlight_indent_errors = 0
let python_highlight_space_errors = 0

"set autoindent
set foldmethod=indent
"disable stuff that doesn't seem to work well w/ python
"set autoindent
"set smartindent
"set cindent

"""""""""""""""""""""
"   Mappings
"""""""""""""""""""""

" remap leader
let mapleader=","

" qq to leave insert mode
imap qq <Esc>

" Easy move between buffers
map <S-Left> :bp<CR>
imap <S-Left> <Esc>:bp<CR>a
map <S-Right> :bn<CR>
imap <S-Right> <Esc>:bn<CR>a
map <C-Tab> :bn<CR>
imap <C-Tab> <Esc>:bn<CR>a
map <S-C-Tab> :bp<CR>
imap <S-C-Tab> <ESC>:bp<CR>a

" Don't use Ex mode, use Q for formatting
map Q gq

" Substitute word under cursor. VERY useful
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" spellchecker
nmap <silent> <leader>s :set spell!<CR>
set spelllang=de_de

" open .vimrc in new tab with: ,v
nmap <leader>v :tabedit $MYVIMRC<CR>

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<CR>/<BS>
