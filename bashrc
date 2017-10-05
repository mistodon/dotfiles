readonly DOTFILES_REPO_PATH=$(cd $(dirname $BASH_SOURCE) && pwd)

export PS1="\[\033[36m\]\u\[\033[m\]@[\[\033[32m\]\D{%F %T}\[\033[m\]]:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export WWW_HOME="https://duckduckgo.com"

# From http://onethingwell.org/post/586977440/mkcd-improved
function mkcd
{
    mkdir -p "$*"
    cd "$*"
}

# File-picking shorthand
function f
{
    if [ "$#" -eq "0" ]; then
        fd -n | hs
    else
        "$@" $(fd -n | hs)
    fi
}

# Shorthands for quitting terminal 
function :q { exit ; }
function qq { exit ; }

function bell { tput bel ; }
function datestamp { date +'%Y_%m_%d_%H%M' ; }

# Git shorthands
function gs { git status "$@" ; }

function ga { git add "$@" ; }

function gr { git reset "$@" ; }

function gd { git diff "$@" ; }

function gc { git checkout "$@" ; }

function gb { git branch "$@" ; }

function gf { git fetch "$@" ; }

function glogday
{
    local date=$1
    shift 1
    git log --after "$date 00:00" --before "$date 23:59" "$@"
}

function gpom { git pull origin master ; }

function gcurr { git rev-parse --abbrev-ref HEAD ; }

function gsub { git submodule update --init --recursive --remote ; }

function gpull
{
    local branch="$(git rev-parse --abbrev-ref HEAD)"
    if [ $? -ne 0 ]; then
        return 1
    fi
    git pull --rebase origin "$branch"
}

function gpush
{
    local branch="$(git rev-parse --abbrev-ref HEAD)"
    if [ $? -ne 0 ]; then
        return 1
    fi
    git push origin "$branch"
}

function withstash
{
    git stash
    "$@"
    git stash pop
}

function gnuke
{
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


# Local server
function lhost
{
    if [ `python --version 2>&1 | cut -c 8` == "2" ]; then
        python -m SimpleHTTPServer 8000
    else
        python -m http.server
    fi
}


# Platform specific
if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "cygwin" ]; then
    source $DOTFILES_REPO_PATH/platform_windows.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
	source $DOTFILES_REPO_PATH/platform_macos.sh
elif [[ "$OSTYPE" == "linux"* ]]; then
	source $DOTFILES_REPO_PATH/platform_linux.sh
else
    echo "dotfiles: error: Could not load basic OS helpers for OS of type $OSTYPE"
fi

