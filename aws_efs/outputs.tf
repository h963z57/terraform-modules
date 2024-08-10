output "efs_file_system_ids" {
  value       = { for fs_name, fs in aws_efs_file_system.module : fs_name => fs.id }
}

output "efs_mount_target_ids" {
  value       = { for mt_name, mt in aws_efs_mount_target.module : mt_name => mt.id }
}