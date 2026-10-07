module "vpc" {
  source = "../../../modules/aws/vpc"

  name               = "project"
  cidr_block         = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "eu-north-1a"
}

module "sg" {
  source = "../../../modules/aws/sg"

  name   = "project"
  vpc_id = module.vpc.vpc_id

  ingress_rules = {
    ssh = {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_ipv4   = "78.10.223.132/32"
    }
    http = {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
    https = {
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  egress_rules = {
    http = {
      description = "HTTP for APT"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
    https = {
      description = "HTTPS for APT"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
    dns_tcp = {
      description = "DNS TCP"
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
      cidr_ipv4   = "10.0.0.2/32"
    }
    dns_udp = {
      description = "DNS UDP"
      from_port   = 53
      to_port     = 53
      protocol    = "udp"
      cidr_ipv4   = "10.0.0.2/32"
    }
  }
}

module "ec2" {
  source = "../../../modules/aws/ec2"

  # ---------------------------------------------------------------------------
  # Instance
  # ---------------------------------------------------------------------------

  name = "project"

  #   ami_id =

  instance_type = "t3.micro"

  # ---------------------------------------------------------------------------
  # Networking
  # ---------------------------------------------------------------------------

  subnet_id = module.vpc.public_subnet_id

  security_group_ids = [module.sg.id]

  associate_public_ip_address = true

  # ---------------------------------------------------------------------------
  # Access
  # ---------------------------------------------------------------------------

  key_name = "AWS_EC2"

  #   iam_instance_profile =

  # ---------------------------------------------------------------------------
  # Storage
  # ---------------------------------------------------------------------------

  volume_size = 8

  volume_type = "gp3"

  encrypted = true

  ebs_optimized = true

  # ---------------------------------------------------------------------------
  # Configuration
  # ---------------------------------------------------------------------------

  monitoring = true

  disable_api_termination = false # Block API-based termination attempts. This effectively breaks "terraform destroy" and should be used only on production setups.

  user_data = <<-EOF
#cloud-config

users:
  - name: ansible
    groups:
      - sudo
    shell: /bin/bash
    sudo: "ALL=(ALL) NOPASSWD:ALL"
    lock_passwd: true
    ssh_authorized_keys:
      - ${var.ansible_ssh_public_key}

# packages:
#   - htop
EOF

}
