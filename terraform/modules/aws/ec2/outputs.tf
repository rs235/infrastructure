# ---------------------------------------------------------------------------
# Instance
# ---------------------------------------------------------------------------

output "id" {
  description = "EC2 instance ID."
  value       = aws_instance.instance.id
}

output "arn" {
  description = "Amazon Resource Name (ARN) of the EC2 instance."
  value       = aws_instance.instance.arn
}

output "availability_zone" {
  description = "Availability Zone in which the EC2 instance is running."
  value       = aws_instance.instance.availability_zone
}

# ---------------------------------------------------------------------------
# Network
# ---------------------------------------------------------------------------

output "public_ip" {
  description = "Public IPv4 address of the EC2 instance."
  value       = aws_instance.instance.public_ip
}

output "private_ip" {
  description = "Private IPv4 address of the EC2 instance."
  value       = aws_instance.instance.private_ip
}

output "public_dns" {
  description = "Public DNS name of the EC2 instance."
  value       = aws_instance.instance.public_dns
}

output "private_dns" {
  description = "Private DNS name of the EC2 instance."
  value       = aws_instance.instance.private_dns
}
