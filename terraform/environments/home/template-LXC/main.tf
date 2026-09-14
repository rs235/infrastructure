module "<MODULE_NAME>" {
  source = "../../../modules/proxmox/lxc"

  # General
  name         = "<RESOURCE_NAME>"
  vm_id        = <VM_ID>
  target_node  = module.common.proxmox.node
  unprivileged = true
  template     = "local:vztmpl/ubuntu-26.04-standard_26.04-1_amd64.tar.zst"
  os_type      = "ubuntu"

  # CPU
  cores = 1

  # Memory
  memory = 512
  swap   = 512

  # Disks
  storage     = module.common.proxmox.storage
  rootfs_size = 8

  # Network
  bridge   = module.common.network.bridge
  firewall = true
  # vlan_id = module.common.network.vlan_id
  address = "10.10.10.<LAST_OCTET>/24"
  gateway = "10.10.10.1"

  # User
  # password  =
  ssh_pub_key = module.common.user.ssh_pub_key

  # Features
  nesting = true
  keyctl  = false

  # Console
  console = true
}
