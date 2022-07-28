#!/bin/bash
export SOURCEDFILES="$SOURCEDFILES ${BASH_SOURCE[0]}"

export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="$PATH:~/.dotfiles/bin"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export WWW_HOME="https://duckduckgo.com"
export EDITOR="vim"
export BASH_ENV=~/.bashrc
export HOPFILE_PATH="$HOME/sync/basis/data/.hopfile"

function from-the-top {
    source ~/.bashrc
    tmux source-file ~/.tmux.conf
}

# Git in prompt from https://coderwall.com/p/pn8f0g/show-your-git-status-and-branch-in-color-at-the-command-prompt
COLOR_NOTCLEAN="\\033[0;35m"
COLOR_YELLOW="\\033[0;33m"
COLOR_LYELLOW="\\033[1;33m"
COLOR_GREY="\\033[0;30;1m"
COLOR_RED="\\033[0;31m"
COLOR_GREEN="\\033[0;32m"
COLOR_BLUE="\\033[0;36m"
COLOR_LBLUE="\\033[1;36m"
COLOR_DBLUE="\\033[0;34m"

function git_color {
  local git_status;
  git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "Changes to be committed" ]]; then
    echo -e "$COLOR_GREEN"
  elif [[ ! $git_status =~ "working tree clean" && ! $git_status =~ "working directory clean" ]]; then
    echo -e "$COLOR_NOTCLEAN"
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e "$COLOR_YELLOW"
  elif [[ $git_status =~ "Your branch is behind" ]]; then
    echo -e "$COLOR_GREY"
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e "$COLOR_BLUE"
  else
    echo -e "$COLOR_DBLUE"
  fi
}

function git_branch {
  local git_status;
  git_status="$(git status 2> /dev/null)"

  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo " ($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo " ($commit)"
  fi
}

function disclaimer {
    if [ -n "$VIM" ]; then
        echo -n "(vim) "
    elif [ -z "$TMUX" ]; then
        echo -n "(no tmux) "
    fi
}

function path_color {
    if [ -n "$VIM" ]; then
        echo -e "$COLOR_LBLUE"
    elif [ -z "$TMUX" ]; then
        echo -e "$COLOR_RED"
    else
        echo -e "$COLOR_LYELLOW"
    fi
}

export PS1="$(disclaimer)\[\033[36m\]\D{%T}\[\033[m\]|\[\$(path_color)\]\W\[\033[m\]\[\$(git_color)\]\$(git_branch)\[\033[m\]\$ "


# From http://onethingwell.org/post/586977440/mkcd-improved
function mkcd {
    mkdir -p "$*"
    cd "$*" || return
}

function mksh {
    echo "#!/usr/bin/env bash

set -eu
set -o pipefail

" > $1 && chmod +x $1
}

function shh {
    chmod +x "$@"
}

function see {
    local filename="$1"
    if [[ "$2" == "-e" ]]; then
        ef "$filename"
    else
        if [[ -z "$filename" ]]; then
            ls
        elif [[ -d "$filename" ]]; then
            ls "$filename"
        else
            bat -p "$filename"
        fi
    fi
}

function lst {
    lx -T $1
}

function with {
    local dirname=$1
    shift

    (cd $dirname && $@)
}

function getthatnewlinetaefuck {
    perl -0pe 's/\n\Z//'
}

# 'edit file' or 'enter folder'
function ef {
    local filename="$1"
    if [[ -d "$filename" ]]; then
        cd "$filename"
    else
        vim "$filename"
    fi
}

# `cd` to directory of the given file
function cdf {
    local path;
    path=$(fd "$@" | head -1)

    if [[ -f "$path" ]]; then
        cd "$(dirname $path)" || return
    elif [[ -d "$path" ]]; then
        cd "$path" || return
    else
        echo "error: No file or directory found."
    fi
}

