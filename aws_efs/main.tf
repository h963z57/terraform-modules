terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 5.0"
    }
  }
}

resource "aws_efs_file_system" "module" {
  for_each       = var.names
  creation_token = "${var.env}-${each.key}"

  tags = {
    Name = "${var.env}-${each.key}"
  }
}

resource "aws_efs_mount_target" "module" {
  for_each = { for name, sg_list in var.names : name => sg_list }

  file_system_id  = aws_efs_file_system.module[each.key].id
  subnet_id       = var.subnet_id
  security_groups = each.value
}