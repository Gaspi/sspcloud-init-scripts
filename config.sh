#!/bin/sh

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

mkdir -p ~/work/git/
cd ~/work/git/
git clone https://github.com/InseeFrLab/helm-charts-interactive-services.git
git clone https://github.com/InseeFrLab/helm-charts-databases.git
git clone https://github.com/InseeFrLab/helm-charts-datavisualization.git
git clone https://github.com/InseeFrLab/helm-charts-automation.git
git clone https://github.com/InseeFrLab/helm-charts-shiny-apps.git
git clone https://github.com/InseeFrLab/helm-charts-miscellaneous.git
git clone https://inseefrlab.github.io/helm-charts-datascience

