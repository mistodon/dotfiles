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
set shell=bash\ --login
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set nu
set cul
set laststatus=2
set nofoldenable
set diffopt+=context:99999
set noeb vb t_vb=
set clipboard=unnamed
set backspace=indent,eol,start
set re=1
set ttyfast
set lazyredraw
set ruler

" [For gvim
set guifont=Consolas:h9:cANSI:qDRAFT
" ]

au GUIEnter * set vb t_vb=
au CursorHold,CursorHoldI * checktime

" File associations
au BufNewFile,BufRead *.geojson set syntax=javascript
au BufNewFile,BufRead *.vs set syntax=glsl
au BufNewFile,BufRead *.fs set syntax=glsl


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

" Need the <tab> because git hooks won't allow trailing spaces
noremap <leader>n :norm<tab>

nnoremap <leader>s :update<cr>
nnoremap <leader>R :!rg<tab>

" TODO: Only works on macOS at the moment - need a cross platform copy/paste
nnoremap <leader>r yiw:!rg $(pbpaste)<cr>

nnoremap <leader>b :sh<cr>
nnoremap <leader>h :tabe %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
nnoremap <leader>c :Diff<cr>
nnoremap <leader>D :tabe .<cr>
nnoremap <leader>d :e .<cr>
nnoremap <leader>U :tabe %:h<cr>
nnoremap <leader>u :e %:h<cr>
nnoremap <leader>g :buffers<cr>:b<tab>
nnoremap <leader>q :only <bar> :q<cr>
nnoremap <leader>, :set nohls<cr>:s/,/,\r/g<cr>={
nnoremap <leader>w :%s/\s*$//g<cr>:noh<cr><C-o>
nnoremap <leader>t :%s/\t/    /g<cr>:noh<cr><C-o>
nnoremap <leader>T :%s/\t/  /g<cr>:noh<cr><C-o>

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

nnoremap ( :set nohls<cr>?[{}];*\s*$<cr>
nnoremap ) :set nohls<cr>/[{}];*\s*$<cr>
nnoremap n nzz
nnoremap N Nzz

nnoremap <C-j> <C-w>h
nnoremap <C-k> <C-w>l
nnoremap <C-h> gT
nnoremap <C-l> gt

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

nmap <leader>ch :HLT<cr>

" Comment/uncomment code - swiped from https://stackoverflow.com/a/24046914/1457538
let s:comment_map = {
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

    if has('win32')
        nnoremap <leader>f :call HeatseekerCommand("dir /a-d /s /b", "", ':e', ':tabe')<CR>
    else
        nnoremap <leader>f :call HeatseekerCommand("fd -n", "", ':e', ':tabe')<cr>
    endif


    nnoremap <leader>F :call HeatseekerCommand("fd -n", "", ":tabe", ":tabe")<cr>
    nnoremap <leader>f :call HeatseekerCommand("fd -n", "", ":e", ":tabe")<cr>


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

