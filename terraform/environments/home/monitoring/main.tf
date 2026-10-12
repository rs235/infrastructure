module "pve-exporter" {
  source = "../../../modules/proxmox/vm"

  # General

  name = "pve-exporter"

  vm_id = 154

  target_node = module.common.proxmox.node

  tags = [
    "terraform",
    "monitoring"
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

  address = "10.10.10.54/24"

  gateway = module.common.cloud-init.gateway

}
