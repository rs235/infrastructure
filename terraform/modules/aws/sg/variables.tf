variable "name" {
  description = "Name of the Security Group."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created."
  type        = string
}

variable "ingress_rules" {
  description = "Ingress rules keyed by name."
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_ipv4   = string
  }))
  default = {}
}

variable "egress_rules" {
  description = "Ingress rules keyed by name."
  type = map(object({
    description = string
    protocol    = string
    cidr_ipv4   = string
    from_port   = optional(number)
    to_port     = optional(number)
  }))
}

variable "tags" {
  description = "Security Group tags."
  type        = map(string)
  default     = {}
}
