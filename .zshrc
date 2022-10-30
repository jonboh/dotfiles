# General configuration
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim"
export VISUAL="nvim"

source $XDG_CONFIG_HOME/zsh/aliases

# prompt configuration
fpath=($XDG_CONFIG_HOME/zsh/external $fpath)
autoload -Uz prompt_purification_setup.zsh; prompt_purification_setup.zsh
autoload -Uz cursor_mode.zsh && cursor_mode.zsh # change cursor for normal/insert modes
export KEYTIMEOUT=1

# add zsh completions
_comp_options+=(globdots)
source $XDG_CONFIG_HOME/zsh/external/completion.zsh # Phantas0s completion options
fpath=($XDG_CONFIG_HOME/external/zsh-completions/src $fpath) # zsh-users completions

# add syntax highlighting provided by zsh-syntax-highlighting package
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# configur directory stack
setopt AUTO_PUSHD # Push the current directory visited on to the stack.
setopt PUSHD_IGNORE_DUPS # Do not store duplicate directories in the stack.
setopt PUSHD_SILENT # Do not print the directory stack after using pushd or popd.
alias d= dirs -v 
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# TODO: check edit-command-line functionality. it allows to edit commands on $EDITOR=nvim directly

# Lines configured by zsh-newuser-install
HISTFILE=~/$XDG_CACHE_HOME/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename  /home/jon/.zshrc 

autoload -Uz compinit
compinit
# End of lines added by compinstall
