output "valheim_security_groups" {
    value = [aws_security_group.valheim_sg_game.id, aws_security_group.valheim_sg_ssh.id]
}