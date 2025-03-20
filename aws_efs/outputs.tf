output "efs_file_system_ids" {
  value = { for fs in aws_efs_file_system.module : fs.id => fs.arn }
}

output "efs_mount_target_ids" {
  value = { for mt in aws_efs_mount_target.module : mt.id => mt.file_system_id }
}