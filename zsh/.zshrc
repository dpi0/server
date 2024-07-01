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

export SERVER="$HOME/.server"

source ~/powerlevel10k/powerlevel10k.zsh-theme

source $SERVER/zsh/options.zsh

source $SERVER/zsh/alias/alias.sh
source $SERVER/zsh/alias/custom-directories.sh
source $SERVER/zsh/alias/docker.sh
source $SERVER/zsh/alias/git.sh
source $SERVER/zsh/alias/pacman.sh
source $SERVER/zsh/alias/python.sh
source $SERVER/zsh/alias/systemctl.sh
source $SERVER/zsh/alias/tmux.sh
source $SERVER/zsh/alias/trash.sh

source $SERVER/zsh/functions/functions.sh
source $SERVER/zsh/functions/fzf.sh
source $SERVER/zsh/functions/paste.sh
source $SERVER/zsh/functions/tmux.sh
source $SERVER/zsh/functions/docker.sh
# source $SERVER/zsh/functions/paste.sh
# source $SERVER/zsh/functions/ag.sh

source $SERVER/zsh/binds.zsh

# source the theme
source $SERVER/zsh/themes/lean-p10k.zsh # same as ~/.p10k.zsh in the docs
# source $SERVER/zsh/themes/robbby-russell-p10k.zsh

# this has to be at the end for zsh=history-substring
source $SERVER/zsh/plugin-manager.zsh
