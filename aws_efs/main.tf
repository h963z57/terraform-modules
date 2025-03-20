resource "aws_efs_file_system" "module" {
  for_each       = { for fs in var.names : fs.name => fs }

  creation_token = "${var.env}-${each.key}"
  throughput_mode = each.value.throughput_mode

  tags = {
    Name = "${var.env}-${each.key}"
  }
}

resource "aws_efs_access_point" "default" {
  for_each = { for fs in var.names : fs.name => fs if fs.default_ap } # Создаём AP, если `default_ap = true`

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
    Name = "${var.env}-${each.key}-access-point"
  }
}

resource "aws_efs_mount_target" "module" {
  for_each = { for fs in var.names : fs.name => fs }

  file_system_id  = aws_efs_file_system.module[each.key].id
  subnet_id       = var.subnet_id
  security_groups = each.value.security_groups
}