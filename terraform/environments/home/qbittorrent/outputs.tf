output "name" {
  value = {
    qbittorrent = module.qbittorrent.name
  }
}

output "vm_id" {
  value = {
    qbittorrent = module.qbittorrent.vm_id
  }
}

output "fqdn" {
  value = {
    qbittorrent = module.qbittorrent.fqdn
  }
}
