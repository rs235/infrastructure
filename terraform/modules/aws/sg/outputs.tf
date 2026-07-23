output "id" {
  description = "Security group ID."
  value = aws_security_group.sg.id
}

output "arn" {
  description = "Amazon Resource Name (ARN) of the security group."
  value = aws_security_group.sg.arn
}

output "name" {
  description = "Name of the security group."
  value       = aws_security_group.sg.name
}
