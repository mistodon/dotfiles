#!/bin/bash

set -e

echo -e "\033[1;33mWARNING:\033[0m This isn't reliable, or tested, or anything good like that."
echo -e "It might as well just be a list of things you \033[1;33mshould\033[0m install in its current state."
echo
echo "Only searching for now - no installing."
echo
echo '# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'

brew search fd
brew search git
brew search python3
brew search tmux
brew search vim

brew cask search docker
brew cask search java8

echo "# curl https://sh.rustup.rs -sSf | sh"

cargo search close_enough
cargo search fselect
cargo search heatseeker
cargo search loc
cargo search ripgrep
cargo search exa #--no-default-features
