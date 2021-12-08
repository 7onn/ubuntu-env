# dotfiles
This repository contains the ansible playbook files to setup my Ubuntu desktop 

## Requirements

```bash
sudo apt update && \
  sudo apt install openssh-server sshpass ansible && \
  eval $(ssh-agent)

sudo ufw allow ssh && \
  sudo ufw enable
```

## Run Locally
```bash
git clone https://github.com/tompsh/dotfiles && cd dotfiles
```

```bash
# Edit the variables accordingly
$EDITOR vars/ansible.yml
```

```bash
# Run the playbook
ansible-playbook -kK \
  -u $(whoami) \
  -i 'localhost,' \
  --extra-vars "@vars/ansible.yml" playbook.yml
```

## License
[MIT](https://choosealicense.com/licenses/mit/)
