function dotfiles()
{
    read -r -p "Are you absolutely sure you want to nuke all your dotfiles and replace them with the ones in the terminal-helpers repo? Like, for sure? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        # vim

        mkdir -p ~/.vim/colors
        cp ~/bin/terminal-helpers/vim/colors/* ~/.vim/colors
        cp ~/bin/terminal-helpers/vim/vimrc ~/.vimrc

        if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "cygwin" ]; then
            echo "Warning: Ensure you have the unixify_paths script on your path (sed 's:\\\\:/:g')"
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
