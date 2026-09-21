terraform {
  backend "local" {
    path = "/opt/terraform-state/proxmox/monitoring/terraform.tfstate"
  }
}