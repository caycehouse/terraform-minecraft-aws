terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }

  required_version = ">= 1.0.0"
}

module "iam" {
  source = "./modules/iam"
}

module "network" {
  source = "./modules/network"
  availability_zone = var.availability_zone
}

module "security_groups" {
  source  = "./modules/security-groups"
  your_ip = var.your_ip
  vpc_id  = module.network.minecraft_vpc
}

module "storage" {
  source = "./modules/storage"
  availability_zone = var.availability_zone
  volume_size = var.volume_size
  volume_type = var.volume_type
  dlm_iam = module.iam.minecraft_dlm_iam
}

module "server" {
  source = "./modules/spot-instance"
  instance_type = var.instance_type
  security_groups = module.security_groups.minecraft_security_groups
  subnet_id = module.network.minecraft_subnet
  volume_id = module.storage.minecraft_volume
}

resource "aws_route53_zone" "primary" {
  name = var.route53_name
}
