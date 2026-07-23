output "name" {
  value = {
    syncthing   = module.syncthing.name
  }
}

output "vm_id" {
  value = {
    syncthing   = module.syncthing.vm_id
  }
}

output "fqdn" {
  value = {
    syncthing   = module.syncthing.fqdn
  }
}
