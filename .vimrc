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

set autoindent
set t_Co=256
set autowrite
set sw=4
set hlsearch
set incsearch
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set textwidth=0
set wrapmargin=0
set nu
set cul
set nofoldenable
set diffopt+=context:99999
set noeb vb t_vb=
set clipboard=unnamed
set backspace=indent,eol,start
set re=1
set ttyfast
set lazyredraw
set ruler
set hidden

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

" Searching -- /=find, ?=highlight, //+??=reverse
nnoremap / :set nohls<cr>/\c
nnoremap // :set nohls<cr>?\c
nnoremap ? :set hls<cr>/
noremap ?? :set hls<cr>?<cr>
nnoremap <leader>\ :noh<cr>
nnoremap * :set hls<cr>*
nnoremap # :set hls<cr>#

noremap <leader>n :norm<space>
nnoremap <leader>s :update<cr>
nnoremap <leader>R :!rg<space>

" TODO: Only works on macOS at the moment - need a cross platform copy/paste
nnoremap <leader>r yiw:!rg $(pbpaste)<cr>

" Split comma separated things onto multiple lines
nnoremap <leader>, :set nohls<cr>%i<cr><esc>%a<cr><esc>:s/,/,\r/g<cr>j0=%

nnoremap <leader>b :sh<cr>
nnoremap <leader>h :tabe %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
nnoremap <leader>c :Diff<cr>
nnoremap <leader>D :tabe .<cr>
nnoremap <leader>d :e .<cr>
nnoremap <leader>U :tabe %:h<cr>
nnoremap <leader>u :e %:h<cr>
nnoremap <leader>g :buffers<cr>:b<space>
nnoremap <leader>q :only <bar> :q<cr>
nnoremap <leader>w :%s/\s*$//g<cr>:noh<cr><C-o>
nnoremap <leader>t :%s/\t/    /g<cr>:noh<cr><C-o>
nnoremap <leader>T :%s/\t/  /g<cr>:noh<cr><C-o>
nmap <leader>ch :HLT<cr>

nnoremap <leader>1 :b1<cr>
nnoremap <leader>2 :b2<cr>
nnoremap <leader>3 :b3<cr>
nnoremap <leader>4 :b4<cr>
nnoremap <leader>5 :b5<cr>
nnoremap <leader>6 :b6<cr>
nnoremap <leader>7 :b7<cr>
nnoremap <leader>8 :b8<cr>
nnoremap <leader>9 :b9<cr>
nnoremap <leader>0 :b10<cr>

nnoremap n nzz
nnoremap N Nzz
nnoremap Y y$

nnoremap <C-j> <C-w>h
nnoremap <C-k> <C-w>l
nnoremap <C-h> gT
nnoremap <C-l> gt

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

nnoremap <cr> o<esc>

inoremap <C-u> <C-o>u
inoremap <C-r> <C-o>r
inoremap <C-w> <C-o>w
inoremap <C-b> <C-o>b
inoremap <C-W> <C-o>W
inoremap <C-B> <C-o>B

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


set exrc
set secure

au BufNewFile,BufRead * colorscheme tori

set clipboard=unnamed
set termguicolors

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum


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

    nnoremap <leader>F :call HeatseekerCommand("fd -c never", "", ":tabe", ":tabe")<cr>
    nnoremap <leader>f :call HeatseekerCommand("fd -c never", "", ":e", ":tabe")<cr>


    map  <C-A> <Home>
    imap <C-A> <Home>
    vmap <C-A> <Home>
    map  <C-E> <End>
    imap <C-E> <End>
    vmap <C-E> <End>
endif

if has("win32unix")
    nnoremap <leader>f :CtrlP<cr>
    let g:ctrlp_max_files = 0
endif

