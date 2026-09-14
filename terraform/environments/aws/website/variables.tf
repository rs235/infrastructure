# EC2 variables

variable "region" {
  description = "AWS region in which to create the EC2 instance."
  type        = string
  default     = "eu-north-1"
}

variable "ANSIBLE_SSH_PUBLIC_KEY" {
  description = "Public key for Ansible automation account."
  type        = string
}

# VPC variables
# SG variables
