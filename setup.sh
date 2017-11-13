#!/bin/bash

set -e

readonly dotfiles_dir=$(cd $(dirname $BASH_SOURCE); pwd)

function create_link
{
    local source=$1
    local destination=$2

    if [ -e $destination ]; then
        echo "$destination already exists..." >&2
    else
        echo "Linking $destination"
        ln -s $source $destination
    fi
}

if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "cygwin" ]; then

    echo "Make this work properly!" >&2

else

    create_link "$dotfiles_dir" ~/.dotfiles
    create_link "$dotfiles_dir/.gitconfig" ~/.gitconfig
    create_link "$dotfiles_dir/unix/.tmux.conf" ~/.tmux.conf
    create_link "$dotfiles_dir/unix/.vimrc" ~/.vimrc

fi
