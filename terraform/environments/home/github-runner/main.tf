module "github-runner" {
  source = "../../../modules/proxmox/lxc"

  # General
  name         = "github-runner"
  vm_id        = 200
  target_node  = module.common.proxmox.node
  unprivileged = true
  template     = "local:vztmpl/ubuntu-26.04-standard_26.04-1_amd64.tar.zst"
  os_type      = "ubuntu"

  # CPU
  cores = 2

  # Memory
  memory = 2048
  swap   = 1024

  # Disks
  storage     = module.common.proxmox.storage
  rootfs_size = 32

  # Network
  bridge   = module.common.network.bridge
  firewall = true
  # vlan_id = module.common.network.vlan_id
  address = "10.10.10.70/24"
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