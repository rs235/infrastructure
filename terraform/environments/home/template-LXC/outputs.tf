output "name" {
  value = {
    LXC   = module.LXC.name
  }
}

output "vm_id" {
  value = {
    LXC   = module.LXC.vm_id
  }
}

output "fqdn" {
  value = {
    LXC   = module.LXC.fqdn
  }
}
