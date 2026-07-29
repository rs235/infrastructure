terraform {
  backend "local" {
    path = "/opt/terraform-state/proxmox/VM/terraform.tfstate"
  }
}