output "minecraft_dlm_iam" {
    value = aws_iam_role.dlm_lifecycle_role.arn
}

output "minecraft_lambda_dns_iam" {
    value = aws_iam_role.minecraft_iam_for_dns_lambda.arn
}

output "minecraft_lambda_startstop_iam" {
    value = aws_iam_role.minecraft_iam_for_startstop_lambda.arn
}