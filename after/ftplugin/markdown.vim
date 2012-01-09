" Markdown converts just fine when the source document is wrapped at 80
" columns; and this makes for a somewhat nicer editing experience imo.
set nowrap
set linebreak
set textwidth=80
set expandtab

set shiftwidth=4
set tabstop=4

abb <buffer> mdash &#8212
abb <buffer> ndash &#8211

" make keyboard navigation work more logically with long wrapped paragraphs
noremap j gj
noremap k gk

