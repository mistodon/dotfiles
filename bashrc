export PS1="\[\033[36m\]\u\[\033[m\]@[\[\033[32m\]\D{%F %T}\[\033[m\]]:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# From http://onethingwell.org/post/586977440/mkcd-improved
function mkcd
{
    mkdir -p "$*"
    cd "$*"
}

# Shorthands for quitting terminal 
function :q { exit ; }
function qq { exit ; }

function bell { tput bel ; }

# Git shorthands
function gs { git status ; }

function ga { git add ; }

function gr { git reset ; }

function gd { git diff ; }

function gc { git checkout ; }

function gb { git branch ; }

function gf { git fetch ; }

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


# Update dotfiles for vim and tmux
# TODO: Source these as part of the users existing dotfiles
function dotfiles
{
    read -r -p "Are you absolutely sure you want to nuke all your dotfiles and replace them with the ones in the terminal-helpers repo? Like, for sure? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        # vim

        mkdir -p ~/.vim/colors
        cp ~/bin/terminal-helpers/vim/colors/* ~/.vim/colors
        cp ~/bin/terminal-helpers/vim/vimrc_head ~/.vimrc
        cat ~/bin/terminal-helpers/vim/vimrc_plugins >> ~/.vimrc

        if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "cygwin" ]; then
            cat ~/bin/terminal-helpers/vim/vimrc_plugins_windows >> ~/.vimrc
        else
            cat ~/bin/terminal-helpers/vim/vimrc_plugins_unix >> ~/.vimrc
        fi

        cat ~/bin/terminal-helpers/vim/vimrc_tail >> ~/.vimrc

        if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "cygwin" ]; then
            cat ~/bin/terminal-helpers/vim/vimrc_win_ext >> ~/.vimrc
        else
            cat ~/bin/terminal-helpers/vim/vimrc_unix_ext >> ~/.vimrc
        fi

        # tmux
        cp ~/bin/terminal-helpers/tmux/tmux.conf ~/.tmux.conf
    else
        echo "Cancelled."
    fi
}


# Platform specific
if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "cygwin" ]; then
    source ~/bin/terminal-helpers/platform_windows.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
	source ~/bin/terminal-helpers/platform_macos.sh
elif [[ "$OSTYPE" == "linux"* ]]; then
	source ~/bin/terminal-helpers/platform_linux.sh
else
    echo "[terminal-helpers] Error: Could not load basic OS helpers for OS of type $OSTYPE"
fi

