#!/bin/bash

set -e


readonly dotfiles_dir=$(cd $(dirname $BASH_SOURCE); pwd)
readonly should_force=$1

if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "cygwin" ]; then
    readonly OSDIR=windows
elif [[ "$OSTYPE" == "darwin"* ]]; then
    readonly OSDIR=macos
else
    readonly OSDIR=unix
fi

readonly green="\033[0;32m"
readonly white="\033[1;37m"
readonly reset="\033[0m"

echo -e "${green}Running dotfiles setup for platform ${white}$OSDIR${green}:${reset}"

function create_link
{
    local source=$1
    local destination=$2

    if [[ "$should_force" == "--force" ]]; then
        rm -f $destination
    fi

    if [ -e $destination ]; then
        echo "$destination already exists. (Use --force to overwrite.)" >&2
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
create_link "$dotfiles_dir/gitconfig" ~/.gitconfig
create_link "$dotfiles_dir/$OSDIR/tmux.conf" ~/.tmux.conf
create_link "$dotfiles_dir/vimrc" ~/.vimrc
create_link "$dotfiles_dir/cargo/config" ~/.cargo/config

if [ "$OSDIR" == "macos" ]; then
    create_link "$dotfiles_dir/alacritty_macos.yml" ~/.alacritty.yml
else
    create_link "$dotfiles_dir/alacritty.yml" ~/.alacritty.yml
fi
