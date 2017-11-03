Dotfiles
===


Requirements
---
1.  Heatseeker (hs): https://github.com/rschmitt/heatseeker (for the `f` command).
2.  Selecta (selecta): https://github.com/garybernhardt/selecta (for \f command in vim).
    -   Note that heatseeker has some weird behaviour in vim - hence using selecta.
    -   Scratch that ... just using heatseeker now? Should probably remove selecta.
    -   Also note that neither work on Cygwin properly...


Setup
---

The following examples assume that you cloned this repo into `~/bin/dotfiles`, but this is not required.


### bashrc

Add the following line to your .bashrc|.bash_profile|.profile|whatever:

`source ~/bin/dotfiles/bashrc`


### git

Make sure you are running Git 2.8 or higher.

Run `./git/configure_git.sh` in this repo (or look at it and run the commands within at your leisure).


### tmux

Add the following line to your .tmux.conf:

`source-file ~/bin/dotfiles/tmux/tmux.conf`

If you get errors sourcing this file, ensure that the line-endings are 'LF' and not 'CRLF'.

You may also need the following for copy/paste and 24-bit color respectively. (And `brew install reattach-to-user-namespace`.)

```
set-option -g default-command "reattach-to-user-namespace -l /bin/bash"
set-option -ga terminal-overrides ",xterm-256color:Tc"
```


### vim

Add the following line to your .vimrc:

`set runtimepath+=~/bin/dotfiles/vim/runtime`

Then add the following line to your .vimrc (depending on OS):

`so ~/bin/dotfiles/vim/vimrc_unix.vim`

`so ~/bin/dotfiles/vim/vimrc_windows.vim`

You may also need: `set termguicolors` for 24-bit color. (You may _also_ need to update your version of vim.)

