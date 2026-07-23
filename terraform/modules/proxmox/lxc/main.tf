resource "proxmox_virtual_environment_container" "lxc" {

  # General
  vm_id        = var.vm_id
  node_name    = var.target_node
  unprivileged = var.unprivileged

  started       = true
  start_on_boot = true

  # Container template
  operating_system {
    template_file_id = var.template
    type             = var.os_type
  }

  # CPU
  cpu {
    cores = var.cores
  }

  # Memory
  memory {
    dedicated = var.memory
    swap      = var.swap
  }

  # Disks
  disk {
    datastore_id = var.storage
    size         = var.rootfs_size
  }

  # Network
  network_interface {
    name     = "eth0"
    bridge   = var.bridge
    firewall = var.firewall
    # vlan_id  = var.vlan_id
  }

  initialization {
  hostname = var.name

  ip_config {
    ipv4 {
      address = var.address
      gateway = var.gateway
    }
  }

  user_account {
    password = var.password

    keys = [
      var.ssh_key
    ]
  }
}

  # Features
  features {
    nesting = var.nesting
    keyctl  = var.keyctl
  }

  # Console
  console {
    enabled = var.console
  }
}
