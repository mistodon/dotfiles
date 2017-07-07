set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'rust-lang/rust.vim'
Plugin 'timonv/vim-cargo'

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

set noeb vb t_vb=
au GUIEnter * set vb t_vb=

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("fd -n", "", ":e")<cr>


nnoremap <leader>\ :noh<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>b :sh<cr>
