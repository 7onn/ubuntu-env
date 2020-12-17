# If you come from bash you might have to change your $PATH.
export PATH=:$HOME/bin:/usr/local/bin:$PATH:~/Library/Python/2.7/bin:$PATH
export PATH=/home/tom/plugins:$PATH
export PATH=/home/tom/Library/Python/3.7/bin:$PATH
#export EDITOR=/usr/local/bin/emacs
# Path to your oh-my-zsh installation.
export ZSH="/home/tom/.oh-my-zsh"

export GOPATH=/home/tom/go

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="candy"
#ZSH_THEME="reggae"


plugins=(git aws)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

eval $(~/.linuxbrew/bin/brew shellenv)

alias tf="aws-vault exec terraform -- terraform"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias k='kubectl'
alias kubectx='kubectl config use-context'
alias knodes='kubectl get nodes --sort-by='.metadata.creationTimestamp' | grep -v monit | grep node' 
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

ecrlogin(){
  aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 307424997672.dkr.ecr.us-east-1.amazonaws.com
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
