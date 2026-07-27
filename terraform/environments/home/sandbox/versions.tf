terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.110.0"
    }
  }

  backend "local" {
    path = "/opt/terraform-state/proxmox/terraform.tfstate"
  }

  required_version = ">= 1.15"
}
