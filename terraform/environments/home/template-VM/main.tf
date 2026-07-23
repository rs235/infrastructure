module "common" {
  source = "../common"
}

module "VM" {
  source = "../../../modules/proxmox/vm"

  # General

  name = "VM"

  vm_id = XXX

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

  address = "10.10.10.XX/24"

  gateway = module.common.cloud-init.gateway

}
