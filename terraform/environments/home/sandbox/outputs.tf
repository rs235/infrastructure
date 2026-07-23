output "name" {
  description = "VM name"
  value       = module.sandbox.name
}

output "vm_id" {
  description = "VM ID"
  value       = module.sandbox.vm_id
}

output "fqdn" {
  value = module.sandbox.fqdn
}
