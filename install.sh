#!/bin/bash

set -e

echo -e "\033[1;33mWARNING:\033[0m This isn't reliable, or tested, or anything good like that."
echo -e "It might as well just be a list of things you \033[1;33mshould\033[0m install in its current state."
echo
echo "Only searching for now - no installing."
echo
echo '# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'

echo "brew install asciidoctor awscli bash bash-completion cmake coreutils fd ffmpeg git java11 jq nmap node@12 p7zip pipenv pyenv python3 tmux vim vlc"
echo "brew --cask docker java11 keepingyouawake ngrok"
echo "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"

echo "cargo search bat cargo-edit cargo-watch close_enough heatseeker loc ripgrep exa eva du-dust"

echo "npm install --global git-open aws-cdk"

echo "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"

echo "pyenv install 3.6.13"
echo "pyenv install 3.7.10"
echo "pyenv install 3.9.1"

echo "You should install these apps too:
- Alacritty
- Audacity
- Clip Studio Paint
- Firefox
- OBS
- Tresorit
"
