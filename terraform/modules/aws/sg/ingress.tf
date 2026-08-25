resource "aws_vpc_security_group_ingress_rule" "sg" {
  for_each = var.ingress_rules

  security_group_id = aws_security_group.sg.id

  description = each.value.description
  ip_protocol = each.value.protocol
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  cidr_ipv4   = each.value.cidr_ipv4
}
