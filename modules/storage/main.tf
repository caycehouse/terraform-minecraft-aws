resource "aws_ebs_volume" "minecraft_ebs" {
  availability_zone = var.availability_zone
  size              = var.volume_size
  type = var.volume_type
  tags = {
    dlmsnapshotpolicyHourly = "Yes"
    dlmsnapshotpolicyDaily = "Yes"
  }
}

resource "aws_dlm_lifecycle_policy" "minecraft_hourly_dlm" {
  description        = "Hourly DLM lifecycle policy"
  execution_role_arn = var.dlm_iam
  state              = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    schedule {
      name = "1 day of hourly snapshots"

      create_rule {
        interval      = 1
        interval_unit = "HOURS"
        times         = ["20:00"]
      }

      retain_rule {
        count = 24
      }

      tags_to_add = {
        SnapshotCreator = "DLM"
      }
    }

    target_tags = {
      dlmsnapshotpolicyHourly = "Yes"
    }
  }
}

resource "aws_dlm_lifecycle_policy" "minecraft_daily_dlm" {
  description        = "Daily DLM lifecycle policy"
  execution_role_arn = var.dlm_iam
  state              = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    schedule {
      name = "1 week of daily snapshots"

      create_rule {
        interval      = 24
        interval_unit = "HOURS"
        times         = ["20:00"]
      }

      retain_rule {
        count = 7
      }

      tags_to_add = {
        SnapshotCreator = "DLM"
      }
    }

    target_tags = {
      dlmsnapshotpolicyDaily = "Yes"
    }
  }
}
