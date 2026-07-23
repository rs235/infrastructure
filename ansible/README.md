## Role based Ansible repository

Features:
 - Inventory split per environment (home,aws etc.)
 - Focus on small and reusable roles.
 - List of known_hosts for the project separate from user's default known_hosts.
 - All secrets encrypted with Ansible Vault.
 - Variables split into group_vars and host_vars with optional per role variables in roles/role/defaults.

### Folder structure

roles/
    Reusable building blocks.

inventories/
    Deployment targets.

playbooks/
    Thin orchestration layer.

group_vars/
    Shared defaults.

host_vars/
    Host-specific overrides.
