#!/bin/sh

sudo apt update -y
sudo apt install tree -y

#configure bashrc to add aliases
sudo tee -a /etc/bash.bashrc <<EOT
# kube aliases
alias k='kubectl'
alias kubetcl='kubectl'
alias kubcetl='kubectl'
alias kg='kubectl get'
alias kga='kubectl get all'
alias kgi='kubectl get ingress'
alias kgp='kubectl get pods'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kdel='kubectl delete'
alias kl='kubectl logs'
alias kex='kubectl exec -it'

# helm aliases
alias h='helm'
alias hl='helm ls'

# keep kube & helm autocompletion with k & h aliases
complete -o default -F __start_kubectl kubectl
complete -o default -F __start_kubectl k
complete -o default -F __start_kubectl kubetcl
complete -o default -F __start_kubectl kubcetl

complete -o default -F __start_helm helm
complete -o default -F __start_helm h

# watch to keep autocompletion when using
alias w='watch '
alias watch='watch '
EOT

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 23
npm install -g npm


