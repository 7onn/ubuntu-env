# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Starts a local HTTP server using Python in working dir
alias httpserver='python -m http.server'

# Usage: cat file.json | asjson
alias json_pp='python -mjson.tool'

alias b='xmodmap /home/tom/.Xmodmap'
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

kmsdecrypt(){
  aws --region $1 kms decrypt \
    --ciphertext-blob fileb://<(echo -n $2 | base64 -d) \
    --output text \
    --query Plaintext | base64 -d
}

kmsencrypt(){
  aws --region $1 kms encrypt \
    --key-id $2 \
    --plaintext fileb://<(echo -n $3) \
    --output text \
    --query CiphertextBlob
}

flushevicted() {
  kubectl -n $1 get pods | grep Evicted | awk '{print $1}' | xargs kubectl -n $1 delete pod
}
