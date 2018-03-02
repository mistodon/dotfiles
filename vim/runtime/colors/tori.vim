set background=light

let g:colors_name="tori"
let python_highlight_all = 1
let c_gnu = 1


hi Normal          guifg=#585858 guibg=#ffffff gui=NONE      ctermfg=59    ctermbg=231   cterm=None
hi Comment         guifg=#808080                             ctermfg=102
hi Constant        guifg=#78cc6b                             ctermfg=133
    hi Number          guifg=#78cc6b                             ctermfg=113
    hi String          guifg=#78cc6b                             ctermfg=113
hi Delimiter       guifg=#bb4da3                             ctermfg=133
    hi Special         guifg=#bb4da3                             ctermfg=133
hi Directory       guifg=#0087d7                             ctermfg=32
hi Error           guifg=#aa0000               gui=Underline ctermfg=124                 cterm=Underline
hi Identifier      guifg=#0087d7                             ctermfg=32
hi Include         guifg=#bb4da3                             ctermfg=133
hi Keyword         guifg=#8800dd                             ctermfg=92
hi Macro           guifg=#bb4da3                             ctermfg=133
hi Operator        guifg=#fa8d6a                             ctermfg=209
hi PreProc         guifg=#bb4da3                             ctermfg=133
hi Statement       guifg=#8800dd                             ctermfg=92
hi Todo            guifg=#585858 guibg=#a7ffa7               ctermfg=59    ctermbg=157
hi Type            guifg=#86c1e3                             ctermfg=110


" Use different cursor line color in insert mode
hi CursorLine      guibg=#eeeeee gui=NONE                    ctermbg=231   cterm=None
au InsertLeave * hi CursorLine      guibg=#eeeeee gui=NONE                    ctermbg=231   cterm=None
au InsertEnter * hi CursorLine      guibg=#ffdfff gui=NONE                    ctermbg=225   cterm=None


hi CursorLineNr    guifg=#585858 guibg=#ffffff               ctermfg=59    ctermbg=231
hi LineNr          guifg=#a8a8a8 guibg=#ffffff               ctermfg=145   ctermbg=231
hi MatchParen      guibg=#dfffff gui=Underline               ctermbg=195   cterm=Underline
hi Pmenu           guifg=#585858 guibg=#eeeeee gui=NONE      ctermfg=59    ctermbg=231   cterm=None
hi PmenuSel        guifg=#0087d7 guibg=#dfffff gui=NONE      ctermfg=32    ctermbg=195   cterm=None
hi PmenuSbar       guibg=#a8a8a8 gui=NONE                    ctermbg=145   cterm=None
hi PmenuThumb      guibg=#0087d7 gui=NONE                    ctermbg=32    cterm=None
hi Search          guifg=#585858 guibg=#a7ffa7 gui=Underline      ctermfg=59    ctermbg=157   cterm=Underline
hi StatusLine      guifg=#a8a8a8 guibg=#eeeeee gui=NONE      ctermfg=145   ctermbg=231   cterm=None
hi StatusLineNC    guifg=#eeeeee guibg=#a8a8a8 gui=NONE      ctermfg=231   ctermbg=145   cterm=None
hi TabLine         guifg=#a8a8a8 guibg=#eeeeee gui=NONE      ctermfg=145   ctermbg=231   cterm=None
hi TabLineSel      guifg=#5fafff guibg=#ffffff gui=Underline ctermfg=75    ctermbg=231   cterm=Underline
hi TabLineFill     guifg=#a8a8a8                             ctermfg=145
hi Visual          guibg=#dfffff                             ctermbg=195


hi DiffAdd         guifg=NONE    guibg=#dfffdf               ctermfg=None  ctermbg=194
hi DiffDelete      guifg=#ffdfdf guibg=#ffdfdf               ctermfg=224   ctermbg=224
hi DiffChange      guifg=NONE    guibg=#dfffff               ctermfg=None  ctermbg=195
hi DiffText        guifg=NONE    guibg=#afd7ff               ctermfg=None  ctermbg=153
hi Folded          guifg=#9e9e9e guibg=#dadada gui=NONE      ctermfg=145   ctermbg=188   cterm=None
if &diff
    hi StatusLine      guifg=#ffffff guibg=#5f5fff gui=NONE      ctermfg=231   ctermbg=63    cterm=None
    hi StatusLineNC    guifg=#ffffff guibg=#afafff gui=NONE      ctermfg=231   ctermbg=147   cterm=None
endif


hi markdownH1      guifg=#bb4da3               gui=Bold      ctermfg=133                 cterm=Bold
hi markdownH2      guifg=#bb4da3               gui=Bold      ctermfg=133                 cterm=Bold
hi markdownH3      guifg=#bb4da3               gui=Bold      ctermfg=133                 cterm=Bold
hi markdownH4      guifg=#bb4da3               gui=Bold      ctermfg=133                 cterm=Bold
hi markdownH5      guifg=#bb4da3               gui=Bold      ctermfg=133                 cterm=Bold
hi markdownH6      guifg=#bb4da3               gui=Bold      ctermfg=133                 cterm=Bold

hi htmlBold        guifg=#000000               gui=Bold      ctermfg=16                  cterm=Bold
hi htmlItalic      guifg=#0087d7               gui=Bold      ctermfg=32                  cterm=Bold

hi Title           guifg=#bb4da3               gui=Bold      ctermfg=133                 cterm=Bold

syntax match toriParens "[()\[\]]"
hi toriParens      guifg=#24c2c7                             ctermfg=38


