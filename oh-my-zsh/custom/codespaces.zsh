# Allow bundler to authenticate with Artifactory. Note that this is handled by the Clio 'dev' tool on local environments
export BUNDLE_CLIO__JFROG__IO="${ARTIFACTORY_USERNAME}:${ARTIFACTORY_API_KEY}"

export PROMPT='
${_current_dir}${vcs_info_msg_0_} %{$fg[blue]%}$> %{$reset_color%}'
