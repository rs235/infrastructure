output "name" {
  description = "VM name"
  value       = proxmox_virtual_environment_vm.vm.name
}

output "vm_id" {
  description = "VM ID"
  value       = proxmox_virtual_environment_vm.vm.vm_id
}

output "fqdn" {
  description = "VM FQDN"
  value = "${proxmox_virtual_environment_vm.vm.name}.home.arpa"
}
