Dotfiles
===

bashrc
---
Add the following line to your .bashrc/.bash_profile/.profile:

`source /path/to/terminal-helpers/bashrc`

git
---
Execute the following command:

`git config --global core.excludesfile /path/to/terminal-helpers/git/gitignore`

tmux
---
Add the following line to your .tmux.conf:

`source-file /path/to/terminal-helpers/tmux/tmux.conf`

If you get errors sourcing this file, ensure that the line-endings are 'LF' and not 'CRLF'.

vim
---
Add the following line to your .vimrc:

`set runtimepath+=/path/to/terminal-helpers/vim/runtime`

Then add the following line to your .vimrc (depending on OS):

`so /path/to/terminal-helpers/vim/vimrc_unix.vim`

`so /path/to/terminal-helpers/vim/vimrc_windows.vim`
