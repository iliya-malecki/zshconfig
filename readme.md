# My beloved system configuration
Ive only considered ubuntu and will fix it only after i start distrohopping

## Installation
`clone` the repo, `cd` into it and run

```bash
ansible-galaxy collection install -r requirements.yml
ansible-playbook playbook.yml --ask-become-pass --extra-vars ansible_user=$USER
```
This runs the default tasks. You can opt in for an extended task set using tags, list using
```bash
ansible-playbook playbook.yml --list-tags --tags all,never
```
and run using those tags, e.g.
```bash
ansible-playbook playbook.yml --ask-become-pass --extra-vars ansible_user=$USER --tags server,conda
ansible-playbook playbook.yml --ask-become-pass --extra-vars ansible_user=$USER --tags personal
ansible-playbook playbook.yml --ask-become-pass --extra-vars ansible_user=$USER --tags essential
```
