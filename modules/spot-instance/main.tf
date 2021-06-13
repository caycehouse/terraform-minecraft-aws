data "aws_region" "current" {}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_spot_instance_request" "valheim_instance" {
    ami = data.aws_ami.amazon_linux_2.id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.security_groups
    key_name = var.key_name
    wait_for_fulfillment = true
    spot_type = "persistent"
    ebs_block_device {
        volume_type = var.volume_type
        volume_size = var.volume_size
        device_name = "/dev/sdb"
    }
    user_data = var.user_data
    iam_instance_profile = var.iam_instance_profile
    lifecycle {
        ignore_changes = [
            id, 
            ebs_block_device,
            security_groups,
            tags,
            volume_tags,
            user_data
        ]
    }
}

