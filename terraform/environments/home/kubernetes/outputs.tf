output "name" {
  value = {
    cp1 = module.k8s-cp1.name
    cp2 = module.k8s-cp2.name
    cp3 = module.k8s-cp3.name
    w1  = module.k8s-w1.name
    w2  = module.k8s-w2.name
    w3  = module.k8s-w3.name
  }
}

output "vm_id" {
  value = {
    cp1 = module.k8s-cp1.vm_id
    cp2 = module.k8s-cp2.vm_id
    cp3 = module.k8s-cp3.vm_id
    w1  = module.k8s-w1.vm_id
    w2  = module.k8s-w2.vm_id
    w3  = module.k8s-w3.vm_id
  }
}

output "fqdn" {
  value = {
    cp1 = module.k8s-cp1.fqdn
    cp2 = module.k8s-cp2.fqdn
    cp3 = module.k8s-cp3.fqdn
    w1  = module.k8s-w1.fqdn
    w2  = module.k8s-w2.fqdn
    w3  = module.k8s-w3.fqdn
  }
}
