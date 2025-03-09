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

  throughput_mode = var.throughput_mode

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

resource "aws_efs_access_point" "default" {
  for_each = var.default_ap ? var.names : {}

  file_system_id = aws_efs_file_system.module[each.key].id

  root_directory {
    path = "/"
    creation_info {
      owner_uid   = 1000
      owner_gid   = 1000
      permissions = "0770"
    }
  }

  tags = {
    Name = "${var.env}-default-access-point"
  }
}