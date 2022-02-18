# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.vim/bundle/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.vim/bundle/fzf/shell/key-bindings.zsh"

export LANG=en_US.UTF-8 # Fixes a perl warning on codespaces, since LANG is en_CA.UTF-8 which isn't present
export FZF_CTRL_R_OPTS='--height 40% --layout=reverse --color=light'
