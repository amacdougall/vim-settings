" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" simplify buffer editing by allowing hidden unsaved buffers
set hidden

" between swap files and git, *~ backups haven't been needed
set nobackup
" store swap files in their own directory
set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp

" seriously, these aren't defaults?
set nowrap
set textwidth=0
set autoindent
set smartindent

set incsearch
set nohlsearch

" automatically get changes from outside -- such as git pulls
set autoread

" git has been good enough for me!
set nobackup

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

" pathogen.vim loads plugins from .vim/bundle/myPlugin
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" don't pop up help on an accidental F1
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" key mappings (leave <Leader>p free for PeepOpen on OSX)
let mapleader = ","

" file opening/switching
noremap <Leader>e :FufFile<CR>
noremap <Leader><Tab> :FufBuffer<CR>

" ack searches
noremap <Leader>aa :Ack --actionscript "
noremap <Leader>aj :Ack --js "
noremap <Leader>ar :Ack --ruby "

" plugin sidebars
noremap <Leader>y :YRShow<CR>
noremap <Leader>g :GundoToggle<CR>
noremap <Leader>t :TagbarToggle<CR>

" quickfix (usually Ack results) list: close, next, previous
noremap <Leader>c :cclose<CR>
noremap <Leader>n :cn<CR> zz
noremap <Leader>N :cN<CR> zz

" let vim-slime use tmux instead of GNU screen
let g:slime_target = "tmux"

" display Gundo preview at bottom, not left
let g:gundo_preview_bottom = 1

" toggle relative line numbers
noremap <Leader>r :set rnu!<CR>

" center on match when searching
noremap n nzz
noremap N Nzz

" set PEP8 compliance check mapping
let g:pep8_map="<Leader>8"

" save some <Esc> reaching by mapping kj to it; kj is a very uncommon
" sequence, and you can always just type it slowly if you need it.
inoremap kj <Esc>

:command! JSONFormat :execute ':%!python -m json.tool' | set filetype=javascript

set foldlevel=20 " no initial folds (TO DO: improve this)

abbr dl( Debug.log(
abbr di( Debug.indent(
abbr du( Debug.unindent(

" color scheme
:colorscheme zenburn

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set tags=./tags,tags

" set up Actionscript in Tagbar
let g:tagbar_type_actionscript = {
	\ 'ctagstype': 'ActionScript',
	\ 'kinds' : [
		\ 'f:functions,methods',
		\ 'p:properties',
		\ 'v:variables',
		\ 'c:classes',
		\ 'i:{To do}'
	\ ]
\ }

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

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
