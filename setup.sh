#!/bin/bash

set -e


readonly dotfiles_dir=$(cd $(dirname $BASH_SOURCE); pwd)

if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "cygwin" ]; then
    readonly OSDIR=windows
elif [ "$OSTYPE" == "darwin16" ]; then
    readonly OSDIR=macos
else
    readonly OSDIR=unix
fi


function create_link
{
    local source=$1
    local destination=$2

    if [ -e $destination ]; then
        echo "$destination already exists..." >&2
    else
        echo "Linking $destination"

        if [ "$OSDIR" == "windows" ]; then
	    local winsrc=$(echo $source | sed 's;^/c/;C:/;g' | sed 's;/;\\;g')
	    local windest=$(echo $destination | sed 's;^/c/;C:/;g' | sed 's;/;\\;g')
	    # TODO: hacky
	    if [ "$source" == "$dotfiles_dir" ]; then
                cmd //c "mklink /D $windest $winsrc"
	    else
                cmd //c "mklink $windest $winsrc"
	    fi
	else
            ln -s $source $destination
	fi
    fi
}


create_link "$dotfiles_dir" ~/.dotfiles
create_link "$dotfiles_dir/.gitconfig" ~/.gitconfig
create_link "$dotfiles_dir/$OSDIR/.tmux.conf" ~/.tmux.conf
create_link "$dotfiles_dir/.vimrc" ~/.vimrc
create_link "$dotfiles_dir/rustfmt.toml" ~/.rustfmt.toml
