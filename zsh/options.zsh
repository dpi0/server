#!/bin/zsh

HISTFILE=~/.zsh_history # location of the history file
HISTFILESIZE=1000000000 # history limit of the file on disk
HISTSIZE=1000000000 # current session's history limit
SAVEHIST=500000 # zsh saves this many lines from the in-memory history list to the history file upon shell exit
HISTTIMEFORMAT="%d/%m/%Y %H:%M] "

setopt INC_APPEND_HISTORY # history file is updated immediately after a command is entered
setopt SHARE_HISTORY # allows multiple Zsh sessions to share the same command history 
setopt EXTENDED_HISTORY # records the time when each command was executed along with the command itself
setopt APPENDHISTORY # ensures that each command entered in the current session is appended to the history file immediately after execution

PIPENV_VENV_IN_PROJECT=0

# export PATH=$PATH:/usr/local/go/bin
# export PATH=$PATH:/home/dpi0/go/bin
# export PATH=$PATH:/home/dpi0/go/pkg/
# export PATH=$PATH:/home/dpi0/go/pkg/mod

eval "$(zoxide init zsh --cmd j)"

export CONFIG="$HOME/.config"

export EDITOR="/usr/bin/nvim"

export PATH="$PATH:/home/dpi0/.local/bin"
export PATH="$PATH:/home/dpi0/.cargo/bin"

autoload -Uz compinit && compinit

# --- FZF ---
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --bind "ctrl-y:execute-silent(printf {} | cut -f 2- | wl-copy --trim-newline)"'
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
# export FZF_DEFAULT_OPTS='--bind "ctrl-y:execute-silent(printf {} | cut -f 2- | wl-copy --trim-newline)"'

# --- FNM NODE ---
FNM_PATH="/home/dpi0/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/dpi0/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# --- RUBY GEMS ---
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

