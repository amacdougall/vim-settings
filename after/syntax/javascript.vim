" These regions should also just match jsComment, but we can add additional
" highlight commands to the colorscheme if we want.
syntax region jsWingComment start=+//+ end=/$/ contains=jsCommentTodo,@Spell extend keepend
syntax region jsDocComment  start=+/\*\*+ end=+\*/+ contains=jsCommentTodo,@Spell fold extend keepend

highlight jsWingComment gui=italic
highlight jsDocComment gui=italic
highlight Comment gui=italic

" highlight clear jsWingComment
" highlight clear jsDocComment

" Just a little stuff to make Solarized prettier for JS.
hi link jsStorageClass Structure
hi link jsReturn Define
hi link jsFuncCall Function
