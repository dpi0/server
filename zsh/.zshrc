# let it stay on top & READ THIS: for why this is so cool- https://github.com/romkatv/zsh-bench?tab=readme-ov-file#instant-prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# to start ssh automatically, and only run a single process across all shell instances
# NOTE: this throws an error: no such file or directory: /run/user/1000/ssh-agent.env
#
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
#     source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi

# start tmux at startup
# if [ -z "$TMUX" ]; then
#     tmux attach-session -t dev || tmux new-session -s dev
# fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

source ~/.dotfiles/zsh/options.zsh

source ~/.dotfiles/zsh/alias/alias.sh
source ~/.dotfiles/zsh/alias/custom-directories.sh
source ~/.dotfiles/zsh/alias/docker.sh
source ~/.dotfiles/zsh/alias/git.sh
source ~/.dotfiles/zsh/alias/pacman.sh
source ~/.dotfiles/zsh/alias/python.sh
source ~/.dotfiles/zsh/alias/systemctl.sh
source ~/.dotfiles/zsh/alias/tmux.sh
source ~/.dotfiles/zsh/alias/trash.sh

source ~/.dotfiles/zsh/functions/functions.sh
source ~/.dotfiles/zsh/functions/fzf.sh
source ~/.dotfiles/zsh/functions/paste.sh
source ~/.dotfiles/zsh/functions/tmux.sh
source ~/.dotfiles/zsh/functions/docker.sh
# source ~/.dotfiles/zsh/functions/paste.sh
# source ~/.dotfiles/zsh/functions/ag.sh

source ~/.dotfiles/zsh/binds.zsh

# source the theme
source ~/.dotfiles/zsh/themes/lean-p10k.zsh # same as ~/.p10k.zsh in the docs
# source ~/.dotfiles/zsh/themes/robbby-russell-p10k.zsh

# this has to be at the end for zsh=history-substring
source ~/.dotfiles/zsh/plugin-manager.zsh
