# General
variable "name" {
  type = string

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.name))
    error_message = "Name must only contain lowercase letters, numbers and hyphens."
  }
}

variable "vm_id" {
  type = number
  validation {
    condition     = var.vm_id > 99
    error_message = "VM ID must be greater than 99."
  }
}

variable "unprivileged" {
  type    = bool
  default = true
}

variable "target_node" {
  type = string

  validation {
    condition     = length(trimspace(var.target_node)) > 0
    error_message = "Target node cannot be empty."
  }
}

variable "template" {
  type = string

  validation {
    condition     = length(trimspace(var.template)) > 0
    error_message = "Target node cannot be empty."
  }
}

variable "os_type" {
  type = string

  validation {
    condition     = length(trimspace(var.os_type)) > 0
    error_message = "OS Type cannot be empty."
  }
}

# CPU
variable "cores" {
  type = number
  validation {
    condition     = var.cores >= 1
    error_message = "Number of cores must be larger than 0."
  }
}

# Memory
variable "memory" {
  type = number
  validation {
    condition     = var.memory >= 128
    error_message = "Amount of assigned memory must be greater than 128MB."
  }
}

variable "swap" {
  type = number

  validation {
    condition     = var.swap >= 0
    error_message = "Swap must be 0 or greater."
  }
}

# Disks
variable "storage" {
  type = string

  validation {
    condition     = length(trimspace(var.storage)) > 0
    error_message = "Target node cannot be empty."
  }
}

variable "rootfs_size" {
  type = number
  validation {
    condition     = var.rootfs_size >= 4
    error_message = "Size of rootfs must be at least 4GB."
  }
}

# Network
variable "bridge" {
  type = string

  validation {
    condition     = length(trimspace(var.bridge)) > 0
    error_message = "Target node cannot be empty."
  }
}

variable "firewall" {
  type    = bool
  default = true
}

# variable "vlan_id" {
#   type = number
# }

variable "address" {
  type = string
}

variable "gateway" {
  type = string
}

# User
variable "password" {
  type      = string
  default   = null
  sensitive = true
}

variable "ssh-public-key" {
  type      = string
  default   = null
  sensitive = true
}

# Features
variable "nesting" {
  type    = bool
  default = true
}

variable "keyctl" {
  type    = bool
  default = false
}

# Console
variable "console" {
  type    = bool
  default = true
}
