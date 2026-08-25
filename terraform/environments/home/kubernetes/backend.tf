terraform {
  backend "local" {
    path = "/opt/terraform-state/proxmox/kubernetes/terraform.tfstate"
  }
}