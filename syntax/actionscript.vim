" Vim syntax file
" Language:     actionscript
" Maintainer:   Alan MacDougall

" SYNTAX
syntax sync ccomment
syntax sync minlines=50

" keywords
syntax match as3operator /[-><=+*/%{}()\[\]&|?!]/
syntax keyword as3conditional if then else switch ?
syntax keyword as3keyword public protected internal private static dynamic extends implements override get set is var const function class interface package import
syntax keyword as3actionKeyword new return continue break throw delete
syntax match as3loopConstructs /each/ " using match lets us override later
syntax keyword as3loopConstructs for while do in try catch finally
syntax keyword as3scalarLiterals null undefined true false Infinity -Infinity NaN
syntax keyword as3switch case default

" syntactical elements
syntax match as3function /\w\+\((\)\@=/
syntax match as3number /-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>/
syntax region as3stringD start=/"/ skip=/\\\\\|\\"/ end=/"/
syntax region as3stringS start=/'/ skip=/\\\\\|\\'/ end=/'/
syntax match as3special "\\\d\d\d\|\\x\x\{2\}\|\\u\x\{4\}\|\\."
syntax region as3regExpString start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,3\}\s*$+ end=+/[gim]\{0,3\}\s*[;.,)\]}]+me=e-1 contains=as3special oneline

syntax match as3propertyLabel /\w\+\(:\s\)\@=/

syntax match as3typeName /\(\w\+\(\.\w\+\)*\|\*\)/ contained
syntax match as3typeSuffixStart /:/ nextgroup=as3typename

" comments
syntax region wingComment start=/\/\*\{1\}/ skip=/\/\{2\}/ end=/\*\//
syntax region docComment start=/\/\*\{2\}/ skip=/\/\{2\}/ end=/\*\// contains=docCommentKeyword
syntax match  docCommentKeyword /@\w\+/
syntax match as3lineComment /\/\{2\}.*$/


" HIGHLIGHTING
" (colors files may supercede the links with explicit highlighting)

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
highlight link as3operator Type
highlight link as3scalarLiterals Boolean
highlight link as3statements Keyword
highlight link as3switch Label
