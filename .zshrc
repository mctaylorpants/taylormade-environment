# Path to settings repo
export TAYLORMADE=/Users/alextaylor/code/taylormade-environment

export ZSH=/Users/alextaylor/.oh-my-zsh

# export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="$HOME/Library/Python/2.7/bin:$PATH" # for the aws eb CLI
export PATH="/usr/local/sbin:$PATH" # recommended by `brew doctor`
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

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

# This changes the prompt expansion highlight. This became an issue
# when I switched to Solarized Light, and the default colour was white
# which has hard to see. https://github.com/robbyrussell/oh-my-zsh/issues/4042#issuecomment-114145634
zle_highlight=( default:fg=black )

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
alias gnb='git checkout master; git pull && git checkout -b '
alias grbi='git rebase --interactive --autosquash' # override the default grbi in the git zsh plugin
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# clio_profile
export PATH="./bin:$PATH" # export local bin after rbenv inits so we can override the shims (for bin/rspec, bin/rails, etc)
eval "$(rbenv init -)"

eval "$(nodenv init -)"
export VAGRANT_DEV_MODE=HYBRID
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /Users/alextaylor/.clio_profile

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
${_current_dir} ${vcs_info_msg_0_} $> '
export RPROMPT=''
