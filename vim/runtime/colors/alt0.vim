set background=light
set t_Co=256
let g:colors_name="snowcone"

let python_highlight_all = 1
let c_gnu = 1

" Use different cursor line color in insert mode
hi CursorLine    ctermbg=255   cterm=None    guibg=#eeeeee gui=NONE      
au InsertLeave * hi CursorLine    ctermbg=255   cterm=None    guibg=#eeeeee gui=NONE      
au InsertEnter * hi CursorLine    ctermbg=225   cterm=None    guibg=#ffdfff gui=NONE      

" Style tab bar
hi TabLine       ctermfg=247   ctermbg=255   cterm=None    guifg=#9e9e9e guibg=#eeeeee gui=NONE      
hi TabLineSel    ctermfg=75    cterm=Underline guifg=#5fafff gui=Underline 
hi TabLineFill   ctermfg=253   guifg=#dadada 

" Normal stuff
hi Normal        ctermfg=240   ctermbg=15    cterm=None    guifg=#585858 guibg=#ffffff gui=NONE      
hi Operator      ctermfg=240   ctermbg=15    cterm=None    guifg=#585858 guibg=#ffffff gui=NONE      
hi Type          ctermfg=127   ctermbg=None  cterm=None    guifg=#b4436c guibg=NONE    gui=NONE      
hi Statement     ctermfg=75    ctermbg=None  cterm=None    guifg=#ff785a guibg=NONE    gui=NONE      
hi Identifier    ctermfg=32    ctermbg=None  cterm=None    guifg=#4d9078 guibg=NONE    gui=NONE      
hi Keyword       ctermfg=75    ctermbg=None  cterm=None    guifg=#f2c14e guibg=NONE    gui=NONE      
hi Constant      ctermfg=71    ctermbg=None  cterm=None    guifg=#5fad56 guibg=NONE    gui=NONE      
hi Search        ctermfg=None  ctermbg=120   cterm=None    guifg=NONE    guibg=#87ff87 gui=NONE      
hi Cursor        ctermfg=240   ctermbg=None  cterm=None    guifg=#585858 guibg=NONE    gui=NONE      
hi SpecialKey    ctermfg=87    ctermbg=None  cterm=Bold    guifg=#5fffff guibg=NONE    gui=Bold      
hi Directory     ctermfg=76    ctermbg=None  cterm=None    guifg=#5fd700 guibg=NONE    gui=NONE      
hi ErrorMsg      ctermfg=124   ctermbg=White cterm=None    guifg=#af0000 guibg=White   gui=NONE      
hi PreProc       ctermfg=242   ctermbg=None  cterm=None    guifg=#6c6c6c guibg=NONE    gui=NONE      
hi Comment       ctermfg=244   ctermbg=None  cterm=None    guifg=#808080 guibg=NONE    gui=NONE      
hi DiffText      ctermfg=88    ctermbg=250   cterm=None    guifg=#870000 guibg=#bcbcbc gui=NONE      
hi Todo          ctermfg=233   ctermbg=118   cterm=Bold    guifg=#121212 guibg=#87ff00 gui=Bold      
hi Error         ctermfg=1     ctermbg=None  cterm=Underline guifg=#800000 guibg=NONE    gui=Underline 
hi Special       ctermfg=160   ctermbg=None  cterm=None    guifg=#d70000 guibg=NONE    gui=NONE      
hi Ignore        ctermfg=220   ctermbg=None  cterm=Bold    guifg=#ffdf00 guibg=NONE    gui=Bold      
hi Underline     ctermfg=244   ctermbg=None  cterm=Underline guifg=#808080 guibg=NONE    gui=Underline 
hi LineNr        ctermfg=248   ctermbg=15    guifg=#a8a8a8 guibg=#ffffff 
hi CursorLineNr  ctermfg=252   ctermbg=15    guifg=#d0d0d0 guibg=#ffffff 
hi FoldColumn    ctermfg=247   ctermbg=None  cterm=Bold    guifg=#9e9e9e guibg=NONE    gui=Bold      
hi StatusLineNC  ctermfg=255   ctermbg=250   cterm=None    guifg=#eeeeee guibg=#bcbcbc gui=NONE      
hi StatusLine    ctermfg=247   ctermbg=253   cterm=None    guifg=#9e9e9e guibg=#dadada gui=NONE      
hi VertSplit     ctermfg=247   ctermbg=234   cterm=Bold    guifg=#9e9e9e guibg=#1c1c1c gui=Bold      
hi NonText       ctermfg=87    ctermbg=None  cterm=Bold    guifg=#5fffff guibg=NONE    gui=Bold      
hi Pmenu         ctermfg=White ctermbg=DarkGray cterm=None    guifg=White   guibg=DarkGray gui=NONE      
hi PmenuSel      ctermfg=None  ctermbg=Gray  cterm=Bold    guifg=NONE    guibg=Gray    gui=Bold      
hi PmenuSbar     ctermfg=DarkGray ctermbg=DarkGray cterm=None    guifg=DarkGray guibg=DarkGray gui=NONE      
hi PmenuThumb    ctermfg=Gray  ctermbg=Gray  cterm=None    guifg=Gray    guibg=Gray    gui=NONE      
hi MatchParen    ctermbg=195   cterm=Underline guibg=#dfffff gui=Underline 
hi Include       ctermfg=32    guifg=#0087d7 
hi Macro         ctermfg=32    guifg=#0087d7 

