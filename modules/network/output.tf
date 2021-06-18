output "minecraft_vpc" {
  value = module.vpc.vpc_id
}

output "minecraft_subnet" {
  value = module.vpc.public_subnets[0]
}
