module "minecraft_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "minecraft"
  description = "Security group for minecraft with custom ports open within VPC"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [
    {
        from_port   = 25565
        to_port     = 25565
        protocol    = "tcp"
        description = "Minecraft"
        cidr_blocks = "0.0.0.0/0"
    },
    {
      rule        = "ssh-tcp"
      cidr_blocks = var.your_ip
    }
  ]

  egress_with_cidr_blocks = [
    {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        description = "Allow all egress"
        cidr_blocks = "0.0.0.0/0"
    }
  ]
}
