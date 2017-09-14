set background=light
set t_Co=256
let g:colors_name="tori"

let python_highlight_all = 1
let c_gnu = 1

hi Normal       guifg=#585858   guibg=#ffffff   gui=NONE    cterm=None
hi Comment      guifg=#808080
hi Constant     guifg=#bb4da3
    hi Number   guifg=#78cc6b
    hi String   guifg=#78cc6b
hi Delimiter    guifg=#bb4da3
    hi Special  guifg=#bb4da3
hi Directory    guifg=#0087d7
hi Error        guifg=#aa0000                   gui=Underline   cterm=Underline
hi Identifier   guifg=#0087d7
hi Include      guifg=#bb4da3
hi Keyword      guifg=#8800dd
hi Macro        guifg=#bb4da3
hi Operator     guifg=#fa8d6a
hi PreProc      guifg=#bb4da3
hi Statement    guifg=#8800dd
hi Todo         guifg=#585858   guibg=#a7ffa7
hi Type         guifg=#86c1e3


" Use different cursor line color in insert mode
hi CursorLine                       guibg=#eeeeee   gui=NONE    cterm=None
au InsertLeave * hi CursorLine      guibg=#eeeeee   gui=NONE    cterm=None
au InsertEnter * hi CursorLine      guibg=#ffdfff   gui=NONE    cterm=None


hi CursorLineNr guifg=#585858   guibg=#ffffff 
hi LineNr       guifg=#a8a8a8   guibg=#ffffff 
hi MatchParen                   guibg=#dfffff   gui=Underline   cterm=Underline
hi Search       guifg=#585858   guibg=#a7ffa7   gui=NONE    cterm=None      
hi StatusLine   guifg=#a8a8a8   guibg=#eeeeee   gui=NONE    cterm=None
hi StatusLineNC guifg=#eeeeee   guibg=#a8a8a8   gui=NONE    cterm=None
hi TabLine      guifg=#a8a8a8   guibg=#eeeeee   gui=NONE    cterm=None
hi TabLineSel   guifg=#5fafff   guibg=#ffffff   gui=Underline   cterm=Underline
hi TabLineFill  guifg=#a8a8a8
hi Visual                       guibg=#dfffff


hi DiffAdd       ctermfg=None  ctermbg=194   guifg=NONE    guibg=#dfffdf 
hi DiffDelete    ctermfg=224   ctermbg=224   guifg=#ffdfdf guibg=#ffdfdf 
hi DiffChange    ctermfg=None  ctermbg=195   guifg=NONE    guibg=#dfffff 
hi DiffText      ctermfg=None  ctermbg=153   guifg=NONE    guibg=#afd7ff 
hi Folded        ctermfg=247   ctermbg=253   cterm=None    guifg=#9e9e9e guibg=#dadada gui=NONE      
if &diff
    hi StatusLine    ctermfg=15    ctermbg=63    cterm=None    guifg=#ffffff guibg=#5f5fff gui=NONE      
    hi StatusLineNC  ctermfg=15    ctermbg=147   cterm=None    guifg=#ffffff guibg=#afafff gui=NONE      
endif


syntax match toriParens "[()\[\]]"
hi toriParens   guifg=#24c2c7