hi Visual        ctermfg=None  ctermbg=195   cterm=None    guifg=NONE    guibg=#dfffff gui=NONE      

" Markdown
hi markdownH1    ctermfg=32    ctermbg=None  cterm=Bold    guifg=#0087d7 guibg=NONE    gui=Bold      
hi markdownH2    ctermfg=32    ctermbg=None  cterm=Bold    guifg=#0087d7 guibg=NONE    gui=Bold      
hi markdownH3    ctermfg=32    ctermbg=None  cterm=Bold    guifg=#0087d7 guibg=NONE    gui=Bold      
hi markdownH4    ctermfg=32    ctermbg=None  cterm=Bold    guifg=#0087d7 guibg=NONE    gui=Bold      
hi markdownH5    ctermfg=32    ctermbg=None  cterm=Bold    guifg=#0087d7 guibg=NONE    gui=Bold      
hi markdownH6    ctermfg=32    ctermbg=None  cterm=Bold    guifg=#0087d7 guibg=NONE    gui=Bold      
hi markdownHeadingDelimiter ctermfg=244   ctermbg=None  cterm=None    guifg=#808080 guibg=NONE    gui=NONE      
hi markdownHeadingRule ctermfg=244   ctermbg=None  cterm=None    guifg=#808080 guibg=NONE    gui=NONE      
hi markdownBold  ctermbg=None  cterm=Bold    guibg=NONE    gui=Bold      
hi markdownItalic ctermbg=None  cterm=Bold    guibg=NONE    gui=Bold      

" HTML
hi HTMLH1        ctermfg=32    ctermbg=None  cterm=Bold    guifg=#0087d7 guibg=NONE    gui=Bold      
hi HTMLH2        ctermfg=32    ctermbg=None  cterm=Bold    guifg=#0087d7 guibg=NONE    gui=Bold      
hi HTMLH3        ctermfg=32    ctermbg=None  cterm=Bold    guifg=#0087d7 guibg=NONE    gui=Bold      
hi HTMLH4        ctermfg=32    ctermbg=None  cterm=Bold    guifg=#0087d7 guibg=NONE    gui=Bold      
hi HTMLH5        ctermfg=32    ctermbg=None  cterm=Bold    guifg=#0087d7 guibg=NONE    gui=Bold      
hi HTMLH6        ctermfg=32    ctermbg=None  cterm=Bold    guifg=#0087d7 guibg=NONE    gui=Bold      

" Diff
hi DiffAdd       ctermfg=None  ctermbg=194   guifg=NONE    guibg=#dfffdf 
hi DiffDelete    ctermfg=224   ctermbg=224   guifg=#ffdfdf guibg=#ffdfdf 
hi DiffChange    ctermfg=None  ctermbg=195   guifg=NONE    guibg=#dfffff 
hi DiffText      ctermfg=None  ctermbg=153   guifg=NONE    guibg=#afd7ff 
hi Folded        ctermfg=247   ctermbg=253   cterm=None    guifg=#9e9e9e guibg=#dadada gui=NONE      

if &diff
    hi StatusLine    ctermfg=15    ctermbg=63    cterm=None    guifg=#ffffff guibg=#5f5fff gui=NONE      
    hi StatusLineNC  ctermfg=15    ctermbg=147   cterm=None    guifg=#ffffff guibg=#afafff gui=NONE      
endif


