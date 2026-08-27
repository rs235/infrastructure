## Overview

Infrastructure as code project for provisioning and management of personal environments on Proxmox VE and commercial cloud platforms.

This repository provisions and manages resources on a self hosted Proxmox VE server and AWS cloud platform. Main goals of this project are modularity, reusability and reproducibility while keeping the code conscise and useful without it becoming a future maintenance burden.

This project is built around the concept of separate environments but not in a typical, corporate way. Instead of creating artificial dev / test / prod environments I made a decision to instead treat home server and different cloud providers as separate environments.

This repository currently does not manage the very base layer of my home environment which includes Proxmox VE, TrueNAS, OPNsense and assorted network devices and instead focuses mainly on the applications and services running on top of this estabilished base layer.

Main building blocks of this projects are:
- Terraform - Used for infrastructure provisioning which includes Proxmox VM, LXC and associated with them virtual devices and configuration, AWS resources like VPC, Security Group and EC2 instances.
- Ansible - Used for operating system, kubernetes and application installation and configuration.
- GitHub Actions as the CI/CD tool. The glue that holds all moving parts together.

Additionaly Kubernetes application provisioning is done via ArgoCD in its own GitOps repository: LINK

## Architecture

``` mermaid
---
config:
  theme: redux
---
flowchart TB
    n2["GitHub"] --> n3["GitHub Actions"]
    n3 --> n4["Terraform"] & n5["Ansible"]
    n4 --> n6["Proxmox VE"]
    n5 --> n7["Linux / Kubernetes"]
    n7 --> n8["Kubernetes"] & n10["Services"]
    n8 --> n9["ArgoCD"]
    n6 --> n11["VM"] & n12["LXC"]
    n11 --> n9
    n12 --> n9
    n9 --> n13["Kubernetes Workloads"]

     n2:::Sky
     n3:::Sky
     n4:::Sky
     n5:::Sky
     n6:::Sky
     n7:::Sky
     n8:::Sky
     n10:::Sky
     n9:::Sky
     n11:::Sky
     n12:::Sky
     n13:::Sky
    classDef Sky stroke-width:1px, stroke-dasharray:none, stroke:#374D7C, fill:#E2EBFF, color:#374D7C
```

#### Infrastructure provisioning

Terraform is used for provisioning and management of infrastructure on top of Proxmox VE and cloud platforms.

``` mermaid
---
config:
  theme: redux
---
flowchart TB
    n14["GitHub"] --> n15["GitHub Actions"]
    n15 --> n16["Terraform"]
    n16 --> n17["Proxmox VE"]
    n17 --> n18["VM"] & n19["LXC"]

     n14:::Sky
     n15:::Sky
     n16:::Sky
     n17:::Sky
     n18:::Sky
     n19:::Sky
     classDef Sky stroke-width:1px, stroke-dasharray:none, stroke:#374D7C, fill:#E2EBFF, color:#374D7C
```

## Workflow

```mermaid
---
config:
  layout: elk
---
flowchart LR
    A["GitHub Push"] -- Trigger --> B["GitHub Actions Workflow"]
    B --> C{"Run Tests"}
    C -- Pass --> D["Lint & Validate"]
    C -- Fail --> E["Notify Developer"]
    D -- Pass --> F["Plan Infrastructure"]
    D -- Fail --> E
    F --> G{"Review Plan"}
    G -- Approve --> H["Apply Infrastructure"]
    G -- Reject --> I["Cancel Deployment"]
    H --> J{"Deployment Success"}
    J -- Yes --> K["Update State File"]
    J -- No --> L["Rollback"]
    K --> M["Notify Team"]
    L --> M
    E --> N["End"]
    I --> N
    M --> N

     A:::trigger
     B:::process
     C:::decision
     D:::process
     E:::failure
     F:::process
     G:::decision
     H:::process
     J:::decision
     K:::process
     L:::failure
     M:::notification
     N:::notification
    classDef trigger stroke:#38bdf8,fill:#f0f9ff
    classDef process stroke:#818cf8,fill:#eef2ff
    classDef decision stroke:#a78bfa,fill:#f5f3ff
    classDef success stroke:#4ade80,fill:#f0fdf4
    classDef failure stroke:#f87171,fill:#fef2f2
    classDef notification stroke:#facc15,fill:#fefce8
```

## Repository structure

```
.
├── ansible               # Contains Ansible configuration, playbooks, roles and inventory.
│   ├── inventories       # Ansible inventory split into separate environments with their own vars.
│   │   ├── aws
│   │   └── home
│   ├── playbooks         # Ansible playbooks. Mostly used to call reusable roles.
│   └── roles             # Reusable Ansible roles.
├── dependencies          # Contains Ansible dependencies like Kubespray.
│   └── kubespray         # Kubespray *git submodule* with *pinned tag*.
├── scripts
│   └── ansible_setup.sh
└── terraform             # Contains Terraform environments and modules.
    ├── environments      # Separate Terraform environments per cloud provider.
    │   ├── aws
    │   └── home
    ├── modules           # Reusable Terraform modules separated by environment.
    │   ├── aws
    │   └── proxmox
    └── README.md         # The file you're reading.
```

## Prerequisites

This project requires a local, self hosted GitHub runner for interacting with a self hosted Proxmox server.

### Tools and versions

| Name        | Version |
| ---         | ---     |
| Terraform   | 1.15.8  |
| Ansible     | 11.13.0 |
| Kubespray   | 2.31.0  |
| Proxmox BPG | 0.110.0 |
| Python      | 3.12    |

### Accounts, credentials, permissions

SSH access with sudo for Ansible.

Proxmox API token for Terraform BPG provider.

AWS Access Key for Terraform AWS provider.

### Environment variables and secrets

Repository secrets:

ANSIBLE_SSH_PRIVATE_KEY
ANSIBLE_VAULT_PASSWORD

PROXMOX_VE_API_TOKEN
PROXMOX_VE_ENDPOINT
PROXMOX_VE_INSECURE

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY

## Getting started

## State management

**Location** - Currently Terraform state is kept on Github runner's filesystem. This is not ideal due to lack of state locking mechanism which makes it impossible to safely make changes to infrastructure from multiple machines. Because of this limitation **the only supported way of making changes to infrastructure is through the GitHub Actions workflow**. This is something that could not be resolved at the time of creating this project due to resource constraints and will be addressed in the future.

**Separation** - Terraform state is separated by major system or group of apps. This way there is no risk of changes made, for example to a Minecraft server affecting the Kubernetes cluster. This approach ads another layer of stability and security to the environment.

**Backups** - State files are backed up with a simple cron job to a mounted SMB share once a day.

## Future improvements

- Moving state to a dedicated system with locking mechanism.
- Improved secret management.
- Additional environments.
- Improved, automated off-site backups.
- Enabling provisioning and configuration of the very base layer of home environment if possible (Proxmox VE, TrueNAS, OPNsense, Home Assistant OS, network devices).


**Disclaimer**: This readme **was not** LLM generated.