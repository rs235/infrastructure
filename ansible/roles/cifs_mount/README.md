## Flexible and reusable SMB share mount role
This role allows for mounting of SMB shares. 

Features:
1. Use of loops allows multiple shares to be mounted at the same time. 
2. SMB share credentials are stored in a credentials file with restrictive permissions (0600) for improved security.
3. Mount options specify "uid" and "gid" for additional security. If that extra security is not required they can be replaced with "noperm".

This role was created and tested with **Ansible core 2.20.7rc1**. Compatibility with older versions is not verified.

Simplified role structure:

``` YAML
- name: Install cifs-utils for SMB support

- name: Ensure /etc/samba directory exists

- name: Create SMB credentials file

- name: Create mount points

- name: Mount SMB shares
```

Simplified variables definitions:

``` YAML
smb_mounts:
  - server: FQDN
    share: share_name
    mount_point: path
    username: share_username
    password: "{{ smb_password1 }}"

  - server: FQDN
    share: share_name2
    mount_point: path
    username: share_username2
    password: "{{ smb_password2 }}"
```

Playbook example:

``` YAML
- hosts: servers
  become: true
  roles:
    - role: smb-mount
```
