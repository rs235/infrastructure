output "name" {
  value = {
    pve-exporter = module.pve-exporter.name
  }
}

output "vm_id" {
  value = {
    pve-exporter = module.pve-exporter.vm_id
  }
}

output "fqdn" {
  value = {
    pve-exporter = module.pve-exporter.fqdn
  }
}
