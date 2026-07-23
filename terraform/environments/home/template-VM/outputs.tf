output "name" {
  value = {
    VM = module.VM.name
  }
}

output "vm_id" {
  value = {
    VM = module.VM.vm_id
  }
}

output "fqdn" {
  value = {
    VM = module.VM.fqdn
  }
}
