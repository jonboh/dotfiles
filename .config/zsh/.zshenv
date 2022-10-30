# General configuration
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim"
export VISUAL="nvim"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# hist file
HISTFILE=$XDG_CACHE_HOME/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
