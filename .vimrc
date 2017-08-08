set nocompatible              " be iMproved, required
filetype off                  " required


" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
        execute 'mkdir -p ~/.vim/autoload'
        execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    endif

"Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes


Plug 'Lokaltog/vim-powerline', { 'branch': 'develop' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'ternjs/tern_for_vim'
Plug 'leafgarland/typescript-vim'
Plug 'jason0x43/vim-js-indent'
Plug 'Quramy/vim-js-pretty-template'

" Initialize plugin system
call plug#end()



" Do not clear screen after exit vi
set t_ti= t_te=
"
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed
set mouse=a
set ttymouse=xterm2

" Performance tweaks
set lazyredraw
set ttyfast

set encoding=utf-8

let mapleader = ","

" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
nmap <Leader><Up> :wincmd k<CR>
nmap <Leader><Down> :wincmd j<CR>
nmap <Leader><Left> :wincmd h<CR>
nmap <Leader><Right> :wincmd l<CR>


nmap <F8> :TagbarToggle<CR>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
set cursorline


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim
" http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=0   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=100
highlight ColorColumn ctermbg=233


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile





" PLUGIN CONFIGS
"===================================



" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
let g:Powerline_symbols = 'fancy'


" Settings for ctrlp

" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" NERD Tree
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree.git
"  + NERDTree Tabs
"  cd ~/.vim/bundle
"  git clone https://github.com/jistr/vim-nerdtree-tabs.git
nmap <silent> <c-n> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeIgnore = ['\.c$','\.o$']
let g:NERDTreeDirArrows=0

let g:tern_show_argument_hints=1
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

