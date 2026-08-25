output "name" {
  value = {
    minecraft = module.minecraft.name
  }
}

output "vm_id" {
  value = {
    minecraft = module.minecraft.vm_id
  }
}

output "fqdn" {
  value = {
    minecraft = module.minecraft.fqdn
  }
}
