
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PS1="\W \$ "

# git
alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'

alias gp='git push'


# rails
alias rs='bin/rails server'
alias rc='bin/rails c'
alias rg='bin/rails g'
alias rk='bin/rake'
alias rr='bin/rake routes'

# CodeCore temp
cd "/Users/alextaylor/Google Drive/CodeCore/assignments"
