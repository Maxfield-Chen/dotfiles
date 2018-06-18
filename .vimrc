set nocompatible              " be iMproved, required
filetype off                  " required

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.

" Enable syntax highlighting
syntax enable


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

"Ignore bullshit files
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Set up folding automatically
set foldmethod=indent
set foldlevel=1
set foldclose=all
set foldnestmax=1

"Correctly set font size and style
set gfn=Envy_Code_R:h8:cANSI

" Use <F11> to toggle between 'paste' and 'nopaste'
"set pastetoggle=<F11>

" Start at Home Directory
cd ~

" cdd changes to current directory
nnoremap cdd :cd %:p:h<CR>:pwd<CR>

" using space as leader key
let mapleader = "\<Space>"

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
" Map save to space w
nnoremap <Leader>w :w<CR>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-l> :nohl<CR><C-L>

"I just prefer c-t instead of c-w to move between splits
nnoremap <C-a> <C-W>
" now jk will pop me out of insert mode, essential
:imap jk <Esc>

" This lets control v paste from clip board and Control c copy to clip board
:nmap <C-V> "+p
:nmap <C-C> "+y

"------------------------------------------------------------
" Appearance {{{1
set t_Co=256
set guifont=Envy_Code_R:h9.55:cANSI

"------------------------------------------------------------
"Have vimgo use 2 spaces for my poor eyes
set shiftwidth=2
set tabstop=2
"Set move key to ctrl
let g:move_key_modifier = 'C'

"------------------------------------------------------------

let syntastic_enable_racket_racket_checker=1

"------------------------------------------------------------
" Begin Vundle Config
"------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Racket Support
Plugin 'wlangstroth/vim-racket'

"Align w/ vim lion
Plugin 'tommcdo/vim-lion'

" You Complete Me: Autocomplete
Plugin 'Valloric/YouCompleteMe'

" Zenburn Colorscheme
Plugin 'jnurmine/zenburn'

" CTRLP Fuzzy File Finding
Plugin 'ctrlpvim/ctrlp.vim'

" LightLine
Plugin 'itchyny/lightline.vim'

" Nerd Commenter
Plugin 'scrooloose/nerdcommenter'

" Easy Rename Current File
Plugin 'danro/rename.vim'

" Vim Fugitive: Git helper
Plugin 'tpope/vim-fugitive'

" Syntastic: Syntax Hacks
Plugin 'vim-syntastic/syntastic'

" Surround
Plugin 'tpope/vim-surround'

" Repeat
Plugin 'tpope/vim-repeat'

" Fireplace + Classpath
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'

" Sexp
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

" Rust Syntastic Integration
Plugin 'rust-lang/rust.vim'

" All Code Indentation helper
Plugin 'Chiel92/vim-autoformat'


call vundle#end()            " required
filetype plugin indent on    " required
"To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------------------------------------------------------------
" End Vundle Config
"------------------------------------------------------------

"------------------------------------------------------------
" Begin AutoIndent Config
"------------------------------------------------------------
noremap <F3> :Autoformat<CR>
"------------------------------------------------------------
" Begin AutoIndent Config
"------------------------------------------------------------

"------------------------------------------------------------
" Begin Rust Config
"------------------------------------------------------------
"let g:rustfmt_autosave = 1
let g:syntastic_rust_checkers=['cargo']
" Syntastic gets slow, make error checking opt in.
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" Enable cargo checker for lalrpop files
autocmd BufNewFile,BufRead *.lalrpop set filetype=rust
"------------------------------------------------------------
" End Rust Config
"------------------------------------------------------------


"------------------------------------------------------------
" Begin Color Scheme Config
"------------------------------------------------------------
colors zenburn
"------------------------------------------------------------
" End Color Scheme Config
"------------------------------------------------------------

"------------------------------------------------------------
" Begin Syntastic Config
"------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Close Syntastic Errors and Warnings
nnoremap <Leader>l :SyntasticReset<CR>

" check for errors
nnoremap <leader>e :SyntasticCheck<CR> 
"------------------------------------------------------------
" End Syntastic Config
"------------------------------------------------------------
"------------------------------------------------------------

"------------------------------------------------------------
" Begin Sexp Config
"------------------------------------------------------------
let g:sexp_enable_insert_mode_mappings = 0
"------------------------------------------------------------
" End Sexp Config
"------------------------------------------------------------
