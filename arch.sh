#!/usr/bin/env bash

SERVER="$HOME/.server"
CONFIG="$HOME/.config"

sudo pacman -Syu

sudo pacman -S zsh tmux fzf neovim bat eza zoxide ripgrep fd btop nftables
sudo pacman -S docker docker-compose
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl start docker.service

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir ~/.config

rm -f $HOME/.zshrc; ln -s $SERVER/zsh/.zshrc $HOME/.zshrc
ln -s "$SERVER/tmux/" "$CONFIG/"

tmux kill-server
sudo chsh -s $(which zsh) $USER
zsh

# sudo reboot