function lx {
    if [ $# -eq 0 ]; then
        exa -a -1
    else
        exa "$@"
    fi
}

# Shorthands for quitting terminal
alias :q='exit'
alias qq='exit'

function isolate_tmux {
    tmux kill-session -a
    tmux kill-window -a
    tmux kill-pane -a
}

function bel { tput bel ; }
function vbel { open https://falseidolfactory.com ; }
function melbel { melo play ~/temp/bell ; }
function bell { osascript -e "display notification \"Bell\" with title \"$1\" sound name \"bottle\"" ; }
function waitbell { ((sleep "$1" ; bell $2) &) }

function datestamp { date +'%Y_%m_%d_%H%M' ; }
function today { date +"%A %Y-%m-%d" ; }

function rgi {
    local query=$1
    local replacement=$2

    rg "$query" -l | xargs perl -i -pe "s:${query}:${replacement}:g"
}

function rginat {
    local query=$1
    local replacement=$2

    rg --hidden "$query" -l | xargs perl -i -pe "s:${query}:${replacement}:g"
}

function rgedit {
    $EDITOR -p "$(rg "$1" -l)"
}

# Git shorthands
function gs { git status "$@" ; }
function ga { git add "$@" ; }
function gau { git add "$(git ls-files -o --exclude-standard)" ; }
function gr { git reset "$@" ; }
function gd { git diff "$@" ; }
function gdd { git diff --cached "$@" ; }
function gc { git checkout "$@" ; }
function gb { git branch "$@" ; }
function gf { git fetch "$@" ; }

function glog {
    local log_hash="%C(11)%h%Creset"
    local log_relative_time="%C(10)(%ar)%Creset"
    local log_author="%C(bold 12)<%an>%Creset"
    local log_refs="%C(bold 9)%d%Creset"
    local log_subject="%s"
    local log_format="$log_hash^$log_relative_time^$log_author^$log_refs $log_subject"
    git log --graph --color=always --pretty="tformat:${log_format}" $* | column -s '^' -t | less --quit-if-one-screen --no-init --RAW-CONTROL-CHARS --chop-long-lines
}

function glogday {
    local date=$1
    shift 1
    git log --after "$date 00:00" --before "$date 23:59" "$@"
}

function gpull {
    local branch;
    branch="$(git rev-parse --abbrev-ref HEAD)"

    if [ $? -ne 0 ]; then
        return 1
    fi
    git pull --rebase origin "$branch" "$@"
    if [ $? -ne 0 ]; then
        echo -e "\033[1;38mSuggestion:\033[0m maybe try gspull?"
    fi
}

function gish {
    git fetch origin pull/$1/head:pr-$1
}

function gspull {
    git stash
    gpull "$@"
    git stash pop
}

function gpush {
    local branch;
    branch="$(git rev-parse --abbrev-ref HEAD)"

    if [ $? -ne 0 ]; then
        return 1
    fi
    git push -u origin "$branch" "$@"
}

function gnuke {
    local to_master="$1"
    read -r -p "Are you sure you want to nuke this repo? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        if [ "$to_master" == "--master" ]; then
            git submodule foreach --recursive "(git checkout .; git clean -dfx; git checkout master; git pull --rebase)"
        else
            git submodule foreach --recursive "(git checkout .; git clean -dfx; git pull --rebase)"
        fi
        git checkout .
        git clean -dfx
        if [ "$to_master" == "--master" ]; then
            git checkout master
        fi
        git pull --rebase
    else
        echo "Cancelled."
    fi
}

function gidentity {
    git config user.name "$1"
    git config user.email "$2"
}

function gidhome {
    gidentity "Vi" "1149443+mistodon@users.noreply.github.com"
}

function gsub {
    git submodule foreach --recursive "$@"
}

# Local server
function lhost {
    if [ `python --version 2>&1 | cut -c 8` == "2" ]; then
        python -m SimpleHTTPServer 8000
    else
        python -m http.server
    fi
}

function bcargo {
    RUST_BACKTRACE=1 cargo "$@"
}

# Platform specific
if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "cygwin" ]; then
    export FILEMANAGER=explorer
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export FILEMANAGER=open
elif [[ "$OSTYPE" == "linux"* ]]; then
    export FILEMANAGER=caja
else
    echo "dotfiles: error: Could not load basic OS helpers for OS of type $OSTYPE"
fi

function fm {
    local filename=$1
    if [[ -z "$filename" ]]; then
        $FILEMANAGER .
    else
        $FILEMANAGER $filename
    fi
}

# True-color test (from https://gist.github.com/XVilka/8346728)
function truecolor_test {
    awk 'BEGIN{
        s="//////////"; s=s s s s s s s s;
        for (colnum = 0; colnum<80; colnum++) {
            r = 255-(colnum*255/79);
            g = (colnum*510/79);
            b = (colnum*255/79);
            if (g>255) g = 510-g;
            printf "\033[0;0;48;2;%d;%d;%dm", r,g,b;
            printf "\033[0;0;38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum+1,1);
        }
        printf "\n";
    }'
}


