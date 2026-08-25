## qBittorrent

#### Description

This role:
- installs qbittorrent-nox package
- creates qbittorrent config directory, copies configuration files and sets appropriate file permissions
- installs qbittorrent service from a template
- ensures qbittorrent service is enabled ans started

#### Variables

This role requires the following variables to be set manually. See /defaults/main.yml for example values.

``` YAML
qbittorrent_user:
qbittorrent_group:
qbittorrent_config_dir:
smb_mount_points:
  - 
```
