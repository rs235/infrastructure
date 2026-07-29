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

variable "target_node" {
  type = string
}

variable "tags" {
  type = string
}

variable "cores" {
  type = number
}

variable "memory" {
  type = number
}

variable "disk_size" {
  type = number
}

variable "storage" {
  type = string
}

variable "bridge" {
  type = string
}

variable "template_vm_id" {
  type = string
}

variable "address" {
  type = string
}

variable "gateway" {
  type = string
}

# Terraform Lifecycle
# Terraform Lifecycle
variable "prevent_destroy" {
  type    = bool
  default = false
}
