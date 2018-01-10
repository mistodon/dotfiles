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
" Plugin 'ctrlpvim/ctrlp.vim' ENABLE ON WINDOWS!!

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

nnoremap / :set nohls<cr>/\c
nnoremap ? :set hls<cr>/
nnoremap <leader>\ :noh<cr>
nnoremap * :set hls<cr>*
nnoremap # :set hls<cr>#

" Need the <tab> because git hooks won't allow trailing spaces
noremap <leader>n :norm<tab>

noremap <leader>? :set hls<cr>?<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>R :!rg

" TODO: Only works on macOS at the moment - need a cross platform copy/paste
nnoremap <leader>r yiw:!rg $(pbpaste)<cr>

nnoremap <leader>b :sh<cr>
nnoremap <leader>h :tabe %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
nnoremap <leader>c :Diff<cr>
nnoremap <leader>D :tabe .<cr>
nnoremap <leader>d :e .<cr>
nnoremap <leader>U :tabe %:h<cr>
nnoremap <leader>u :e %:h<cr>
nnoremap <leader>q :only <bar> :q<cr>
nnoremap <leader>, :set nohls<cr>:s/,/,\r/g<cr>={
nnoremap <leader>w :%s/\s*$//g<cr>:noh<cr><C-o>
nnoremap <leader>t :%s/\t/    /g<cr>:noh<cr><C-o>
nnoremap <leader>T :%s/\t/  /g<cr>:noh<cr><C-o>

nnoremap ( :set nohls<cr>?[{}];*\s*$<cr>
nnoremap ) :set nohls<cr>/[{}];*\s*$<cr>
nnoremap n nzz
nnoremap N Nzz
nnoremap Y 0y$

nnoremap <C-j> <C-w>h
nnoremap <C-k> <C-w>l
nnoremap <C-h> gT
nnoremap <C-l> gt

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


exec "so ~/.dotfiles/vim/vimrc_ext_unix"
" exec \"so ~/.dotfiles/vim/vimrc_ext_windows\"  ENABLE ON WINDOWS
