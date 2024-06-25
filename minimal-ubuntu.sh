#!/usr/bin/env bash

SERVER="$HOME/.server"
CONFIG="$HOME/.config"

sudo apt update && sudo apt upgrade -y
sudo apt install zsh tmux fzf neovim bat ripgrep fd-find btop -y
sudo apt install eza -y # only on 24.04
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

mkdir ~/.config

sudo mv ~/.local/bin/zoxide /usr/local/bin/
sudo ln -s $(which fdfind) /usr/local/bin/fd
ln -s /usr/bin/batcat /usr/local/bin/bat

rm -f $HOME/.zshrc; ln -s $SERVER/zsh/.zshrc $HOME/.zshrc
ln -s "$SERVER/tmux/" "$CONFIG/"

# source ./sudo-bootstrap.sh

tmux kill-server
sudo chsh -s $(which zsh) $USER
zsh
