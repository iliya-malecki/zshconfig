# My beloved system configuration
Ive only considered ubuntu and will fix it only after i start distrohopping

## Installation
`clone` the repo, `cd` into it and run

```bash
ansible-galaxy collection install -r requirements.yml
ansible-playbook playbook.yml --ask-become-pass --extra-vars ansible_user=$USER
```
