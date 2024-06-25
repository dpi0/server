#!/usr/bin/env bash

SERVER="$HOME/.server"
CONFIG="$HOME/.config"

sudo apt update && sudo apt upgrade -y
sudo apt install zsh vim fzf btop gh tmux ripgrep net-tools gdu bat zip unzip fd-find trash-cli git-delta -y
sudo apt install eza -y # only on 24.04

mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
ln -s /usr/bin/batcat ~/.local/bin/bat

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
sudo mv ~/.local/bin/zoxide /usr/local/bin/

sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
sudo apt update
sudo apt install -y fastfetch

LAZYGIT_VERSION=$(curl -s "<https://api.github.com/repos/jesseduffield/lazygit/releases/latest>" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "<https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${>LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz lazygit

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

mkdir ~/.config
rm -f $HOME/.zshrc; ln -s $SERVER/zsh/.zshrc $HOME/.zshrc
ln -s "$SERVER/tmux/" "$CONFIG/"

# source ./sudo-bootstrap.sh

tmux kill-server
sudo chsh -s $(which zsh) $USER
zsh
