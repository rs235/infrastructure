data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-resolute-26.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "instance" {
  # ---------------------------------------------------------------------------
  # Instance
  # ---------------------------------------------------------------------------

  instance_type = var.instance_type
  ami           = var.ami_id != null ? var.ami_id : data.aws_ami.ubuntu.id

  # ---------------------------------------------------------------------------
  # Network
  # ---------------------------------------------------------------------------

  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip_address

  # ---------------------------------------------------------------------------
  # Storage
  # ---------------------------------------------------------------------------

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    encrypted             = var.encrypted
    delete_on_termination = true
  }

  ebs_optimized = var.ebs_optimized

  # ---------------------------------------------------------------------------
  # Access
  # ---------------------------------------------------------------------------

  key_name             = var.key_name
  iam_instance_profile = var.iam_instance_profile

  # ---------------------------------------------------------------------------
  # Configuration
  # ---------------------------------------------------------------------------

  monitoring              = var.monitoring
  disable_api_termination = var.disable_api_termination

  user_data = var.user_data

  # When set to true, this option ensures that any changes to the user_data will force a replacement of the EC2 instance, allowing the new user data script to execute.
  user_data_replace_on_change = true

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  # ---------------------------------------------------------------------------
  # Tags
  # ---------------------------------------------------------------------------

  tags = merge(var.tags, {
    Name = var.name
  })

  volume_tags = merge(var.tags, {
    Name = var.name
  })
}
