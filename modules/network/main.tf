module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "minecraft-vpc"
  cidr = "10.10.10.0/24"

  azs             = [var.availability_zone]
  public_subnets  = ["10.10.10.0/24"]

  enable_ipv6 = true

  public_subnet_tags = {
    Name = "minecraft-public"
  }

  vpc_tags = {
    Name = "minecraft-vpc"
  }
}