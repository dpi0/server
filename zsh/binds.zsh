#!/bin/zsh

bindkey -e # sets the ZLE to use Emacs key bindings

# use showkey -a to get the shortcut name
# or cat -v

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

my-forward-word() {
    local WORDCHARS=${WORDCHARS//[\/,.-:;_]}
    zle forward-word
}
zle -N my-forward-word
bindkey '^[[1;5C' my-forward-word

my-backward-word() {
    local WORDCHARS=${WORDCHARS//[\/,.-:;_]}
    zle backward-word
}
zle -N my-backward-word
bindkey '^[[1;5D' my-backward-word

my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS//[\/,.-:;_]}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^[^?' my-backward-delete-word

zle -N copybuffer
bindkey "^O" copybuffer

zle -N copydir
bindkey "^Y" copydir

zle -N copylastcommand
bindkey "^T" copylastcommand


# zle -N f
# bindkey "^f" f

# zle -N ff
# bindkey "^[f" ff

# zle -N sudo-command-line
# bindkey "\e\e" sudo-command-line

bindkey -s '^[v' 'v .^M'
bindkey -s '^[c' 'code .^M'
