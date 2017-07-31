Terminal Helpers
===

Just a collection of terminal aliases and functions I end up using a lot.

1. Clone this repo into `~/bin/terminal-helpers` (hardcoded right now).
2. Add the line `source ~/bin/terminal-helpers/terminal-helpers.sh` to your .bashrc or equivalent.

tmux
---
Add the following line to your .tmux.conf:

`source-file /path/to/terminal-helpers/tmux/tmux.conf`

vim
---
Add the following line to your .vimrc (depending on OS):

`so /path/to/terminal-helpers/vim/vimrc_unix.vim`

`so /path/to/terminal-helpers/vim/vimrc_windows.vim`
