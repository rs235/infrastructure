locals {
  proxmox = {
    node    = "pve"
    storage = "local-lvm"
  }

  network = {
    bridge  = "vmbr1"
    # vlan_id = 10
  }

  cloud-init = {
    gateway = "10.10.10.1"
  }
}
