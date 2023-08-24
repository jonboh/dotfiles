os="Linux" # use your distro to get more specific instructions
shell="zsh"
model="open-aigpt35-turbo"

ask-assistant() {
    VISUAL="env OPENAI_API_KEY=$(cat ~/.secrets/chatgpt.key) shai ask --operating-system \"$os\" --shell \"$shell\" --model $model --edit-file"  zle edit-command-line
}
explain-assistant() {
    VISUAL="env OPENAI_API_KEY=$(cat ~/.secrets/chatgpt.key) shai explain --operating-system \"$os\" --shell \"$shell\" --model $model --edit-file" zle edit-command-line
}
# Bind a key combination to trigger the custom widget
zle -N ask-assistant
zle -N explain-assistant
bindkey  ^[s  ask-assistant
bindkey  ^[e  explain-assistant

