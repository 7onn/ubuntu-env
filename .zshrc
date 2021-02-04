# If you come from bash you might have to change your $PATH.
export PATH=:$HOME/bin:/usr/local/bin:$PATH:~/Library/Python/2.7/bin:$PATH
export PATH=/home/tom/plugins:$PATH
export PATH=/home/tom/Library/Python/3.7/bin:$PATH
export ZSH="/home/tom/.oh-my-zsh"

export GOPATH=/home/tom/go
export GOBIN=/home/tom/go/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR='emacs'

ZSH_THEME="muse"
#ZSH_THEME="reggae"

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval $(~/.linuxbrew/bin/brew shellenv)

xmodmap ~/.xmodmaprc

alias tf="aws-vault exec terraform -- terraform"
alias k='kubectl'
alias kubectx='kubectl config use-context'
alias knodes='kubectl get nodes --sort-by='.metadata.creationTimestamp' | grep -v monit | grep node' 
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

ecrlogin(){
  aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 307424997672.dkr.ecr.us-east-1.amazonaws.com
}

myip(){
  curl -s https://ipinfo.io/json | jq .ip | sed -e 's/\"//g' | pbcopy
}

sshls(){
  for key in ~/.ssh/id_*; do ssh-keygen -l -f "${key}"; done | uniq
}

getsecret(){
  echo -n $1 | base64 -d | pbcopy
}

setsecret(){
  echo -n $1 | base64 | pbcopy
}
