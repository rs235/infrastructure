# ------------------------------------------------------------------------------
# Default VPC Security Group
# ------------------------------------------------------------------------------

# This resource tags the default security group created automatically by AWS alongside new VPC. Empty ingress and egress rules efectively block all traffic in this group in case it becomes assigned to instance by accident.
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc.id

  ingress = []
  egress  = []

  tags = merge(var.tags, {
    Name = "${var.name}-default"
  })
}
