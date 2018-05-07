set runtimepath+=~/.dotfiles/vim/runtime
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'timonv/vim-cargo'
Plugin 'tikhomirov/vim-glsl'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'gerw/vim-HiLinkTrace'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'skywind3000/asyncrun.vim'

if has("win32unix")
    Plugin 'ctrlpvim/ctrlp.vim'
endif

call vundle#end()
filetype plugin indent on

syntax on
colorscheme tori
let mapleader=","

set autoindent
set t_Co=256
set autowrite
set sw=4
set incsearch
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set textwidth=0
set wrapmargin=0
set nu
set cul
set nofoldenable
set diffopt+=context:99999
set noeb vb t_vb=
set backspace=indent,eol,start
set re=1
set ttyfast
set lazyredraw
set ruler
set hidden
set exrc
set secure
set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set clipboard=unnamed
set scrolloff=3

if has("x11")
    set clipboard=unnamedplus
endif

" Gary Bernhardt's:
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" Status Line
set laststatus=2                             " always show statusbar  
set statusline=  
set statusline+=\[%2n\ ]\                      " buffer number  
set statusline+=%f\                          " filename   
set statusline+=%h%m%r%w                     " status flags  
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
set statusline+=%=                           " right align remainder  
set statusline+=%-14(%l,%c%V%)               " line, character  
set statusline+=%<%P                         " file position  

" [For gvim
set guifont=Consolas:h9:cANSI:qDRAFT
" ]

au GUIEnter * set vb t_vb=
au CursorHold,CursorHoldI * checktime
au BufReadPost *
    \ if line("'\'") && line("'\'") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Syntax associations
au BufNewFile,BufRead *.geojson set syntax=javascript
au BufNewFile,BufRead *.vs set syntax=glsl
au BufNewFile,BufRead *.fs set syntax=glsl
au FileType lua :setlocal sw=2 ts=2 sts=2
au FileType javascript :setlocal sw=2 ts=2 sts=2
au FileType scss :setlocal sw=2 ts=2 sts=2
au BufNewFile,BufRead * colorscheme tori
au CursorHoldI * stopinsert

if !has('nvim')
    set notextmode
endif

if has('nvim')
    au VimLeave * set guicursor=a:ver25-blinkon500
endif

let g:vim_markdown_folding_disabled=1
let g:netrw_banner = 0
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

command! -nargs=0 Diff execute ':silent !git difftool -y HEAD -- %' | execute ':redraw!'

