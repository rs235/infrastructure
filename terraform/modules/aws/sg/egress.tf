# trivy:ignore:AVD-AWS-0104
# Egress to the internet is intentional as workloads require outbound HTTP/HTTPS access to package repositories.
resource "aws_vpc_security_group_egress_rule" "sg" {
  for_each = var.egress_rules

  security_group_id = aws_security_group.sg.id

  description = each.value.description
  ip_protocol = each.value.protocol
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  cidr_ipv4   = each.value.cidr_ipv4
}
