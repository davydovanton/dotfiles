if !has('gui_running') && &t_Co < 256
  finish
endif

set background=dark
hi clear

if exists('syntax_on')
  syntax reset
endif

let colors_name = "darcksoul"

hi! ColorColumn cterm=NONE ctermbg=235 guibg=#1e2132
hi! CursorColumn cterm=NONE ctermbg=235 guibg=#1e2132
hi! CursorLine cterm=NONE ctermbg=235 guibg=#1e2132
hi! Comment ctermfg=242 guifg=#c6c8d1
hi! Constant ctermfg=103 guifg=#c6c8d1
hi! Cursor ctermbg=252 ctermfg=234 guibg=#babbc0 guifg=#161821
hi! CursorLineNr ctermbg=237 ctermfg=253 guibg=#2a3158 guifg=#cdd1e6
hi! Delimiter ctermfg=236 guifg=#c6c8d1
hi! DiffAdd ctermbg=108 ctermfg=234 guibg=#555a47 guifg=#c6c8d1
hi! DiffChange ctermbg=66 ctermfg=234 guibg=#445861 guifg=#c6c8d1
hi! DiffDelete ctermbg=95 ctermfg=234 guibg=#673e43 guifg=#c6c8d1
hi! DiffText cterm=NONE ctermbg=116 ctermfg=234 gui=NONE guibg=#c6c8d1 guifg=#161821
hi! Directory ctermfg=NONE guifg=#c6c8d1
hi! Error ctermbg=234 ctermfg=203 guibg=#161821 guifg=#c6c8d1
hi! ErrorMsg ctermbg=234 ctermfg=203 guibg=#161821 guifg=#c6c8d1
hi! WarningMsg ctermbg=234 ctermfg=203 guibg=#161821 guifg=#c6c8d1
hi! Folded ctermbg=235 ctermfg=245 guibg=#1e2132 guifg=#c6c8d1
hi! FoldColumn ctermbg=235 ctermfg=239 guibg=#1e2132 guifg=#444b71
hi! Function ctermfg=NONE guifg=#c6c8d1
hi! Identifier cterm=NONE ctermfg=NONE guifg=#c6c8d1
hi! LineNr ctermbg=NONE ctermfg=239 guibg=#1e2132 guifg=#444b71
hi! MatchParen ctermbg=NONE ctermfg=255 guibg=#3e445e guifg=#ffffff
hi! MoreMsg ctermfg=NONE guifg=#c6c8d1
hi! NonText ctermbg=NONE ctermfg=236 guibg=#c6c8d1 guifg=#242940
hi! SpecialKey ctermbg=NONE ctermfg=236 guibg=#161821 guifg=#242940
hi! Normal ctermbg=NONE ctermfg=252 guibg=#161821 guifg=#c6c8d1
hi! Operator ctermfg=NONE guifg=#c6c8d1
hi! Pmenu ctermbg=NONE ctermfg=251 guibg=#3d425b guifg=#c6c8d1
hi! PmenuSbar ctermbg=NONE guibg=#3d425b
hi! PmenuSel ctermbg=NONE ctermfg=255 guibg=#c6c8d1 guifg=#eff0f4
hi! PmenuThumb ctermbg=NONE guibg=#c6c8d1
hi! PreProc ctermfg=NONE guifg=#c6c8d1
hi! Question ctermfg=NONE guifg=#c6c8d1
hi! Search ctermbg=103 ctermfg=234 guibg=#c6c8d1 guifg=#392313
hi! SignColumn ctermbg=NONE ctermfg=239 guibg=#1e2132 guifg=#444b71
hi! Special ctermfg=NONE guifg=#c6c8d1
hi! SpellBad guisp=#c6c8d1
hi! SpellCap guisp=#c6c8d1
hi! SpellLocal guisp=#c6c8d1
hi! SpellRare guisp=#c6c8d1
hi! Statement ctermfg=NONE gui=NONE guifg=#c6c8d1
hi! StatusLine cterm=reverse ctermbg=234 ctermfg=245 gui=reverse guibg=#17171b guifg=#818596 term=reverse
hi! StatusLineNC cterm=reverse ctermbg=238 ctermfg=233 gui=reverse guibg=#3e445e guifg=#0f1117
hi! StorageClass ctermfg=NONE guifg=#c6c8d1
hi! String ctermfg=103 guifg=#c6c8d1
hi! Structure ctermfg=NONE guifg=#c6c8d1
hi! TabLine cterm=NONE ctermbg=245 ctermfg=234 gui=NONE guibg=#818596 guifg=#17171b
hi! TabLineFill cterm=reverse ctermbg=234 ctermfg=245 gui=reverse guibg=#17171b guifg=#818596
hi! TabLineSel cterm=NONE ctermbg=234 ctermfg=252 gui=NONE guibg=#161821 guifg=#9a9ca5
hi! Title ctermfg=NONE gui=NONE guifg=#c6c8d1
hi! Todo ctermbg=234 ctermfg=150 guibg=#c6c8d1 guifg=#c6c8d1
hi! Type ctermfg=NONE gui=NONE guifg=#c6c8d1
hi! Underlined cterm=underline ctermfg=110 gui=underline guifg=#c6c8d1 term=underline
hi! VertSplit ctermbg=237 ctermfg=233 guibg=#0f1117 guifg=#0f1117
hi! Visual ctermbg=237 guibg=#272c42
hi! WildMenu ctermbg=238 ctermfg=234 guibg=#d4d5db guifg=#17171b
hi! diffAdded ctermfg=150 guifg=#c6c8d1
hi! diffRemoved ctermfg=203 guifg=#c6c8d1

hi! link cssBraces Delimiter
hi! link helpHyperTextJump Constant
hi! link htmlArg Constant
hi! link htmlEndTag Statement
hi! link htmlTag Statement
hi! link jsFunction Function
hi! link markdownCode String
hi! link markdownCodeDelimiter String
hi! link markdownHeadingDelimiter Comment
hi! link markdownRule Comment
hi! link phpVarSelector Identifier
hi! link rubyDefine Statement
hi! link rubyInclude Statement
hi! link rubyInterpolationDelimiter String
hi! link rubySharpBang Comment
hi! link rubyStringDelimiter String
hi! link svssBraces Delimiter
hi! link swiftIdentifier Normal
hi! link vimContinue Comment
hi! link vimIsCommand Statement
hi! link xmlAttribPunct Statement
hi! link xmlEndTag Statement
hi! link xmlNamespace Statement
hi! link xmlTag Statement
hi! link xmlTagName Statement
hi! link yamlKeyValueDelimiter Delimiter
