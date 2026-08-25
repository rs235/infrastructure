output "vpc_id" {
  description = "VPC ID."
  value       = aws_vpc.vpc.id
}

output "vpc_arn" {
  description = "VPC ARN."
  value       = aws_vpc.vpc.arn
}

output "public_subnet_id" {
  description = "Public subnet ID."
  value       = aws_subnet.public_subnet.id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID."
  value       = aws_internet_gateway.igw.id
}

output "public_route_table_id" {
  description = "Public route table ID."
  value       = aws_route_table.public_rt.id
}
