export ZSH=$HOME/.oh-my-zsh

export PATH="$HOME/Library/Python/2.7/bin:$PATH" # for the aws eb CLI
export PATH="/usr/local/sbin:$PATH" # recommended by `brew doctor`
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

plugins=(git docker)

ZSH_THEME="avit"
HIST_STAMPS="yyyy-mm-dd"

# This changes the prompt expansion highlight. This became an issue
# when I switched to Solarized Light, and the default colour was white
# which has hard to see. https://github.com/robbyrussell/oh-my-zsh/issues/4042#issuecomment-114145634
zle_highlight=( default:fg=black )

# User configuration

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

alias zshconfig="vim ~/.zshrc"
alias vim='nvim'
alias gcb='git checkout $(git for-each-ref --sort=-committerdate --count=50 --format="%(refname:short)" refs/heads/ | selecta)'
alias gs='git status'
alias gS='git show'
alias gl='git log --pretty=oneline'
alias ga='git add'
alias gau='git add --update'
alias gc='git commit -v'
alias gca='git commit --amen --no-edit' # because 'amen' is more fun ;)
alias gcau='gau && gca'
alias gcm='git commit -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gp='git push'
alias gP='git pull origin $(current_branch)'
alias gpoh='git push origin $(current_branch)'
alias gco='git checkout'
alias gf='git fetch'
alias gfo'git fetch && git checkout'
alias grbm='echo "Updating master..." && gco master; git pull && gco - && grb master'
alias gmm='echo "Updating master..." && gco master && git pull && gco - && git merge master'
alias gnb='git checkout master && git pull && git checkout -b '
alias grbi='git rebase --interactive --autosquash' # override the default grbi in the git zsh plugin
alias grh='git reset --hard'
alias gcom='git checkout master && gP'
alias prune='git-prune-local'
alias nuke='git reset --hard HEAD~50 && git pull'
alias wip='git commit --no-verify -m "WIP"'

# rails
alias bb='bundle install --local'
alias be='bundle exec'
alias bn='IGNORE_PENDING_RAILS_NEXT=1 bin/next'
alias bo='bundle open'
alias bno='bin/next bundle open'

alias notes='vim ~/Documents/obsidian-notes/notes'


# Make autocomplete more like Bash
# http://serverfault.com/questions/109207/how-do-i-make-zsh-completion-act-more-like-bash-completion
setopt noautomenu
setopt nomenucomplete

# Custom keybindings
bindkey '^S' down-line-or-history # ctrl+s
bindkey '^A' up-line-or-history   # ctrl+a

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias dc='docker-compose'
alias dcrspec='docker-compose run --rm app rspec'

alias bnr='bin/next rspec'
alias br='bin/rspec'

# override avit's prompt because git is super slow in themis on catalina :/
# Load version control information
autoload -Uz vcs_info
zstyle ':vcs_info:git*' formats "[%b]"
precmd() { vcs_info }

export PROMPT='
${_current_dir}${vcs_info_msg_0_} %{$fg[red]%}$> %{$reset_color%}'
export RPROMPT=''

if [[ "${CODESPACES}" = true ]]; then
  export SHELL=$(which zsh) # SHELL is /bin/bash by default in Codespaces
  export PROMPT='
${_current_dir}${vcs_info_msg_0_} 🐙 %{$fg[blue]%}$> %{$reset_color%}'
  export RPROMPT=''
fi

[[ $TERM != "screen" ]] && exec tmux
