output "rds_endpoint" {
  value       = aws_db_instance.module.endpoint
}

output "rds_port" {
  value       = aws_db_instance.module.port
}
