set wrap
set linebreak
set tw=0
" set wrapmargin=0

" make keyboard navigation work more logically with long wrapped paragraphs
noremap j gj
noremap k gk

" add Narvar notes context
set complete+=k~/projects/narvar/notes/**/*.md

echo 'hi, processed ftplugin/text.vim'
