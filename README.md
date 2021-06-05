# dotfiles
still on development but the purpose of this repository is to hold all of my configuration files and their installation scripts

```bash
sudo apt update && sudo apt install openssh-server sshpass
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa
ssh-copy-id tom@cosmos

sudo ufw allow ssh && \
    sudo ufw enable

sudo apt install ansible
ansible-playbook -kK \
    -u tom \
    -i 'localhost,' \
    playbook.yml --extra-vars "@vars/ansible.yml"


sudo snap install authy --beta
```
