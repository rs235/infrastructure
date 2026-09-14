terraform {
  backend "local" {
    path = "/opt/terraform-state/proxmox/LXC/terraform.tfstate"
  }
}