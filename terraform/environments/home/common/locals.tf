locals {
  proxmox = {
    node    = "pve"
    storage = "local-lvm"
  }

  network = {
    bridge = "vmbr1"
    # vlan_id = 10
  }

  cloud-init = {
    gateway = "10.10.10.1"
  }

  user = {
    ssh_pub_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJGlasRS7kxBSKvZ4vTGtCIeTa92Zjm7IXkurFfoRofk ansible@automation"
  }
}
