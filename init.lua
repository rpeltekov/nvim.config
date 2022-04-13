-- require "plugins"
vim.g.instant_username = "robert"

vim.cmd [[
	" Enable matchit
	runtime macros/matchit.vim
	if v:version < 800
	    "Start pathogen
	    execute pathogen#infect()
	endif

	set nocompatible              " required
	filetype off                  " required

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'

	" add all your plugins here (note older versions of Vundle
	" used Bundle instead of Plugin)

	" Fold definitions and structures
	Plugin 'tmhedberg/SimpylFold'
	" Properly smart python auto indentation
	Plugin 'vim-scripts/indentpython.vim'
	" Syntax checker
	Plugin 'vim-syntastic/syntastic'
	" Python backend for syntastic
	Plugin 'nvie/vim-flake8'
	" File manager
	Plugin 'scrooloose/nerdtree'
	Plugin 'jistr/vim-nerdtree-tabs'
	" Git Integration
	Plugin 'tpope/vim-fugitive'
	" Airline
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'


	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	"Enable filetype detection
	filetype plugin indent on	 " required

	"Enable folding based on indent (on 8.0 and greater versions)
	if v:version >= 800
	    set foldmethod=indent
	    set foldnestmax=10
	    set nofoldenable
	    set foldlevelstart=10
	endif

	"Enable proper tabbing according to PEP 8 Indentation
	au BufNewFile,BufRead *.py
	    \ set tabstop=4 |
	    \ set softtabstop=4 |
	    \ set shiftwidth=4 |
	    \ set textwidth=79 |
	    \ set expandtab |
	    \ set autoindent |
	    \ set fileformat=unix

	" highlighting and lines
	set showmatch
	set viminfo='1000,f1,<500

	"split navigations
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>

	" Enable folding
	set foldmethod=indent
	set foldlevel=99
	nnoremap <space> za
	let g:SimpylFold_docstring_preview=1

	" flag unnecessary whitespace
	highlight BadWhitespace ctermbg=red guibg=darkred
	au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

	set encoding=utf-8
	set nu

	" Point YCM to the Pipenv created virtualenv, if possible
	" At first, get the output of 'pipenv --venv' command.
	let pipenv_venv_path = system('pipenv --venv')
	" The above system() call produces a non zero exit code whenever
	" a proper virtual environment has not been found.
	" So, second, we only point YCM to the virtual environment when
	" the call to 'pipenv --venv' was successful.
	" Remember, that 'pipenv --venv' only points to the root directory
	" of the virtual environment, so we have to append a full path to
	" the python executable.
	if v:shell_error == 0
	  let venv_path = substitute(pipenv_venv_path, '\n', '', '')
	  let g:ycm_python_binary_path = venv_path . '/bin/python'
	else
	  let g:ycm_python_binary_path = 'python'
	endif

	let python_highlight_all=1
	"Turn on syntax highlighting
	syntax on

	let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
	nnoremap <leader>n :NERDTreeFocus<CR>
	nnoremap <C-n> :NERDTree<CR>
	nnoremap <C-t> :NERDTreeToggle<CR>
	nnoremap <C-f> :NERDTreeFind<CR>

	" Sync the system clipboard with vims
	set clipboard=unnamed,unnamedplus

	if v:progname =~? "evim"
	  finish
	endif

	" Get the defaults that most users want.
	source $VIMRUNTIME/defaults.vim

	if has("vms")
	  set nobackup		" do not keep a backup file, use versions instead
	else
	  set backup		" keep a backup file (restore to previous version)
	  if has('persistent_undo')
	    set undofile	" keep an undo file (undo changes after closing)
	  endif
	endif

	if &t_Co > 2 || has("gui_running")
	  " Switch on highlighting the last used search pattern.
	  set hlsearch
	endif

	" Add optional packages.
	"
	" The matchit plugin makes the % command work better, but it is not backwards
	" compatible.
	" The ! means the package won't be loaded right away but when plugins are
	" loaded during initialization.
	if has('syntax') && has('eval')
	  packadd! matchit
	endif
]]

