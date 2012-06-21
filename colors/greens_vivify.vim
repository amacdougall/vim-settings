set background=dark "or light
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "vivify"
set t_Co=256


" General Syntax Colors
highlight Boolean             guifg=#8f6129 ctermfg=14                            gui=bold cterm=bold
highlight CTagsClass          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalConstant guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalVariable guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsImport         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsMember         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Character           guifg=#7ac5cd ctermfg=116                           gui=none cterm=none

highlight Comment             guifg=#698b69 ctermfg=65                            gui=italic cterm=none
highlight wingComment         guifg=#66644e ctermfg=65                            gui=italic cterm=none
highlight docComment          guifg=#749191 ctermfg=65                            gui=italic cterm=none
highlight docCommentKeyword   guifg=#749191 ctermfg=65                            gui=bold cterm=none

highlight Conditional         guifg=#90ee90 ctermfg=114                           gui=none cterm=none
highlight Constant            guifg=#6b8e23 ctermfg=64                            gui=none cterm=none

highlight Cursor                                        guibg=#386338 ctermbg=28  gui=none cterm=none
highlight CursorColumn        guifg=#eeeeee ctermfg=255 guibg=#003853 ctermbg=24  gui=none cterm=none
highlight CursorLine          guibg=#022913 ctermbg=41                            gui=none cterm=none

highlight Debug               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Define              guifg=#bcd2ee ctermfg=153                           gui=none cterm=none
highlight DefinedName         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Delimiter           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight DiffAdd             guifg=#99aa99 ctermfg=108 guibg=#008b8b ctermbg=30  gui=none cterm=none
highlight DiffChange          guifg=#99aa99 ctermfg=108 guibg=#008b00 ctermbg=28  gui=none cterm=none
highlight DiffDelete          guifg=#99aa99 ctermfg=108 guibg=#000000 ctermbg=0   gui=none cterm=none
highlight DiffText            guifg=#00ffff ctermfg=14                            gui=bold cterm=bold
highlight Directory           guifg=#6ca6cd ctermfg=74                            gui=none cterm=none
highlight EnumerationName     guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight EnumerationValue    guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Error               guifg=#ffffe0 ctermfg=230 guibg=#cd0000 ctermbg=160 gui=none cterm=none
highlight ErrorMsg            guifg=#ffffe0 ctermfg=230 guibg=#b22222 ctermbg=124 gui=none cterm=none
highlight Exception           guifg=#90ee90 ctermfg=114                           gui=bold cterm=bold
highlight Float               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight FoldColumn          guifg=#b0d0e0 ctermfg=117 guibg=#305060 ctermbg=74  gui=bold cterm=bold
highlight Folded              guifg=#000000 ctermfg=0   guibg=#8c8c8c ctermbg=245 gui=bold cterm=bold
highlight Function            guifg=#46ad8a ctermfg=79                            gui=none cterm=none
highlight Identifier          guifg=#46ad8a ctermfg=79                            gui=none cterm=none
highlight Ignore              guifg=#204050 ctermfg=74                            gui=none cterm=none
highlight IncSearch           guifg=#333333 ctermfg=11  guibg=#A3CCA3 ctermbg=74  gui=bold cterm=bold
highlight Include             guifg=#a2b5cd ctermfg=110                           gui=none cterm=none
highlight Keyword             guifg=#60a360 ctermfg=71                            gui=bold cterm=bold
highlight Label               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight LineNr              guifg=#8db6cd ctermfg=74  guibg=#0f0f0f ctermbg=233 gui=bold cterm=bold
highlight LocalVariable       guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Macro               guifg=#8db6cd ctermfg=74                            gui=none cterm=none
highlight MatchParen          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight ModeMsg             guifg=#90ee90 ctermfg=114 guibg=#006400 ctermbg=22  gui=none cterm=none
highlight MoreMsg             guifg=#2e8b57 ctermfg=72                            gui=bold cterm=bold
highlight NonText             guifg=#3d5d6d ctermfg=74  guibg=#001800 ctermbg=22  gui=none cterm=none
highlight Normal              guifg=#99aa99 ctermfg=108 guibg=#001800 ctermbg=22  gui=none cterm=none
highlight Number              guifg=#0486b5 ctermfg=37                            gui=none cterm=none
highlight Operator            guifg=#60a360 ctermfg=71                            gui=bold cterm=bold
highlight PMenu               guifg=#dddddd ctermfg=253 guibg=#444444 ctermbg=67  gui=bold cterm=bold
highlight PMenuSbar           guifg=#dddddd ctermfg=253 guibg=#666666 ctermbg=67  gui=bold cterm=bold
highlight PMenuSel            guifg=#88dd88 ctermfg=114 guibg=#666666 ctermbg=67  gui=bold cterm=bold
highlight PMenuThumb          guifg=#dddddd ctermfg=253 guibg=#c4c6c8 ctermbg=110 gui=bold cterm=bold
highlight PreCondit           guifg=#a4d3ee ctermfg=117                           gui=none cterm=none
highlight PreProc             guifg=#8b7e66 ctermfg=179                           gui=none cterm=none
highlight Question            guifg=#4eee94 ctermfg=85                            gui=bold cterm=bold
highlight Repeat              guifg=#4eee94 ctermfg=85                            gui=none cterm=none
highlight Search              guifg=#000000 ctermfg=0   guibg=#607b8b ctermbg=67  gui=none cterm=none
highlight SignColumn          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Special             guifg=#7ccd7c ctermfg=114                           gui=bold cterm=bold
highlight SpecialChar         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpecialComment      guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpecialKey          guifg=#7ac5cd ctermfg=116 guibg=#103040 ctermbg=24  gui=none cterm=none
highlight SpellBad            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellCap            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellLocal          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellRare           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Statement           guifg=#228b22 ctermfg=28                            gui=bold cterm=bold
highlight StatusLine          guifg=#000000 ctermfg=0   guibg=#e0e0e0 ctermbg=254 gui=bold cterm=bold
highlight StatusLineNC        guifg=#1a1a1a ctermfg=234 guibg=#999999 ctermbg=246 gui=none cterm=none
highlight StorageClass        guifg=#add8e6 ctermfg=81                            gui=none cterm=none
highlight String              guifg=#029ea3 ctermfg=37                            gui=none cterm=none
highlight Structure           guifg=#add8e6 ctermfg=81                            gui=none cterm=none
highlight TabLine             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLineFill         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLineSel          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Tag                 guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Title               guifg=#e066ff ctermfg=171                           gui=bold cterm=bold
highlight Todo                guifg=#90ee90 ctermfg=14  guibg=bg ctermbg=74  gui=none cterm=none
highlight Type                guifg=#bd7550 ctermfg=173                           gui=none cterm=none
highlight Typedef             guifg=#add8e6 ctermfg=81                            gui=none cterm=none
highlight Underlined          guifg=#838b83 ctermfg=65                            gui=underline cterm=underline
highlight Union               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight VertSplit           guifg=#000000 ctermfg=0   guibg=#999999 ctermbg=246 gui=none cterm=none
highlight Visual              guibg=#022913 ctermbg=41                            gui=none cterm=none
highlight VisualNOS           guifg=#eeeeee ctermfg=255                           gui=bold,underline cterm=bold,underline
highlight WarningMsg          guifg=#333333 ctermfg=11  guibg=#A3CCA3 ctermbg=74  gui=bold cterm=bold
highlight WildMenu            guifg=#000000 ctermfg=0   guibg=#7fff00 ctermbg=118 gui=bold cterm=bold
highlight pythonBuiltin       guifg=#99aa99 ctermfg=108                           gui=none cterm=none
