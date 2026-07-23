output "name" {
  description = "VM name"
  value       = module.syncthing.name
}

output "vm_id" {
  description = "VM ID"
  value       = module.syncthing.vm_id
}

output "fqdn" {
  value = module.syncthing.fqdn
}
