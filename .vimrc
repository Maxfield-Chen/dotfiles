set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim/
  let path='~/vimfiles/bundle'
  call vundle#begin(path)

" let Vundle manage Vundle, required

  Bundle 'matze/vim-move'

  Bundle 'suan/vim-instant-markdown'

  Bundle 'godlygeek/tabular'

  Bundle 'eagletmt/ghcmod-vim'

  Bundle 'eagletmt/neco-ghc'

  Plugin 'jeffkreeftmeijer/vim-numbertoggle'

  Plugin 'chriskempson/base16-vim'

  Plugin 'scrooloose/syntastic'

  Plugin 'fatih/vim-go'

  Plugin 'Valloric/YouCompleteMe'

  Plugin 'gmarik/Vundle.vim'

  Plugin 'scrooloose/nerdtree'

  Plugin 'flazz/vim-colorschemes'

  Plugin 'majutsushi/tagbar'

  Plugin 'Raimondi/delimitMate'

" All off these are for snipmate
  Plugin 'garbas/vim-snipmate'

  Plugin 'MarcWeber/vim-addon-mw-utils'

  Plugin 'tomtom/tlib_vim'

  Plugin 'honza/vim-snippets'

" -----------------------------------------------------------
"
" All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
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
filetype indent plugin on

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
nnoremap <C-L> :nohl<CR><C-L>

"I just prefer c-t instead of c-w to move between splits
nnoremap <C-a> <C-W>
" now jk will pop me out of insert mode, essential 
:imap jk <Esc>

" This lets control v paste from clip board and Control c copy to clip board
:nmap <C-V> "+p
:nmap <C-C> "+y

" Toggle Tagbar
:nmap <F8> :TagbarToggle

"ghc mod mappings
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

"Tabularize mappings
let g:haskell_tabular = 1
let g:cpp_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

"------------------------------------------------------------
" Appearance {{{1
set t_Co=256
set guifont=Envy_Code_R:h9.55:cANSI

"------------------------------------------------------------
" Plugin Customization
" Make indents turn on automatically
  "au VimEnter * IndentGuidesEnable
" Open nerdtree with Cntrl n
map <C-n> :NERDTreeToggle<CR>
" Auto Close Nerdtree on Open
let NERDTreeQuitOnOpen=1
"Include ycm extra conf
let g:ycm_global_ycm_extra_conf                     = '~/vimfiles/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion  = 1

"Have vimgo use 2 spaces for my poor eyes
set shiftwidth=2
set tabstop=2
"Set move key to ctrl
let g:move_key_modifier = 'C'

"Syntastic things
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_open            = 0
let g:syntastic_check_on_wq              = 0

"Enable autocompletion through neco-ghc with ycm
let g:ycm_semantic_triggers = {'haskell' : ['.']}

"tab is bound already so make snipmate work with sx
imap xs <esc>a<Plug>snipMateNextOrTrigger
smap xs <Plug>snipMateNextOrTrigger
"------------------------------------------------------------
" Auto Reloading
augroup reload_vimrc " {
    autocmd!
  augroup END " }
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
