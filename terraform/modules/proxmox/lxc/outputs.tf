output "name" {
  description = "Container name"
  value       = var.name
}

output "vm_id" {
  description = "Container ID"
  value       = proxmox_virtual_environment_container.lxc.vm_id
}

output "fqdn" {
  description = "Container FQDN"
  value       = "${var.name}.home.arpa"
}
