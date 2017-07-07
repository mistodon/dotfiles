function vimsetup()
{
    mkdir -p ~/.vim/colors
    cp ~/bin/terminal-helpers/vim/colors/* ~/.vim/colors
    cp ~/bin/terminal-helpers/vim/vimrc ~/.vimrc

    if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "cygwin" ]; then
        echo "Warning: Ensure you have the unixify_paths script on your path (sed 's:\\\\:/:g')"
        cat ~/bin/terminal-helpers/vim/vimrc_win_ext >> ~/.vimrc
    else
        cat ~/bin/terminal-helpers/vim/vimrc_unix_ext >> ~/.vimrc
    fi
}
