# dotfiles

still on development but the purpose of this repository is to hold all of my configuration files and their installation scripts


```bash
cp .xmodmaprc ~/.xmodmaprc && \
    cp .zshrc ~/.zshrc && \
    cp .gitconfig ~/.gitconfig && \
    cp .ssh/config ~/.ssh/config && \
    cp .vimrc ~/.vimrc && \
    cp -r .emacs.d ~/.emacs.d

sudo apt update

sudo apt install openssh-server sshpass
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa
ssh-copy-id tom@cosmos # will prompt password

sudo ufw allow ssh && \
    sudo ufw enable

sudo apt install ansible
ansible-playbook -kK -u tom -i 'cosmos,' playbook.yml -e ansible_python_interpreter=/usr/bin/python3 # will prompt password both user and root

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh # then type "zsh"

sudo snap install authy --beta


```
