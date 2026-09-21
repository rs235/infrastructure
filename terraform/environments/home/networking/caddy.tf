module "caddy" {
  source = "../../../modules/proxmox/vm"

  # General

  name = "caddy"

  vm_id = 152

  target_node = module.common.proxmox.node

  tags = [
    "terraform",
    "networking"
  ]

  template_vm_id = 900

  # CPU

  cores = 1

  # RAM

  memory = 1024

  # Disks

  storage = module.common.proxmox.storage

  disk_size = 16

  # Network

  bridge = module.common.network.bridge

  # vlan_id = module.common.network.vlan_id

  # cloud-init

  address = "10.10.10.52/24"

  gateway = module.common.cloud-init.gateway

}
