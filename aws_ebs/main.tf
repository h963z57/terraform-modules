terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 5.0"
    }
  }
}

resource "aws_ebs_volume" "module" {
  availability_zone = var.zone
  size              = var.size
  type              = var.type
  encrypted         = var.encrypted
  final_snapshot    = var.final_snapshot

  tags = {
    Name  = var.tag_name
    Env   = var.env
    Owner = var.owner
  }
}

resource "aws_volume_attachment" "module" {
  count       = var.attach_state ? 1 : 0
  device_name = var.device_name
  volume_id   = aws_ebs_volume.module.id
  instance_id = var.instance_id
}