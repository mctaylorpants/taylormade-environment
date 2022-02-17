eval "$(~/go/bin/dev _hook)"

# export local bin after rbenv inits so we can override the shims (for bin/rspec, bin/rails, etc)
export PATH="./bin:$PATH" 

source $HOME/.clio_profile
