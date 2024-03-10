## My Ansible config

1. In order to use this, first install ansible. On Ubuntu, run:
```bash
sudo apt update
sudo apt install ansible
```

2. Copy the vault key to `~/.vault.txt`

3. Clone this repo: `cd ~; git clone https://github.com/anmolsingh95/ansible`

4. Run `cd ansible; ansible-playbook all.yaml -K`
