output "minecraft_security_groups" {
    value = [aws_security_group.minecraft_sg_game.id, aws_security_group.minecraft_sg_ssh.id]
}