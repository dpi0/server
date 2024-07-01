#!/usr/bin/env bash

SERVER="$HOME/.server"
CONFIG="$HOME/.config"

sudo pacman -Syu --noconfirm
sudo pacman -Sy --noconfirm zsh tmux fzf neovim bat exa zoxide ripgrep fd btop nftables docker docker-compose

sudo usermod -aG docker $USER
sudo systemctl enable --now docker.service containerd.service

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p "$CONFIG"

ln -sf "$SERVER/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$SERVER/tmux/" "$CONFIG/"

tmux kill-server
sudo chsh -s $(which zsh) $USER

exec zsh

# sudo reboot
