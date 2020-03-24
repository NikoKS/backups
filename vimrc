set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tmhedberg/SimpylFold'
Plugin 'valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'ludovicchabant/vim-gutentags'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"========================= Non Plugin ================================


" General Settings
set nu "numbering
set mouse=a
highlight Visual cterm=reverse ctermbg=NONE

"split and buffer navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-@> <C-W><C-W>
set splitbelow
set splitright
nnoremap <C-n> :NERDTreeToggle<CR>

"For common typo
cnoremap Q q
cnoremap W w

"Copy paste to device clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y

noremap <F5> :! python3 "%"<CR>

" Indentation Settings
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
au BufNewFile,BufRead *.py set textwidth=80
au BufNewFile,BufRead *.html set tabstop=2
au BufNewFile,BufRead *.html set shiftwidth=2

" Enable Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1


" Syntax Highlight
let python_highlight_all=1
syntax on

"Whitespace flaggin
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set backspace=indent,eol,start

"Easier search find
set path+=**
set wildmenu

"Better File Browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"Status line
set laststatus=2                             " always show statusbar
set statusline=
set statusline+=%-10.3n\                     " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=%=                           " right align remainder
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position


"NerdTree Settings
autocmd StdinReadPre * let s:std_in=1                                                                 "open when no file specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "close vim if only nerd tree
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif                   "Make sure nothing opened in nerdtree buffer
autocmd StdinReadPre * let s:std_in=1  "open nerd tree when vim a folder
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"Device Specific Settings
"nuc:
"filetype plugin on
"filetype indent on
"syntax enable

"Command to install vundle:
"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"sudo apt install build-essential cmake python3-dev
"cd ~/.vim/bundle/YouCompleteMe
"python3 install.py --all

"TODO:
