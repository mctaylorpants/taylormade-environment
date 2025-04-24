export ZSH=$HOME/.oh-my-zsh

export PATH="$HOME/Library/Python/2.7/bin:$PATH" # for the aws eb CLI
export PATH="/usr/local/sbin:$PATH" # recommended by `brew doctor`

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


gitmain() { git symbolic-ref refs/remotes/origin/HEAD | cut -d'/' -f4 }

alias zshconfig="vim ~/.zshrc"
alias vim='nvim'
alias gcb='git checkout $(git for-each-ref --sort=-committerdate --count=50 --format="%(refname:short)" refs/heads/ | selecta)'
alias gs='git status'
alias gS='git show'
alias gl='git log --pretty=oneline'
alias ga='git add'
alias gap='git add -p'
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
alias grbm='echo "Updating main branch..." && gco $(gitmain); git pull && gco - && grb $(gitmain)'
alias ghrbm='git reset --hard HEAD~100 && grbm'
alias gmm='echo "Updating main branch..." && gco $(gitmain) && git pull && gco - && git merge $(gitmain)'
alias gnb='git checkout $(gitmain) && git pull && git checkout -b '
alias grbi='git rebase --interactive --autosquash' # override the default grbi in the git zsh plugin
alias grh='git reset --hard'
alias gcom='git checkout $(gitmain) && gP'
alias prune='git-prune-local'
alias wip='git commit --no-verify -m "WIP"'

# rails
alias bb='bundle install --local'
alias be='bundle exec'
alias bn='IGNORE_PENDING_RAILS_NEXT=1 bin/next'
alias bo='bundle open'
alias bno='bin/next bundle open'
alias brc='bin/rails c'
alias dbm='bin/rails db:migrate'
alias dbr='bin/rails db:rollback'

alias notes='vim ~/Documents/obsidian-notes/notes'


# Make autocomplete more like Bash
# http://serverfault.com/questions/109207/how-do-i-make-zsh-completion-act-more-like-bash-completion
setopt noautomenu
setopt nomenucomplete

# Custom keybindings
bindkey '^S' down-line-or-history # ctrl+s
bindkey '^A' up-line-or-history   # ctrl+a

# Set up fzf key bindings and fuzzy completion
# (i.e. ctrl+r to search command history)
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --color=light'

alias dc='docker compose'
alias dcrspec='docker compose run --rm app rspec'

alias bnr='bin/next rspec'
alias br='bin/rspec'
alias up='dev up'
alias down='dev down'

# override avit's prompt because git is super slow in themis on catalina :/
# Load version control information
autoload -Uz vcs_info
zstyle ':vcs_info:git*' formats "[%b]"
precmd() { vcs_info }

NEWLINE=$'\n'
export BAT_THEME="Solarized (light)"
export PROMPT='
${_current_dir}${vcs_info_msg_0_} ${NEWLINE}%{$fg[red]%}$> %{$reset_color%}'
export RPROMPT=''

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(dev _hook)"