function vrun {
    local script_file=~/.vrun
    vim $script_file
    sh $script_file
}


function farcopy {
    echo "$@" > ~/Sync/Work/.farcopy
}

function farpaste {
    cat ~/Sync/Work/.farcopy
}

function far {
    # Only works on macOS at the moment
    echo -n `farpaste` | pbcopy
}

function pipeloop {
    if [[ "$#" -ne "1" ]]; then
        echo "error: Requires a single argument: pipename"
        return 1
    fi
    local name=$1
    local pipefile=~/temp/$name
    if [[ ! -p $pipefile ]]; then
        mkfifo $pipefile
    fi
    (while true; do cat $pipefile; done) | bash --login
}

function tellpipe {
    if [[ "$#" -eq "0" ]]; then
        echo "error: Requires at least one argument: pipename commands..."
        return 1
    fi
    local name=$1
    local pipefile=~/temp/$name
    shift
    local command=$@
    if [[ ! -p $pipefile ]]; then
        echo "error: No pipe exists at $pipefile"
    else
        echo "$command" > $pipefile
    fi
}

function tm {
    tmux attach 2> /dev/null
    if [[ "$?" != "0" ]]; then
        tmux new -s work &
        tmux new -s main
    else
        echo "Attaching..."
    fi
}

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="%F %T "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

function todo_filename {
    local tmux_session_name=$(tmux display-message -p '#S' || true)
    if [[ "$tmux_session_name" == "work" ]]; then
        echo -n "$HOME/sync/basis/skyscanner/todo.md"
    else
        echo -n "$HOME/sync/basis/data/todo.md"
    fi
}

if [[ "$(pwd)" == "$HOME" ]]; then
    # Print todo list
    # todo_fname=$(todo_filename)
    # if [[ -f $todo_fname ]]; then
    #     echo -ne "\033[36m"
    #     bat -P --decorations never $todo_fname || cat $todo_fname
    #     echo -ne "\033[0m"
    # fi

    # Display a truecolor strip to make sure colors haven't regressed
    truecolor_test
fi

function todo {
    vim $(todo_filename)
}

function mmail {
    see "/var/mail/$USER" "$@"
}

# Heatseeker-based tab completion - not enabled by default
function _hot_tab {
    if [ $COMP_CWORD -lt 0 ]; then
        COMPREPLY=()
        return
    fi

    local word=${COMP_WORDS[COMP_CWORD]}
    local line=${COMP_LINE}

    if [[ "$word" == "?" ]]; then
        echo
        COMPREPLY=($(fd | hs))
    elif [[ "$word" == "d?" ]]; then
        echo
        COMPREPLY=($(fd -t d | hs))
    elif [[ "$word" == "b?" ]]; then
        echo
        COMPREPLY=($(git branch | sed 's/^[* ] //' | hs))
    elif [[ "$word" == "g?" ]]; then
        echo
        COMPREPLY=($(git diff --name-only | hs))
    else
        COMPREPLY=()
    fi

    if [ -n "$COMPREPLY" ]; then
        echo -n $line
    fi
}
# Add the following line to your .bashrc to enable it
# complete -D -F _hot_tab -o bashdefault -o default

stty -ixon > /dev/null 2> /dev/null

function fuck_you_macos {
    local filename=$1
    sudo chmod -R 755 $1
}

function nvmup {
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
}

function nvm12 {
    nvmup
    nvm use --lts=erbium
}

function nvm16 {
    nvmup
    nvm use --lts=gallium
}

function mine {
    chmod 0644 $@
}

function seriously_mine {
    chmod 0600 $@
}
