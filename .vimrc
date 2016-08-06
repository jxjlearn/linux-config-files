set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" simple fold
Plugin 'tmhedberg/SimpylFold'
" python indent
Plugin 'vim-scripts/indentpython.vim'
" Auto-complete
Plugin 'Valloric/YouCompleteMe'
" syntax check
Plugin 'scrooloose/syntastic'
" PEP8 check
Plugin 'nvie/vim-flake8'
" powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Color scheme
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
" vim-ipython 
"Plugin 'ivanov/vim-ipython'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
" Put your non-Plugin stuff after this lin
" enable syntax highlighting
syntax enable

" show line numbers
set number

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"PEP8 indentation
au BufNewFile,BufRead *.py
"set tab as 4 spaces
    \ set tabstop=4
    \ set softtabstop=4
" when using the >> or << commands, shift lines by 4 spaces
    \ set shiftwidth=4
    \ set textwidth=79
" expand tabs into spaces
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

"other filetypes have different format
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
"Flagging Unnecessary Whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>



"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Powerline setup
 set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
 set laststatus=2

" use system clipboard
set clipboard=unnamed

"set t_Co=256
"if has('gui_running')
"	set background=dark
"	colorscheme solarized
"else
"	colorscheme zenburn
"endif
"
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
