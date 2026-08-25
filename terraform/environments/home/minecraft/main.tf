module "common" {
  source = "../common"
}

module "minecraft" {
  source = "../../../modules/proxmox/vm"

  # General

  name = "minecraft"

  vm_id = 153

  target_node = module.common.proxmox.node

  template_vm_id = 900

  # CPU

  cores = 2

  # RAM

  memory = 4096

  # Disks

  storage = module.common.proxmox.storage

  disk_size = 64

  # Network

  bridge = module.common.network.bridge

  # vlan_id = module.common.network.vlan_id

  # cloud-init

  address = "10.10.10.53/24"

  gateway = module.common.cloud-init.gateway

}
