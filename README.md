## My Ansible config

1. In order to use this, first install ansible. On Ubuntu, run:
```bash
sudo apt update
sudo apt install ansible
```

2. Copy the vault key to `~/.vault.txt`

3. Run `ansible-playbook main.yaml -K`
