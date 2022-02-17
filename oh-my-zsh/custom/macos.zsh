# clio_profile
export PATH="./bin:$PATH" # export local bin after rbenv inits so we can override the shims (for bin/rspec, bin/rails, etc)
eval "$(rbenv init -)"
eval "$(nodenv init -)"
source $HOME/.clio_profile
