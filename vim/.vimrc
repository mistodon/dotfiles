set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on

syntax on

set autoindent
set t_Co=256
colorscheme calmdown
set autowrite
set sw=4
set notextmode
set hlsearch
set incsearch
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
