# VPC outputs

output "vpc_id" {
  description = "VPC ID."
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "VPC ARN."
  value       = module.vpc.vpc_arn
}

output "public_subnet_id" {
  description = "Public subnet ID."
  value       = module.vpc.public_subnet_id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID."
  value       = module.vpc.internet_gateway_id
}

output "public_route_table_id" {
  description = "Public route table ID."
  value       = module.vpc.public_route_table_id
}

# Security Group outputs

output "sg_id" {
  description = "Security group ID."
  value       = module.sg.id
}

output "name" {
  description = "Name of the security group."
  value       = module.sg.name
}

output "sg_arn" {
  description = "Amazon Resource Name (ARN) of the security group."
  value       = module.sg.arn
}

# EC2 Outputs

output "ec2_id" {
  description = "N/A"
  value       = module.ec2.id
}

output "ec2_arn" {
  description = "N/A"
  value       = module.ec2.arn
}

output "public_ip" {
  description = "Public IPv4 address."
  value       = module.ec2.public_ip
}

output "public_dns" {
  description = "Public DNS IPv4 address."
  value       = module.ec2.public_dns
}

output "private_ip" {
  description = "Private IPv4 address."
  value       = module.ec2.private_ip
}

output "private_dns" {
  description = "Private DNS IPv4 address."
  value       = module.ec2.private_dns
}

output "availability_zone" {
  description = "N/A"
  value       = module.ec2.availability_zone
}
