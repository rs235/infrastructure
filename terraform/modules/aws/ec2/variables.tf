# -----------------------------------------------------------------------------
# Instance
# -----------------------------------------------------------------------------

variable "instance_type" {
  description = "AWS EC2 instance type e.g. t3.micro or t3.small."
  type = string

  validation {
    condition     = length(var.instance_type) > 0
    error_message = "Instance type cannot be empty."
  }
}

variable "ami_id" {
  description = "AMI ID to use. If null, the latest supported Ubuntu image is used."
  type        = string
  default     = null
}

variable "name" {
  description = "Name tag assigned to the EC2 instance."
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "Instance type cannot be empty."
  }
}

# -----------------------------------------------------------------------------
# Network
# -----------------------------------------------------------------------------

variable "subnet_id" {
  description = "ID of the subnet in which to launch the EC2 instance."
  type        = string

  validation {
    condition     = length(trim(var.subnet_id, " ")) > 0
    error_message = "Subnet ID cannot be empty."
  }
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the instance."
  type        = list(string)

  validation {
    condition     = length(var.security_group_ids) > 0
    error_message = "At least one security group ID must be provided."
  }
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IPv4 address with the instance."
  type        = bool
  default     = false
}

# -----------------------------------------------------------------------------
# Storage
# -----------------------------------------------------------------------------

variable "volume_type" {
  description = "Type of the root EBS volume (e.g. gp3, gp2, io2)."
  type        = string

  validation {
    condition     = contains(["gp3", "gp2", "io1", "io2", "st1", "sc1", "standard"], var.volume_type)
    error_message = "Volume type must be one of: gp3, gp2, io1, io2, st1, sc1, standard."
  }
}

variable "volume_size" {
  description = "Size of the root EBS volume in GiB."
  type        = number

  validation {
    condition = var.volume_size >= 8
    error_message = "Volume size must be at least 8 GiB."
  }
}

variable "encrypted" {
  description = "Whether the root EBS volume should be encrypted."
  type        = bool
  default     = true
}

variable "ebs_optimized" {
  description = "Whether to enable EBS optimization for the EC2 instance."
  type        = bool
  default     = true
}

# -----------------------------------------------------------------------------
# Access
# -----------------------------------------------------------------------------

variable "key_name" {
  description = "Name of the EC2 key pair used for SSH access."
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "Name of the IAM instance profile to attach to the EC2 instance."
  type        = string
  default     = null
}

# -----------------------------------------------------------------------------
# Configuration
# -----------------------------------------------------------------------------

variable "monitoring" {
  description = "Enable detailed CloudWatch monitoring for the EC2 instance."
  type    = bool
  default = false
}

variable "disable_api_termination" {
  description = "Prevent API-based termination of the EC2 instance. When enabled, Terraform destroy will fail until this setting is disabled."
  type = bool
  default = false
}

variable "user_data" {
  description = "Cloud-init or shell script to run during the first boot."
  type        = string
  default     = ""
}

# -----------------------------------------------------------------------------
# Tags
# -----------------------------------------------------------------------------

variable "tags" {
  description = "Additional tags to apply to the EC2 instance."
  type        = map(string)
  default     = {}
}
