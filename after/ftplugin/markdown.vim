" Markdown converts just fine when the source document is wrapped at 80
" columns; and this makes for a somewhat nicer editing experience imo.
set nowrap
set linebreak
set textwidth=80
set expandtab

set shiftwidth=2
set tabstop=2

" make keyboard navigation work more logically with long wrapped paragraphs
noremap j gj
noremap k gk

" add Narvar notes context
set complete+=k~/projects/narvar/notes/minutes/**/*.md
