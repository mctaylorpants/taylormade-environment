# Path to settings repo
export TAYLORMADE=/Users/alextaylor/code/taylormade-environment

export ZSH=/Users/alextaylor/.oh-my-zsh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/Library/Python/2.7/bin:$PATH" # for the aws eb CLI
export PATH="/usr/local/sbin:$PATH" # recommended by `brew doctor`
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="./bin:$PATH" # export local bin after rbenv inits so we can override the shims (for bin/rspec, bin/rails, etc)

plugins=(git docker)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
  ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# User configuration

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# git
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

alias vim='nvim'
alias gs='git status'
alias gS='git show'
alias gl='git log --pretty=oneline'
alias ga='git add'
alias gau='git add --update'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gp='git push'
alias gP='git pull'
alias gpoh='git push origin head'
alias gco='git checkout'
alias gf='git fetch'
alias gfo'git fetch && git checkout'
alias grbm='echo "Updating master..." && CURRENT_BRANCH=`git branch | grep "*" | cut -d " " -f 2` && gco master; git pull && gco $CURRENT_BRANCH && grb master'
alias gnb='git checkout master; git pull && git checkout -b '
alias grbi='git rebase --interactive --autosquash' # override the default grbi in the git zsh plugin
alias gcom='git checkout master && git pull'
alias notes='cd ~/notes && vim'

# rails
alias bb='bundle'

#instance lookup alias
alias prod='aws-ec2-list --region=us-east-1 | grep webapp'
alias int='aws-ec2-list --region=us-west-2 | grep webapp'
alias webapp='cd ~/code/unbounce/lp-webapp'

# for bundler development
# https://github.com/bundler/bundler/blob/master/doc/development/SETUP.md
alias dbundle='BUNDLE_TRAMPOLINE_DISABLE=1 ruby -I /Users/alextaylor/code/bundler/bundler/lib /Users/alextaylor/code/bundler/bundler/exe/bundle'

# make sure to use homebrew's ctags (https://gist.github.com/nazgob/1570678)
alias ctags="`brew --prefix`/bin/ctags"

alias clj='lein repl'
alias hsk='stack ghci'

# Make autocomplete more like Bash
# http://serverfault.com/questions/109207/how-do-i-make-zsh-completion-act-more-like-bash-completion
setopt noautomenu
setopt nomenucomplete

# Custom keybindings
bindkey '^S' down-line-or-history # ctrl+s
bindkey '^A' up-line-or-history   # ctrl+a

eval "$(nodenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
