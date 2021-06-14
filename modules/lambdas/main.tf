resource "aws_lambda_function" "minecraft_dns" {
  filename      = "${path.module}/minecraft-dns/function.zip"
  function_name = "minecraft_dns"
  role          = var.lambda_dns_iam
  handler       = "index.handler"
  source_code_hash = filebase64sha256("${path.module}/minecraft-dns/function.zip")

  runtime = "nodejs14.x"

  environment {
    variables = {
      hosted_zone_id = var.hosted_zone_id
      record_name = var.record_name
    }
  }
}

resource "aws_lambda_function" "minecraft_startstop" {
  filename      = "${path.module}/minecraft-startstop/function.zip"
  function_name = "minecraft_startstop"
  role          = var.lambda_startstop_iam
  handler       = "index.handler"
  source_code_hash = filebase64sha256("${path.module}/minecraft-startstop/function.zip")

  runtime = "nodejs14.x"

  environment {
    variables = {
      instance_id = var.instance_id
    }
  }
}

resource "aws_cloudwatch_event_target" "minecraft_event_target" {
  arn  = aws_lambda_function.minecraft_dns.arn
  rule = aws_cloudwatch_event_rule.minecraft_event_rule.id
}

resource "aws_cloudwatch_event_rule" "minecraft_event_rule" {
  name = "minecraft_instance_start_dns"
  description = "Sets the Route53 DNS entry when the minecraft server starts"

event_pattern = <<EOF
{
  "source": ["aws.ec2"],
  "detail-type": ["EC2 Instance State-change Notification"],
  "detail": {
    "state": ["running"],
    "instance-id": ["${var.instance_id}"]
  }
}
EOF
}