## Flexible and reusable Linux user management role
This role allows for managing Linux user accounts, primary groups, supplementary groups, SSH authorized keys, and more.
Both interactive user and system/service accounts are supported.

Features:
1. Use of loops allows multiple users to be managed at the same time. 
2. Optional values use "default(omit)" to avoid passing undefined variables. Values where empty definitions should also be treated as unset use "default(omit, true)".
3. Basic validation for user name and primary group ensures those two critical values can not be empty.
4. Installation of authorized keys is optional and runs only if a key is defined.

This role was created and tested with **Ansible core 2.20.7rc1**. Compatibility with older versions is not verified.

Simplified role structure:

``` YAML
- name: Validate user definitions

- name: Create primary group

- name: Create user

- name: Install SSH key (optional)
```

Simplified variables definitions:

``` YAML
users:
  # Interactive user with sudo
  - name: user_name
    comment: "Full Name"
    uid: number
    group: user_group
    gid: number
    create_home: true
    home: /home/user_name
    system: false
    shell: /bin/bash
    groups:
      - sudo
    ssh_key: "{{ ssh_key }}" # Variable can be replaced with path to key file or plaintext key. 

  # Service/system account
  - name: service_account_name
    comment: "Service account description"
    uid: number
    group: service_account_group
    gid: number
    system: true
    shell: /usr/sbin/nologin
```

Playbook example:

``` YAML
- hosts: servers
  become: true
  roles:
    - role: user-management
```
