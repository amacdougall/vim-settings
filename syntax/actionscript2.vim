" Vim syntax file
" Language:     actionscript
" Maintainer:   Alan MacDougall

syntax clear
let main_syntax = 'actionscript'

syntax keyword as3conditional if then else switch ?
syntax keyword as3keyword public protected internal private override var const function class interface package import return
syntax keyword as3loopConstructs for while do in each break continue
syntax keyword as3scalarLiterals null undefined true false Infinity -Infinity NaN
syntax keyword as3switch case default

syntax match as3function /\w\+\((\)\@=/
syntax match as3lineComment /\/\{2\}.*$/
syntax match as3number /\d\+\(\.\d\+\)\=/
syntax match as3operators /[-><=+*/%{}()\[\]]/
syntax match as3propertyLabel /\w\+\(:\W\)\@=/
syntax match as3typeName /\w\+/ contained
syntax match as3typeSuffixStart /:/ nextgroup=as3typename

syntax region as3docComment start=/\/\*\{2\}/ end=/\*\//
syntax region as3stringD start=/"/ skip=/\\"/ end=/"/
syntax region as3stringS start=/'/ skip=/\\'/ end=/'/
syntax region as3wingComment start=/\/\*\{1\}/ end=/\*\//

highlight link as3docComment Comment
highlight link as3function Function
highlight link as3keyword Keyword
highlight link as3lineComment Identifier
highlight link as3loopConstructs Repeat
highlight link as3number Number
highlight link as3operators Keyword
highlight link as3scalarLiterals Boolean
highlight link as3statements Keyword
highlight link as3stringD String
highlight link as3stringS String
highlight link as3switch Label
highlight link as3typeName Type
highlight link as3wingComment Delimiter

" TODO: figure out how much of this we want to have to deal with
highlight as3propertyLabel guifg=#84C2C1 gui=bold
