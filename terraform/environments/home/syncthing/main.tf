module "common" {
  source = "../common"
}

module "syncthing" {
  source = "../../../modules/proxmox/vm"

  # General

  name = "syncthing"

  vm_id = 151

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

  address = "10.10.10.51/24"

  gateway = module.common.cloud-init.gateway

}
