
" ==========================================================
" VUNDLE
" ==========================================================
"
set nocompatible              " be iMproved, required
set shell=bash
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'L9'
" Avoid a name conflict with L9
Plugin 'bfredl/nvim-ipy'
" Plugin 'ivanov/vim-ipython'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/base16-vim'
Plugin 'alfredodeza/pytest.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
:so /home/roderick/ctagstest/amazingtags.vim
"Plugin 'aliev/btags.vim'
" Plugin 'ervandew/supertab' 

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

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighting
filetype on                   " try to detect filetypes
filetype indent on
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=longest,list,full             " <Tab> cycles between all matching choices.
set hidden

" don't bell or blink
set noerrorbells
set vb t_vb=

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
" set autoindent              " always set autoindenting on
" set nosmartindent           " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.

""" Enable the mouse and scolling
set mouse=a


""" Tags
set tags=~/mytags
" "==========================================================
" [Shortcuts]
" ==========================================================
let mapleader=","             " change the leader to be a comma vs slash

" change current dirctory to this file
nnoremap <leader>cd :lcd %:p:h <CR>:exe ":echo 'current dir modified'"<CR>
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
" sudo write this
cmap W! w !sudo tee % >/dev/null

" Utils
" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" " for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null


"" Cursorline in insert
autocmd InsertEnter * set cursorline
autocmd InsertEnter * highlight CursorLine guifg=white guibg=DarkBlue
autocmd InsertLeave * set nocursorline
"sane copypaste from clipboard
vnoremap <leader>y "+y
nnoremap <leader>p a<C-r><C-o>+
" My commands
command! RemoveTrailingSpaces %s/\s\+$//

" When double click a word, highlight matches( search forward and then backward)
nnoremap <2-LeftMouse> *#
vnoremap <space> *#

" Select all
map <C-a> <esc>ggVG<CR>

" Use Esc to remove search highlights. Second mapping fixes the use of arrowkeys
nnoremap <silent><esc> :noh<CR>
nnoremap <esc>^[ <esc>^[

" Terminal mode in nvim easier window switching
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
" "==========================================================
" [Plugins] configuration
" ==========================================================

" Open NerdTree
map <leader>e :NERDTreeFocus<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', 'tags']
" Nerdcommenter
" Sane shortcuts for toggling comments
map <C-_> <plug>NERDCommenterToggle<CR>
imap <C-_> <Esc><plug>NERDCommenterToggle<CR>i
" Multiple cursors
let g:multi_cursor_exit_from_insert_mode=0

" Flake8
autocmd FileType python map <buffer> <leader>l :call Flake8()<CR>
" Autopep8
autocmd FileType python map <buffer> <leader>8 :call Autopep8()<CR>


" Pytest
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>t <Esc>:Pytest error<CR>
nmap <silent><Leader>tt <Esc>:Pytest <Tab>


" show status when usinv nvim-ipy
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)%(\ -\ %{g:ipy_status}%)\ -\ 

map <silent> <C-J> <Plug>(IPy-Run) 
imap <silent> <C-J> <Esc><Plug>(IPy-Run) 
map <F11> <Plug>(IPy-Interrupt)
map <F12> <Plug>(IPy-Terminate)
" "==========================================================
" Python configuration 
" ==========================================================
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 cindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with colorcolumn=100
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

set colorcolumn=79
" set t_Co=16
" Only if terminal does not support full colors or set to solarized scheme
" let g:solarized_termcolors=16 "Solarized
let g:rehash256 = 1 " Molokai
" Base 16 Access colors present in 256 colorspace
let base16colorspace=256
set background=dark
colorscheme base16-railscasts

"" ----------------------------------------------------------------------------
"" BTags
"" ----------------------------------------------------------------------------
"function! s:align_lists(lists)
  "let maxes = {}
  "for list in a:lists
    "let i = 0
    "while i < len(list)
      "let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      "let i += 1
    "endwhile
  "endfor
  "for list in a:lists
    "call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  "endfor
  "return a:lists
"endfunction

"function! s:btags_source()
  "let lines = map(split(system(printf(
    "\ 'ctags -f - --sort=no --fields=nKs --excmd=pattern --language-force=%s %s',
    "\ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  "if v:shell_error
    "throw 'failed to extract tags'
  "endif
  "return map(s:align_lists(lines), 'join(v:val, "\t")')
"endfunction

"function! s:btags_sink(line)
  "let lines = split(a:line, "\t")
  "for line in lines
      "let arr = split(line, ":")
      "if arr[0] == "line"
          "exec arr[-1]
      "endif
  "endfor
  "sil! norm! zvzz
"endfunction

"function! s:btags()
  "try
    "call fzf#run({'source':  s:btags_source(),
                 "\'down':    '50%',
                 "\'options': '+m -d "\t" --with-nth 4,1',
                 "\'sink':    function('s:btags_sink')})
  "catch
    "echohl WarningMsg
    "echom v:exception
    "echohl None
  "endtry
"endfunction

"command! BTags call s:btags()
