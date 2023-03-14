export WINIT_X11_SCALE_FACTOR=1.25

if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

# pgrep fan2go  >/dev/null || $XDG_CONFIG_HOME/fan2go/fan2go.sh # if fan2go is not running start it

source $XDG_CONFIG_HOME/zsh/aliases

# key-bindings
source $XDG_CONFIG_HOME/zsh/.zshbindings

# prompt configuration
fpath=($XDG_CONFIG_HOME/zsh/external $fpath)
autoload -Uz prompt_purification_setup.zsh; prompt_purification_setup.zsh
autoload -Uz cursor_mode.zsh && cursor_mode.zsh # change cursor for normal/insert modes
export KEYTIMEOUT=1

# add zsh completions
_comp_options+=(globdots)
source $XDG_CONFIG_HOME/zsh/external/completion.zsh # Phantas0s completion options
fpath=($XDG_CONFIG_HOME/external/zsh-completions/src $fpath) # zsh-users completions

# add zsh suggestions
source $XDG_CONFIG_HOME/zsh/external/zsh-autosuggestions/zsh-autosuggestions.zsh

# add syntax highlighting provided by zsh-syntax-highlighting package
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# configur directory stack
setopt AUTO_PUSHD # Push the current directory visited on to the stack.
setopt PUSHD_IGNORE_DUPS # Do not store duplicate directories in the stack.
setopt PUSHD_SILENT # Do not print the directory stack after using pushd or popd.
alias d= dirs -v 
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# fzf
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line # press  v  on vimode to open nvim and edit command
# TODO: check bd directory navigation for quickly going back directories

autoload -Uz compinit; compinit # initialize completion engine

# zoxide initialization
eval "$(zoxide init zsh)"

# path additions
PATH="$HOME/.cargo/bin/:$PATH"
