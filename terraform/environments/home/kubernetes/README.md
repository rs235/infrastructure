## kubernetes

This root module defines Kubernetes cluster infrastructure.

Resources:

Control plane:
Cores: 2
RAM: 4096
Disk: 32GB

Worker node:
Cores: 4
RAM: 6144
Disk: 32GB

*Before deployment on prod enable Proxmox API TLS certificate verification in providers.tf.*