#!/bin/bash

sudo yum groupinstall 'Development Tools'

sudo yum install curl file git

sudo yum install libxcrypt-compat

git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew

mkdir ~/.linuxbrew/bin

ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin

eval $(~/.linuxbrew/bin/brew shellenv)

sudo dnf -y install dnf-plugins-core

sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
 
sudo dnf install docker-ce docker-ce-cli containerd.io

curl https://az764295.vo.msecnd.net/stable/d2e414d9e4239a252d1ab117bd7067f125afd80a/code-1.50.1-1602601064.el7.x86_64.rpm -o code.rpm
sudo dnf install code.rpm

sudo dnf install snapd

sudo ln -s /var/lib/snapd/snap /snap

sudo snap install authy --beta

sudo yum install zsh

echo 'exec zsh' >> ~/.bashrc

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install

rm -rf aws
rm -f awscliv2.zip

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl https://github.com/99designs/aws-vault/releases/download/v6.2.0/aws-vault-linux-amd64 -o ~/bin/aws-vault
chmod +x ~/bin/aws-vault


