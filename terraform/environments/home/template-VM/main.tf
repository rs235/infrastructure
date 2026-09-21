module "MODULE_NAME" {
  source = "../../../modules/proxmox/vm"

  # General

  name = "RESOURCE_NAME"

  vm_id = VM_ID

  target_node = module.common.proxmox.node

  tags = [
    "terraform",
    "RESOURCE_NAME"
  ]

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

  address = "10.10.10.LAST_OCTET/24"

  gateway = module.common.cloud-init.gateway

}
