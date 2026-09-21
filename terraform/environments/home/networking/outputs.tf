output "name" {
  value = {
    caddy = module.caddy.name
  }
}

output "vm_id" {
  value = {
    caddy = module.caddy.vm_id
  }
}

output "fqdn" {
  value = {
    caddy = module.caddy.fqdn
  }
}
