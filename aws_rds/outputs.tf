output "rds_endpoint" {
  value = replace(aws_db_instance.module.endpoint, "/:\\d+$/", "")
}

output "rds_port" {
  value       = aws_db_instance.module.port
}
