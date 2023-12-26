output "ec2_id" {
  value = aws_instance.module[*].id
}

output "ec2_public_ip" {
  value = aws_instance.module[*].public_ip
}

output "ec2_private_ip" {
  value = aws_instance.module[*].private_ip
}