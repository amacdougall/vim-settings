" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" simplify buffer editing by allowing hidden unsaved buffers
set hidden

" always show status line
set laststatus=2

" with git and good save discipline, *~ backups haven't been needed
set nobackup

" I also see swapfiles get in my way a lot more than they help
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
Plugin 'VundleVim/Vundle.vim'

" plugin listing
" ...from Github
Plugin 'Lokaltog/vim-easymotion'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'amacdougall/Birds-of-Paradise-VIM-Theme'
Plugin 'amacdougall/Zenburn'
Plugin 'amacdougall/badwolf'
Plugin 'amacdougall/inkpot'
Plugin 'amacdougall/jellybeans.vim'
Plugin 'amacdougall/vim-colors-solarized'
Plugin 'amacdougall/vim-javascript'
Plugin 'amacdougall/vim-pyte'
Plugin 'buztard/vim-rel-jump'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ervandew/supertab'
Plugin 'exu/pgsql.vim'
Plugin 'fatih/vim-go'
Plugin 'github/copilot.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'icymind/NeoSolarized'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'jpalardy/vim-slime'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kovisoft/slimv'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'mbbill/undotree'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'mileszs/ack.vim'
Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'mxw/vim-jsx'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'vim-scripts/wokmarks.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-reload'
Plugin 'yalesov/vim-emblem'

Plugin 'L9'
Plugin 'FuzzyFinder'

call vundle#end()

" don't pop up help on an accidental F1
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" inspired by Evil Leader in Spacemacs
let mapleader = " "

" file save
noremap <Leader>fs :w<CR>

" highlight JSX even in .js files
let g:jsx_ext_required = 0


" Buffergator, buffer switcher
let g:buffergator_sort_regime = "mru"
let g:buffergator_autoexpand_on_split = 0
" show Buffergator at top of screen
let g:buffergator_viewport_split_policy = "T"
" show Vim's buffer name
let g:buffergator_display_regime = "bufname"
" mnemonic: 'alt-tab'
noremap <Leader><Tab> :BuffergatorOpen<CR>
" don't add global keymappings beyond the ones I define
let g:buffergator_suppress_keymaps = 1

" These don't add to the jumplist, so I'll skip them for now
" noremap gn :BuffergatorMruCycleNext<CR>
" noremap gp :BuffergatorMruCyclePrev<CR>

inoremap kj <ESC>

" FuzzyFinder, for flexible file opening
noremap <Leader>fe :FufFile<CR>

" mnemonic: 'file refresh'
noremap <Leader>fr :FufRenewCache<CR>

" mnemonic: 'file find' (uses fzf extended mode)
noremap <Leader>fg :GFiles<CR>
" noremap <Leader>ff :Files<CR>
noremap <Leader>ff :call fzf#run({'source': 'ag --hidden -p ~/.ignore -l -g ""', 'sink': 'e'})<CR>

" mnemonic: 'buffer buffer' (for consistency with leader-ff really)
noremap <Leader>bb :Buffers<CR>

" EasyMotion searches
nmap s <Plug>(easymotion-s2)

" ack searches
noremap <Leader>aa :Ack --actionscript "
noremap <Leader>aj :Ack --js --coffee --ts "
noremap <Leader>ah :Ack --haml "
noremap <Leader>ar :Ack --ruby "
noremap <Leader>ac :Ack --clojure -G "\.clj[cs]?$" "
noremap <Leader>ae :Ack -G "\.emblem$" "
noremap <Leader>as :Ack -G "\.s(a\|c)ss(\.erb)?$" "
noremap <Leader>am :Ack --markdown "
noremap <Leader>at :Ack -G "\.tsx?$" "

" also, use ag as the backing app for ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column --path-to-ignore ~/.ignore'

" plugin sidebars
noremap <Leader>y :YRShow<CR>
noremap <Leader>g :UndotreeToggle<CR>

" close quickfix, error, and preview windows
noremap <Leader>cc :cclose<CR>:pc<CR>:lclose<CR>

" quickfix (usually Ack results) list: next, previous
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

let g:slime_default_config = {"socket_name": "command", "target_pane": ":"}
let g:slime_dont_ask_default = 1

" disable Yankring zap keys
let g:yankring_zap_keys = ''

" allow vim-clojure-static to do its thing on long forms
let g:clojure_maxlines = 250

" toggle relative line numbers
noremap <Leader>rn :set rnu!<CR>

" repeat last command in bash using vim-slime
noremap <Leader>!! :SlimeSend1 !!<CR>

" enable/disable Github Copilot
noremap <Leader>ce :Copilot enable<CR>
noremap <Leader>cd :Copilot disable<CR>

" center on match when searching
noremap n nzz
noremap N Nzz

inoremap kj <ESC>

" set up Syntastic eslint configuration
let g:syntastic_javascript_checkers = ['eslint'] " if array, runs ALL in order
let g:syntastic_coffee_checkers = ['coffee'] " if array, runs ALL in order
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["go"] }

:command! JSONFormat :execute ':%!python -m json.tool' | set filetype=javascript

" Useful when adding require lines to JS viewport code.
:command! -nargs=1 RequireJS :read !require <args> %

set foldlevel=20 " no initial folds (TO DO: improve this)

" quick JS console.log insertion
abbr cl( console.log(

" initial color scheme
:colorscheme zenburn

set history=250		" keep 250 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Used by TagList, which manages Exuberant CTags
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
  set guifont=Menlo:h14

	let g:neovide_scale_factor=1.0
	function! ChangeScaleFactor(delta)
	  let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
	endfunction
	nnoremap <expr><C-=> ChangeScaleFactor(1.10)
	nnoremap <expr><C--> ChangeScaleFactor(1/1.10)
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
  au BufRead,BufNewFile *.cljc set filetype=clojure
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
