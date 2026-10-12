output "name" {
  value = {
    MODULE_NAME = module.MODULE_NAME.name
  }
}

output "vm_id" {
  value = {
    MODULE_NAME = module.MODULE_NAME.vm_id
  }
}

output "fqdn" {
  value = {
    MODULE_NAME = module.MODULE_NAME.fqdn
  }
}
