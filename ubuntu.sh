#!/usr/bin/env bash

SERVER="$HOME/.server"
CONFIG="$HOME/.config"

sudo apt update && sudo apt upgrade -y
sudo apt install zsh vim fzf btop gh tmux ripgrep net-tools gdu bat zip unzip fd-find trash-cli git-delta -y
sudo apt install eza -y # only on 24.04

# fix fd and bat
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
ln -s /usr/bin/batcat ~/.local/bin/bat

# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
sudo mv ~/.local/bin/zoxide /usr/local/bin/

# fastfetch
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y sudo apt update
sudo apt install -y fastfetch

# lazygit
LAZYGIT_VERSION=$(curl -s "<https://api.github.com/repos/jesseduffield/lazygit/releases/latest>" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "<https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${>LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz lazygit

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# clone p10k and tpm
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p "$CONFIG"

ln -sf "$SERVER/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$SERVER/tmux/" "$CONFIG/"

~/.tmux/plugins/tpm/bin/install_plugins

tmux kill-server

sudo chsh -s $(which zsh) $USER

exec zsh

# sudo reboot
