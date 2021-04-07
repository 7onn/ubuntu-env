export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:$LD_LIBRARY_PATH
export PATH=:$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/tom/plugins:$PATH

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=/home/tom/go/bin:$PATH
export PATH=/usr/local/cuda-11.1/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64:$LD_LIBRARY_PATH
export ZSH="/home/tom/.oh-my-zsh"

export GOOGLE_APPLICATION_CREDENTIALS="/home/tom/Downloads/echotom-dev-b2a0f646b5f6.json"

export HOST="cosmos"
export GOPATH=/home/tom/go

ZSH_THEME="steeef"
#ZSH_THEME="spaceship"
#ZSH_THEME="muse"
#ZSH_THEME="reggae"


plugins=(git)

source $ZSH/oh-my-zsh.sh


export EDITOR='emacs'

alias tf="aws-vault --debug exec terraform --duration=1h -- terraform"
#alias tf="aws-vault --debug exec terraform --duration=1h -- terraform0.13.16"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias k='kubectl'
alias kubectx='kubectl config use-context'
alias kv4='kubectl config use-context k8s-v4.descomplica.io'
alias kv5='kubectl config use-context k8s-v5.us.descomplica.io'
alias knodes='kubectl get nodes --sort-by='.metadata.creationTimestamp' | grep -v monit | grep node' 
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias b='xmodmap /home/tom/.xmodmaprc'



ecrlogin(){
  aws2 ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 307424997672.dkr.ecr.us-east-1.amazonaws.com
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tom/plugins/google-cloud-sdk/path.zsh.inc' ]; then . '/home/tom/plugins/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tom/plugins/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/tom/plugins/google-cloud-sdk/completion.zsh.inc'; fi

myip(){
  curl -s https://ipinfo.io/json | jq .ip | sed -e 's/\"//g' | pbcopy
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

PATH="/home/tom/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/tom/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/tom/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/tom/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/tom/perl5"; export PERL_MM_OPT;

# configure hal auto-complete 
. /etc/bash_completion.d/hal
