function dotfiles()
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
