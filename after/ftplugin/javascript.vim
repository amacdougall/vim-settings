set shiftwidth=2
set tabstop=2
set foldmethod=indent
set foldlevel=999
set expandtab
set formatoptions=qn
set smartindent

" check syntax on lines of up to 500 characters
set synmaxcol=500

" run grunt tests
noremap <Leader>gt :SlimeSend1 grunt test<CR>

" run npm tests
noremap <Leader>nt :SlimeSend1 npm test<CR>

" start npm application
noremap <Leader>ns :SlimeSend1 npm start<CR>
