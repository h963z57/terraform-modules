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