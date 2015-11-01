" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" simplify buffer editing by allowing hidden unsaved buffers
set hidden

" always show status line
set laststatus=2

" with git and good save discipline, *~ backups haven't been needed
set nobackup

" honestly, swap files have annoyed me way more often than they have helped
set noswapfile

" seriously, these aren't defaults?
set nowrap
set textwidth=0
set autoindent

set incsearch
set nohlsearch

" automatically get changes from outside -- such as git pulls
set autoread

" don't put double spaces after a period, motherfucker
set nojoinspaces

set t_Co=256
" highlight line the cursor is on
set cul

" use tabs instead of spaces
set noexpandtab
set tabstop=4
set shiftwidth=4

if has("gui_running")
    set guioptions=egt
endif

" VUNDLE PLUGIN CONFIG
" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" plugin listing
" ...from Github
Plugin 'amacdougall/badwolf'
Plugin 'amacdougall/Birds-of-Paradise-VIM-Theme'
Plugin 'amacdougall/inkpot'
Plugin 'amacdougall/jellybeans.vim'
Plugin 'amacdougall/vim-clojure-static'
Plugin 'amacdougall/vim-colors-solarized'
Plugin 'amacdougall/vim-javascript'
Plugin 'amacdougall/vim-pyte'
Plugin 'amacdougall/Zenburn'
Plugin 'buztard/vim-rel-jump'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ervandew/supertab'
Plugin 'exu/pgsql.vim'
Plugin 'guns/vim-sexp'
Plugin 'jpalardy/vim-slime'
Plugin 'junegunn/fzf'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'mileszs/ack.vim'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'vim-scripts/wokmarks.vim'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-reload'

Plugin 'L9'
Plugin 'FuzzyFinder'

call vundle#end()

" don't pop up help on an accidental F1
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" key mappings (leave <Leader>p free for PeepOpen on OSX)
let mapleader = " "

" file save
noremap <Leader>fs :w<CR>

" FuzzyFinder, for everyday file opening and buffer switching
" mnemonic: 'file edit'
noremap <Leader>fe :FufFile<CR>
" mnemonic: 'alt-tab'
noremap <Leader><Tab> :FufBuffer<CR>
" mnemonic: 'file refresh'
noremap <Leader>fr :FufRenewCache<CR>

" FZF, for industrial-strength searches
set rtp+=~/.fzf

" ...needs an xterm-equivalent script in OSX
if has("gui_macvim")
  let g:fzf_launcher = 'fake_xterm %s'
endif

" mnemonic: 'file find' (uses fzf extended mode)
noremap <Leader>ff :FZF -x<CR>

" EasyMotion searches
nmap s <Plug>(easymotion-s2)

" ack searches
noremap <Leader>aa :Ack --actionscript "
noremap <Leader>aj :Ack --js "
noremap <Leader>ar :Ack --ruby "
noremap <Leader>ac :Ack --clojure "

" also, use ag as the backing app for ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" plugin sidebars
noremap <Leader>y :YRShow<CR>
noremap <Leader>g :GundoToggle<CR>

" quickfix (usually Ack results) list: close, next, previous
noremap <Leader>c :cclose<CR>
noremap <Leader>n :cn<CR>zz
noremap <Leader>N :cN<CR>zz

" Syntastic results open, close, next, previous (actually the location list)
noremap <Leader>so :Errors<CR>
noremap <Leader>sc :lclose<CR>
noremap <Leader>sn :lnext<CR>
noremap <Leader>sN :lNext<CR>

" Background color switch
noremap <Leader>bl :set background=light<CR>
noremap <Leader>bd :set background=dark<CR>


" let vim-slime use tmux instead of GNU screen
let g:slime_target = "tmux"

" display Gundo preview at bottom, not left
let g:gundo_preview_bottom = 1

" disable Yankring zap keys
let g:yankring_zap_keys = ''

" allow vim-clojure-static to do its thing on long forms
let g:clojure_maxlines = 250

" toggle relative line numbers
noremap <Leader>r :set rnu!<CR>

" center on match when searching
noremap n nzz
noremap N Nzz

" set up Syntastic eslint configuration
let g:syntastic_javascript_checkers = ['eslint'] " if array, runs ALL in order

:command! JSONFormat :execute ':%!python -m json.tool' | set filetype=javascript

" Useful when adding require lines to JS viewport code.
:command! -nargs=1 RequireJS :read !require <args> %

set foldlevel=20 " no initial folds (TO DO: improve this)

abbr cl( console.log(
abbr dl( Debug.log(
abbr di( Debug.indent(
abbr du( Debug.unindent(

" initial color scheme
:colorscheme zenburn

set history=250		" keep 250 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set tags=./tags,tags

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " additional file types
  au BufRead,BufNewFile *.as set filetype=actionscript
  au BufRead,BufNewFile *.djt set filetype=htmldjango
  au BufRead,BufNewFile *.txt set filetype=text
  au BufRead,BufNewFile *.md set filetype=markdown " instead of Modula3!
  au BufRead,BufNewFile *.coffee set filetype=coffee
  au BufRead,BufNewFile *.jinja2 set filetype=jinja
  au BufRead,BufNewFile Gemfile* set filetype=ruby
  au BufRead,BufNewFile Guardfile set filetype=ruby
  au BufRead,BufNewFile *.clj set filetype=clojure
  au BufRead,BufNewFile *.cljs set filetype=clojure
  " this TypeScript one works because the syntax is so similar
  au BufRead,BufNewFile *.ts set filetype=actionscript
  au BufNewFile,BufRead *.sql set filetype=pgsql

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When reading an Actionscript file, always convert indentation spaces to tabs.
  au BufReadPost *.as retab!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
