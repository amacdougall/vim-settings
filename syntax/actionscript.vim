" Vim syntax file
" Language:     actionscript
" Maintainer:   Alan MacDougall

" SYNTAX
syntax sync ccomment
syntax sync minlines=50

" keywords
syntax match as3operator /[-><=+*/%{}()\[\]]/
syntax keyword as3conditional if then else switch ?
syntax keyword as3keyword public protected internal private static dynamic extends implements override get set var const function class interface package import
syntax keyword as3actionKeyword new return continue break throw delete
syntax keyword as3loopConstructs for while do in each try catch finally
syntax keyword as3scalarLiterals null undefined true false Infinity -Infinity NaN
syntax keyword as3switch case default

" syntactical elements
syntax match as3function /\w\+\((\)\@=/
syntax match as3number /-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>/
syntax region as3stringD start=/"/ skip=/\\\\\|\\"/ end=/"/
syntax region as3stringS start=/'/ skip=/\\\\\|\\'/ end=/'/
syntax match as3special "\\\d\d\d\|\\x\x\{2\}\|\\u\x\{4\}\|\\."
syntax region as3RegexpString start=+/\(\*\|/\)\@!+ skip=+\\\\\|\\/+ end=+/[gim]\{,3}+ contains=as3Special oneline

syntax match as3propertyLabel /\w\+\(:\s\)\@=/

syntax match as3typeName /\(\w\+\|\*\)/ contained
syntax match as3typeSuffixStart /:/ nextgroup=as3typename

" comments
syntax region as3wingComment start=/\/\*\{1\}/ skip=/\/\{2\}/ end=/\*\//
syntax region as3docComment start=/\/\*\{2\}/ skip=/\/\{2\}/ end=/\*\// contains=as3docCommentKeyword
syntax match as3docCommentKeyword /@\w\+/
syntax match as3lineComment /\/\{2\}.*$/


" HIGHLIGHTING
" Designed to work with zenburn.vim. Not really a redistributable solution.
" This is due entirely to the comments -- I defined some extra highlight
" groups so I could have different colored comments all italicized. Otherwise,
" this highlighting uses the same (irritating) convention of bending C-centric
" highlight group names into the service of another language's constructs.

" comments
highlight link as3wingComment Comment
highlight link as3docComment Comment
highlight link as3lineComment Comment

" context highlighting
highlight link as3stringD String
highlight link as3stringS String
highlight link as3regexpString String
highlight link as3typeName Include
highlight link as3function Function
highlight link as3propertyLabel Type

" keyword highlighting
highlight link as3keyword Keyword
highlight link as3actionKeyword PreProc
highlight link as3loopConstructs Repeat
highlight link as3number Number
highlight link as3conditional Conditional
highlight link as3operator StorageClass
highlight link as3scalarLiterals Boolean
highlight link as3statements Keyword
highlight link as3switch Label

" TODO: figure out how to integrate this with the color scheme?
highlight as3docComment guifg=#AABFAA gui=italic
highlight as3docCommentKeyword guifg=#AABFAA gui=bold
highlight as3wingComment guifg=#999999 gui=italic

