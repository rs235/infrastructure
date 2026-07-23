module "common" {
  source = "../common"
}

module "qbittorrent" {
  source = "../../../modules/proxmox/vm"

  # General

  name = "qbittorrent"

  vm_id = 152

  target_node = module.common.proxmox.node

  template_vm_id = 900

  # CPU

  cores = 1

  # RAM

  memory = 1024

  # Disks

  storage = module.common.proxmox.storage

  disk_size = 8

  # Network

  bridge = module.common.network.bridge

  # vlan_id = module.common.network.vlan_id

  # cloud-init

  address = "10.10.10.50/24"

  gateway = module.common.cloud-init.gateway

}
