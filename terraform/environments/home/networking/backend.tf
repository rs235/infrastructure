terraform {
  backend "local" {
    path = "/opt/terraform-state/proxmox/networking/terraform.tfstate"
  }
}