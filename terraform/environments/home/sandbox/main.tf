module "common" {
  source = "../common"
}

module "sandbox" {
  source = "../../../modules/proxmox/vm"

  # General

  name = "sandbox"

  vm_id = 800

  target_node = module.common.proxmox.node

  template_vm_id = 900

  # CPU

  cores = 1

  # RAM

  memory = 2048

  # Disks

  storage = module.common.proxmox.storage

  disk_size = 32

  # Network

  bridge = module.common.network.bridge

  # vlan_id = module.common.network.vlan_id

  # cloud-init

  address = "10.10.10.80/24"

  gateway = module.common.cloud-init.gateway

}
