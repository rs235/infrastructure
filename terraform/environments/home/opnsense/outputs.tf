output "name" {
  description = "VM name"
  value       = module.opnsense.name
}

output "vm_id" {
  description = "VM ID"
  value       = module.opnsense.vm_id
}

output "fqdn" {
  value = module.opnsense.fqdn
}
