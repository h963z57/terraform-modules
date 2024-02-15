output "ec2_id" {
  value = { for name, instance in aws_instance.module : name => instance.id }
}

output "ec2_public_ip" {
  value = { for name, instance in aws_instance.module : name => instance.public_ip }
}

output "ec2_private_ip" {
  value = { for name, instance in aws_instance.module : name => instance.private_ip }
}