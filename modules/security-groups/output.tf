output "minecraft_security_groups" {
    value = [aws_security_group.minecraft_sg.id]
}