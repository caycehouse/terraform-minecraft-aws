terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }

  required_version = ">= 1.0.0"
}

module "network" {
  source = "./modules/network"
  availability_zone = var.availability_zone
}

module "security_groups" {
  source  = "./modules/security-groups"
  your_ip = var.your_ip
  vpc_id  = module.network.valheim_vpc
}

module "server" {
  source = "./modules/spot-instance"
  instance_type = var.instance_type
  security_groups = module.security_groups.valheim_security_groups
  subnet_id = module.network.valheim_subnet
  volume_size = var.volume_size
  volume_type = var.volume_type
}

resource "aws_route53_zone" "primary" {
  name = var.route53_name
}
