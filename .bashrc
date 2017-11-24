export PATH="$PATH:~/.dotfiles/bin"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export WWW_HOME="https://duckduckgo.com"

function from-the-top
{
    source ~/.bashrc
}

# Git in prompt from https://coderwall.com/p/pn8f0g/show-your-git-status-and-branch-in-color-at-the-command-prompt
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREY="\033[0;30;1m"
COLOR_GREEN="\033[0;32m"
COLOR_BLUE="\033[0;36m"
COLOR_DBLUE="\033[0;34m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "Changes to be committed" ]]; then
    echo -e $COLOR_GREEN
  elif [[ ! $git_status =~ "working tree clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "Your branch is behind" ]]; then
    echo -e $COLOR_GREY
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_BLUE
  else
    echo -e $COLOR_DBLUE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
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

export PS1="\[\033[32m\]\D{%T}\[\033[m\]|\[\033[33;1m\]\w\[\033[m\]\[\$(git_color)\]\$(git_branch)\[\033[m\]\$ "


# From http://onethingwell.org/post/586977440/mkcd-improved
function mkcd
{
    mkdir -p "$*"
    cd "$*"
}

# `cd` to directory of the given file
function cdf
{
    local path=$(dirname $(fd "$@" | head -1))
    if [ -n "$path" ]; then
        cd $path
    fi
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
alias :q='exit'
alias qq='exit'
function qall { tmux kill-server; }

function bell { tput bel ; }
function datestamp { date +'%Y_%m_%d_%H%M' ; }
function today { date +"%A %Y-%m-%d" ; }

function rgi
{
    local query=$1
    local replacement=$2

    if [ "$OSTYPE" == "msys" ]
    then
        rg $query -l | sed 's;\\;/;g' | xargs sed -i "" "s;$1;$2;g"
    else
        rg $query -l | xargs sed -i "" "s;$1;$2;g"
    fi
}

# Git shorthands
function gs { git status "$@" ; }

function ga { git add "$@" ; }
function gau { git add $(git ls-files -o --exclude-standard) ; }

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

function gidentity
{
    git config user.name "$1"
    git config user.email "$2"
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

    function fm { explorer . ; }


    which make &>/dev/null
    if [ $? -ne 0 ]; then
        alias make="mingw32-make"
    else
        alias make="make"
    fi


    function msvcup
    {
        export PATH="C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin:C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\Bin:C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE:$PATH"
        export INCLUDE="C:\Program Files\Microsoft SDKs\Windows\v7.1\Include;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\Include;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\atlmfc\include;C:\Program Files (x86)\Windows Kits\10\Include\10.0.10586.0\ucrt\;$INCLUDE"
        export LIB="C:\Program Files\Microsoft SDKs\Windows\v7.1\Lib;C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\lib;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.10586.0\ucrt\x86;$LIB"
    }


    function msbuild
    {
        echo "WARNING: This function is pure janky and has a hardcoded path in it"
        echo "  If you installed this repo anywhere but ~/bin/dotfiles it ain't gonna work"
        cmd "/C %HOME%/bin/dotfiles/windows_bats/msbuild.bat $@"
    }

elif [[ "$OSTYPE" == "darwin"* ]]; then

    function fm { open . ; }

elif [[ "$OSTYPE" == "linux"* ]]; then

    function fm { caja . ; }

else
    echo "dotfiles: error: Could not load basic OS helpers for OS of type $OSTYPE"
fi


# True-color test (from https://gist.github.com/XVilka/8346728)
function truecolor_test
{
    awk 'BEGIN{
        s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
        for (colnum = 0; colnum<77; colnum++) {
            r = 255-(colnum*255/76);
            g = (colnum*510/76);
            b = (colnum*255/76);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum+1,1);
        }
        printf "\n";
    }'
}
