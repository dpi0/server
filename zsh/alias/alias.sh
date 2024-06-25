alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
# alias /='cd'
alias md='mkdir -p'
alias bd='cd "$OLDPWD"'
alias vf='rga-fzf'

# remove all dir and all it's files
alias rmd='/bin/rm  --recursive --force --verbose '

alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

alias sudoe='sudo -E -s'

alias l="eza --icons -a -l"
alias ls="l"
alias lg="l -g"
alias lt="eza --icons -a -T"
alias br="broot -s"

alias crnew="crontab -e"
alias scrnew="sudo crontab -e"
alias crlist="crontab -l"

alias c="bat"
alias cat="bat"
alias h="history -E 1"
alias j="ji"
alias jj="cd ~"
alias tree="eza --tree --long"
alias re="source ~/.zshrc && exec zsh"
alias tre="tmux source-file $DOTFILES/tmux/tmux.conf"
alias i="feh -Fd"
alias ufw="sudo ufw"
alias dw="aria2c"
alias pdf="zathura"
alias disk="duf"
alias dust="gdu"
alias size="gdu"
alias play="mpv"
alias lz=lazygit
alias v=nvim
alias sv="sudo vim"
alias ex="extract"
alias open="thunar ."
alias vpndown='sudo wg-quick down'
alias vpnup='sudo wg-quick up'
alias config='/usr/bin/git --git-dir=/home/dpi0/.cfg/ --work-tree=/home/dpi0'
