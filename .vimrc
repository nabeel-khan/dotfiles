" NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
 set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#begin()
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'Quramy/tsuquyomi'
call neobundle#end()

" TypeScript plugin
autocmd FileType typescript setlocal completeopt+=menu,preview
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
let g:syntastic_typescript_tsc_fname = ''

call plug#begin()
Plug 'scwood/vim-hybrid'
call plug#end()

execute pathogen#infect()
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Install vundle
Plugin 'gmarik/Vundle.vim'
" Add syntastic
" Plugin 'scrooloose/syntastic'
" Add emmet
Plugin 'mattn/emmet-vim'
" Add React syntax
Plugin 'mgechev/vim-jsx'
" Add vim-surround
Plugin 'tpope/vim-surround'
" Add NERDTree
Plugin 'scrooloose/nerdtree'
" Add tern
Plugin 'marijnh/tern_for_vim'
" Add MatchTagAlways
Plugin 'valloric/MatchTagAlways'
" Add coffeescript syntax
Plugin 'kchmck/vim-coffee-script'
" Add editorconfig plugin
Plugin 'editorconfig/editorconfig-vim'
" Add awesome color scheme
Bundle 'mgechev/stylish'
" Add Seti_UI color scheme
Plugin 'trusktr/seti.vim'
" Better integration with tmux
Plugin 'christoomey/vim-tmux-navigator'
" Add go support
Plugin 'fatih/vim-go'
" Add TypeScript
Plugin 'leafgarland/typescript-vim'
" Add auto formatter
Plugin 'Chiel92/vim-autoformat'
" Add ctrl+p
Plugin 'kien/ctrlp.vim'
" Add Goyo for distraction free coding
Plugin 'junegunn/goyo.vim'
" Add limelight for better Goyo experience
Plugin 'junegunn/limelight.vim'
" Tools
Plugin 'Shougo/vimproc.vim'
" Supertab
Plugin 'ervandew/supertab.git'
" Switch Splits
Plugin 'wesQ3/vim-windowswap'
call vundle#end()            " required
filetype plugin indent on    " required

" Enhance command-line completion
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Set smartindent
set smartindent
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif
" Set spaces indentation
function SetIndent(n)
  let &tabstop=a:n
  let &shiftwidth=a:n
  let &softtabstop=a:n
endfunction
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
" Use 2 spaces by default
call SetIndent(2)
set expandtab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
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

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" Automatic commands
if has("autocmd")
  " Enable filetype plugin
  " filetype plugin on
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufNewFile,BufRead *.es6 setfiletype javascript syntax=javascript
  autocmd BufNewFile,BufRead *.es7 setfiletype javascript syntax=javascript
  autocmd BufNewFile,BufRead *.tsx setfiletype typescript syntax=typescript
  " Set appropriate linters
  autocmd BufNewFile,BufRead *.jsx let g:syntastic_javascript_jshint_exec = 'jsxhint'
  autocmd BufNewFile,BufRead *.jsx let g:syntastic_javascript_jscs_exec = 'jsxcs'
  autocmd BufNewFile,BufRead *.js let g:syntastic_javascript_checkers = ['jshint', 'jscs']
  " Treat .md files as .markdown
  autocmd BufNewFile,BufRead *.md set syntax=markdown
  " Start NERDTree automatically
  autocmd VimEnter * NERDTree
  " Enable emmet for JavaScript and CSS files
  autocmd FileType html,css EmmetInstall
  " Indentation for CSS files
  autocmd BufNewFile,BufRead *.css,*.py call SetIndent(4)
endif
" Set stylish as color scheme
syntax enable
set background=dark
colorscheme gruvbox
" Emmet
let g:user_emmet_install_global = 0
" Toggle NERDTree
nnoremap <C-e> :NERDTreeToggle<CR>
" Show hidden files in NERDTree
let NERDTreeShowHidden=1

nnoremap <S-j> :m .+1<CR>
nnoremap <S-k> :m .-2<CR>
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" To spell check all git commit messages
au BufNewFile,BufRead COMMIT_EDITMSG set spell

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256"

let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" imap <Tab> <C-P>

" Emmet uses spaces instead of tabs
let g:user_emmet_settings = {
\  'html' : {
\    'indentation' : '  '
\  }
\}

" Change the var declaration from multiline to single line
noremap <leader>v $r;^hhrrhrahrv
" Autoformat
noremap <F3> :Autoformat<CR>

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
