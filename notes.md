source-file ~/bin/terminal-helpers/tmux/tmux.conf
set-option -g default-command "reattach-to-user-namespace -l /bin/bash"
set-option -ga terminal-overrides ",xterm-256color:Tc"

set runtimepath+=~/bin/terminal-helpers/vim/runtime
so ~/bin/terminal-helpers/vim/vimrc_unix.vim
set clipboard=unnamed
set termguicolors

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
