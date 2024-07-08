#!/usr/bin/env bash

SERVER="$HOME/.server"
CONFIG="$HOME/.config"

sudo hostnamectl set-hostname wsl
logout

date
timedatectl status
sudo apt install util-linux-extra (needed in 24.04, not in the ones before it)
timedatectl set-timezone "Asia/Kolkata"
sudo ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
sudo hwclock --systohc
date


# get a list of packages installed with date
zgrep 'install ' /var/log/dpkg.log* | sort | cut -f1,2,4 -d' '
# OR
tail /var/log/dpkg.log

sudo apt update && sudo apt upgrade -y
sudo apt install zsh tmux fzf neovim bat ripgrep fd-find btop -y
sudo apt install eza -y # only on 24.04

# sudo apt install util-linux-extra (needed in 24.04, not in the ones before it)
#timedatectl status
#timedatectl set-timezone "Asia/Kolkata"
#sudo ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
#sudo hwclock --systohc

# fix fd and bat
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
ln -s /usr/bin/batcat ~/.local/bin/bat

# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
sudo mv ~/.local/bin/zoxide /usr/local/bin/

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
