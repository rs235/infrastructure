output "name" {
  value = {
    github-runner = module.github-runner.name
  }
}

output "vm_id" {
  value = {
    github-runner = module.github-runner.vm_id
  }
}

output "fqdn" {
  value = {
    github-runner = module.github-runner.fqdn
  }
}