command! FromTheTop so $MYVIMRC

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY (Gary Bernhardt's)
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: Only works on macOS - must be a better way than this
nnoremap <leader>r yiw:!rg $(pbpaste)<cr>

" Searching with and without highlighting
nnoremap / :set nohls<cr>/\c
nnoremap ? :set nohls<cr>?\c
nnoremap // :set hls<cr>/
nnoremap ?? :set hls<cr>?
nnoremap * :set hls<cr>*
nnoremap # :set hls<cr>#

" Make Y consistent with D, C, in terms of newlines
nnoremap Y y$

" Shortcut for typing backquotes which are also my tmux prefix
inoremap ±± ```

" Double-escape makes the selected line color change faster - no idea why
inoremap <esc> <esc><esc>

" Use CTRL+{HJKL} to move between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Set the g marker when moving to top/bottom of file so we can go back later
nnoremap gg gg<C-o>mg<C-i>
nnoremap G G<C-o>mg<C-i>

" Move in display-lines rather than logical lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Make some normal mode commands available in insert mode
inoremap <C-u> <C-o>u
inoremap <C-r> <C-o><C-r>
inoremap <C-w> <C-o>w
inoremap <C-b> <C-o>b

" Make some insert mode commands available in normal mode
nnoremap <cr> o<esc>
nnoremap <bs> O<esc>

" Unmap/remap footgun commands
cnoreabbrev <expr> X (getcmdtype() is# ':' && getcmdline() is# 'X') ? 'x' : 'X'
nnoremap Q :q<cr>
nnoremap Z :x<cr>

" Leader commands
nmap <leader>ch :HLT<cr>

noremap <leader>n :norm<space>

nnoremap <leader>m1 :map <leader>1 :update \\| :call system("
nnoremap <leader>m2 :map <leader>2 :update \\| :call system("
nnoremap <leader>m3 :map <leader>3 :update \\| :call system("
nnoremap <leader>m4 :map <leader>4 :update \\| :call system("
nnoremap <leader>m5 :map <leader>5 :update \\| :call system("
nnoremap <leader>m6 :map <leader>6 :update \\| :call system("
nnoremap <leader>m7 :map <leader>7 :update \\| :call system("
nnoremap <leader>m8 :map <leader>8 :update \\| :call system("
nnoremap <leader>m9 :map <leader>9 :update \\| :call system("
nnoremap <leader>M1 :map <leader>1 :update \\| :!
nnoremap <leader>M2 :map <leader>2 :update \\| :!
nnoremap <leader>M3 :map <leader>3 :update \\| :!
nnoremap <leader>M4 :map <leader>4 :update \\| :!
nnoremap <leader>M5 :map <leader>5 :update \\| :!
nnoremap <leader>M6 :map <leader>6 :update \\| :!
nnoremap <leader>M7 :map <leader>7 :update \\| :!
nnoremap <leader>M8 :map <leader>8 :update \\| :!
nnoremap <leader>M9 :map <leader>9 :update \\| :!
nnoremap <leader><leader> :noh<cr>
nnoremap <leader>D :tabe .<cr>
nnoremap <leader>R :!rg<space>
nnoremap <leader>T :%s/\t/  /g<cr>:noh<cr><C-o>
nnoremap <leader>U :tabe %:h<cr>
nnoremap <leader>b :sh<cr>
nnoremap <leader>c :Diff<cr>
nnoremap <leader>d :e .<cr>
nnoremap <leader>g :buffers<cr>:b<space>
nnoremap <leader>h :tabe %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
nnoremap <leader>q :bd<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>t :%s/\t/    /g<cr>:noh<cr><C-o>
nnoremap <leader>u :e %:h<cr>
nnoremap <leader>w :%s/\s*$//g<cr>:noh<cr><C-o>
nnoremap <leader>' f'xf'x
nnoremap <leader>" f"xf"x
nnoremap <leader>i' F'xf'x
nnoremap <leader>i" F"xf"x
nnoremap <leader>[ %%%x<C-o>x
nnoremap <leader>i[ %%x<C-o>x


" Run some default program for a file
let s:executable_map = {
    \   "rust": 'AsyncRun cargo check && cargo run',
    \   "abc": 'AsyncRun abc2midi % -o %:r.mid && timidity %:r.mid',
    \   "melo": 'AsyncRun melo play %',
    \ }

function! RunFile()
    if g:asyncrun_status == "running"
        exec "AsyncStop"
    else
        if has_key(s:executable_map, &filetype)
            update
            let program = s:executable_map[&filetype]
            exec program
            copen
            wincmd w
        else
            echo "Not sure how to run current file"
        end
    end
endfunction

nnoremap <leader>x :call RunFile()<cr>
vnoremap <leader>x :call RunFile()<cr>
nnoremap <leader>z :exec "AsyncStop"<cr>
vnoremap <leader>z :exec "AsyncStop"<cr>

" Comment/uncomment code - swiped from https://stackoverflow.com/a/24046914/1457538
let s:comment_map = {
    \   "abc": '%',
    \   "bash": '#',
    \   "bash_profile": '#',
    \   "bashrc": '#',
    \   "bat": 'REM',
    \   "lua": '--',
    \   "python": '#',
    \   "ruby": '#',
    \   "sh": '#',
    \   "tex": '%',
    \   "vim": '"',
    \ }

function! ToggleComment()
    let comment_leader = has_key(s:comment_map, &filetype) ? s:comment_map[&filetype] : '\/\/'
    if getline('.') =~ "^\\s*" . comment_leader . " "
        " Uncomment the line
        execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
    else
        if getline('.') =~ "^\\s*" . comment_leader
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
        else
            " Comment the line
            " execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            execute "silent s/^/" . comment_leader . " /"
        end
    end
endfunction

nnoremap <leader>/ :call ToggleComment()<cr>
vnoremap <leader>/ :call ToggleComment()<cr>




if !has("win32unix")
    function! HeatseekerCommand(choice_command, hs_args, first_command, rest_command)
        try
            let selections = system(a:choice_command . " | hs " . a:hs_args)
        catch /Vim:Interrupt/
            redraw!
            return
        endtry
        redraw!
        let first = 1
        for selection in split(selections, "\n")
            if first
                exec a:first_command . " " . selection
                let first = 0
            else
                exec a:rest_command . " " . selection
            endif
        endfor
    endfunction

    nnoremap <leader>f :call HeatseekerCommand("fd -c never", "", ":e", ":tabe")<cr>
    nnoremap <leader>F :call HeatseekerCommand("fd -HI -c never", "", ":e", ":tabe")<cr>
    nnoremap <leader>G yiw<cr> :call HeatseekerCommand("rg -l ".@*, "", ":e", ":tabe")<cr>
endif

if has("win32unix")
    nnoremap <leader>f :CtrlP<cr>
    let g:ctrlp_max_files = 0
endif


" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" changeindent (bool): true: Go to line with different indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, changeindent, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:changeindent && indent(line) == indent ||
          \ a:changeindent && indent(line) != indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or different indentation.
" {_, +} : Move to {next, prev} line with same indentation.
" ,{_, +} : Move to {next, prev} line with different indentation.
nnoremap <silent> <leader>_ :call NextIndent(0, 0, 0, 1)<CR>^
nnoremap <silent> <leader>+ :call NextIndent(0, 1, 0, 1)<CR>^
nnoremap <silent> _ :call NextIndent(0, 0, 1, 1)<CR>^
nnoremap <silent> + :call NextIndent(0, 1, 1, 1)<CR>^
vnoremap <silent> <leader>_ <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> <leader>+ <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> _ <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> + <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> <leader>_ :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> <leader>+ :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> _ :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> + :call NextIndent(1, 1, 1, 1)<CR>
