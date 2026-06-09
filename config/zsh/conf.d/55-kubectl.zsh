# kubectl / kubectx / kubens

alias k='kubectl'
alias kx='kubectx'
alias kb='kubens'

# (Mercari GKE context shortcuts kbd/kbp live in 50-mercari.local.zsh)

# tab-completion for kubectl, and make `k` complete the same way
# (needs compinit, set up in 19-completion.zsh)
if (( $+commands[kubectl] )); then
  source <(kubectl completion zsh)
  compdef k=kubectl
fi
