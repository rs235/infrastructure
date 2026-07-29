resource "proxmox_virtual_environment_vm" "vm" {

  # General
  name      = var.name
  vm_id     = var.vm_id
  node_name = var.target_node
  tags = [
    "terraform",
    "dev"
  ]

  # Auto start
  started = true
  on_boot = true

  # Template
  clone {
    vm_id = var.template_vm_id
    full  = true
  }

  # QEMU Guest Agent
  agent {
    enabled = true
    type    = "virtio"
    trim    = true
    timeout = "5m"
  }

  # CPU
  cpu {
    cores = var.cores
    type  = "host"
  }

  # RAM
  memory {
    dedicated = var.memory
  }

  # UEFI
  bios    = "ovmf"
  machine = "q35"

  # Disks and bus/device
  scsi_hardware = "virtio-scsi-single"

  disk {
    interface    = "scsi0"
    datastore_id = var.storage
    size         = var.disk_size

    ssd      = true
    discard  = "on"
    iothread = true
  }

  # Network
  network_device {
    bridge   = var.bridge
    model    = "virtio"
    firewall = true
    # vlan_id = var.vlan_id
  }

  # cloud-init
  initialization {
    ip_config {
      ipv4 {
        address = var.address
        gateway = var.gateway
      }
    }
  }

  # Serial device for console output
  serial_device {}

  # Set display output to serial
  vga {
    type = "serial0"
  }
}