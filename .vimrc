colorscheme desert
"colorscheme vividchalk

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype
" and for plugins that are filetype specific.
filetype plugin on
filetype indent on
" Enable syntax highlighting
syntax on
" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden
"set autochdir
set showmatch
set autowrite

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
" find the next match as we type the search
set incsearch
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
" set autoindent

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

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
" set number

" Show the line number relative to the line with the cursor in front of each
" line.
set relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <a-left> <C-w>h
map <a-down> <C-w>j
map <a-up> <C-w>k
map <a-right> <C-w>l

" Start scrolling three lines before horizontal border of window.
set scrolloff=3
" Start scrolling three columns before vertical border of window.
set sidescrolloff=3


" Highlight the screen line of the cursor
" :set cursorline

" mark the ideal max text width
set colorcolumn=+1

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Section: statusline {{{1
" see :help 'statusline

"statusline setup
set statusline=%<%f " Path to the file in the buffer

"display a warning if fileformat isnt unix
function StatuslineWarnFileFormat(fileFormat)
  if a:fileFormat != 'unix'
    return '['.a:fileFormat.']'
  else
    return ''
  endif
endfunction
set statusline+=%(\ %#warningmsg#%{StatuslineWarnFileFormat(&ff)}%*%)

"display a warning if file encoding isnt utf-8
function StatuslineWarnEncoding(encoding)
  if a:encoding != 'utf-8' && a:encoding != ''
    return '['.a:encoding.']'
  else
    return ''
  endif
endfunction
set statusline+=%(\ %#warningmsg#%{StatuslineWarnEncoding(&fenc)}%*%)

" flags : modified, read only, help and fugitive
"set statusline+=%(\ [%M%R%H%{fugitive#statusline()}]%)
set statusline+=%(\ [%M%R%H]%)

set statusline+=%= " right side
" line number, column number, virtual column number and percentage of file
set statusline+=%-14.(%l,%c%V%)\ %P

" }}}1

" Section: statusline colors {{{1
" Don't know myself if putting colors here is a good idea.
" I will know soon enough.

" Function: InsertStatuslineColor {{{2
"   This function change the color of the status line.
"   See :runtime syntax/colortest.vim
" Args:
"   -mode: The current mode : i for INSERT, r for REPLACE
"
" Returns:
"   nothing
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatusLine ctermbg=lightgreen
  elseif a:mode == 'r'
    hi StatusLine ctermbg=lightblue
  else
    hi StatusLine ctermbg=white
  endif
endfunction " }}}2

"au InsertEnter * call InsertStatuslineColor(v:insertmode)
"au InsertChange * call InsertStatuslineColor(v:insertmode)
"au InsertLeave * call InsertStatuslineColor('')

" to handle exiting insert mode via a control-C
"inoremap <c-c> <c-o>:call InsertStatuslineColor('')<cr><c-c>

" default the statusline to green when entering Vim
"call InsertStatuslineColor(v:insertmode)

" }}}1

" vim: set foldmethod=marker:
