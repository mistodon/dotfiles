Dotfiles
===

bashrc
---
Add the following line to your .bashrc/.bash_profile/.profile:

`source /path/to/terminal-helpers/bashrc`

tmux
---
Add the following line to your .tmux.conf:

`source-file /path/to/terminal-helpers/tmux/tmux.conf`

vim
---
Add the following line to your .vimrc:

`set runtimepath+=/path/to/terminal-helpers/vim/runtime`

Then add the following line to your .vimrc (depending on OS):

`so /path/to/terminal-helpers/vim/vimrc_unix.vim`

`so /path/to/terminal-helpers/vim/vimrc_windows.vim`
