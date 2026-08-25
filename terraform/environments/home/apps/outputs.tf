output "name" {
  value = {
    qbittorrent = module.qbittorrent.name
    searxng     = module.searxng.name
    # syncthing   = module.syncthing.name
  }
}

output "vm_id" {
  value = {
    qbittorrent = module.qbittorrent.vm_id
    searxng     = module.searxng.vm_id
    # syncthing   = module.syncthing.vm_id
  }
}

output "fqdn" {
  value = {
    qbittorrent = module.qbittorrent.fqdn
    searxng     = module.searxng.fqdn
    # syncthing   = module.syncthing.fqdn
  }
}
