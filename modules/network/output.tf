output "minecraft_vpc" {
  value = aws_vpc.minecraft_vpc.id
}

output "minecraft_subnet" {
  value = aws_subnet.minecraft_subnet.id
}
