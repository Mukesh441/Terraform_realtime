# Fetch Availability Zones
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# Fetch Existing Subnets in the VPC
data "aws_subnets" "my_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

# Map Subnet IDs to Availability Zones using indexing
locals {
  az_to_subnet_map = {
    for idx, az in data.aws_availability_zones.my_azones.names : 
    az => data.aws_subnets.my_subnets.ids[idx]
  }
}

# Create EC2 Instances in Each Subnet
resource "aws_instance" "myec2vm" {
  ami                  = data.aws_ami.amzLinux.id        # Use Amazon Linux AMI ID
  instance_type        = var.instance_type_map["dev"]     # Instance type
  user_data            = file("${path.module}/app1-install.sh")
  key_name             = var.instance_keypair
  for_each             = toset(data.aws_availability_zones.my_azones.names)  

  # Reference the existing subnet ID for each Availability Zone
  subnet_id            = local.az_to_subnet_map[each.value]
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

  tags = {
    Name = "Ec2Demo-${each.value}"
  }
}
