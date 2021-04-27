
export EDITOR='emacs'
export HOST="cosmos"

export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:$LD_LIBRARY_PATH

export PATH=:$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/tom/plugins:$PATH
export PATH=/home/tom/go/bin:$PATH
export GOPATH=/home/tom/go
export GOROOT=/usr/local/bin

export ZSH="/home/tom/.oh-my-zsh"

ZSH_THEME="steeef"
#ZSH_THEME="spaceship"
#ZSH_THEME="muse"
#ZSH_THEME="reggae"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/zsh-snap/znap.zsh

alias b='xmodmap /home/tom/.xmodmaprc'
alias k='kubectl'
alias kv4='kubectl config use-context k8s-v4.descomplica.io'
alias kv5='kubectl config use-context k8s-v5.us.descomplica.io'
alias knodes='kubectl get nodes --sort-by='.metadata.creationTimestamp' | grep -v monit | grep node' 
alias kubectx='kubectl config use-context'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias tf="aws-vault --debug exec terraform --duration=1h -- terraform"

ecrlogin(){
  aws2 ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 307424997672.dkr.ecr.us-east-1.amazonaws.com
}

myip(){
    #curl -s https://ipinfo.io/json | jq .ip | sed -e 's/\"//g' | pbcopy
     curl -s https://httpbin.org/ip | jq .origin | sed -e 's/\"//g' | pbcopy
}

sshls(){
  for key in ~/.ssh/id_*; do ssh-keygen -l -f "${key}"; done | uniq
}

getsecret(){
  echo -n $1 | base64 -d | sed -e 's/\n//g' | pbcopy
}

setsecret(){
  echo -n $1 | base64 | sed -e 's/\n//g' | pbcopy
}

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \
    zsh-users/zsh-autosuggestions \
    zdharma/fast-syntax-highlighting

### End of Zinit's installer chunk
