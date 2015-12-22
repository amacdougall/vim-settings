set shiftwidth=2
set tabstop=2
set foldmethod=indent
set foldlevel=999
set expandtab
set formatoptions=qn
set smartindent

" check syntax on lines of up to 500 characters
set synmaxcol=500

" run tests, assuming grunt at least
noremap <Leader>rt :SlimeSend1 grunt test &<CR>
