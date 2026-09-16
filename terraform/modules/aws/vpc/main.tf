# ------------------------------------------------------------------------------
# Virtual Private Cloud (VPC)
# ------------------------------------------------------------------------------

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    Name = var.name
  })
}

# ------------------------------------------------------------------------------
# Internet Gateway
# ------------------------------------------------------------------------------

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(var.tags, {
    Name = "${var.name}-igw"
  })
}

# ------------------------------------------------------------------------------
# Public Subnet
# ------------------------------------------------------------------------------

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr

  # "coalesce" is used to provide a default value when a variable is null or undefined. So if var.availability_zone is empty (null) it pick the first option from data.aws_availability_zones.available.names. This makes it so availability_zone does not need to be defined in the resource.
  availability_zone = coalesce(
    var.availability_zone,
    data.aws_availability_zones.available.names[0]
  )

  map_public_ip_on_launch = false


  tags = merge(var.tags, {
    Name = "${var.name}-public"
  })
}

# ------------------------------------------------------------------------------
# Public Route Table
# ------------------------------------------------------------------------------

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(var.tags, {
    Name = "${var.name}-public"
  })
}

# ------------------------------------------------------------------------------
# Default Route to the Internet Gateway
# ------------------------------------------------------------------------------

resource "aws_route" "internet" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# ------------------------------------------------------------------------------
# Associate the Public Subnet with the Public Route Table
# ------------------------------------------------------------------------------

resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
