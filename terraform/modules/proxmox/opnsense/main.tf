resource "proxmox_virtual_environment_vm" "opnsense" {

  name = var.name
  #  vm_id     = var.vm_id
  node_name = var.target_node

  started = true
  on_boot = true

  scsi_hardware = "virtio-scsi-single"

  boot_order = ["ide3", "scsi0"]

  #   # QEMU Guest Agent
  #   agent {
  #     enabled = true
  #     type    = "virtio"
  #     trim    = true
  #     timeout = "15m"
  #   }

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

  efi_disk {
    datastore_id      = "local-lvm"
    type              = "4m"
    pre_enrolled_keys = true
  }

  # Display
  serial_device {}

  vga {
    type = "std" # Change to "serial0" after installation.
  }

  # Installer ISO
  cdrom {
    file_id   = "nas:iso/${var.iso}"
    interface = "ide3"
  }


  # EFI disk

  efi_disk {
    datastore_id = "local-lvm"
  }

  # Storage disk
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
    bridge   = var.bridge1
    model    = "virtio"
    firewall = false
  }

  network_device {
    bridge   = var.bridge2
    model    = "virtio"
    firewall = false
  }
}
