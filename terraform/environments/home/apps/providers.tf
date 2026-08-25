provider "proxmox" {
  endpoint  = var.pve_api_url
  api_token = "${var.pve_api_token_id}=${var.pve_api_token_secret}"

  # Disables Proxmox API server TLS certificate verification. Must be set to true for deployment on production.
  insecure = true
}
