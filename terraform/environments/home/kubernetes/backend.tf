terraform {
  backend "local" {
    path = "/opt/terraform-state/proxmox/sandbox/terraform.tfstate"
  }
}