" Name:    focus.vim
" Author:  Alan MacDougall <smoke@alanmacdougall.com>
" License: Public Domain
"
" Focus on a single column of text, showing it in a distraction-free format.
" Save this as ~/.vim/scripts/focus.vim (or whatever you please), and invoke
" it with :source <filename>. Of course, you could certainly hook that up to a
" :command, or a macro, or a Vimscript function...

" collapse current splits and divide screen in three
only
vsplit
vsplit
"
" hide the tildes for nonexistent lines
hi! NonText guifg=bg guibg=bg
" hide the vertical split borders
hi! VertSplit guifg=bg guibg=bg

set laststatus=0 " hide status bar
set noruler " hide ruler [I prefer to leave this out]
enew " edit new blank file, i.e. clear screen
set nocul " hide cursor line highlight, if present
2wincmd l " move to right-hand split
enew
set nocul
wincmd h " move to center split; happy typing!
